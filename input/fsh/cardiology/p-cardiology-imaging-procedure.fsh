Alias:   $sct = http://snomed.info/sct
Alias: $CardiologyImagingCodes = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/EcgCodes


Profile: CardiologyImagingProcedures
Parent: Procedure
Id: cardiology-imaging-procedure
Title: "Cardiology Imaging Procedure"
Description: "Defines constraints and extensions on the Cardiology Imaging procedures"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = http://snomed.info/sct#363679005

* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code[sct] from $CardiologyImagingCodes (required)
* performed[x] 1..1
* subject only Reference(Patient)
