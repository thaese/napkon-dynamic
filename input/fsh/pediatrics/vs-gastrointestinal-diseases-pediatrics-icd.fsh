// Author: Thomas Haese

Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

ValueSet: GastrointestinalDiseasesPediatricsICD
Id: gastrointestinal-diseases-pediatrics-icd
Title: "Gastrointestinal Diseases Pediatrics ICD-VS"
Description:  "Gastrointestinal diseases in the context of pediatrics and Covid-19"

* ^date = "2021-09-10"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* ^status = #draft

* $icd-10-gm#K59.9 "Funktionelle Darmstörung, nicht näher bezeichnet"
* $icd-10-gm#K52.9 "Nichtinfektiöse Gastroenteritis und Kolitis, nicht näher bezeichnet"
* $icd-10-gm#K90.0 "Zöliakie"
* $icd-10-gm#Z91.0 "Kuhmilchproteinallergie"
* $icd-10-gm#K83.9 "Gallengangserkrankung"

//Andere fehlt

// Alle Codes unter K und Z verfügbar machen //
//* include codes from system $icd-10-gm where concept regex /^K.*/ and child exists false
//* include codes from system $icd-10-gm where concept regex /^Z.*/ and child exists false
