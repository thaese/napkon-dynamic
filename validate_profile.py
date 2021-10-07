"""
Validate profiles and instances in a FSH file.

Process:
- Run SUSHI to generate JSON files (StructureDefinitions, ValueSets, Instances, etc) from FSH files
- Parse FSH file to identify profiles and instances defined in the file
- Run FHIR Java validator for each instance defined in FSH file
"""
from typing import Dict, Tuple, List, Union, Optional
import subprocess  # nosec
from pathlib import Path
import json
import re
import argparse
import urllib.request
from datetime import datetime

import pandas as pd
from jsonpath_ng import parse

VALIDATOR_URL = "https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar"
VALIDATOR_BASENAME = VALIDATOR_URL.split("/")[-1]


class bcolors:
    """Color strings for formatting console messages."""

    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKCYAN = "\033[96m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


def print_box(message: str, min_length: int = 100, print_str: bool = True) -> str:
    """
    Print a string in a neat box.

    :param message: Message to be printed
    :param min_length: Minimum length of box (in characters)
    :param print_str: if False, the generated string will not be printed (just returned)
    :return: str to be printed if return_str is True
    """
    strlen = len(message)
    padding = " " * (min_length - strlen)
    message += padding

    s = ""

    s += "=" * (max(min_length, strlen) + 4) + "\n"
    s += f"* {message} *" + "\n"
    s += "=" * (max(min_length, strlen) + 4) + "\n"

    if print_str:
        printc(s, col=bcolors.OKBLUE, end="")

    return s


class CommandNotSuccessfulException(Exception):
    """Shell command not successfully executed."""

    def __init__(
        self,
        msg: str = "Command execution not successful - see command output for more information",
        *args,
    ):
        """
        Shell command not successfully executed.

        :param msg: Message to display
        :param args: Other positional arguments for BaseException
        :param kwargs: Other keyword arguments for BaseException
        """
        args = tuple([msg] + list(args))
        super().__init__(*args)


def download_validator(fname_validator: Path) -> None:
    """
    Download FHIR Java validator.

    :param fname_validator: Filename where the validator will be downloaded to
    :return: None
    """
    urllib.request.urlretrieve(VALIDATOR_URL, fname_validator)  # nosec


def parse_fsh(fname_fsh: Path) -> Tuple[List[Dict], List[Dict]]:
    """
    Parse FSH file to extract profiles and instances that are defined in it.

    :param fname_fsh: Filename of the FSH file to parse
    :return: List of defined profiles, List of defined instances
    """
    with open(fname_fsh, "r") as f:
        content = f.read()

    re_group_capture = "[a-zA-Z0-9_-]+"

    pattern = re.compile(
        rf"Profile: (?P<profile>{re_group_capture})[^\n]*\nParent: (?P<parent>{re_group_capture})[^\n]*\nId: (?P<id>{re_group_capture})",
        re.MULTILINE,
    )
    fsh_profiles = [m.groupdict() for m in pattern.finditer(content)]

    pattern = re.compile(
        rf"Instance: (?P<instance>{re_group_capture})[^\n]*\nInstanceOf: (?P<instanceof>{re_group_capture})",
        re.MULTILINE,
    )
    fsh_instances = [m.groupdict() for m in pattern.finditer(content)]

    return fsh_profiles, fsh_instances


def parse_fsh_generated(path: Path) -> Tuple[Dict, Dict, Dict, Dict, Dict]:
    """
    Parse json files generated from FSH through SUSHI.

    Goal: Extract structure definitions, instances, value set and dependencies from generated JSON files.

    :param path: Path to generated files through SUSHI
    :return: StructureDefinitions, Instances, Dependencies, ValueSets, CodeSystems
    """

    def parse_structure_definition(fname: Path, json_data: str) -> Dict:
        url = parse("$.url").find(json_data)[0].value
        return {
            url: {
                "filename": fname.resolve(),
                "id": parse("$.id").find(json_data)[0].value,
            }
        }

    def parse_instance(fname: Path, json_data: str) -> Dict:
        return {
            parse("$.id")
            .find(json_data)[0]
            .value: {
                "filename": fname.resolve(),
                "profile": parse("$.meta.profile").find(json_data)[0].value[0],
            }
        }

    def parse_ig(fname: Path, json_data: str) -> Dict:
        deps = parse("$.dependsOn[*]").find(json_data)
        return {v.value["packageId"]: v.value for v in deps}

    def parse_value_set(fname: Path, json_data: str) -> Dict:
        url = parse("$.url").find(json_data)[0].value
        return {
            url: {
                "filename": fname.resolve(),
                "id": parse("$.id").find(json_data)[0].value,
            }
        }

    def parse_code_system(fname: Path, json_data: str) -> Dict:
        url = parse("$.url").find(json_data)[0].value
        return {
            url: {
                "filename": fname.resolve(),
                "id": parse("$.id").find(json_data)[0].value,
            }
        }

    sdefs = {}
    instances = {}
    deps = {}
    vs = {}
    cs = {}

    for fname in path.glob("*.json"):
        json_data = json.load(open(fname))
        resourceType = parse("$.resourceType").find(json_data)[0].value
        if resourceType == "StructureDefinition":
            sd = parse_structure_definition(fname, json_data)
            sdefs.update(sd)
        elif resourceType == "ImplementationGuide":
            deps.update(parse_ig(fname, json_data))
        elif resourceType == "ValueSet":
            vs.update(parse_value_set(fname, json_data))
        elif resourceType == "CodeSystem":
            cs.update(parse_code_system(fname, json_data))
        else:
            instances.update(parse_instance(fname, json_data))

    return sdefs, instances, deps, vs, cs


