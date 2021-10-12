// Author: Thomas Haese
Alias: $GastrointestinalDiseasesPediatricsICD = https://www.netzwerk-universitaetsmedizin.de/fhir//ValueSet/gastrointestinal-diseases-pediatrics-icd
Alias: $GastrointestinalDiseasesPediatrics = https://www.netzwerk-universitaetsmedizin.de/fhir//ValueSet/gastrointestinal-diseases-pediatrics

Profile:        GastrointestinalDiseasesPediatrics
Parent:         Condition
Id:             gastrointestinal-diseases-pediatrics
Title:          "Gastrointestinal Diseases Pediatrics"
Description:    "Gastrointestinal diseases in the field of pediatrics as a risk factor for a severe course of an infection with SARS-CoV-2."

* insert napkon-metadata(2021-08-11, #draft, 0.1.0)

* category 1.. MS
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains gastroenterology 1..1 MS
* category.coding[gastroenterology] = $sct#394584008
* category.coding[gastroenterology].system 1.. MS
* category.coding[gastroenterology].code 1.. MS

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    icd10-gm 0..1 and
    sct 0..1
* code.coding[icd10-gm] from $GastrointestinalDiseasesPediatricsICD (required)
* code.coding[sct] from $GastrointestinalDiseasesPediatrics (required)

Instance: instance-gastrointestinal-diseases-pediatrics
InstanceOf: gastrointestinal-diseases-pediatrics
Usage: #example
Title: "Instance of fhir resource sgastrointestinal-diseases in the context of pediatrics"
Description: "Example of a gastrointestinal disease"
* code = $sct#236069009 "Chronic constipation (disorder)"
* subject = Reference(ExamplePatient)

Instance: instance-gastrointestinal-diseases-pediatrics-icd10
InstanceOf: gastrointestinal-diseases-pediatrics
Usage: #example
Title: "Instance of fhir resource sgastrointestinal-diseases in the context of pediatrics"
Description: "Example of a gastrointestinal disease"
* code = $icd10-gm#K59.9 "Funktionelle Darmstörung, nicht näher bezeichnet"
* subject = Reference(ExamplePatient)
