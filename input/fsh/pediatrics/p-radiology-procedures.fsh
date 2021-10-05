//Author: Sally Brose
// Berlin Institute of Health | Charité 
Alias: $sct = http://snomed.info/sct
Alias: $Procedure = https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure
Alias: $diagnostic-report-radiology = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/diagnostic-report-radiology
Alias: $radiology-procedures = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/radiology-procedures
Alias: $radiology-procedures-dicom = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/radiology-procedures-dicom

Profile: Radiology Procedures
Parent: Profile-MII-Procedure-Prozedur
Parent: $RadiologyProcedures
Id: raiolody-procecures
Title: "Radiology Procedures"
Description: "Records an application of a radiological imaging procedures performed on the patient (COVID-19 imaging procedures)"
* insert napkon-metadata(2021-09-27)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#40701008 "Echocardiography (procedure)"
* bodySite 1..
* bodySite.coding 1..
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "$this"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomed-heart 0..1
* bodySite.coding[snomed-heart] = $sct#80891009
* bodySite.coding[snomed-heart] ^short = "Coding for bodySite of heart"
* bodySite.coding[snomed-heart] ^definition = "A reference to a code defined by SNOMED CT to express that the imaging procedure is performed on the anatomical location of the heart."
* bodySite.coding[snomed- heart].system 1..
* bodySite.coding[snomed- heart].code 1..
* report only Reference($diagnostic-report-radiology)
* report MS

* code.coding[sct] = $sct#450436003 "Positron emission tomography with computed tomography (procedure)"
* subject only Reference(Patient)
* subject MS

Instance: radiology-procedure-instance
InstanceOf: radiology-procedure
Usage: #example
Title: "radiology-procedure-instance"
Description: "Example of a radiology procedure"
* status = #not-done
* code = $sct#40701008 "Echocardiography (procedure)"
* code = $sct#450436003 "Positron emission tomography with computed tomography (procedure)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
