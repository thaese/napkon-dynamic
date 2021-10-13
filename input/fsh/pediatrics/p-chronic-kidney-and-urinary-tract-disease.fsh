//Author: Sally Brose
// Berlin Institute of Health | Charité

Profile: ChronicKidneyAndUrinaryTractDisease
Parent: Condition
Id: chronic-kidney-and-urinary-tract-disease
Title: "Chronic Kidney And Urinary Tract Disease"
Description: "This profile describes a congenital disease of the kidneys or the urinary tract for a pediatric patient."
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains
	icd10-gm 1..1
	and sct 1..1 MS
* category.coding[icd10-gm] = $icd10-gm#Q60 "Nierenagenesie und sonstige Reduktionsdefekte der Niere"
* category.coding[sct] = $sct#82525005 "Congenital cystic kidney disease (disorder)"
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
	icd 1..1
	and sct 1..1 MS
* code 1..1 MS
* code.coding[sct] from ChronicKidneyAndUrinaryTractDisease (required)
* code.coding[icd] from ChronicKidneyAndUrinaryTractDiseaseICD (required)

Instance: chronic-kidney-and-urinary-tract-disease-instance
InstanceOf: chronic-kidney-and-urinary-tract-disease
Usage: #example
Title: "chronic-kidney-and-urinary-tract-disease-instance"
Description:  "This profile describes a congenital disease of the kidneys or the urinary tract for a pediatric patient."
* code.coding[icd] = $icd10-gm#Q60 "Nierenagenesie und sonstige Reduktionsdefekte der Niere"
* code.coding[sct] = $sct#82525005 "Congenital cystic kidney disease (disorder)"
* subject = Reference(ExamplePatient)
