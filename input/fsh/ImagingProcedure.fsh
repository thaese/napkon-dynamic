Alias: $sct = http://snomed.info/sct
Alias: $Procedure = https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure
Alias: $imaging-category-sct = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct
//Alias: $cardiology-procedures-dicom = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/cardiology-procedures-dicom

Profile: ImagingProcedures
//Procedure on the basis of MEI 
Parent: Procedure 
Id: imaging-procedures
Title: "Imaging Procedures"
Description: "Defines constraints and methods on imaging procedures performed on the patient."
* ^publisher = "Charité"
* ^status = #active
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = http://snomed.info/sct#71388002
// setting the rules for having to be some kind of procedure specific to an organ?
* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code[sct] from $imaging-category-sct (required)
* performed[x] 1..1
* subject only Reference(Patient)



// value set has to cover all the different organs or types of procedures 
ValueSet: ImagingCategorySnomed
Id: imaging-category-sct
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #118797008
* ^compose.include[=].concept[=].display = " Procedure on heart (procedure)"
* ^compose.include[=].concept[=].designation.language = #de-DE
//* ^compose.include[=].concept[=].designation.use = $sct#900000000000013009 "Synonym"
//* ^compose.include[=].concept[=].designation.value = "Durchgeführte 12-Kanal-EKG-Untersuchung"







