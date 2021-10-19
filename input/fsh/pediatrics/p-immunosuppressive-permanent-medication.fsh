// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: ImmunosuppresivePermanentMedication
Parent: $mii-medication-statement
Id: immunosuppresive-permanent-medication
Title: "Immunosuppresive Permanent Medication"
Description: "Immunosuppresive Permanent Medication"
* insert napkon-metadata(2021-09-13, #draft, 0.1.0)

* medicationCodeableConcept.coding ^slicing.discriminator[0].type = #pattern
* medicationCodeableConcept.coding ^slicing.discriminator[0].path = "$this"
* medicationCodeableConcept.coding ^slicing.rules = #open
* medicationCodeableConcept.coding contains 
    sct 0..1 and atcde 0..1
* medicationCodeableConcept.coding[sct] from immunosuppressive-permament-medications-sct-und-napkon (required) // TODO funktioniert das mit 2 systemen? wie?
* medicationCodeableConcept.coding[atcde] from immunosuppressive-permament-medications-atcde (required)
// TODO: 2. slices mit ATC codes
// TODO: List Resource mit "medikation vor Aufnahme"

Instance: ImmunosuppresivePermanentMedication
InstanceOf: immunosuppresive-permanent-medication
Usage: #example
Title: "Immunosuppresive Permanent Medication"
Description: "Example of a Immunosuppresive Permanent Medication"
* status = #completed
* medicationCodeableConcept = $nped#000007 "Anti-CD3/CD19 antibody"
* subject = Reference(ExamplePatient)
* effectiveDateTime = "2021-09-14T13:06:00+02:00"
