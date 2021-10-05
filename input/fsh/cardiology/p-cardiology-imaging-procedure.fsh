Alias: $CardiologyImagingCodes = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/EcgCodes

Profile: CardiologyImagingProcedures
Parent: Procedure
Id: cardiology-imaging-procedure
Title: "Cardiology Imaging Procedure"
Description: "Defines constraints and extensions on the Cardiology Imaging procedures"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#363679005

* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains sct 1..1
* code.coding[sct] from $CardiologyImagingCodes (required)
* performed[x] 1..1
* subject only Reference(Patient)
