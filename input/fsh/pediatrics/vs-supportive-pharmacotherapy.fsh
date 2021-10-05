Alias: §sct = http://snomed.info/sct

ValueSet: SupportivePharmacotherapy
Id: vs-supportive-pharmacotherapy-pediatrics
Title: "ValuesetSupportivePharmacotherapy"
Description:  "Supportive pharamcotherapy used in the context of Covid-19 and Pediatrics"

* ^date = "2021-09-13"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* ^status = #draft
// Nachfolgende anpassen
* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[0].code = #127784009
* ^compose.include[0].concept[0].display = "Inhaled bronchodilator therapy (procedure)"
* ^compose.include[0].concept[0].designation[0].language = #de-DE
* ^compose.include[0].concept[0].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[0].designation[0].value = "Bronchodilatoren"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[1].code = #6710000
* ^compose.include[0].concept[1].display = "Nitric oxide (substance)"
* ^compose.include[0].concept[1].designation[1].language = #de-DE
* ^compose.include[0].concept[1].designation[1].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[1].designation[1].value = "Inhaltation Stickstoffmonoxid"
