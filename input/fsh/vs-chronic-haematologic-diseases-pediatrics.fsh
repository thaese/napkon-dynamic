Alias: §sct = http://snomed.info/sct

ValueSet: ChronicHaematologicDiseasesPediatrics
Id: chronic-haematologic-diseases-pediatrics
Title: "ChronicHaematologicDiseasesPediatricsVS"
Description:  "Chronic haematologic diseases the context of pediatrics and Covid-19"

* ^status = #draft

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[0].code = #61261009
* ^compose.include[0].concept[0].display = "Hemolytic anemia (disorder)"
* ^compose.include[0].concept[0].designation[0].language = #de-DE
* ^compose.include[0].concept[0].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[0].designation[0].value = "Haemolytische Anaemie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[1].code = #40108008
* ^compose.include[0].concept[1].display = "Thalassemia (disorder)"
* ^compose.include[0].concept[1].designation[0].language = #de-DE
* ^compose.include[0].concept[1].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[1].designation[0].value = "Thalassämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[2].code = #127040003
* ^compose.include[0].concept[2].display = "Sickle cell-hemoglobin SS disease (disorder)"
* ^compose.include[0].concept[2].designation[0].language = #de-DE
* ^compose.include[0].concept[2].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[2].designation[0].value = "Sichelzellanämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[3].code = #62403005
* ^compose.include[0].concept[3].display = "Glucose-6-phosphate dehydrogenase deficiency anemia (disorder)"
* ^compose.include[0].concept[3].designation[0].language = #de-DE
* ^compose.include[0].concept[3].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[3].designation[0].value = "G6PD-Mangel-Anämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[4].code = #87522002
* ^compose.include[0].concept[4].display = "Iron deficiency anemia (disorder)"
* ^compose.include[0].concept[4].designation[0].language = #de-DE
* ^compose.include[0].concept[4].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[4].designation[0].value = "Eisenmangelanämie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[5].code = #248693006
* ^compose.include[0].concept[5].display = "Chronic idiopathic neutropenia (disorder)"
* ^compose.include[0].concept[5].designation[0].language = #de-DE
* ^compose.include[0].concept[5].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[5].designation[0].value = "Chronische Neutropenie"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[6].code = #109995007
* ^compose.include[0].concept[6].display = "Myelodysplastic syndrome (disorder)"
* ^compose.include[0].concept[6].designation[0].language = #de-DE
* ^compose.include[0].concept[6].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[6].designation[0].value = "Myelodysplastisches Syndrom"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[7].code = #64779008
* ^compose.include[0].concept[7].display = "Blood coagulation disorder (disorder)"
* ^compose.include[0].concept[7].designation[0].language = #de-DE
* ^compose.include[0].concept[7].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[7].designation[0].value = "Gerinnungsstörung"

//Other is missing
