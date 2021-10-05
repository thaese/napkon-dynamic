Invariant: vs-de-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present"
Severity: #error
Expression: "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"

Invariant: vs-de-1
Description: "If Observation.effective[x] is dateTime and has a value then that value shall be precise to the day"
Severity: #error
Expression: "$this.toString().length() >= 8"

Invariant: vs-de-3
Description: "If there is no a value a data absent reason must be present"
Severity: #error
Expression: "value.exists() or dataAbsentReason.exists()"

Invariant: vs-2
Description: "If there is no component or hasMember element then either a value[x] or a data absent reason must be present."
Severity: #error
Expression: "(component.empty() and hasMember.empty()) implies (dataAbsentReason.exists() or value.exists())"
XPath: "f:component or f:memberOF or f:*[starts-with(local-name(.), 'value')] or f:dataAbsentReason"

Invariant: vs-1
Description: "if Observation.effective[x] is dateTime and has a value then that value shall be precise to the day"
Severity: #error
Expression: "($this is dateTime) implies $this.toString().length() >= 8"

Invariant: vs-3
Description: "If there is no a value a data absent reason must be present"
Severity: #error
Expression: "value.exists() or dataAbsentReason.exists()"
XPath: "f:*[starts-with(local-name(.), 'value')] or f:dataAbsentReason"

Invariant: idf-num-codex-bloom-filter
Description: "If NUM-CODEX Bloom filter is present, CRR and DIC pseudonyms shall not be present."
Severity: #error
Expression: "$this.exists() implies (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/crr-pseudonym').exists().not() and (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/dic-pseudonym').exists().not()))"

Invariant: idf-num-codex-crr-pseudonym
Description: "If NUM-CODEX CRR pseudonym is present, Bloom filter and DIC pseudonym shall not be present."
Severity: #error
Expression: "$this.exists() implies (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/bloom-filter').exists().not() and (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/dic-pseudonym').exists().not()))"

Invariant: idf-num-codex-dic-pseudonym
Description: "If NUM-CODEX DIC pseudonym is present, Bloom filter and CRR pseudonym shall not be present."
Severity: #error
Expression: "$this.exists() implies (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/bloom-filter').exists().not() and (%resource.identifier.where(system='http://www.netzwerk-universitaetsmedizin.de/sid/crr-pseudonym').exists().not()))"