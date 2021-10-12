// Author: Thomas Haese
ValueSet: GastrointestinalDiseasesPediatricsICD
Id: gastrointestinal-diseases-pediatrics-icd
Title: "Gastrointestinal Diseases Pediatrics ICD-VS"
Description:  "Gastrointestinal diseases in the context of pediatrics and Covid-19"

* insert napkon-metadata(2021-09-10, #draft, 0.1.0)

* $icd10-gm#K59.9 "Funktionelle Darmstörung, nicht näher bezeichnet"
* $icd10-gm#K52.9 "Nichtinfektiöse Gastroenteritis und Kolitis, nicht näher bezeichnet"
* $icd10-gm#K90.0 "Zöliakie"
* $icd10-gm#Z91.0 "Kuhmilchproteinallergie"
* $icd10-gm#K83.9 "Gallengangserkrankung"

//Andere fehlt

// Alle Codes unter K und Z verfügbar machen //
//* include codes from system $icd10-gm where concept regex /^K.*/ and child exists false
//* include codes from system $icd10-gm where concept regex /^Z.*/ and child exists false
