FHIR – Governance
#################

.. include:: <isonum.txt>

Dieses Dokument betreibt den Workflow und die Konventionen zur Erstellung von FHIR Profilen im NAPKON Projekt.

Workflow
========

Übersicht
---------

1. napkon-dynamic git repository lokal clonen (wenn noch nicht geschehen)
2. In Verantwortlichkeitstabelle zu bearbeitende Items heraussuchen und als “in Progress” markieren
3. FSH Profildatei in Verzeichnis ``input/fsh`` erstellen (siehe `FSH Dateien Konventionen`_ )
4. Profil & *mindestens* eine Instance pro verwendeter Terminologie (SNOMED, LOINC etc) spezifizieren
5. Grundlegende Übersetzbarkeit FSH |rarr| JSON testen durch Aufruf von sushi

  a. Ggf. Fehler beheben bis sushi fehlerfrei durchläuft

6. Profil mit Instanz(en) validieren durch Aufruf des Java FHIR Validators

  a. Ggf. Fehler beheben bis der Validator fehlerfrei durchläuft

7. Geänderte Dateien ins repository commiten (in den persönlichen Branch, nicht in staging oder master)
8. Branch pushen und pull request in **staging** Branch erstellen
9. Gemeinsame Begutachtung und Freigabe des Pull Requests in den **staging** Branch (mit externem Reviewer)
10. Verantwortlichkeitstabelle aktualisieren (Status = "done")
11. Pull request in **master** branch - review durch gefyra Berater und finale Freigabe (durch merge mit **master** branch)

Details
-------

* Das github repositoy `napkon-dynamic <https://github.com/BIH-CEI/napkon-dynamic>`_ ist der zentrale "point of truth"
* Neu erstellte oder geänderte Profile, ValueSets, usw. werden in den jeweiligen eigenen Branch commitet und gepusht (commit & push üblicherweise sobald eine konsistente & funktionierende Einheit (z.B. ein Profil) fertiggestellt ist).
* Sobald ein Profil von der erstellenden Person als fertig betrachtet wird, wird ein Pull Request in den **staging** branch erstellt. 
* Pull requests werden in wöchentlichen Meetings (TechMeet, Dienstags 14-15 Uhr) gemeinsam begutachtet und ergänzt/freigegeben
* `GitHub Issues <https://github.com/BIH-CEI/napkon-dynamic/issues>`_ werden für issue-tracking benutzt
* To-dos und Überblick der Entwicklung sind unter `Projects > Core NAPKON <https://github.com/BIH-CEI/napkon-dynamic/projects/1>`_ zu dokumentieren

Allgemein
=========


FSH Dateien Konventionen
========================
.. _FSH Dateien Konventionen: 

Allgemein
---------
* Profilierung in FSH durchführen (nicht Forge)
* Codes aus Codesystemen immer mit Bezeichnung (“display”) angeben nach dem Format:
  ``{CodeSystem}|{version}#{code} “{display}”``
 
  * Version ist optional

* Beispiele

  * In ValueSet: ``* $sct#416798007 "Substance with calcineurin inhibitor mechanism of action (substance)"``
  * In Profile:  ``* code.coding[ops] = $ops|"2021"#8-144 "Therapeutische Drainage der Pleurahöhle"``

