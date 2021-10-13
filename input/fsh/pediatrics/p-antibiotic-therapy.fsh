//Author: Sally Brose
// Berlin Institute of Health | Charité

Profile: AntibioticTherapy
Parent: Procedure
Id: antibiotic-therapy
Title: "Antbiotic Therapy"
Description: "Application of an antibiotic therapy"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* category = $sct#281789004 "Antibiotic therapy (procedure)"
* code.coding from AntibioticTherapyProcedure
* subject only Reference(Patient)
* subject MS


Instance: AntibioticTherapy
InstanceOf: antibiotic-therapy
Usage: #example
Title: "antibiotic-therapy-instance"
Description: "Example of an antibiotic therapy"
* status = #completed
* code = $sct#281789004 "Antibiotic therapy (procedure)"
* subject = Reference(ExamplePatient)
