//Author: THA
Alias: §sct = http://snomed.info/sct

ValueSet: AntibioticTherapyProcedure
Id: vs-antibiotic-therapy-procedure-pediatrics
Title: "Antibiotic Therapy Procedure PediatricsVS"
Description:  "Antibiotic Therapy the context of pediatrics and Covid-19"

* ^status = #draft
* ^date = "2021-05-28"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* include codes from system SNOMED_CT where concept is-a #281789004
