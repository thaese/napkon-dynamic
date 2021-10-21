//Alias: $ViralInfectiousDiseases = https://www.netzwerk-universitaetsmedizin.de/fhir//ValueSet/vs-viral-infect-pediatrics

Profile: ViralInfection
Parent: Condition
Id: viral-infection
Title: "Viral Infection"
Description: "Occurrence of a viral infection"
* insert napkon-metadata(2021-10-03, #draft, 0.1.0)
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#34014006 "Viral disease (disorder))"
* code 1..1 MS
* code from viral-infections (required)

Alias: §sct = http://snomed.info/sct

// value set has to cover all the different viral infectious diseases
ValueSet: ViralInfection
Title: "Bacterial Infections"
Description: "Value set of viral infections"
* ^status = #draft
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/viral-infection"

// Q: why exel says double..? same with Areus, and Gruppe Streptokokken --> I skipped these



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
