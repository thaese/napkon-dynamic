// Author: Sami Adnan
// Berlin Institute of Health | Charité
// This is an FSH profiling file under development. See sushi documentation for usage.

// Declare Alias for the profiles
Alias: LNC = http://loinc.org
Alias: sct = http://snomed.info/sct
Alias: $ObservationLab = https://www.medizininformatik-initiative.de/fhir/core/modul-labor/StructureDefinition/ObservationLab
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $sct = http://snomed.info/sct
Alias: SNOMED_CT = http://snomed.info/sct
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $loinc = http://loinc.org
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $gecco-base-condition = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/gecco-base-condition
Alias: $data-absent-reason = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $cardiovascular-diseases-icd = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/cardiovascular-diseases-icd
Alias: $cardiovascular-diseases = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/cardiovascular-diseases
Alias: $CardiologyDiseasesCodes = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/CardiologyDiseasesCodes
Alias: $cardiovascular-diseases-icd = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/cardiovascular-diseases-icd
Alias: $cardiovascular-diseases = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/cardiovascular-diseases
Alias: $CardiologyDiseases = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/CardiologyDiseases
// End declaration of Alias. Keeping all here even if depreciated.

// Profile HEADER
Profile: CardiologyDiseases
Parent: $gecco-base-condition
Id: napkon-cardiology-diseases
Title: "Disorders (Cardiology)"
Description: "Defines constraints and extensions on the conditions resource for the minimal
set of data to query and retrieve diseases related to the field of Cardiology."
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/CardiologyDiseases"
* ^publisher = "BIH@Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* category 1.. MS
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 0..1
// * category[SCT] = // Leave this to specify/restrict in the future

* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code[sct] from $CardiologyDiseasesCodes (required) // Assigning ValuSet requirement
// * code[SCT] = // Leave this to specify/restrict in the future

* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains vascularMedicine 1..1 MS
* category.coding[vascularMedicine] = $sct#722414000
* category.coding[vascularMedicine].system 1.. MS
* category.coding[vascularMedicine].code 1.. MS
* code.coding[icd10-gm] from $cardiovascular-diseases-icd (required)
// * code.coding[icd10-gm] ^sliceName = "icd10-gm"
* code.coding[sct] from $cardiovascular-diseases (required)
* code.coding[sct] ^sliceName = "sct"
* onsetPeriod ^sliceName = "onsetPeriod"
* onsetPeriod.extension ^slicing.discriminator.type = #value
* onsetPeriod.extension ^slicing.discriminator.path = "url"
* onsetPeriod.extension ^slicing.rules = #open
* onsetPeriod.extension[dataAbsentReason] only $data-absent-reason
* onsetPeriod.extension[dataAbsentReason] ^sliceName = "dataAbsentReason"
* onsetDateTime ^sliceName = "onsetDateTime"
* onsetDateTime.extension ^slicing.discriminator.type = #value
* onsetDateTime.extension ^slicing.discriminator.path = "url"
* onsetDateTime.extension ^slicing.rules = #open
* onsetDateTime.extension[dataAbsentReason] only $data-absent-reason
* onsetDateTime.extension[dataAbsentReason] ^sliceName = "dataAbsentReason"

* subject only Reference(Patient)

// Profile INSTANCE
Instance: CardiologyDiseasesInstance
InstanceOf: $CardiologyDiseases
Usage: #example
* code[sct] = sct#84114007
* subject = Reference(Patient/example)

// ValueSet INSTANCE
Instance: CardiologyDiseasesCodes
InstanceOf: ValueSet

* url = $CardiologyDiseasesCodes
* status = #draft

* compose.include[0].system = sct
* compose.include[0].concept[0].code = sct#63593006
* compose.include[0].concept[0].display = "Supraventricular premature beats (disorder)"
