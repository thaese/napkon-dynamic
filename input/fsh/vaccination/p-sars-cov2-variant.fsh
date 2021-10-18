// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: SARSCoV2Variant
Parent: ProfileObservationLaboruntersuchung // MII ProfileObservationLaboruntersuchung nicht verwendet, da ein identifier angegeben werden muss - der Laborbefund hier kann u.U. nicht identifziert
Id: sars-cov2-variant
Title: "SARS CoV2 Variant"
Description: "Variant/strain of detected SARS CoV2 (Pango Cov-lineage)"
* insert napkon-metadata(2021-10-05, #draft, 0.1.0)
* code = $loinc#96741-4 "SARS-CoV-2 (COVID-19) variant [Type] in Specimen by Sequencing"
* value[x] only CodeableConcept
* valueCodeableConcept from $loinc-sars-cov2-variants (required)
* identifier[analyseBefundCode].system.extension contains $ext-data-absent-reason named dataAbsentReason 0..1 MS
* identifier[analyseBefundCode].value.extension contains $ext-data-absent-reason named dataAbsentReason 0..1 MS
* identifier[analyseBefundCode].assigner.extension contains $ext-data-absent-reason named dataAbsentReason 0..1 MS
* effectiveDateTime.extension contains $ext-data-absent-reason named dataAbsentReason 0..1 MS

Instance: SARSCoV2Variant
InstanceOf: sars-cov2-variant
Usage: #example
Title: "SARS CoV2 Variant"
Description: "Example of a SARS CoV2 variant (Pango lineage)"
* identifier[analyseBefundCode].system.extension[dataAbsentReason].valueCode = $cs-data-absent-reason#not-applicable
* identifier[analyseBefundCode].value.extension[dataAbsentReason].valueCode = $cs-data-absent-reason#not-applicable
* identifier[analyseBefundCode].assigner.extension[dataAbsentReason].valueCode = $cs-data-absent-reason#not-applicable
* identifier[analyseBefundCode].assigner.display = "not-applicable"
* status = #final
* valueCodeableConcept = $loinc#LA32552-4 "SARS-CoV-2 Delta variant (WHO)"
* subject = Reference(ExamplePatient)
* effectiveDateTime = "0001-01-01T00:00:00+00:00" // required for sushi 2.1.1, but not actually ..
//* effective[x].extension[dataAbsentReason].valueCode = $cs-data-absent-reason#unknown
//* effective[x].extension[dataAbsentReason].url = $ext-data-absent-reason  // shouldn't be required here - maybe a sushi bug?
* effectiveDateTime.extension[dataAbsentReason].valueCode = $cs-data-absent-reason#unknown
