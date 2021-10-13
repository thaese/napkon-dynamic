//Author: Sally Brose
// Berlin Institute of Health | Charité

Profile: HemostaseologicTherapy
Parent: Procedure
Id: hemostaseologic-therapy
Title: "Hemostaseologic Therapy"
Description: "Application of a hemostaseologic therapy"
* insert napkon-metadata(2021-09-23, #draft, 0.1.0)
* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
* code from HemostaseologicTherapy (required)
* performed[x] 1..1
* subject only Reference(Patient)
* subject 1..1
* subject MS

Instance: HemostaseologicTherapy
InstanceOf: hemostaseologic-therapy
Usage: #example
Title: "hemostaseologic-therapy-instance"
Description: "Example of a hemostaseologic therapy"
* status = #draft
* code = $sct#116861002 "Transfusion of fresh frozen plasma (procedure)"
* subject = Reference(ExamplePatient)
* performedDateTime = "2021-10-10T22:23:01+02:00"
