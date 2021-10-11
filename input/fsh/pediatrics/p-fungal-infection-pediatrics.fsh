// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: FungalInfectionPediatrics
Parent: Condition
Id: fungal-infection-pediatrics
Title: "Fungal Infection"
Description: "Occurrence of a fungal infection"
* insert napkon-metadata(2021-09-22, #draft, 0.1.0)
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#3218000 "Mycosis (disorder)"
* code 1..1 MS
* code from FungalInfections (required)

Instance: fungal-infection-instance
InstanceOf: fungal-infection-pediatrics
Usage: #example
Title: "fungal-infection-instance"
Description: "Example of a fungal infection"
* code =  $sct#53326005 "Candida albicans (organism)"
* subject = Reference(ExamplePatient)
