//Author: Thomas Haese

Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct

Profile: BirthHeightPediatrics
Parent: Observation
Id: observation-birth-height-pediatrics
Title: "Birth Height"
Description: "Birth Height of a patient in context of Pediatrics"

* ^experimental = false
* ^date = "2021-08-10"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* code ^short = "Birth Height"
* code ^definition = "Birth Height"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#89269-5
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $sct#169886007
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..

* value[x] only Quantity
* value[x] MS
* valueQuantity 0..1
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
//Percentile
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
//cm
* valueQuantity.code 1.. MS
* valueQuantity.code from http://hl7.org/fhir/ValueSet/ucum-bodylength|4.0.1 (required)

* dataAbsentReason MS