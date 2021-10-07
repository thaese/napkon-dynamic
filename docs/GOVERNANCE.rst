FHIR – Governance
#################

This document describes the workflow and conventions for creating FHIR profiles in the NAPKON project.

Workflow
========

Overview
---------

1. Clone napkon-dynamic git repository locally (if not already done).
2. Pick items to be edited in the responsibility table and mark them as "in progress"
3. Create FSH profile file in directory ``input/fsh`` (see `FSH File Conventions`_ )
4. Specify profile & *at least* one instance per terminology used (SNOMED, LOINC etc)
5. Test basic FSH → JSON translatability by calling sushi

  a. If necessary, fix errors until sushi runs without errors

6. Validate profile with instance(s) by calling Java FHIR validator

  a. If necessary, fix errors until the validator runs without errors.

7. Commit changed files into repository (into personal branch, not into staging or master)
8. Update responsibility table (status = "done")
9. Push branch and create pull request for merge in **staging** branch
10. Review and release pull request to **staging** branch together (with external reviewer)
11. Pull request in **master** branch - review by external reviewer and final release (by merge with **master** branch)


Details
-------
* The github repositoy "napkon-dynamic" is the central "point of truth" ( https://github.com/BIH-CEI/napkon-dynamic )
* Newly created or changed profiles, ValueSets, etc. are committed and pushed to your own branch
* Commits (& pushs) are usually performed as soon as a functional change has been completed, i.e. commits should not
  contain non-functional intermediate work. Do not use git as a backup system.
* As soon as a profile is considered finished by the person creating it, a pull request is created for merge to the
  **staging** branch.
* Pull requests are reviewed and added/released together in weekly meetings (TechMeet, Tuesdays 14-15).
* `GitHub Issues <https://github.com/BIH-CEI/napkon-dynamic/issues>`_ are used for issue-tracking
* To-dos and overview of the development are documented under `Projects > Core NAPKON <https://github.com/BIH-CEI/napkon-dynamic/projects/1>`_

General
=========

* Perform profiling in FSH (not Forge).
* Always specify codes from code systems with designation ("display") using the following short format:
  ``{CodeSystem}|{version}#{code} “{display}”``

  * Version is optional

* Examples

  * In ValueSet: ``* $sct#416798007 "Substance with calcineurin inhibitor mechanism of action (substance)"``
  * In Profile:  ``* code.coding[ops] = $ops|"2021"#8-144 "Therapeutische Drainage der Pleurahöhle"``

Links
-----
* napkon-dynamic repository: https://github.com/BIH-CEI/napkon-dynamic
* Issues: https://github.com/BIH-CEI/napkon-dynamic/issues

Versioning
-------------

* Initial draft (first github push of the functional & validated profile to the own branch):

  * ``Status = #draft``
  * ``Version = 0.1.0``

* For merge in master branch

  * ``Status = #active``
  * ``Version 1.0.0``

FSH File Conventions
=====================
.. _FSH File Conventions:

Profiles
--------
* Each profile in a separate file
* At least one instance of each profile in the same file.
* **Filename**: ``p-<profile-id>.fsh`` (profile-id naming convention see below)
* Identical "file header" (metadata - status, date, publisher etc).

  * | Insert common "file header" into a profile (valueset etc) using the ruleset ``"napkon-metadata(date, status, version)"``
    | Example:
    | ``* insert napkon-metadata(2021-09-13, #draft, 0.1.0)``
    | This consistently inserts the fields status, version, publisher, contact and date

ValueSets
---------
* Each ValueSet into a separate file
* **Filename**: ``vs-<valueset-id>.fsh`` (valueset-id naming convention see below).
* Each ValueSet contains only one terminology (e.g. only ICD10 or only SNOMED CT)
* Reuse ValueSets if possible, if already defined (also outside NAPKONs, e.g. in GECCO)

Aliase
------
* Extra file for managing all aliases (**aliases.fsh**)

Invarianten
-----------
* Like Aliases (with file **invariants.fsh**)



FSH Naming conventions
======================
* Profile/Instance/ValueSet: CamelCase
* Id: dash-case of the Profil/Instance/ValueSets name
* The name/id of **Profiles** (not ValueSets) must be followed by the name of the module:

  * pediatrics (Pädiatriemodul)
  * cardiology (Kardiologiemodul)
  * vaccination (Impfmodul)
  * longcovid (Long-Covid Modul)

* Title = As profile name ("Profile") but with spaces
* Description at one's own discretion

Examples
---------

**Profile**

.. code-block::

  Profile: IntensiveCareTreatmentDuration
  Parent: Observation
  Id: intensive-care-treatment-duration
  Title: "Intensive care treatment duration"
  Description: "Duration of intensive care treatment"

**Instance**

.. code-block::

  Instance: intensive-care-treatment-duration-instance
  InstanceOf: intensive-care-treatment-duration
  Usage: #example
  Title: "intensive-care-treatment-duration-instance"
  Description: "Example of an intensive care treatment duration"

**ValueSet**

.. code-block::

  ValueSet: RestrictedEventStatus
  Id: restricted-event-status
  Title: "RestrictedEventStatus"
  Description: "EventStatus value set restricted to codes not-done, completed and unknown"





Appendix
########

Validation script
==================
The Python script "validate_profile.py" (from the napkon-dynamic github repository) allows validation of profiles by
running sushi and the Java FHIR validator.

Requirements
---------------
 * Python >= 3.5
 * jsonpath_ng library

  * |  Install via
    | ``pip install --upgrade jsonpath-ng``
    | or
    | ``conda install jsonpath-ng -c conda-forge``

 * pandas

Run
------

.. code-block:: shell

  validate_profile.py [-h] [--all] [--subdir SUBDIR] [--base-path BASE_PATH] [--validator-path PATH_VALIDATOR] [--verbose] [--log-path LOG_PATH] [filename [filename ...]]

**Options**

.. code-block:: shell

    positional arguments:
      filename              fsh file names (basename only - no path)

    optional arguments:
      -h, --help            show this help message and exit
      --all                 if set, all detected profiles will be validated
      --subdir SUBDIR       Specifies the subdirectory (relative to input/fsh/) in which to search for profiles if --all is set
      --base-path BASE_PATH
                            base path (containing input/fsh/ directory)
      --validator-path PATH_VALIDATOR
                            path to validator
      --verbose             Be verbose
      --log-path LOG_PATH   log file path - if supplied, log files will be written

**Example call to validate a *single* profile**

.. code-block:: shell

  $ python validate_profile.py p-thoracic-drainage.fsh

**Example call to validate *all* profiles**
The following call validates all profiles in the subdirectory "vaccination/" and writes the results of the validation
log files in the directory logs/.


.. code-block:: shell

  $ python validate_profile.py --all --subdir vaccination/ --log-path logs/

FHIR Java Validator
===================
The syntax for the FHIR Java Validator to validate a profile against an instance is described below.
This can be done automatically by the Python validation script (see above).

Requirements
---------------
* Java must be installed.
* Download the latest version of the validator here: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar


Run
------
Calling the validator to validate an instance on a profile according to the following pattern:

.. code-block:: shell

  java –jar <path-to-validator>/validator_cli.jar \
    -version 4.0.1 \
    -ig <filename-of-profile-StructureDefinition-file> \
    -ig <canonical-name-of-dependencies> \	# optional
    -ig <filename-of-ValueSets> \  			# optional
    -profile <url-of-profile-to-validate-against> \
  <filename-of-instance-file>



**Example 1**
Validate the profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration
(defined in StructureDefinition-intensive-care-treatment-duration.json)
with the instance defined in “Observation-intensive-care-treatment-duration-instance.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig StructureDefinition-intensive-care-treatment-duration.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration \
  Observation-intensive-care-treatment-duration-instance.json



**Example 2**
Validate profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage
(defined in StructureDefinition-thoracic-drainage.json)
with the instance defined in “Procedure-thoracic-drainage-instance.json”
using the dependency “de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2”
and the ValueSet defined in “ValueSet-restricted-event-status.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2 \
  -ig StructureDefinition-thoracic-drainage.json \
  -ig ValueSet-restricted-event-status.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage \
  Procedure-thoracic-drainage-instance.json


**More information**
* https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator
