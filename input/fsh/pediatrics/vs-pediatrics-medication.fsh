// Author: Sally
// Berlin Institute of Health | Charité

ValueSet: MedicationPediatrics
Id: medication-pediatrics
Title: "ValueSetMedicationPediatrics"
Description:  "Medication used in the case of a of Covid-19 infection and Pediatrics"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)

// Codes for MEDICATION
* $sct#387458008 "Aspirin (substance)"
* $sct#112133008 "Immunoglobulin (substance)"
* $sct#444648007 "Tocilizumab (substance)"
* $sct#385549000 "Anakinra (substance)"
* include codes from system $sct where concept is-a #373213009 "Inotropic agent (substance)"
* include codes from system $sct where concept is-a #870406003 "Vasopressor (substance)"
