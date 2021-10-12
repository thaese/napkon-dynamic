Alias: $CardiologyImagingCodes = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/EcgCodes

Profile: ImagingProceduresCardiology
Parent: Procedure
Id: imaging-procedure-cardiology
Title: "Cardiology Imaging Procedure"
Description: "Defines constraints and extensions on the Cardiology Imaging procedures"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding = $sct#363679005
* code from $CardiologyImagingCodes (required)
* performed[x] 1..1
* subject only Reference(Patient)


ValueSet: ImagingCodes
Id: imaging-procedures-cardiology
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* ^url = $CardiologyImagingCodes

* ^compose.include[0].system = $sct
* ^compose.include[=].concept[0].code = #268400002
* ^compose.include[=].concept[=].display = "12 lead electrocardiogram (procedure)"
* ^compose.include[=].concept[=].designation.language = #de-DE
* ^compose.include[=].concept[=].designation.use = $sct#900000000000013009 "Synonym"
* ^compose.include[=].concept[=].designation.value = "Durchgeführte 12-Kanal-EKG-Untersuchung"

* ^compose.include[=].concept[+].code = #40701008
* ^compose.include[=].concept[=].display = "Echocardiography (procedure)"
* ^compose.include[=].concept[=].designation.language = #de-DE
* ^compose.include[=].concept[=].designation.use = $sct#900000000000013009 "Synonym"
* ^compose.include[=].concept[=].designation.value = "Durchgeführte Echokardiographie"

* ^compose.include[=].concept[+].code = #433236007
* ^compose.include[=].concept[=].display = "Transthoracic echocardiography (procedure)"
* ^compose.include[=].concept[=].designation.language = #de-DE
* ^compose.include[=].concept[=].designation.use = $sct#900000000000013009 "Synonym"
* ^compose.include[=].concept[=].designation.value = "Transthorakale Echokardiographie"
