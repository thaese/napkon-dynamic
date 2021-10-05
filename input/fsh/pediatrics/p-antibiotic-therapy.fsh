//Author: Sally Brose
// Berlin Institute of Health | Charité 

Profile: Antibiotic Therapy
Parent: Profile-MII-Procedure-Prozedur
Id: antibiotic-therapy
Title: "Antbiotic Therapy"
Description: "Application of an antibiotic therapy"
* insert napkon-metadata(2021-09-23)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#281789004 "Antibiotic therapy (procedure)"
* code.coding[sct] = include codes from system $sct where concept is-a #281789004 "Antibiotic therapy (procedure)"
* code.coding[ops] = $ops|"2021"#8-987 "Komplexbehandlung bei Besiedelung oder Infektion mit multiresistenten Erregern [MRE]"
* code.coding[ops] = $ops|"2021"#8-98g "Komplexbehandlung bei Besiedelung oder Infektion mit nicht multiresistenten isolationspflichtigen Erregern"
* subject only Reference(Patient)
* subject MS

Instance: antibiotic therapy
InstanceOf: antibiotic therapy
Usage: #example
Title: "antibiotic-therapy-instance"
Description: "Example of an antibiotic therapy"
* status = #not-done
* code = $sct where concept is-a #281789004 "Antibiotic therapy (procedure)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
