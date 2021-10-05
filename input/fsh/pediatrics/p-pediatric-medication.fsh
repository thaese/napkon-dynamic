//Author: Sally Brose
// Berlin Institute of Health | Charité 
Alias: $MII-Reference = https://www.medizininformatik-initiative.de/fhir/core/StructureDefinition/MII-Reference
Alias: $target-site-uv-ips = http://hl7.org/fhir/uv/ips/ValueSet/target-site-uv-ips
Alias: $medicine-route-of-administration = http://hl7.org/fhir/uv/ips/ValueSet/medicine-route-of-administration

Profile: Pediatric Medication
Parent: Profile-MII-MedicationStatement
Id: pediatric-medication
Title: "Profile - MedicationStatement - Medikation"
Description: "Prescription of a medication or consumption by a pediatric patient."
* ^url = "https://www.medizininformatik-initiative.de/fhir/core/modul-medikation/StructureDefinition/MedicationStatement"
* insert napkon-metadata(2021-09-23)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#387458008 "Aspirin (substance)"
* code.coding[sct] = $sct#387458008 "Aspirin (substance)"
* code.coding[sct] = $sct#444648007 "Tocilizumab"
* code.coding[sct] = $sct#385549000 "Anakinra (substance)"
* code.coding[sct] = include codes from system $sct where concept is-a #373213009  "Inotropic agent (substance)"
* code.coding[sct] = include codes from system $sct where concept is-a #870406003 "Vasopressor (substance)"

Instance: pediatric-medication-instance
InstanceOf: pediatric-medication
Usage: #example
Title: "pediatric-medication-instance"
Description: "Example of a prescription of a medication or consumption by a pediatric patient "
* status = #not-done
* code.coding[sct] = $sct#387458008 "Aspirin (substance)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
