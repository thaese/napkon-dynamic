ValueSet: GastrointestinalDiseasesPediatrics
Id: gastrointestinal-diseases-pediatrics
Title: "VSGastrointestinal Diseases Pediatrics"
Description:  "Gastrointestinal diseases in the context of pediatrics and Covid-19"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[0].code = #236069009
* ^compose.include[0].concept[0].display = "Chronic constipation (disorder)"
* ^compose.include[0].concept[0].designation[0].language = #de-DE
* ^compose.include[0].concept[0].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[0].designation[0].value = "Chronische Obstipation"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[1].code = #6382002
* ^compose.include[0].concept[1].display = "Chronic inflammatory small bowel disease (disorder)"
* ^compose.include[0].concept[1].designation[0].language = #de-DE
* ^compose.include[0].concept[1].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[1].designation[0].value = "Chronisch entzündliche Darmerkrankung"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[2].code = #396331005
* ^compose.include[0].concept[2].display = "Celiac disease (disorder)"
* ^compose.include[0].concept[2].designation[0].language = #de-DE
* ^compose.include[0].concept[2].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[2].designation[0].value = "Zölikalie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[3].code = #782555009
* ^compose.include[0].concept[3].display = "Allergy to cow's milk protein (finding)"
* ^compose.include[0].concept[3].designation[0].language = #de-DE
* ^compose.include[0].concept[3].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[3].designation[0].value = "Kuhmilchproteinallergie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[4].code = #118926004
* ^compose.include[0].concept[4].display = "Disorder of bile duct (disorder)"
* ^compose.include[0].concept[4].designation[0].language = #de-DE
* ^compose.include[0].concept[4].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[4].designation[0].value = "Gallengangserkrankung"

// Andere //
//* include codes from system SNOMED_CT where concept is-a #119292006
