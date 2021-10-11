// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: InfectiousComplicationPediatrics
Parent: Condition
Id: infectious-complications-pediatrics
Title: "Pediatry Infectious Complications"
Description: "Defines constraints and methods on pediatry infectious complications"
* insert napkon-metadata(2021-07-30, #draft, 0.1.0)
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#40733004 "Infectious disease (disorder)"
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains sct 1..1
* code.coding[sct] from $infectious-complications-sct (required)
* subject only Reference(Patient)

Instance: InfectionsComplicationPediatrics
InstanceOf: infectious-complications-pediatrics
Usage: #example
Title: "InfectionsComplicationPediatrics"
Description: "Example instance of infectious-complications-pediatrics"
* code = $sct#235859005:246112005=386134007 "Liver disorder due to infection where Severity = Significant"
* subject = Reference(ExamplePatient)
