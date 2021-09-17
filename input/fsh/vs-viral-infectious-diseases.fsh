Alias: §sct = http://snomed.info/sct

// value set has to cover all the different viral infectious diseases
ValueSet: ViralInfectiousDiseases
Id: viral-infectious-complications-sct
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #55735004
* ^compose.include[=].concept[=].display = "Respiratory syncytial virus infection (disorder)"
//^compose.include[=].concept[=].designation.language = #de-DE
// ^compose.include[=].concept[=].designation.use = $sct#900000000000013009 "Synonym"
// ^compose.include[=].concept[=].designation.value = "Durchgeführte 12-Kanal-EKG-Untersuchung"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #6142004
* ^compose.include[=].concept[=].display = "Influenza (disorder)"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #1087141000119106
* ^compose.include[=].concept[=].display = "Human metapneumovirus infection (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #41546002
* ^compose.include[=].concept[=].display = "Disease caused by Rhinovirus (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #25225006
* ^compose.include[=].concept[=].display = "Disease caused by Adenovirus (disorder)"

// Q: wrong in AD/excel there the code for organism was used --> need to change
* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #1148698007
* ^compose.include[=].concept[=].display = "Disease caused by Human bocavirus (disorder)"

// Q: wrong in AD/excel there the code for organism was used --> need to change
* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #27619001
* ^compose.include[=].concept[=].display = "Disease caused by Coronaviridae (disorder)"

// Q: wrong in AD/excel there the code for organism was used --> need to change
* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #12188008
* ^compose.include[=].concept[=].display = "Parainfluenza (disorder)"

// Q: do not know how to cover 'other viral diesease' -- would not use qualifier value 

