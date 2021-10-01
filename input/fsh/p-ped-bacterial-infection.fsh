Profile: BacterialInfection
Parent: Condition
Id: bacterial-infection
Title: "Bacterial Infection"
Description: "Occurrence of a bacterial infection"
* insert napkon-metadata(2021-09-30, #draft)
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#87628006 "Bacterial infectious disease (disorder)"
* code 1..1 MS
* code from BacterialInfection (required)

Alias: §sct = http://snomed.info/sct

// value set has to cover all the different viral infectious diseases
ValueSet: BacterialInfection
Id: bacterial-infection
Title: "Bacterial Infections"
Description: "Value set of bacterial infections"
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/imaging-category-sct"

// Q: why exel says double..? same with Areus, and Gruppe Streptokokken --> I skipped these



* $sct#91428005 "Haemophilus influenzae infection (disorder)"
* $sct#77116006 "Infection caused by Bordetella parapertussis (disorder)"
* $sct#186464008 "Mycoplasma infection (disorder)"
* $sct#105629000 "Chlamydial infection (disorder)"
* $sct#26726000 "Legionella infection (disorder)"
* $sct#95883001 "Bacterial meningitis (disorder)"
* $sct#48245008 "Bacterial arthritis (disorder)"
* $sct#61011009 "Bacterial osteomyelitis (disorder)"
* $sct#45816000 "Pyelonephritis (disorder)"
* $sct#301183007 "Bacterial endocarditis (disorder)"


* $sct#406602003 "Infection caused by Staphylococcus aureus (disorder)"
* $sct#34020007 "Pneumonia caused by Streptococcus (disorder)"
* $sct#108661000119109 "Infection caused by Streptococcus viridans group (disorder)"
* $sct#302809008 "Streptococcus pyogenes infection (disorder)"
* $sct#426933007 "Streptococcus agalactiae infection (disorder)"
* $sct#406574007 "Infection caused by enterococcus (disorder)"
* $sct#91428005 "Haemophilus influenzae infection (disorder)"
* $sct#71057007 "Infection caused by Escherichia coli (disorder)"
* $sct#721756002 "Infection caused by Klebsiella (disorder)"
* $sct#11218009  "Infection caused by Pseudomonas aeruginosa (disorder)"


Instance: bacterial-infection-instance
InstanceOf: bacterial-infection
Usage: #example
Title: "bacterial-infection-instance"
Description: "Example of a bacterial infection"
* code =  $sct#197303009 "Bacterial portal cirrhosis (disorder)"
* subject = Reference(ExamplePatient)