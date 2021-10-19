Profile: BacterialInfection
Parent: Condition
Id: bacterial-infection
Title: "Bacterial Infection"
Description: "Occurrence of a bacterial infection"
* insert napkon-metadata(2021-10-04, #draft, 0.1.0)
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = $sct#87628006 "Bacterial infectious disease (disorder)"
* code 1..1 MS
* code from bacterial-infections-complications (required)


Instance: bacterial-infection-instance
InstanceOf: bacterial-infection
Usage: #example
Title: "bacterial-infection-instance"
Description: "Example of a bacterial infection"
* code =  $sct#197303009 "Bacterial portal cirrhosis (disorder)"
* subject = Reference(ExamplePatient)

