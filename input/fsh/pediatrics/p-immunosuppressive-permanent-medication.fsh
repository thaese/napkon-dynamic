// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: ImmunosuppresivePermanentMedication
Parent: $mii-medication-statement
Id: immunosuppresive-permanent-medication
Title: "Immunosuppresive Permanent Medication"
Description: "Immunosuppresive Permanent Medication"
* insert napkon-metadata(2021-09-13, #draft, 0.1.0)
* medicationCodeableConcept from immunosuppressive-permament-medications

Instance: ImmunosuppresivePermanentMedication
InstanceOf: immunosuppresive-permanent-medication
Usage: #example
Title: "Immunosuppresive Permanent Medication"
Description: "Example of a Immunosuppresive Permanent Medication"
* status = #completed
* medicationCodeableConcept = $nped#000007 "Anti-CD3/CD19 antibody"
* subject = Reference(ExamplePatient)
* effectiveDateTime = "2021-09-14T13:06:00+02:00"
