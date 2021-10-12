// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: ThoracicDrainagePediatrics
Parent: Profile-MII-Procedure-Prozedur
Id: thoracic-drainage-pediatrics
Title: "Thoracic Drainge"
Description: "Application of a thoraric drainage"
* insert napkon-metadata(2021-09-13, #draft, 0.1.0)
* status from RestrictedEventStatus
* category.coding[sct] = $sct#277132007 "Therapeutic procedure (procedure)"
* code.coding[sct] = $sct#34193001 "Closed drainage of chest (procedure)"
* code.coding[ops] = $ops|"2021"#8-144 "Therapeutische Drainage der Pleurahöhle"
* subject only Reference(Patient)
* subject MS


Instance: ThoracicDrainage
InstanceOf: thoracic-drainage-pediatrics
Usage: #example
Title: "Thoracic Drainage"
Description: "Example of a thoracic drainage"
* status = #not-done
* code = $sct#34193001 "Closed drainage of chest (procedure)"
* subject = Reference(ExamplePatient)
* performedDateTime = "2021-09-14T13:06:00+02:00"