def get_paths(base_path: str) -> Tuple[Path, Path]:
    """
    Get fsh input and output paths from base path.

    :param base_path: Base path
    :return: FSH input path, FSH output path
    """
    return (
        Path(base_path) / "input" / "fsh",
        Path(base_path) / "fsh-generated" / "resources",
    )


def _validate_fsh_files(
    path_output: Path, fnames: List[Path], fname_validator: str, verbose: bool = False
) -> List[Dict]:
    """
    Validate FSH files.

    Process:
    - Extract Profiles and Instances defined in each FSH file
    - Run FHIR Java validator for each instance to validate it against its corresponding profile

    :param path_output: output path (of SUSHI project)
    :param fnames: FSH file names to validate (full paths)
    :param fname_validator: full path to FHIR Java validator file
    :param verbose: Print more information
    :return: List of validation result dicts containing
      - status: parsed output from parse_validator_output()
      - output: full output from validator execution
      - instance: processed instance
      - profile: processed profile
    """
    sdefs, instances, deps, vs, cs = parse_fsh_generated(path_output)

    results = []
    for fname in fnames:

        if not fname.exists():
            raise FileNotFoundError(fname)

        fsh_profiles, fsh_instances = parse_fsh(fname)

        assert_instances_availability(fsh_profiles, fsh_instances)
        results += run_validation(
            fname_validator,
            fsh_profiles,
            fsh_instances,
            sdefs,
            instances,
            deps,
            vs,
            cs,
            verbose=verbose,
        )

    return results


def validate_fsh(
    base_path: str, fname: str, fname_validator: str, verbose: bool = False
) -> List[Dict]:
    """
    Validate a single FSH file.

    Process:
    - Extract Profiles and Instances defined in FSH file
    - Run FHIR Java validator for each instance to validate it against its corresponding profile

    :param base_path: base path (of SUSHI project)
    :param fname: FSH file name (just basename, path is inferred from base_path)
    :param fname_validator: full path to FHIR Java validator file
    :param verbose: Print more information
    :return: List of validation result dicts containing validation status, full output and instance and profile names
    """
    path_input, path_output = get_paths(base_path)

    fnames = [path_input / fname]

    return _validate_fsh_files(
        path_output=path_output,
        fnames=fnames,
        fname_validator=fname_validator,
        verbose=verbose,
    )


def validate_all_fsh(
    base_path: str, subdir: str, fname_validator: str, verbose: bool = False
) -> List[Dict]:
    """
    Validate all FSH files in a given subdir.

    Process:
    - Extract Profiles and Instances defined in FSH file
    - Run FHIR Java validator for each instance to validate it against its corresponding profile

    :param base_path: base path (of SUSHI project)
    :param subdir: subdirectory of profiles
    :param fname_validator: full path to FHIR Java validator file
    :param verbose: Print more information
    :return: List of validation result dicts containing validation status, full output and instance and profile names
    """
    path_input, path_output = get_paths(base_path)

    path_full = path_input / subdir

    if not path_full.exists():
        raise FileNotFoundError(path_full)

    fnames = list(path_full.rglob("*.fsh"))

    return _validate_fsh_files(
        path_output=path_output,
        fnames=fnames,
        fname_validator=fname_validator,
        verbose=verbose,
    )


def assert_instances_availability(
    fsh_profiles: List[Dict], fsh_instances: List[Dict]
) -> None:
    """
    Assert that at least one instance exists for each defined profile extracted from FSH file.

    :param fsh_profiles: List of profile defined in FSH file
    :param fsh_instances: List of instances defined in FSH file
    :return:
    """
    for p in fsh_profiles:
        assert any(
            i["instanceof"] == p["id"] for i in fsh_instances
        ), f"Could not find any instance for profile \"{p['id']}\""


