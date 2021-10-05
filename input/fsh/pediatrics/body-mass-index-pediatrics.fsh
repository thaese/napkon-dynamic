// Author: Thomas Haese

Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct

Profile: BodyMassIndexPediatrics
Parent: Observation
Id: observation-body-mass-index-pediatrics
Title: "Body Mass Index"
Description: "Body mass index of a patient in context of Pediatrics"

* ^date = "2021-08-10"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* code ^short = "Body Mass index"
* code ^definition = "Body Mass index"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* 
  //  snomed 0..*
* code.coding[loinc] = $loinc#39156-5
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
//* code.coding[snomed] = $sct#60621009
//* code.coding[snomed].system 1..
//* code.coding[snomed].code 1..

* value[x] MS
* value[x] only Quantity


* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.unit = "BMI"

//Perzentile offen

//Instance
Instance: instance-body-mass-index-pediatrics 
InstanceOf: observation-body-mass-index-pediatrics
Usage: #example
Title: "Instance of fhir resource body mass index in the context of pediatrics"
Description: "Example of body mass index"

//Values
* valueQuantity.value = 25
* status = #final