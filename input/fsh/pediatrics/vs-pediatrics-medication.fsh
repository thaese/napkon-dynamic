// Author: Sally 
// Berlin Institute of Health | Charité
// This is an FSH profiling file under development. See sushi documentation for usage.
ValueSet: MedicationPediatrics
Id: medication-pediatrics
Title: "ValueSetMedicationPediatrics"
Description:  "Medication used in the case of a of Covid-19 infection and Pediatrics"
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)
// CAUTION! //
// Add Pediatric codes in this ValueSet, devide sections by commenting HEADER

// ValueSet HEADER
ValueSet: PediatricMedicationCodes
Id: pediatric-medication-codes
Title: "ValueSet for Pediatric Module"
Description:  "Codes related to the Pediatric Module."
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)
//* ^url = $PediatricsMedicationCodes // Path declared as Alias // GL: not defined

// Codes for MEDICATION
* $sct#387458008 "Aspirin (substance)" 
* $sct#333710000 "Product containing immunoglobulin (product)" 
* $sct#444648007 "Tocilizumab (substance)" 
* $sct#385549000 "Anakinra (substance)" 
* include codes from system SNOMED_CT where concept is-a $sct#373213009 "Inotropic agent (substance)" 
* include codes from system SNOMED_CT where concept is-a $sct#870406003 "Vasopressor (substance)" 


