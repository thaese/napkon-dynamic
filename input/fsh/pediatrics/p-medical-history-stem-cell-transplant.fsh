//Author: Sally Brose
// Berlin Institute of Health | Charité 

Profile: MedicalHistoryStemCellsTransplant
Parent: Condition
Id: medical-history-stem-cell-transplant
Title: "Medical History Stem Cells Transplant"
Description: "This profile describes a stem cell transplant for a pediatric patient."
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)

* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains 
   icd10-gm 1..1 and sct 1..1 MS
* category.coding[sct] = $sct#77158009 "Structure of transplanted bone marrow (body structure)"
* category.coding[icd10-gm] = $icd10-gm#Z94.80 "Zustand nach hämatopoetischer Stammzelltransplantation ohne gegenwärtige Immunsuppression"
* code 1..1 MS
* code from MedicalHistoryStemCells (required)
* code from MedicalHistoryStemCellsICD (required)



Instance: medical-history-stem-cell-transplant-instance
InstanceOf: medical-history-stem-cell-transplant
Usage: #example
Title: "medical-history-stem-cell-transplant-instance"
Description: "This profile describes a stem cell transplant for a pediatric patient."
* code = $sct#77158009 "Structure of transplanted bone marrow (body structure)"
* code = $icd10-gm#Z94.80 "Zustand nach hämatopoetischer Stammzelltransplantation ohne gegenwärtige Immunsuppression"
* subject = Reference(ExamplePatient)

