ValueSet: GastrointestinalDiseasesPediatricsICD
Id: gastrointestinal-diseases-pediatrics-icd
Title: "Gastrointestinal Diseases Pediatrics ICD-VS"
Description:  "Gastrointestinal diseases in the context of pediatrics and Covid-19"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* $icd10-gm#K59.9 "Funktionelle Darmstörung, nicht näher bezeichnet"
// Chronisch entzündliche Darmerkrankung fehlt
* $icd10-gm#K90.0 "Zöliakie"
* $icd10-gm#Z91.0 "Kuhmilchproteinallergie"
* $icd10-gm#K83.9 "Gallengangserkrankung"

// Andere fehlt =>
// Alle Codes unter K und Z verfügbar machen //
//* include codes from system $icd-10-gm where concept regex /^K.*/ and child exists false
//* include codes from system $icd-10-gm where concept regex /^Z.*/ and child exists false
