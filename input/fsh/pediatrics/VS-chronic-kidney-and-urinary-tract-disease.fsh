// Author: Sally 
// Berlin Institute of Health | Charité
// This is a FSH profiling file under development. See sushi documentation for usage.

Alias: §sct = http://snomed.info/sct

ValueSet: ChronicKidneyAndUrinaryTractDisease
Id: chronic-kidney-and-urinary-tract-disease
Title: "ChronicKidneyAndUrinaryTractDisease"
Description:  "Medical history linked to congenital disease of the kidney or urinary tract for pediatric patients"

* ^url = $ChronicKidneyAndUrinaryTractDisease // Path declared as Alias
* ^status = #draft

// Codes for CHRONIC KIDNEY AND URINARY TRACT DISEASE
*sct#82525005 "Congenital cystic kidney disease (disorder)" 
*sct#118642009 "Congenital anomaly of the urinary tract proper (disorder)"