def run_validation(
    fname_validator: str,
    fsh_profiles: List[Dict],
    fsh_instances: List[Dict],
    sdefs: Dict,
    instances: Dict,
    deps: Dict,
    vs: Dict,
    cs: Dict,
    verbose: bool,
) -> List[Dict]:
    """
    Run FHIR Java validator for each instance defined in FSH file.

    :param fname_validator: full path to FHIR Java validator file
    :param fsh_profiles: List of profile defined in FSH file
    :param fsh_instances: List of instances defined in FSH file
    :param sdefs: StructureDefinitions from SUSHI output
    :param instances: Instance from SUSHI output
    :param deps: Dependencies from SUSHI output
    :param vs: ValueSets from SUSHI output
    :param cs: CodeSystems from SUSHI output
    :param verbose: Print more information
    :return: List of validation result dicts containing validation status, full output and instance and profile names
    """
    cmd_base = ["java", f"-jar {fname_validator}", "-version 4.0.1"]
    cmd_base += [f'-ig {dep["packageId"]}#{dep["version"]}' for dep in deps.values()]

    cmds = {}

    for fsh_instance in fsh_instances:

        if not fsh_instance["instance"] in instances:
            raise Exception(f'Could not find {fsh_instance["instance"]} in instances')

        instance = instances[fsh_instance["instance"]]

        cmd = list(cmd_base)
        if instance["profile"] in sdefs:
            cmd += [f'-ig {sdefs[instance["profile"]]["filename"]}']
        cmd += [f'-ig {valueset["filename"]}' for valueset in vs.values()]
        cmd += [f'-ig {codesystem["filename"]}' for codesystem in cs.values()]
        cmd += [f'-profile {instance["profile"]}', instance["filename"]]

        cmds[fsh_instance["instance"]] = cmd

    results = []

    for fsh_instance in cmds:
        print_box(f'Validating {fsh_instance} against profile {instance["profile"]}')
        status, output = execute_validator(cmds[fsh_instance], verbose=verbose)
        results.append(
            {
                "status": status,
                "output": output,
                "instance": fsh_instance,
                "profile": instance["profile"],
            }
        )

    return results


def run_command(cmd: Union[str, List[str]]) -> None:
    """
    Run a shell command.

    Raises CommandNotSuccessfulException if the return code of the command is not 0.

    :param cmd: Command to run as single string or list of strings
    :return: None
    """
    if isinstance(cmd, list):
        cmd = "  ".join([str(s) for s in cmd])

    c = subprocess.run(cmd, shell=True)  # nosec

    if c.returncode != 0:
        raise CommandNotSuccessfulException()


def parse_validator_output(output: List[str]) -> Dict:
    """
    Parse output of Java FHIR validator to extract status and errors, warnings.

    :param output: Output lines of validator run
    :return: Dict with parsed information from validator output:
        - status: Success or *FAILURE*
        - n_errors: number of detected errors
        - n_warnings: number of detected warnings
        - n_notes: number of detected notes
        - errors: error messages
        - warnings: warning messages
    """
    pattern_status = re.compile(
        r"(?P<status>\*FAILURE\*|Success): (?P<n_errors>\d+) errors, (?P<n_warnings>\d+) warnings, (?P<n_notes>\d+) notes"
    )
    pattern_error = re.compile(r"  (Error @ .*)")
    pattern_warn = re.compile(r"  (Warning @ .*)")

    output_s = "".join(output)

    status = pattern_status.search(output_s).groupdict()  # type: ignore
    status["errors"] = [m.group().strip() for m in pattern_error.finditer(output_s)]  # type: ignore
    status["warnings"] = [m.group().strip() for m in pattern_warn.finditer(output_s)]  # type: ignore

    return status


def printc(msg: str, col: str, end: str = "\n") -> None:
    """
    Print a message in color to console.

    :param msg: Message to print
    :param col: Color (from bcolors)
    :param end: end of line character(s)
    :return: None
    """
    print(f"{col}{msg}{bcolors.ENDC}", end=end)


def pretty_print_status(status: Dict) -> None:
    """
    Format and print the parsed output of fhir java validator to console.

    :param status: Status dictionary as returned by parse_validator_output()
    :return: None
    """
    if int(status["n_errors"]) > 0:
        col = bcolors.FAIL
    elif int(status["n_warnings"]) > 0:
        col = bcolors.WARNING
    else:
        col = bcolors.OKGREEN

    printc(
        f"{bcolors.BOLD}{status['status']}: {status['n_errors']} errors, {status['n_warnings']} warnings, {status['n_notes']} notes",
        col,
    )

    for msg in status["errors"]:
        printc(msg, bcolors.FAIL)

    for msg in status["warnings"]:
        printc(msg, bcolors.WARNING)


