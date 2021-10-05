// Author: Sally 
// Berlin Institute of Health | Charité
// This is an FSH profiling file under development. See sushi documentation for usage.
ValueSet: ImagingPediatrics
Id: imaging-pediatrics
Title: "ValueSetImagingPediatrics"
Description:  "Imaging procedures used in the case of a of Covid-19 infection and Pediatrics"
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)
// CAUTION! //
// Add Pediatric codes in this ValueSet, devide sections by commenting HEADER

// ValueSet HEADER
ValueSet: PediatricsImagingCodes
Id: pediatric-imaging-codes
Title: "ValueSet for Pediatric Module"
Description:  "Codes related to the Pediatric Module."
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)
//* ^url = $PediatricsImagingCodes // Path declared as Alias // GL: not defined

// Codes for IMAGING PROCEDURES
* $sct#40701008 "Echocardiography (procedure)" 
* $sct#450436003 "Positron emission tomography with computed tomography (procedure)" 
