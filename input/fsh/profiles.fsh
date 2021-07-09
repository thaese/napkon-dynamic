Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $loinc = http://loinc.org
Alias: $snomed = http://snomed.info/sct

Profile: VitalSignsBase
Parent: Observation
Id: gecco-vital-signs-base
Title: "Vital Signs Base Profile"
Description: "Vital signs base definition profile"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/vital-signs-base"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* obeys vs-2
* status MS
* category MS
* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "$this"
* category ^slicing.rules = #open
* category contains vs-cat 1..1
* category[vs-cat] = $observation-category#vital-signs
* code MS
* subject 1..1 MS
* subject only Reference(Patient)
* effective[x] 1..1 MS
* effective[x] ^slicing.discriminator[0].type = #type
* effective[x] ^slicing.discriminator[0].path = "$this"
* effective[x] ^slicing.rules = #open
* effective[x] only dateTime or Period
* effective[x] ^short = "Often just a dateTime for vital signs"
* effective[x] ^definition = "Often just a dateTime for vital signs."
//* effective[x] contains effectiveDateTime 0..1
//* effectiveDateTime obeys vs-1
//* effectiveDateTime ^condition[0] = "vs-1"
* value[x] ^short = "Vital Signs value are recorded using the Quantity data type. For supporting observations such as Cuff size could use other datatypes such as CodeableConcept."
* value[x] ^definition = "Vital Signs value are recorded using the Quantity data type. For supporting observations such as Cuff size could use other datatypes such as CodeableConcept."
* value[x] ^requirements = "9. SHALL contain exactly one [1..1] value with @xsi:type=\"PQ\" (CONF:7305)."
* value[x] ^condition = "vs-2"
* dataAbsentReason ^condition = "vs-2"
* hasMember ^short = "Used when reporting vital signs panel components"
* hasMember ^definition = "Used when reporting vital signs panel components."

Profile: RespiratoryRate
Parent: VitalSignsBase
Id: gecco-observation-respiratory-rate
Title: "Respiratory Rate"
Description: "Respiratory rate of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/respiratory-rate"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Respiratory Rate"
* code ^definition = "Respiratory Rate"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#9279-1
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#86290005
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code = #/min
* dataAbsentReason MS

Profile: HeartRate
Parent: VitalSignsBase
Id: gecco-observation-heart-rate
Title: "Heart Rate"
Description: "Heart rate of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/heart-rate"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Heart Rate"
* code ^definition = "Heart Rate"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#8867-4
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#364075005
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code = #/min
* dataAbsentReason MS

Profile: BodyTemperature
Parent: VitalSignsBase
Id: gecco-observation-body-temperature
Title: "Body Temperature"
Description: "Body Temperature of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/body-temperature"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Body Temperature"
* code ^definition = "Body Temperature"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#8310-5
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#386725007
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code = #Cel
* dataAbsentReason MS

Profile: OxygenSaturation
Parent: VitalSignsBase
Id: gecco-observation-oxygen-saturation
Title: "Oxygen Saturation"
Description: "Oxygen saturation of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/oxygen-saturation"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Oxygen Saturation"
* code ^definition = "Oxygen Saturation"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#2708-6
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#431314004
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code = #%
* dataAbsentReason MS

Profile: BodyWeight
Parent: VitalSignsBase
Id: gecco-observation-body-weight
Title: "Body Weight"
Description: "Body Weight of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/body-weight"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Body Weight"
* code ^definition = "Body Weight"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#29463-7
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#27113001
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code from http://hl7.org/fhir/ValueSet/ucum-bodyweight|4.0.0 (required)
* dataAbsentReason MS

Profile: BodyHeight
Parent: VitalSignsBase
Id: gecco-observation-body-height
Title: "Body Height"
Description: "Body Height of a patient"
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/body-height"
* ^version = "1.0.4"
* ^status = #active
* ^experimental = false
* ^date = "2021-04-14"
* ^publisher = "Charité"
* ^contact[0].telecom[0].system = #url
* ^contact[0].telecom[0].value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code ^short = "Body Height"
* code ^definition = "Body Height"
* code ^comment = "Additional codes that translate or map to this code are allowed. For example a more granular LOINC code or code that is used locally in a system."
* code.coding ^slicing.discriminator[0].type = #pattern
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed 0..*
* code.coding[loinc] = $loinc#8302-2
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#248334005
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] MS
* value[x] only Quantity
* valueQuantity.system 1.. MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.value 1.. MS
* valueQuantity.unit 1.. MS
* valueQuantity.code 1.. MS
* valueQuantity.code from http://hl7.org/fhir/ValueSet/ucum-bodylength|4.0.0 (required)
* dataAbsentReason MS


Profile: BloodPressure
Parent: VitalSignsBase
Id: gecco-observation-blood-pressure
Title: "Blood Pressure"
Description: "The blood pressure of a patient."
* ^url = "https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/blood-pressure"
* ^version = "1.0.4"
* ^date = "2020-10-29"
* ^publisher = "Charité"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.bihealth.org/en/research/core-facilities/interoperability/"
* code MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..* and
    snomed ..*
