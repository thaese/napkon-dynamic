Alias: §sct = http://snomed.info/sct

ValueSet: ChronicHaematologicDiseasesPediatrics
Id: chronic-haematologic-diseases-pediatrics
Title: "ChronicHaematologicDiseasesPediatricsVS"
Description:  "Chronic haematologic diseases the context of pediatrics and Covid-19"

* ^status = #draft

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #61261009
* ^compose.include[0].concept[+].display = "Hemolytic anemia (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Haemolytische Anaemie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #40108008
* ^compose.include[0].concept[+].display = "Thalassemia (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Thalassämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #127040003
* ^compose.include[0].concept[+].display = "Sickle cell-hemoglobin SS disease (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Sichelzellanämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #62403005
* ^compose.include[0].concept[+].display = "Glucose-6-phosphate dehydrogenase deficiency anemia (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "G6PD-Mangel-Anämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #87522002
* ^compose.include[0].concept[+].display = "Iron deficiency anemia (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Eisenmangelanämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #248693006
* ^compose.include[0].concept[+].display = "Chronic idiopathic neutropenia (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Chronische Neutropenie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #109995007
* ^compose.include[0].concept[+].display = "Myelodysplastic syndrome (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Myelodysplastisches Syndrom"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[+].code = #64779008
* ^compose.include[0].concept[+].display = "Blood coagulation disorder (disorder)"
* ^compose.include[0].concept[+].designation[=].language = #de-DE
* ^compose.include[0].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[+].designation[=].value = "Gerinnungsstörung"

//Other is missing
