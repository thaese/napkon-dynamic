"""
Validate profiles and instances in a FSH file.

Process:
- Run SUSHI to generate JSON files (StructureDefinitions, ValueSets, Instances, etc) from FSH files
- Parse FSH file to identify profiles and instances defined in the file
- Run FHIR Java validator for each instance defined in FSH file
"""
from typing import Dict, Tuple, List, Union
import subprocess  # nosec
from pathlib import Path
import json
import re
import argparse
import urllib.request

from jsonpath_ng import parse

VALIDATOR_URL = "https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar"
VALIDATOR_BASENAME = VALIDATOR_URL.split("/")[-1]


def print_box(message: str, min_length: int = 100) -> None:
    """
    Print a string in a neat box.

    :param message: Message to be printed
    :param min_length: Minimum length of box (in characters)
    :return:
    """
    strlen = len(message)
    padding = " " * (min_length - strlen)
    message += padding

    s = ""

    s += "=" * (max(min_length, strlen) + 4) + "\n"
    s += f"* {message} *" + "\n"
    s += "=" * (max(min_length, strlen) + 4) + "\n"

    print(s)


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
        f"Profile: (?P<profile>{re_group_capture})[^\n]*\nParent: (?P<parent>{re_group_capture})[^\n]*\nId: (?P<id>{re_group_capture})",
        re.MULTILINE,
    )
    fsh_profiles = [m.groupdict() for m in pattern.finditer(content)]

    pattern = re.compile(
        f"Instance: (?P<instance>{re_group_capture})[^\n]*\nInstanceOf: (?P<instanceof>{re_group_capture})",
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


def validate_fsh(base_path: str, fname: str, fname_validator: str) -> None:
    """
    Validate a single FSH file.

    Process:
    - Extract Profiles and Instances defined in FSH file
    - Run FHIR Java validator for each instance to validate it against its corresponding profile

    :param base_path: base path (of SUSHI project)
    :param fname: FSH file name (just basename, path is inferred from base_path)
    :param fname_validator: full path to FHIR Java validator file
    :return: None
    """
    path_input, path_output = get_paths(base_path)

    fname_full = path_input / fname

    if not fname_full.exists():
        raise FileNotFoundError(fname_full)

    fsh_profiles, fsh_instances = parse_fsh(fname_full)
    sdefs, instances, deps, vs, cs = parse_fsh_generated(path_output)

    assert_instances_availability(fsh_profiles, fsh_instances)
    run_validation(
        fname_validator, fsh_profiles, fsh_instances, sdefs, instances, deps, vs, cs
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
) -> None:
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
    :return: None
    """
    cmd_base = ["java", f"-jar {fname_validator}", "-version 4.0.1"]
    cmd_base += [f'-ig {dep["packageId"]}#{dep["version"]}' for dep in deps.values()]

    cmds = []

    for fsh_instance in fsh_instances:

        if not fsh_instance["instance"] in instances:
            raise Exception(f'Could not find {fsh_instance["instance"]} in instances')

        instance = instances[fsh_instance["instance"]]

        print_box(
            f'Validating {fsh_instance["instance"]} against profile {instance["profile"]}'
        )

        cmd = list(cmd_base)
        if instance["profile"] in sdefs:
            cmd += [f'-ig {sdefs[instance["profile"]]["filename"]}']
        cmd += [f'-ig {valueset["filename"]}' for valueset in vs.values()]
        cmd += [f'-ig {codesystem["filename"]}' for codesystem in cs.values()]
        cmd += [f'-profile {instance["profile"]}', instance["filename"]]

        cmds.append(cmd)

    for cmd in cmds:
        run_command(cmd)


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

    parser.add_argument(
        "filename", help="fsh file names (basename only - no path)", nargs="+"
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

    args = parser.parse_args()

    fname_validator = Path(args.path_validator) / VALIDATOR_BASENAME
    if not fname_validator.exists():
        print_box("Downloading java validator")
        download_validator(fname_validator.resolve())

    print_box("Running SUSHI")
    run_sushi(args.base_path)

    print_box("Validating FSH files")

    for filename in args.filename:
        validate_fsh(args.base_path, filename, str(fname_validator))

    print_box("All profiles successfully validated!")
