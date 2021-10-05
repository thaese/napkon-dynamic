ValueSet: VaccineTypCovidPediatrics
Id: vaccine-type-covid-pediatrics
Title: "ValueSetVaccineTypeCovidPediatrics"
Description:  "Vaccine type used in the case of a vaccination in the context of Covid-19 and Pediatrics"

* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[0].code = #1119349007
* ^compose.include[0].concept[0].display = "Vaccine product containing only Severe acute respiratory syndrome coronavirus 2 messenger ribonucleic acid (medicinal product)"
* ^compose.include[0].concept[0].designation[0].language = #de-DE
* ^compose.include[0].concept[0].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[0].designation[0].value = "MRNA-Impfstoff"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[0].concept[1].code = #1119305005
* ^compose.include[0].concept[1].display = "Vaccine product containing only Severe acute respiratory syndrome coronavirus 2 antigen (medicinal product)"
* ^compose.include[0].concept[1].designation[0].language = #de-DE
* ^compose.include[0].concept[1].designation[0].use = #900000000000013009 "Synonym"
* ^compose.include[0].concept[1].designation[0].value = "Antigen-Impfstoff"
