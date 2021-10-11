Alias: $eventStatus = http://hl7.org/fhir/event-status

ValueSet: RestrictedEventStatus
Id: restricted-event-status
Title: "RestrictedEventStatus"
Description: "EventStatus value set restricted to codes not-done, completed and unknown"
* $eventStatus#not-done
* $eventStatus#completed
* $eventStatus#unknown
