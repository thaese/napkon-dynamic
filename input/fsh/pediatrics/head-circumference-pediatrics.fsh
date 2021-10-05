//Author: Thomas Haese
Profile: HeadCircumferencePediatrics
Parent: Observation
Id: observation-head-circumference-pediatrics
Title: "Head circumference"
Description: "Head circumference of a patient in context of Pediatrics"

* insert napkon-metadata(2021-08-10, #draft, 0.1.0)

* code ^short = "Head circumference at birth"
* code ^definition = "Head circumference at birth"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..*
* code.coding[loinc] = $loinc#9843-4
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..

* value[x] MS
* value[x] only Quantity

//For cm
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.unit = "cm"

//For percentiles
//* valueQuantity.system 1.. MS
//* valueQuantity.system = "http://unitsofmeasure.org"
//* valueQuantity.value 1.. MS
//* valueQuantity.unit 1.. MS
//* valueQuantity.unit = "Perzentile"



Instance: instance-head-circumference-pediatrics
InstanceOf: observation-head-circumference-pediatrics
Usage: #example
Title: "Instance of fhir resource head circumference in teh context of pediatrics"
Description: "Example of a head circumference"

//cm
* valueQuantity.value = 10
* status = #final
