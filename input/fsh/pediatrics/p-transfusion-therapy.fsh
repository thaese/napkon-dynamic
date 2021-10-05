//Author: Sally Brose
// Berlin Institute of Health | Charité 

Profile: Transfusion Therapy
Parent: Profile-MII-Procedure-Prozedur
Id: transfusion-therapy
Title: "Transfusion Therapy"
Description: "Application of a transfusion"
* insert napkon-metadata(2021-09-23)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#277132007 "Therapeutic procedure (procedure)"
* code.coding[sct] = include codes from system $sct where concept is-a #116859006 "Transfusion of blood product (procedure)"
* code.coding[ops] = $ops|"2021"#8-803 "Transfusion von Blutzellen"
* subject only Reference(Patient)
* subject MS

Instance: transfusion-instance
InstanceOf: transfusion therapy
Usage: #example
Title: "transfusion-therapy-instance"
Description: "Example of a transfusion therapy"
* status = #not-done
* code = $sct where concept is-a #116859006 "Transfusion of blood product (procedure)"
* subject = Reference(ExamplePatient)
* performedDateTime = ""
