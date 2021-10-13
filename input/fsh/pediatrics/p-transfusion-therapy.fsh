//Author: Sally Brose
// Berlin Institute of Health | Charité 

Profile: TransfusionTherapy
Parent: Procedure
Id: transfusion-therapy
Title: "Transfusion Therapy"
Description: "Application of a blood transfusion therapy"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1
* category.coding[sct] = $sct#277132007 "Therapeutic procedure (procedure)"
* code 1..1 MS
* code from PediatricsBloodTransfusionTherapy (required)
* subject only Reference(Patient)
* subject MS


Instance: TransfusionTherapy
InstanceOf: transfusion-therapy //sollte das lieber blood-transfuion-therapy heißen?
Usage: #example
Title: "transfusion-therapy-instance"
Description: "Example an application of a blood transfusion therapy"
* status = #completed
* code =  $sct##277132007 "Therapeutic procedure (procedure)"
* subject = Reference(ExamplePatient)

