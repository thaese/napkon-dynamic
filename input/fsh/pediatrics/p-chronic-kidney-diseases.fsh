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
* category contains 
    sct 0..1 and 
    icd10-gm 0..1
* category[sct] = $sct#709044004 "Chronic kidney disease (disorder)"
* code 1..1 MS
* code from $ChronicKidneyDiseases (required)
* code from ChronicKidneyDiseasesICD (required)
* subject MS
* subject only Reference(Patient)

Instance: instance-chronic-kidney-diseases-sct
InstanceOf: chronic-kidney-diseases
Usage: #example
Title: "Instance of fhir resource chronic kidney diseases in the context of pediatrics"
Description: "Example or chronic kidney diseases"
* code = $sct#128606002 "Disorder of the urinary system (disorder)"
* subject = Reference(ExamplePatient)


Instance: instance-chronic-kidney-diseases-icd
InstanceOf: chronic-kidney-diseases
Usage: #example
Title: "Instance of fhir resource chronic kidney diseases in the context of pediatrics"
Description: "Example or chronic kidney diseases"
//* code.coding[icd10-gm] = $icd10-gm#N39.9 "Krankheit des Harnsystems, nicht näher bezeichnet"
* code = $icd10-gm#N39.9 "Krankheit des Harnsystems, nicht näher bezeichnet"
* subject = Reference(ExamplePatient)