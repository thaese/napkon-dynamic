// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: TotalLengthOfStay
Parent: Observation
Id: total-length-of-stay
Title: "Total length of stay"
Description: "Total length of stay"
* insert napkon-metadata(2021-09-15, #draft, 0.1.0)
* code ^short = "Days in intensive care unit"
* code ^definition = "Days in intensive care unit"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..*
* code.coding[loinc] = $loinc#78033-8 "Hospital stay duration"
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = $ucum
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.unit = "day"
* valueQuantity.code 1.. MS
* valueQuantity.code = #d

Instance: TotalLengthOfStay
InstanceOf: total-length-of-stay
Usage: #example
Title: "Total Length of Stay"
Description: "Example of an total length of stay"
* valueQuantity.value = 10
* status = #final
