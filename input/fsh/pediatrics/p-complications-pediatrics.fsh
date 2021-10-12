// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
Profile: Covid19ComplicationPediatrics
Parent: Condition
Id: covid19-complication-pediatrics
Title: "Covid19 complication"
Description: "Complication due to COVID19"
* insert napkon-metadata(2021-09-22, #draft, 0.1.0)
* category.coding ^slicing.discriminator[0].type = #pattern
* category.coding ^slicing.discriminator[0].path = "$this"
* category.coding ^slicing.rules = #open
* category.coding contains sct 1..1 MS
* category.coding[sct] = $sct#116223007:42752001=840539006 "Complication where Due to = Disease caused by 2019 novel coronavirus"
* code 1..1 MS
* code from Covid19Complications (required)

Instance: Covid19Complication
InstanceOf: covid19-complication-pediatrics
Usage: #example
Title: "Covid19 Complication"
Description: "Example of a covid19 complication"
* code = $sct#235859005:246112005=386134007 "Liver disorder due to infection where Severity = Significant"
* subject = Reference(ExamplePatient)
