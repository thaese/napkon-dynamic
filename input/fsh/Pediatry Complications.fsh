Alias: $sct = http://snomed.info/sct
Alias: $gecco-base-condition = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/gecco-base-condition
Alias: $infectious-complications-sct = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/infectious-complications-sct


Profile: PediatryInfectiousComplication
//Procedure on the basis of MEI 
Parent: Condition 
Id: $gecco-base-condition
Title: "Pediatry Infectious Complications"
Description: "Defines constraints and methods on pediatry infectious complications"
* ^date = "2021-07-30"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* category 1.. MS
* category.coding MS
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains  Infectious disease  1..1 MS
* category.coding contains  Infectious disease 1..1 MS
* category.coding[ Infectious disease] = $sct#40733004
* category.coding[ Infectious disease].system 1.. MS
* category.coding[ Infectious disease].code 1.. MS
* code.coding contains sct 1..
* code.coding[sct] from $infectious-complications-sct (required)


// value set has to cover all the different organs or types of procedures 
ValueSet: PediatryInfectiousComplication
Id: pediatry-infectiou-complications-sct
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