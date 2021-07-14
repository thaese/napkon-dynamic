Alias: §sct = http://snomed.info/sct

ValueSet: ChronicHaematologicDiseasesPediatrics
Id: chronic-haematologic-diseases-pediatrics
Title: "ChronicHaematologicDiseasesPediatricsVS"
Description:  "Chronic haematologic diseases the context of pediatrics and Covid-19"

* ^status = #draft

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #61261009
* ^compose.include[=].concept[+].display = "Hemolytic anemia (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Haemolytische Anaemie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #40108008
* ^compose.include[=].concept[+].display = "Thalassemia (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Thalassämie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #127040003
* ^compose.include[=].concept[+].display = "Sickle cell-hemoglobin SS disease (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Sichelzellanämie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #62403005
* ^compose.include[=].concept[+].display = "Glucose-6-phosphate dehydrogenase deficiency anemia (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "G6PD-Mangel-Anämie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #87522002
* ^compose.include[=].concept[+].display = "Iron deficiency anemia (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Eisenmangelanämie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #248693006
* ^compose.include[=].concept[+].display = "Chronic idiopathic neutropenia (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Chronische Neutropenie"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #109995007
* ^compose.include[=].concept[+].display = "Myelodysplastic syndrome (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Myelodysplastisches Syndrom"

* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #64779008
* ^compose.include[=].concept[+].display = "Blood coagulation disorder (disorder)"
* ^compose.include[=].concept[+].designation[=].language = #de-DE
* ^compose.include[=].concept[+].designation[=].use = #900000000000013009 "Synonym"
* ^compose.include[=].concept[+].designation[=].value = "Gerinnungsstörung"

//Other is missing
