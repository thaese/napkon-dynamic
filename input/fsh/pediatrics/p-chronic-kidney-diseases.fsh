// Author: Thomas Haese
// Charité – Universitätsmedizin Berlin

Profile: ChronicKidneyDiseases
Parent: Condition
Id: chronic-kidney-diseases
Title: "Chronic Kidney Diseases"
Description: "Chronic kidney diseases in the context of pediatrics"

* insert napkon-metadata(2021-10-18, #draft, 0.1.0)

* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#709044004 "Chronic kidney disease (disorder)"
* code 1..1 MS
* code from FungalInfections (required)
