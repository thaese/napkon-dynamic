// Author: Sally
// Berlin Institute of Health | Charité

ValueSet: HemostaseologicTherapy
Id: hemostaseologic-therapy
Title: "ValueSetHemostaseologicTherapy"
Description: "Hemostaseologic drug therapies"
* insert napkon-metadata(2021-05-28, #draft, 0.1.0)

// Codes for HEMOSTASEOLOGIC THERAPY
* include codes from system $sct where concept is-a #116861002 "Transfusion of fresh frozen plasma (procedure)"
* include codes from system $sct where concept is-a #74287006 "Transfusion of coagulation factors (procedure)"
* include codes from system $sct where concept is-a #12719002 "Platelet transfusion (procedure)"
