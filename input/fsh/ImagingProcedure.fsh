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
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 0..1
// setting the rules for having to be some kind of procedure specific to an organ?
* category.coding[sct] from $imaging-category-sct (preferred)
* category.coding[sct] ^patternCoding.system = "http://snomed.info/sct"
* category.coding[sct].system 1.. MS
* category.coding[sct].code 1.. MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains sct 0..1
* code.coding[sct] from $imaging-category-sct (required)


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

//* ^compose.include[1].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #118797008
* ^compose.include[=].concept[=].display = "Procedure on lung (procedure)"