* code.coding[loinc] = $loinc#85354-9
* code.coding[loinc].system 1..
* code.coding[loinc].code 1..
* code.coding[snomed] = $snomed#75367002
* code.coding[snomed].system 1..
* code.coding[snomed].code 1..
* value[x] ..0
* component MS
* component obeys vs-3
* component ^short = "Used when reporting systolic and diastolic blood pressure."
* component ^definition = "Used when reporting systolic and diastolic blood pressure."
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    systolicBloodPressure 1..1 MS and
    diastolicBloodPressure 1..1 MS
* component[systolicBloodPressure] ^short = "Systolic blood pressure"
* component[systolicBloodPressure].code = $loinc#8480-6
* component[systolicBloodPressure].code MS
* component[systolicBloodPressure].code.coding 1..
* component[systolicBloodPressure].code.coding ^slicing.discriminator.type = #pattern
* component[systolicBloodPressure].code.coding ^slicing.discriminator.path = "$this"
* component[systolicBloodPressure].code.coding ^slicing.rules = #open
* component[systolicBloodPressure].code.coding contains 
    loinc 1..* and
    snomed 0..*
//* component[systolicBloodPressure].code.coding[loinc] = $loinc#8480-6
* component[systolicBloodPressure].code.coding[loinc] ^patternCoding = $loinc#8480-6
* component[systolicBloodPressure].code.coding[loinc].system 1..
* component[systolicBloodPressure].code.coding[loinc].code 1..
//* component[systolicBloodPressure].code.coding[snomed] = $snomed#271649006
* component[systolicBloodPressure].code.coding[snomed] ^sliceName = "snomed"
* component[systolicBloodPressure].code.coding[snomed] ^patternCoding = $snomed#271649006
* component[systolicBloodPressure].code.coding[snomed].system 1..
* component[systolicBloodPressure].code.coding[snomed].code 1..
* component[systolicBloodPressure].value[x] only Quantity
* component[systolicBloodPressure].value[x] MS
* component[systolicBloodPressure].value[x] ^slicing.discriminator.type = #type
* component[systolicBloodPressure].value[x] ^slicing.discriminator.path = "$this"
* component[systolicBloodPressure].value[x] ^slicing.rules = #open
* component[systolicBloodPressure].valueQuantity only Quantity
* component[systolicBloodPressure].valueQuantity ^sliceName = "valueQuantity"
* component[systolicBloodPressure].valueQuantity ^short = "Systolic blood pressure value"
* component[systolicBloodPressure].valueQuantity ^mustSupport = true
* component[systolicBloodPressure].valueQuantity.value 1..1
* component[systolicBloodPressure].valueQuantity.unit 1..1
* component[systolicBloodPressure].valueQuantity.system 1..1
* component[systolicBloodPressure].valueQuantity.system = "http://unitsofmeasure.org"
* component[systolicBloodPressure].valueQuantity.code 1..1
* component[systolicBloodPressure].valueQuantity.code = #mm[Hg]

* component[diastolicBloodPressure] ^short = "Diastolic blood pressure"
* component[diastolicBloodPressure].code = $loinc#8462-4
* component[diastolicBloodPressure].code MS
* component[diastolicBloodPressure].code.coding 1..
* component[diastolicBloodPressure].code.coding ^slicing.discriminator.type = #pattern
* component[diastolicBloodPressure].code.coding ^slicing.discriminator.path = "$this"
* component[diastolicBloodPressure].code.coding ^slicing.rules = #open
* component[diastolicBloodPressure].code.coding contains 
    loinc 1..* and
    snomed 0..*
//* component[diastolicBloodPressure].code.coding[loinc] = $loinc#8462-4
* component[diastolicBloodPressure].code.coding[loinc] ^patternCoding = $loinc#8462-4
* component[diastolicBloodPressure].code.coding[loinc].system 1..
* component[diastolicBloodPressure].code.coding[loinc].code 1..
//* component[diastolicBloodPressure].code.coding[snomed] = $snomed#271650006
* component[diastolicBloodPressure].code.coding[snomed] ^sliceName = "snomed"
* component[diastolicBloodPressure].code.coding[snomed] ^patternCoding = $snomed#271650006
* component[diastolicBloodPressure].code.coding[snomed].system 1..
* component[diastolicBloodPressure].code.coding[snomed].code 1..
* component[diastolicBloodPressure].value[x] only Quantity
* component[diastolicBloodPressure].value[x] MS
* component[diastolicBloodPressure].value[x] ^slicing.discriminator.type = #type
* component[diastolicBloodPressure].value[x] ^slicing.discriminator.path = "$this"
* component[diastolicBloodPressure].value[x] ^slicing.rules = #open
* component[diastolicBloodPressure].valueQuantity only Quantity
* component[diastolicBloodPressure].valueQuantity ^sliceName = "valueQuantity"
* component[diastolicBloodPressure].valueQuantity ^short = "Diastolic blood pressure value"
* component[diastolicBloodPressure].valueQuantity ^mustSupport = true
* component[diastolicBloodPressure].valueQuantity.value 1..1
* component[diastolicBloodPressure].valueQuantity.unit 1..1
* component[diastolicBloodPressure].valueQuantity.system 1..1
* component[diastolicBloodPressure].valueQuantity.system = "http://unitsofmeasure.org"
* component[diastolicBloodPressure].valueQuantity.code 1..1
* component[diastolicBloodPressure].valueQuantity.code = #mm[Hg]

Alias: $Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: $ethnic-group = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/ethnic-group
Alias: $age = https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/age
