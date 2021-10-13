//Author: Sally Brose
// Berlin Institute of Health | Charité 
/*
Profile: PediatricMedication
Parent: MedicationStatement
Id: pediatric-medication
Title: "Profile - MedicationStatement - Medikation"
Description: "Prescription of a medication or consumption by a pediatric patient."

* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* status from RestrictedEventStatus //wenn nur einen code dann wie in zeile 15. Mehrere codes: "from ...vs name schreiben"
* category.coding[sct] = $sct#387458008 "Aspirin (substance)"
* category.coding[sct] = $sct#387458008 "Aspirin (substance)"
* category.coding[sct] = $sct#444648007 "Tocilizumab"
* category.coding[sct] = $sct#385549000 "Anakinra (substance)"
* code.coding[sct] = codes from system $sct where concept is-a #373213009  "Inotropic agent (substance)"
* code.coding[sct] = codes from system $sct where concept is-a #870406003 "Vasopressor (substance)"

Instance: pediatric-medication-instance
InstanceOf: pediatric-medication
Usage: #example
Title: "pediatric-medication-instance"
Description: "Example of a prescription of a medication or consumption by a pediatric patient "
* status = #draft
* code = $sct#387458008 "Aspirin (substance)"
* subject = Reference(ExamplePatient)
*/