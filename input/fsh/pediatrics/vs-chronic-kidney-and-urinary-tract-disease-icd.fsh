// Author: Sally
// Berlin Institute of Health | Charité

ValueSet: ChronicKidneyAndUrinaryTractDiseaseICD
Id: chronic-kidney-and-urinary-tract-disease-icd
Title: "ValueSetChronicKidneyAndUrinaryTractDiseaseICD"
Description:  "Medical history linked to congenital disease of the kidney or urinary tract for pediatric patients"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)

// Codes for CHRONIC KIDNEY AND URINARY TRACT DISEASE ICD-10-GM
* include codes from system $icd10-gm where concept is-a #Q60 "Nierenagenesie und sonstige Reduktionsdefekte der Niere"
* include codes from system $icd10-gm where concept is-a #Q61 "Zystische Nierenkrankheit"
* include codes from system $icd10-gm where concept is-a #Q62 "Angeborene obstruktive Defekte des Nierenbeckens und angeborene Fehlbildungen des Ureters"
* include codes from system $icd10-gm where concept is-a #Q63 "Sonstige angeborene Fehlbildungen der Niere"
* include codes from system $icd10-gm where concept is-a #Q64 "Sonstige angeborene Fehlbildungen des Harnsystems"
