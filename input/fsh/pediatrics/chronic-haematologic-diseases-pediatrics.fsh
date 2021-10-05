// Author: Thomas Haese

Alias: $ChronicHaematologicDiseasesPediatricsICD = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/chronic-haematologic-diseases-pediatrics-icd
Alias: $ChronicHaematologicDiseasesPediatrics = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/chronic-haematologic-diseases-pediatrics

Profile: ChronicHaematologicDiseases
Parent: Condition
Id: chronic-haematologic-diseases-pediatrics
Title: "Chronic Haematologic Diseases"
Description: "Chronic Haematologic diseases as a risk factor for a severe course of an infection with SARS-CoV-2 in the context of pediatrics"

* insert napkon-metadata(2021-08-02, #draft, 0.1.0)

* category 1..
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains clinicalHematology  1..1 MS
* category.coding[clinicalHematology] = $sct#394803006
* category.coding[clinicalHematology].system 1.. MS
* category.coding[clinicalHematology].code 1.. MS

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    icd10-gm 1..1 and
    sct 1..1
* code.coding[icd10-gm] from $ChronicHaematologicDiseasesPediatricsICD (required)
* code.coding[sct] from $ChronicHaematologicDiseasesPediatrics (required)
