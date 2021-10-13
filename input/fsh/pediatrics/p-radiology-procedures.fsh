//Author: Sally Brose

Profile: RadiologyProcedures
Parent: Procedure 
Id: radiology-procedures
Title: "RadiologyProcedures"
Description: "Records an application of a radiological imaging procedures performed on the patient (COVID-19 imaging procedures)"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#40701008 "Echocardiography (procedure)"
* bodySite 1..
* bodySite.coding 1..
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "$this"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomed-heart 0..1
* bodySite.coding[snomed-heart] = $sct#80891009 "Heart structure (body structure)"
* bodySite.coding[snomed-heart] ^short = "Coding for bodySite of heart"
* bodySite.coding[snomed-heart] ^definition = "A reference to a code defined by SNOMED CT to express that the imaging procedure is performed on the anatomical location of the heart."
* bodySite.coding[snomed-heart].system 1..0
* bodySite.coding[snomed-heart].code 1..0
* report only Reference(ImagingPediatrics)
* report MS

* category.coding[sct] = $sct#450436003 "Positron emission tomography with computed tomography (procedure)"
* subject only Reference(Patient)
* subject MS

Instance: radiology-procedure-instance
InstanceOf: radiology-procedures
Usage: #example
Title: "radiology-procedure-instance"
Description: "Example of a radiology procedure"
* code = $sct#40701008 "Echocardiography (procedure)"
* code = $sct#450436003 "Positron emission tomography with computed tomography (procedure)"
* subject = Reference(ExamplePatient)

