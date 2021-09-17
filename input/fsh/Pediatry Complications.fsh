Alias: $sct = http://snomed.info/sct
Alias: $gecco-base-condition = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/gecco-base-condition
Alias: $pediatry-infectious-complications-sct = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/infectious-complications-sct


Profile: PediatryInfectiousComplication
//Procedure on the basis of MEI 
Parent: Condition 
Id: gecco-base-condition
Title: "Pediatry Infectious Complications"
Description: "Defines constraints and methods on pediatry infectious complications"
* ^date = "2021-07-30"
* ^publisher = "Charité"
* ^status = #active
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = http://snomed.info/sct#40733004
* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code[sct] from $infectious-complications-sct (required)
* performed[x] 1..1
* subject only Reference(Patient)


