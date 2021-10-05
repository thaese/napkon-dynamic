// Author: Sally 
// Berlin Institute of Health | Charité
// This is a FSH profiling file under development. See sushi documentation for usage.

Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

ValueSet: MedicalHistoryStemCellsICD
Id: medical-history-stem-cells-icd
Title: "ValueSetMedicalHistoryStemCells"
Description:  "Medical history linked to stem cells or bone marrow transplant for pediatric patients"
* ^url = $ MedicalHistoryStemCellsICD // Path declared as Alias

// Codes for MEDICAL HISTORY STEM CELLS ICD-10-GM
* $icd-10-gm# Z94.80 "Zustand nach hämatopoetischer Stammzelltransplantation ohne gegenwärtige Immunsuppression"
* $icd-10-gm# Z94.81 "Zustand nach hämatopoetischer Stammzelltransplantation mit gegenwärtiger Immunsuppression"