def execute_validator(
    cmd: Union[str, List[str]], verbose: bool = False
) -> Tuple[Dict, List[str]]:
    """
    Execute the Java FHIR validator and parse it's output.

    :param cmd: Command to execute
    :param verbose: If true, all output from the validator will be printed to stdout.
    :return: Parsed status (see parse_validator_output) and output from validator execution.
    """
    if isinstance(cmd, list):
        cmd = "  ".join([str(s) for s in cmd])

    popen = subprocess.Popen(  # nosec
        cmd, stdout=subprocess.PIPE, universal_newlines=True, shell=True
    )

    if popen.stdout is None:
        return {"status": "popen failed"}, []

    output = []

    for line in popen.stdout:
        if verbose or line.strip() in ["Loading", "Validating"]:
            printc(line, col=bcolors.HEADER, end="")

        output.append(line)
    popen.stdout.close()
    popen.wait()

    try:
        status = parse_validator_output(output)
        pretty_print_status(status)
    except Exception:
        print("Could not parse validator output:")
        print("".join(output))
        status = {"status": "Error during validator execution"}

    return status, output


def store_log(results: List[Dict], log_path: Path) -> None:
    """
    Store parsed and full output from validator run to files.

    Parsed output will be saved to an excel file in tabular format, full output to a text file.

    :param results: List of dicts with as returned by _validate_fsh_files()
    :param log_path: Path where log files are stored
    :return: None
    """
    dfs = []
    output = ""

    for d in results:
        dr = {k: v for k, v in d["status"].items() if k not in ["errors", "warnings"]}
        dr["instance"] = d["instance"]
        dr["profile"] = d["profile"]

        df = pd.DataFrame(dr, index=[0])
        dfs.append(df)

        output += print_box(
            f"Validating {d['instance']} on profile {d['profile']}", print_str=False
        )
        output += "".join(d["output"])
        output += "\n\n"

    df = pd.concat(dfs).reset_index(drop=True)

    log_basename = "validation_" + datetime.now().strftime("%y%m%dT%H%M%S")

    with open(log_path / (log_basename + ".log"), "w") as f:
        f.write(output)

    df.to_excel(log_path / (log_basename + ".xlsx"), index=False)


def run_sushi(path: str) -> None:
    """
    Run SUSHI to convert FSH files.

    :param path: Path to run SUSHI in
    :return: None
    """
    run_command(f"sushi {path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Validate a fsh file",
        formatter_class=argparse.RawTextHelpFormatter,
    )

    arg_fname = parser.add_argument(
        "filename", help="fsh file names (basename only - no path)", nargs="*"
    )

    parser.add_argument(
        "--all",
        dest="all",
        action="store_true",
        help="if set, all detected profiles will be validated",
        required=False,
        default=False,
    )

    parser.add_argument(
        "--subdir",
        dest="subdir",
        type=str,
        help="Specifies the subdirectory (relative to input/fsh/) in which to search for profiles if --all is set",
        required=False,
        default="/",
    )

    parser.add_argument(
        "--base-path",
        dest="base_path",
        type=str,
        help="base path (containing input/fsh/ directory)",
        required=False,
        default=".",
    )

    parser.add_argument(
        "--validator-path",
        dest="path_validator",
        type=str,
        help="path to validator",
        required=False,
        default=".",
    )

    parser.add_argument(
        "--verbose",
        dest="verbose",
        action="store_true",
        help="Be verbose",
        required=False,
        default=False,
    )

    parser.add_argument(
        "--log-path",
        dest="log_path",
        type=str,
        help="log file path - if supplied, log files will be written",
        required=False,
        default=None,
    )

    args = parser.parse_args()

    if not args.all and len(args.filename) == 0:
        raise argparse.ArgumentError(
            arg_fname, "filename must be set if --all is not specified"
        )
    elif args.all and len(args.filename) > 0:
        raise argparse.ArgumentError(
            arg_fname, "filename must not be set if --all is given"
        )

    fname_validator = Path(args.path_validator) / VALIDATOR_BASENAME
    if not fname_validator.exists():
        print_box("Downloading java validator")
        download_validator(fname_validator.resolve())

    print_box("Running SUSHI")
    run_sushi(args.base_path)

    if args.all:
        print_box("Validating all FSH files")
        results = validate_all_fsh(
            args.base_path, args.subdir, str(fname_validator), verbose=args.verbose
        )
    else:
        print_box("Validating FSH files")
        for filename in args.filename:
            results = validate_fsh(
                args.base_path, filename, str(fname_validator), verbose=args.verbose
            )

    if args.log_path is not None:
        log_path = Path(args.log_path)
        if not log_path.exists():
            log_path.mkdir()
        store_log(results, log_path)

    print_box("All profiles validated - check output for errors / warnings!")
