Alias: $imaging-category-sct = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct


Profile: ImagingProcedures
//Procedure on the basis of MEI
Parent: Procedure
Id: imaging-procedures
Title: "Imaging Procedures"
Description: "Defines constraints and methods on imaging procedures performed on the patient."

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#71388002 "Procedure (procedure)"
// setting the rules for having to be some kind of procedure specific to an organ?
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains sct 1..1
* code.coding[sct] from $imaging-category-sct (required)
* performed[x] 1..1
* subject only Reference(Patient)



// value set has to cover all the different organs or types of procedures
ValueSet: ImagingCategorySnomed
Id: imaging-category-sct
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* $sct#118797008 " Procedure on heart (procedure)"
