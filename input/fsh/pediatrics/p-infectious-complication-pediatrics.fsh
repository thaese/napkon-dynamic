Alias: $infectious-complications-sct = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/infectious-complications-sct


Profile: InfectiousComplicationPediatrics
//Procedure on the basis of MEI 
Parent: Condition 
Id: infectious-complications-pediatrics
Title: "Pediatry Infectious Complications"
Description: "Defines constraints and methods on pediatry infectious complications"

* insert napkon-metadata(2021-07-30, #draft, 0.1.0)

* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#40733004 "Infectious disease (disorder)"
* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code[sct] from $infectious-complications-sct (required)
* subject only Reference(Patient)


