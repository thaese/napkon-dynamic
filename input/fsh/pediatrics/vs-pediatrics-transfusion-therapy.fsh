// Author: Sally
// Berlin Institute of Health | Charité

// value set has to cover all the different blood transfusions therapies
ValueSet: BloodTransfusionTherapy
Id: blood-transfusion-therapy-codes
Title: "Blood Transfusion Therapy"
Description: "ValueSet for Blood Transfusion Therapy"
* insert napkon-metadata(2021-10-08, #draft, 0.1.0)

// Codes for BLOOD TRANSFUSION THERAPY
* codes from system $sct where concept is-a #116859006 "Transfusion of blood product (procedure)"
