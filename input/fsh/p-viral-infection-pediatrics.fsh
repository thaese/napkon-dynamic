Profile: ViralInfection
Parent: Condition
Id: viral-infection
Title: "Viral Infection"
Description: "Occurrence of a viral infection"
* insert napkon-metadata(2021-09-30, #draft)
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#34014006 "Viral disease (disorder))"
* code 1..1 MS
* code from ViralInfection (required)

Alias: §sct = http://snomed.info/sct

// value set has to cover all the different viral infectious diseases
ValueSet: ViralInfection
Title: "Bacterial Infections"
Description: "Value set of viral infections"
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/viral-infection"

// Q: why exel says double..? same with Areus, and Gruppe Streptokokken --> I skipped these



* $sct#5735004 "Respiratory syncytial virus infection (disorder)"
* $sct#6142004 "Influenza (disorder)"
* $sct#1087141000119106 "Human metapneumovirus infection (disorder)"
* $sct#41546002 "Disease caused by Rhinovirus (disorder)"
* $sct#25225006 "Disease caused by Adenovirus (disorder)"
* $sct#1148698007 "Disease caused by Human bocavirus (disorder)"
* $sct#27619001 "Disease caused by Coronaviridae (disorder)"
* $sct#12188008 "Parainfluenza (disorder)"


// Q: do not know how to cover 'other viral diesease' -- would not use qualifier value 



Instance: viral-infection-instance
InstanceOf: viral-infection
Usage: #example
Title: "viral-infection-instance"
Description: "Example of a viral infection"
* code =  $sct#105631009  "Disease caused by Paramyxoviridae (disorder)"
* subject = Reference(ExamplePatient)


Instance: viral-infection-instance2
InstanceOf: viral-infection
Usage: #example
Title: "viral-infection-instance"
Description: "Example of a viral infection"
* code =  $sct#261665006  "Unknown (qualifier value)"
* subject = Reference(ExamplePatient)