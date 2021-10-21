Alias: $sct = http://snomed.info/sct
Alias: $Procedure = https://www.medizininformatik-initiative.de/fhir/core/modul-prozedur/StructureDefinition/Procedure
Alias: $imaging-procedures = https://www.netzwerk-universitaetsmedizin.de/fhir/ValueSet/vs-imaging-procedures


Profile: ImagingProcedures
Parent: Procedure
Id: imaging-procedures
Title: "Imaging Procedures"
Description: "Defines constraints and methods on imaging procedures performed on the patient."
* insert napkon-metadata(2021-10-02, #draft, 0.1.0)
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains sct 1..1
* category[sct] = http://snomed.info/sct#71388002

* code ^slicing.discriminator[0].type = #pattern
* code ^slicing.discriminator[0].path = "$this"
* code ^slicing.rules = #open
* code contains sct 1..1
//* subject only Reference(Patient)
* code[sct] from $imaging-procedures (required)


Instance: imaging-procedures-instance
InstanceOf: imaging-procedures
Usage: #example
Title: "imaging-procedures-instance"
Description: "Example of a imaging procedure"
* code =  $sct#433235006  "Fetal echocardiography (procedure)"
* subject = Reference(ExamplePatient)
