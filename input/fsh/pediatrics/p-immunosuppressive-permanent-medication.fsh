// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: ImmunosuppresivePermanentMedicationPediatrics
Parent: ProfileMedicationStatementMedikation
Id: immunosuppresive-permanent-medication-pediatrics
Title: "Immunosuppresive Permanent Medication"
Description: "Immunosuppresive Permanent Medication"
* insert napkon-metadata(2021-09-13, #draft, 0.1.0)
* medicationCodeableConcept from immunosuppressive-permament-medications

Instance: immunosuppresive-permanent-medication-instance
InstanceOf: immunosuppresive-permanent-medication-pediatrics
Usage: #example
Title: "immunosuppresive-permanent-medication-instance"
Description: "Example of a Immunosuppresive Permanent Medication"
* status = #completed
* medicationCodeableConcept = $nis#000007 "Anti-CD3/CD19 antibody (substance)"
* subject = Reference(ExamplePatient)
* effectiveDateTime = "2021-09-14T13:06:00+02:00"
