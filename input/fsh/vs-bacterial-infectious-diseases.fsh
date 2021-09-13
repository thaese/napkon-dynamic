Alias: §sct = http://snomed.info/sct

// value set has to cover all the different viral infectious diseases
ValueSet: BacterialInfectiousDiseases
Id: bacterial-infectious-complications-sct
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct"

// Q: why exel says double..? same with Areus, and Gruppe Streptokokken --> I skipped these


// Q: wrong code in excel!!!
* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #91428005
* ^compose.include[=].concept[=].display = "Haemophilus influenzae infection (disorder)"

* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #77116006
* ^compose.include[=].concept[=].display = "Infection caused by Bordetella parapertussis (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #186464008
* ^compose.include[=].concept[=].display = "Mycoplasma infection (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #105629000
* ^compose.include[=].concept[=].display = "Chlamydial infection (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #26726000
* ^compose.include[=].concept[=].display = "Legionella infection (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #95883001
* ^compose.include[=].concept[=].display = "Bacterial meningitis (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #48245008
* ^compose.include[=].concept[=].display = "Bacterial arthritis (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #61011009
* ^compose.include[=].concept[=].display = " Bacterial osteomyelitis (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #45816000
* ^compose.include[=].concept[=].display = "Pyelonephritis (disorder)"


* ^compose.include[0].system = "http://snomed.info/sct"
* ^compose.include[=].concept[0].code = #301183007
* ^compose.include[=].concept[=].display = "Bacterial endocarditis (disorder)"



