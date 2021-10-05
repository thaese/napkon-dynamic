// Author: Sally 
// Berlin Institute of Health | Charité
// This is an FSH profiling file under development. See sushi documentation for usage.

//GL: valuesets already exist
/*
ValueSet: DrugTherapyPediatrics
Id: drug-therapy-pediatrics
Title: "ValueSetDrugTherapyPediatrics"
Description:  "Drug thereapy used in the case of a of Covid-19 infection and Pediatrics"
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)
// CAUTION! //
// Add Pediatric codes in this ValueSet, devide sections by commenting HEADER

// ValueSet HEADER
ValueSet: PediatricsDrugTherapyCodes
Id: pediatric-drug-therapy-codes
Title: "ValueSet for Pediatric Module"
Description:  "Codes related to the Pediatric Module."

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* ^url = $PediatricsDrugTherapyCodes // Path declared as Alias

// Codes for HEMOSTASEOLOGIC THERAPY
* include codes from system SNOMED_CT where concept is-a $sct#346447007 "Fresh frozen plasma (product)" 
* include codes from system SNOMED_CT where concept is-a $sct#12719002 "Platelet transfusion (procedure)"

//anderes ValueSet bauen 
* include codes from system SNOMED_CT where concept is-a $sct#1003715001 "Product containing coagulation protein (product)"
*/