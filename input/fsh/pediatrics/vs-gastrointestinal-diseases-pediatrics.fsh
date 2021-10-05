// Author: Thomas Haese

Alias: §sct = http://snomed.info/sct

ValueSet: GastrointestinalDiseasesPediatrics
Id: gastrointestinal-diseases-pediatrics
Title: "VSGastrointestinal Diseases Pediatrics"
Description:  "Gastrointestinal diseases in the context of pediatrics and Covid-19"

* ^date = "2021-08-11"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"

* ^status = #draft

* ^compose.include[0].system = §sct
* ^compose.include[0].concept[0].code = #236069009
* ^compose.include[0].concept[0].display = "Chronic constipation (disorder)"
* ^compose.include[0].concept[0].designation[0].language = #de-DE
* ^compose.include[0].concept[0].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[0].designation[0].value = "Chronische Obstipation"

* ^compose.include[0].system = §sct
* ^compose.include[0].concept[1].code = #6382002
* ^compose.include[0].concept[1].display = "Chronic inflammatory small bowel disease (disorder)"
* ^compose.include[0].concept[1].designation[1].language = #de-DE
* ^compose.include[0].concept[1].designation[1].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[1].designation[1].value = "Chronisch entzündliche Darmerkrankung"

* ^compose.include[0].system = §sct
* ^compose.include[0].concept[2].code = #396331005
* ^compose.include[0].concept[2].display = "Celiac disease (disorder)"
* ^compose.include[0].concept[2].designation[2].language = #de-DE
* ^compose.include[0].concept[2].designation[2].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[2].designation[2].value = "Zölikalie"

* ^compose.include[0].system = §sct
* ^compose.include[0].concept[3].code = #782555009
* ^compose.include[0].concept[3].display = "Allergy to cow's milk protein (finding)"
* ^compose.include[0].concept[3].designation[3].language = #de-DE
* ^compose.include[0].concept[3].designation[3].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[3].designation[3].value = "Kuhmilchproteinallergie"

* ^compose.include[0].system = §sct
* ^compose.include[0].concept[4].code = #118926004
* ^compose.include[0].concept[4].display = "Disorder of bile duct (disorder)"
* ^compose.include[0].concept[4].designation[4].language = #de-DE
* ^compose.include[0].concept[4].designation[4].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[4].designation[4].value = "Gallengangserkrankung"

// Andere //
* include codes from system §sct where concept is-a §sct#119292006