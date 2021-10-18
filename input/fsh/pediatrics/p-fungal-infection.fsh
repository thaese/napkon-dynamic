// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: FungalInfection
Parent: $gecco-base-condition
Id: fungal-infection
Title: "Fungal Infection"
Description: "Occurrence of a fungal infection"
* insert napkon-metadata(2021-09-22, #draft, 0.1.0)
// TODO remove category?
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#3218000 "Mycosis (disorder)"
* code 1..1 MS
* code from FungalInfections (required)

Instance: FungalInfection
InstanceOf: fungal-infection
Usage: #example
Title: "fungal-infection-instance"
Description: "Example of a fungal infection"
* code =  $sct#53326005 "Candida albicans (organism)"
* subject = Reference(ExamplePatient)
* recordedDate = "2021-09-14T13:06:00+02:00"
