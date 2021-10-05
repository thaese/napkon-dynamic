//Author: Sally Brose
// Berlin Institute of Health | Charité 
Alias: §sct = http://snomed.info/sct
Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

Profile: MedicalHistoryStemCellsTransplant
Parent: Condition
Id: medical-history-stem-cell-transplant
Title: "Medical History Stem Cells Transplant"
Description: "This profile describes a stem cell transplant for a pediatric patient."
* ^url = "https://simplifier.net/basisprofilde/condition-de-basis-0.2"
* insert napkon-metadata(2021-10-01)
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
	icd10-gm 1..1 and
	sct 1..1
* code.coding[icd10-gm] = from $MedicalHistoryStemCellsICD (required)
* code.coding[sct] = from $MedicalHistoryStemCellsICD (required)
* code.coding[sct] = $sct#77158009 "Structure of transplanted bone marrow (body structure)"
* code 1..1 MS


Instance: medical-history-stem-cell-transplant-instance
InstanceOf: medical-history-stem-cell-transplant
Usage: #example
Title: "medical-history-stem-cell-transplant -instance"
Description:  "This profile describes a stem cell transplant for a pediatric patient."
* status = #draft
* category.coding[sct] = $sct#77158009 "Structure of transplanted bone marrow (body structure)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
