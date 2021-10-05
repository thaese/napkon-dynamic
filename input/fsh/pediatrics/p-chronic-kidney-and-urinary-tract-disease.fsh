//Author: Sally Brose
// Berlin Institute of Health | Charité 
Alias: §sct = http://snomed.info/sct
Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

Profile: ChronicKidneyAndUrinaryTractDisease
Parent: Condition
Id: chronic-kidney-and-urinary-tract-disease
Title: "Chronic Kidney And Urinary Tract Disease"
Description: "This profile describes a congenital disease of the kidneys or the urinary tract for a pediatric patient."
* ^url = "https://simplifier.net/basisprofilde/condition-de-basis-0.2"
* insert napkon-metadata(2021-10-01)
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
	icd10-gm 1..1 and
	sct 1..1
* code.coding[icd10-gm] = from $ChronicKidneyAndUrinaryTractDiseaseICD (required)
* code.coding[sct] = from $ChronicKidneyAndUrinaryTractDisease (required)

* code.coding[sct] = $sct#82525005 "Congenital cystic kidney disease (disorder)"
* code.coding[sct] = $sct#118642009 "Congenital anomaly of the urinary tract proper (disorder)"
* code 1..1 MS
* code from $ChronicKidneyAndUrinaryTractDisease (required)


Instance: chronic-kidney-and-urinary-tract-disease-instance
InstanceOf: chronic-kidney-and-urinary-tract-disease
Usage: #example
Title: "chronic-kidney-and-urinary-tract-disease-instance"
Description:  "This profile describes a congenital disease of the kidneys or the urinary tract for a pediatric patient."
* status = #draft
* category.coding[sct] = $sct#82525005 "Congenital cystic kidney disease (disorder)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
