// Author: Thomas Haese
// Charité – Universitätsmedizin Berlin

Profile: ChronicKidneyDiseases
Parent: Condition
Id: chronic-kidney-diseases
Title: "Chronic Kidney Diseases"
Description: "Chronic kidney diseases in the context of pediatrics"

* insert napkon-metadata(2021-10-18, #draft, 0.1.0)

* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#709044004 "Chronic kidney disease (disorder)"
* code ^slicing.discriminator.type = #pattern
* code ^slicing.discriminator.path = "$this"
* code ^slicing.rules = #open
* code contains
    sct 0..1 and
    icd10-gm 0..1
* code[sct] from $ChronicKidneyDiseases (required)
* code[icd10-gm] from $ChronicKidneyDiseasesICD (required)
* subject only Reference(Patient)

Instance: instance-chronic-kidney-diseases-sct
InstanceOf: chronic-kidney-diseases
Usage: #example
Title: "Instance of fhir resource chronic kidney diseases in the context of pediatrics"
Description: "Example or chronic kidney diseases"

* code = $sct#82525005 "Congenital cystic kidney disease (disorder)"
* subject = Reference(ExamplePatient)


Instance: instance-chronic-kidney-diseases-icd
InstanceOf: chronic-kidney-diseases
Usage: #example
Title: "Instance of fhir resource chronic kidney diseases in the context of pediatrics"
Description: "Example or chronic kidney diseases"

* code = $icd10-gm#N39.9 "Krankheit des Harnsystems, nicht näher bezeichnet"
* subject = Reference(ExamplePatient)