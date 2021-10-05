// Author: Thomas Haese

Alias: $sct = http://snomed.info/sct
Alias: $icd10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm
Alias: $ChronicHaematologicDiseasesPediatricsICD = https://www.netzwerk-universitaetsmedizin.de/fhir//ValueSet/chronic-haematologic-diseases-pediatrics-icd
Alias: $ChronicHaematologicDiseasesPediatrics = https://www.netzwerk-universitaetsmedizin.de/fhir//ValueSet/chronic-haematologic-diseases-pediatrics

Profile: ChronicHaematologicDiseases
Parent: Condition
Id: chronic-haematologic-diseases-pediatrics
Title: "Chronic Haematologic Diseases"
Description: "Chronic Haematologic diseases as a risk factor for a severe course of an infection with SARS-CoV-2 in the context of pediatrics"

* ^date = "2021-08-02"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* ^status = #draft

* category 1..
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains clinicalHematology  1..1 MS
* category.coding[clinicalHematology] = §sct#394803006
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





