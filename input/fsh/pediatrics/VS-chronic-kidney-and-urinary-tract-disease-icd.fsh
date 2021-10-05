// Author: Sally 
// Berlin Institute of Health | Charité
// This is a FSH profiling file under development. See sushi documentation for usage.

Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

ValueSet: ChronicKidneyAndUrinaryTractDiseaseICD
Id: chronic-kidney-and-urinary-tract-disease-icd
Title: "ValueSetChronicKidneyAndUrinaryTractDiseaseICD"
Description:  "Medical history linked to congenital disease of the kidney or urinary tract for pediatric patients"
* ^url = $ChronicKidneyAndUrinaryTractDiseaseICD // Path declared as Alias
* ^status = #draft

// Codes for CHRONIC KIDNEY AND URINARY TRACT DISEASE ICD-10-GM
* include codes from system $icd-10-gm where concept is-a # Q60.- "Nierenagenesie und sonstige Reduktionsdefekte der Niere"
* include codes from system $icd-10-gm where concept is-a # Q61.- "Zystische Nierenkrankheit"
* include codes from system $icd-10-gm where concept is-a # Q62.- "Angeborene obstruktive Defekte des Nierenbeckens und angeborene Fehlbildungen des Ureters"
* include codes from system $icd-10-gm where concept is-a # Q63.- "Sonstige angeborene Fehlbildungen der Niere"
* include codes from system $icd-10-gm where concept is-a # Q64.- "Sonstige angeborene Fehlbildungen des Harnsystems"
