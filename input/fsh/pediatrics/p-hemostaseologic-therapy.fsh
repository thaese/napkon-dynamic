//Author: Sally Brose
// Berlin Institute of Health | Charité 

Profile: Antibiotic Therapy
Parent: Profile-MII-Procedure-Prozedur
Id: hemostaseologic-therapy
Title: "Hemostaseologic Therapy"
Description: "Application of a hemostaseologic therapy"
* insert napkon-metadata(2021-09-23)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#12719002 "Platelet transfusion (procedure)"
* code.coding[sct] = include codes from system $sct where concept is-a #12719002 "Platelet transfusion (procedure)"
* category.coding[sct] = $sct#26245005 " Fresh frozen plasma thawing (procedure)"
* code.coding[sct] = $sct#26245005 " Fresh frozen plasma thawing (procedure)"
* code.coding[ops] = $ops|"2021"#8-803 "Transfusion von Blutzellen"
* subject only Reference(Patient)
* subject MS

Instance: hemostaseologic therapy
InstanceOf: hemostaseologic therapy
Usage: #example
Title: " hemostaseologic-therapy-instance"
Description: "Example of a hemostaseologic therapy"
* status = #not-done
* code = $sct where concept is-a #12719002 "Platelet transfusion (procedure)"
* code = $sct#26245005 " Fresh frozen plasma thawing (procedure)"

* subject = Reference(ExamplePatient)
* performedDateTime = ""