Profile
-------
* Jedes Profil in eine eigene Datei
* Zu jedem Profil mindestens eine Instance in dieselbe Datei
* **Dateiname**: ``p-<profile-id>.fsh`` (profile-id Namenskonvention siehe unten)
* Identischer „Dateikopf“ (Metadaten – Status, Date, Publisher etc)

  * | Einfügen in die Datei mit dem ruleset ``“napkon-metadata(date, status, version)”``
    | Beispiel:
    | ``* insert napkon-metadata(2021-09-13, #draft, 0.1.0)``
    | Dies fügt konsistent die Felder status, version, publisher, contact und date ein

ValueSets
---------
* Jedes ValueSet in eine eigene Datei
* **Dateiname**: ``vs-<valueset-id>.fsh`` (valueset-id Namenskonvention siehe unten
* Jedes ValueSet enthält nur eine Terminologie (zB nur ICD10 oder nur SNOMED CT)
* ValueSets möglichst wiederverwenden, wenn schon definiert (auch außerhalb NAPKONs, zB in GECCO)

Aliase
------
* Extra Datei zur Verwaltung übergreifender Aliase (**aliases.fsh**)

Invarianten
-----------
* Analog zu Aliasen (mit **invariants.fsh**)

Versionierung
--------------

* Initialer Entwurf (erster github Push des funktionsfähigen Profils in den eigenen Branch):

  * ``Status = #draft``
  * ``Version = 0.1.0``

* Für merge in master branch

  * ``Status = #active``
  * ``Version 1.0.0``


FSH Namenskonventionen
======================
* Profile/Instance/ValueSet: CamelCase
* Id: dash-case des Profil/Instance/ValueSets Namens
* Dem Namen/id von **Profilen** (nicht ValueSets) ist der Name des Moduls hintenanstellen

  * pediatrics (Pädiatriemodul)
  * cardiology (Kardiologiemodul)
  * vaccination (Impfmodul)
  * longcovid (Long-Covid Modul)

* Title = Wie Profilname ("Profile") mit Leerzeichen
* Description nach eigenem Ermessen

Beispiele
---------

**Profile**

.. code-block::

  Profile: IntensiveCareTreatmentDuration
  Parent: Observation
  Id: intensive-care-treatment-duration
  Title: "Intensive care treatment duration"
  Description: "Duration of intensive care treatment"

**Instance**

.. code-block::

  Instance: intensive-care-treatment-duration-instance
  InstanceOf: intensive-care-treatment-duration
  Usage: #example
  Title: "intensive-care-treatment-duration-instance"
  Description: "Example of an intensive care treatment duration"

**ValueSet**

.. code-block::

  ValueSet: RestrictedEventStatus
  Id: restricted-event-status
  Title: "RestrictedEventStatus"
  Description: "EventStatus value set restricted to codes not-done, completed and unknown"

Appendix
########

Validierungsscript
==================
Das Python script “validate_profile.py” (aus dem napkon-dynamic github repository) ermöglicht die Validierung von Profiln durch Ausführung von sushi und des Java FHIR Validators. 

Voraussetzungen
---------------
 * Python >= 3.5
 * jsonpath_ng library

  * |  Installation durch:
    | ``pip install --upgrade jsonpath-ng``
    | oder
    | ``conda install jsonpath-ng -c conda-forge``

Aufruf
------

.. code-block:: shell
  
  python validate_profile.py [--base-path BASE_PATH] [--validator-path PATH_VALIDATOR] filename [filename ...]

**Optionen**

.. code-block:: shell
  
  --base-path = Pfad zum napkon-dynamic Wurzelverzeichnis (wenn nicht explizit angegeben, wird das aktuelle Verzeichnis verwendet)
  --validator-path = Pfad zum Java Validator (ohne Dateiname) - wenn in diesem Pfad der Validator nicht vorhanden ist, wird er durch das Script heruntergeladen
  filename = Dateiname einer Profil FSH Datei (Konventionen siehe oben). Diese Datei muss ein Profil sowie mindestens eine Instanz für das Profil beinhalten.

**Beispiel-Aufruf**

.. code-block:: shell

  $ python validate_profile.py p-thoracic-drainage.fsh
Namenskonvention)
4. Profil + mindestens eine Instance pro verwendeter Terminologie (SNOMED, LOINC etc) spezifizieren
5. Grundlegende Übersetzbarkeit FSH->JSON testen durch Aufruf von sushi

  a. Ggf. Fehler beheben bis sushi fehlerfrei durchläuft

6. Profil mit Instanz(en) validieren durch Aufruf des Java FHIR Validators

  a. Ggf. Fehler beheben bis der Validator fehlerfrei durchläuft

7. Geänderte Dateien ins repository commiten (in den persönlichen Branch, nicht in master)
8. Branch pushen und pull request in staging Branch erstellen
9. Gemeinsame Begutachtung und Freigabe des Pull Requests in den staging branch (mit Julian)
10. Verantwortlichkeitstabelle aktualisieren (Status = “done”)
11. Pull request in master branch - review durch gefyra Berater und finale Freigabe (durch merge mit Master)

Details
-------

* Das github repositoy “napkon-dynamic” ist der zentrale “Point of Truth” ( https://github.com/BIH-CEI/napkon-dynamic ) 
* Neu erstellte oder geänderte Profile (ValueSets, …) werden in den jeweiligen eigenen Branch commitet und gepusht (commit & push üblicherweise sobald eine konsistente Einheit (zB Profil) fertiggestellt ist.
* Sobald ein Profil von der erstellenden Person als fertig betrachtet wird, wird ein Pull Request in den staging branch erstellt. 
* Pull requests werden in wöchentlichen Meetings (TechMeet, Dienstags 14-15 Uhr) gemeinsam begutachtet und ergänzt/freigegeben
* GitHub Issues werden für issue-tracking benutzt: https://github.com/BIH-CEI/napkon-dynamic/issues
* To-dos und Überblick der Entwicklung sind unter Projects > Core NAPKON zu dokumentieren: https://github.com/BIH-CEI/napkon-dynamic/projects/1


Allgemein
=========

* Profilierung in FSH durchführen (nicht Forge)
* Codes aus Codesystemen immer mit Bezeichnung (“display”) angeben nach dem Format:
  ``{CodeSystem}|{version}#{code} “{display}”``
 
  * Version ist optional

* Beispiele

  * In ValueSet: ``* $sct#416798007 "Substance with calcineurin inhibitor mechanism of action (substance)"``
  * In Profile:  ``* code.coding[ops] = $ops|"2021"#8-144 "Therapeutische Drainage der Pleurahöhle"``

Links
-----
* napkon-dynamic repository: https://github.com/BIH-CEI/napkon-dynamic
* Issues: https://github.com/BIH-CEI/napkon-dynamic/issues

Versionierung
-------------

* Initialer Entwurf (erster github Push des funktionsfähigen Profils in den eigenen Branch):

  * ``Status = #draft``
  * ``Version = 0.1.0``

* Für merge in master branch

  * ``Status = #active``
  * ``Version 1.0.0``

FSH Dateien Konventionen
========================

Profile
-------
* Jedes Profil in eine eigene Datei
* Zu jedem Profil mindestens eine Instance in dieselbe Datei
* **Dateiname**: ``p-<profile-id>.fsh`` (profile-id Namenskonvention siehe unten)
* Identischer „Dateikopf“ (Metadaten – Status, Date, Publisher etc)

  * | Einfügen in die Datei mit dem ruleset ``“napkon-metadata(date, status, version)”``
    | Beispiel:
    | ``* insert napkon-metadata(2021-09-13, #draft, 0.1.0)``
    | Dies fügt konsistent die Felder status, version, publisher, contact und date ein

ValueSets
---------
* Jedes ValueSet in eine eigene Datei
* **Dateiname**: ``vs-<valueset-id>.fsh`` (valueset-id Namenskonvention siehe unten
* Jedes ValueSet enthält nur eine Terminologie (zB nur ICD10 oder nur SNOMED CT)
* ValueSets möglichst wiederverwenden, wenn schon definiert (auch außerhalb NAPKONs, zB in GECCO)

Aliase
------
* Extra Datei zur Verwaltung übergreifender Aliase (**aliases.fsh**)

Invarianten
-----------
* Analog zu Aliasen (mit **invariants.fsh**)



FSH Namenskonventionen
======================
* Profile/Instance/ValueSet: CamelCase
* Id: dash-case des Profil/Instance/ValueSets Namens
* Dem Namen/id von **Profilen** (nicht ValueSets) ist der Name des Moduls hintenanstellen

  * pediatrics (Pädiatriemodul)
  * cardiology (Kardiologiemodul)
  * vaccination (Impfmodul)
  * longcovid (Long-Covid Modul)

* Title = Wie Profilname ("Profile") mit Leerzeichen
* Description nach eigenem Ermessen

Beispiele
---------

**Profile**

.. code-block::

  Profile: IntensiveCareTreatmentDuration
  Parent: Observation
  Id: intensive-care-treatment-duration
  Title: "Intensive care treatment duration"
  Description: "Duration of intensive care treatment"

**Instance**

.. code-block::

  Instance: intensive-care-treatment-duration-instance
  InstanceOf: intensive-care-treatment-duration
  Usage: #example
  Title: "intensive-care-treatment-duration-instance"
  Description: "Example of an intensive care treatment duration"

**ValueSet**

.. code-block::

  ValueSet: RestrictedEventStatus
  Id: restricted-event-status
  Title: "RestrictedEventStatus"
  Description: "EventStatus value set restricted to codes not-done, completed and unknown"





Appendix
########

Validierungsscript
==================
Das Python script “validate_profile.py” (aus dem napkon-dynamic github repository) ermöglicht die Validierung von Profiln durch Ausführung von sushi und des Java FHIR Validators. 

Voraussetzungen
---------------
 * Python >= 3.5
 * jsonpath_ng library

  * |  Installation durch:
    | ``pip install --upgrade jsonpath-ng``
    | oder
    | ``conda install jsonpath-ng -c conda-forge``

Aufruf
------

.. code-block:: shell
  
  python validate_profile.py [--base-path BASE_PATH] [--validator-path PATH_VALIDATOR] filename [filename ...]

**Optionen**

.. code-block:: shell
  
  --base-path = Pfad zum napkon-dynamic Wurzelverzeichnis (wenn nicht explizit angegeben, wird das aktuelle Verzeichnis verwendet)
  --validator-path = Pfad zum Java Validator (ohne Dateiname) - wenn in diesem Pfad der Validator nicht vorhanden ist, wird er durch das Script heruntergeladen
  filename = Dateiname einer Profil FSH Datei (Konventionen siehe oben). Diese Datei muss ein Profil sowie mindestens eine Instanz für das Profil beinhalten.

**Beispiel-Aufruf**

.. code-block:: shell

  $ python validate_profile.py p-thoracic-drainage.fsh


FHIR Java Validator
===================
Nachstehend wird die Syntax für den FHIR Java Validator zur Validierung eines Profils anhand einer Instanz beschrieben. Dies kann automatisch durch das Python Validierungsskript erfolgen (siehe oben).

Voraussetzungen
---------------
* Aktuelles Java muss installiert sein.
* Aktuelle Version des Validators hier herunterladen: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar


Aufruf
------
Aufruf des Validators zur Validierung einer Instanz an einem Profil nach folgendem Muster:

.. code-block:: shell

  java –jar <path-to-validator>/validator_cli.jar \
    -version 4.0.1 \
    -ig <Dateiname-der-profil-StructureDefinition-Datei> \
    -ig <canonical-name-von-dependenciens> \	# optional
    -ig <Dateiname-von-ValueSets> \  			# optional
    -profile <url-des-zu-validierenden-profils> \
  <Dateiname-der-Instanz-Datei>



**Beispiel 1**
Validierung des Profils https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration (definiert in StructureDefinition-intensive-care-treatment-duration.json) durch die Instanz definiert in “Observation-intensive-care-treatment-duration-instance.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig StructureDefinition-intensive-care-treatment-duration.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration \
  Observation-intensive-care-treatment-duration-instance.json

 

**Beispiel 2**
Validierung des Profils https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage (definiert in StructureDefinition-thoracic-drainage.json) durch die Instanz definiert in “Procedure-thoracic-drainage-instance.json”  unter Verwendung der Dependency “de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2” und des ValueSets definiert in “ValueSet-restricted-event-status.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2 \
  -ig StructureDefinition-thoracic-drainage.json \
  -ig ValueSet-restricted-event-status.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage \
  Procedure-thoracic-drainage-instance.json


FHIR Java Validator
===================
Nachstehend wird die Syntax für den FHIR Java Validator zur Validierung eines Profils anhand einer Instanz beschrieben. Dies kann automatisch durch das Python Validierungsskript erfolgen (siehe oben).

Voraussetzungen
---------------
* Aktuelles Java muss installiert sein.
* Aktuelle Version des Validators hier herunterladen: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar


Aufruf
------
Aufruf des Validators zur Validierung einer Instanz an einem Profil nach folgendem Muster:

.. code-block:: shell

  java –jar <path-to-validator>/validator_cli.jar \
    -version 4.0.1 \
    -ig <Dateiname-der-profil-StructureDefinition-Datei> \
    -ig <canonical-name-von-dependenciens> \	# optional
    -ig <Dateiname-von-ValueSets> \  			# optional
    -profile <url-des-zu-validierenden-profils> \
  <Dateiname-der-Instanz-Datei>



**Beispiel 1**
Validierung des Profils https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration (definiert in StructureDefinition-intensive-care-treatment-duration.json) durch die Instanz definiert in “Observation-intensive-care-treatment-duration-instance.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig StructureDefinition-intensive-care-treatment-duration.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/intensive-care-treatment-duration \
  Observation-intensive-care-treatment-duration-instance.json

 

**Beispiel 2**
Validierung des Profils https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage (definiert in StructureDefinition-thoracic-drainage.json) durch die Instanz definiert in “Procedure-thoracic-drainage-instance.json”  unter Verwendung der Dependency “de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2” und des ValueSets definiert in “ValueSet-restricted-event-status.json”

.. code-block:: shell

  java -jar ~/projects/BIH-CEI/fhir-validator/validator_cli.jar \
  -version 4.0.1\
  -ig de.medizininformatikinitiative.kerndatensatz.prozedur#2.0.0-alpha2 \
  -ig StructureDefinition-thoracic-drainage.json \
  -ig ValueSet-restricted-event-status.json \
  -profile https://www.netzwerk-universitaetsmedizin.de/fhir/StructureDefinition/thoracic-drainage \
  Procedure-thoracic-drainage-instance.json
