// Author: Gregor Lichtner
// Berlin Institute of Health | Charité
ValueSet: ImmunosuppressivePermanentMedications
Id: immunosuppressive-permament-medications
Title: "Immunosuppressive Permanent Medications"
Description: "Immunosuppressive medications"

* insert napkon-metadata(2021-10-05, #draft, 0.1.0)
// TODO: Use only ATC DE codes here?

// Systemische Steroide
* $sct#116566001 "Steroid (substance)"
    // $atcde|2021#A14A "ANABOLE STEROIDE"

// Systemische Calcineurin-Inhibitoren
* $sct#416798007 "Substance with calcineurin inhibitor mechanism of action (substance)"
    // $atcde#L04AD "Calcineurin-Inhibitoren"

// mTOR-Inhibitoren
* $atcde#L01EG "Mammalian target of rapamycin (mTOR)-Kinase-Inhibitoren"

// Sphingosin-Analoga
* $nped#000001 "Sphingosine analogue"
    // zB $atcde#L04AA27 "Fingolimod"

// Antimetabolite
* $sct#372785000 "Antimetabolite (substance)"
    //* $atcde#L01B "ANTIMETABOLITEN"

// Alkylantien
* $sct#372669002 "Alkylating agent (substance)"
    // $atcde|2021#L01A "ALKYLIERENDE MITTEL"

// TNF-Inhibitoren
* $sct#420693002 "Substance with tumor necrosis factor alpha inhibitor mechanism of action (substance)"
    //* $atcde#L04AB "Tumornekrosefaktor alpha (TNF-alpha)-Inhibitoren"

// IL-1-Inhibitoren
* $sct#430866006 "Substance with interleukin 1 receptor antagonist mechanism of action (substance)"
    // $atcde#L04AC "Interleukin-Inhibitoren"

 // IL-2-Inhibitoren
* $nped#000002 "Interleukin 2 receptor antagonist"
    // $atcde#L04AC "Interleukin-Inhibitoren"

// IL-6-Inhibitoren
* $sct#784015001 "Substance with interleukin 6 receptor antagonist mechanism of action (substance)"
    // $atcde#L04AC "Interleukin-Inhibitoren"

// IL-17-Inhibitoren
* $nped#000003 "Interleukin 17 receptor antagonist"
    // $atcde#L04AC "Interleukin-Inhibitoren"

// IL-23-Inhibitoren
* $sct#771592004 "Substance with interleukin 23 receptor antagonist mechanism of action (substance)"
    // $atcde#L04AC "Interleukin-Inhibitoren"

// CTLA-4-Antagonisten
* $sct#870401008 "Substance with cytotoxic T-lymphocyte-associated protein 4 inhibitor mechanism of action (substance)"
    // $atcde#L01XC "Monoklonale Antikörper"
    // zB $atcde#L01XC11 "Ipilimumab"

// CD20-Antikörper
* $nped#000004 "Anti-CD20 antibody"
    // $atcde#L01XC "Monoklonale Antikörper"
    // zB $atcde#L01XC02 "Rituximab", $atcde#L01XC10 "Ofatumumab", $atcde#L01XC15 "Obinutuzumab"

// CD52-Antikörper
* $nped#000005 "Anti-CD52 antibody"
    // $atcde#L01XC "Monoklonale Antikörper"
    // zB L01XC04 "Alemtuzumab"

// CD3-Antikörper
* $nped#000006 "Anti-CD3 antibody"
    // $atcde#L01XC "Monoklonale Antikörper"
    // zB $atcde#L01XC09 "Catumaxomab"
    // zB $atcde#L04AA02 "Muromonab-CD3" >> L04AA "Selektive Immunsuppressiva"


// CD3/CD19-Antikörper
* $nped#000007 "Anti-CD3/CD19 antibody"
    // $atcde#L01XC "Monoklonale Antikörper"
    // zB $atcde#L01XC19 "Blinatumomab"

// Anti-T-Lymphozytenglobulin
* $sct#768651008 "Antithymocyte immunoglobulin (substance)"
    // $atcde#L04AA03 "Antilymphozytäres Immunglobulin (Pferd)"
    // $atcde#L04AA04 "Antithymozytäres Immunglobulin (Kaninchen)"
    // Oberkategorie $atcde#L04AA "Selektive Immunsuppressiva"

// Integrin-Inhibitoren
* $nped#000008 "Integrin inhibitor"
    // zB $atcde#L04AA33 "Vedolizumab"
    // Oberkategorie $atcde#L04AA "Selektive Immunsuppressiva"

// BAFF-Inhibitoren
* $nped#000009 "B cell activating factor inhibitor"
    // zB $atcde#L04AA26 "Belimumab"
    // Oberkategorie $atcde#L04AA "Selektive Immunsuppressiva"

// JAK-Inhibitoren
* $sct#704312008 "Substance with Janus kinase inhibitor mechanism of action (substance)"
    //* $atcde#L01EJ "Janus-assoziierte Kinase (JAK)-Inhibitoren"

// Tyrosinkinase-Inhibitoren
* $sct#372917005 "Substance with protein-tyrosine kinase inhibitor mechanism of action (substance)"
    // $atcde#L01EA "BCR-ABL-Tyrosinkinase-Inhibitoren"
    // $atcde#L01EB "Epidermaler Wachstumsfaktor-Rezeptor (EGFR)-Tyrosinkinase-Inhibitoren"
    // $atcde#L01EH "Humaner epidermaler Wachstumsfaktor-Rezeptor 2 (HER2)-Tyrosinkinase-Inhibitoren"
    // $atcde#L01EK "Vaskulärer endothelialer Wachstumsfaktor-Rezeptor (VEGFR)-Tyrosinkinase-Inhibitoren"
    // $atcde#L01EL "Bruton-Tyrosinkinase (BTK)-Inhibitoren"


// IgE-Antikörper
* $sct#48583005 "Immunoglobulin E (substance)"
    // zB  $atcde#R03DX05 "Omalizumab"
    // Oberkategorie: $atcde#R03DX "Andere Mittel bei obstruktiven Atemwegserkrankungen zur systemischen Anwendung"

// Interferone
* $sct#49327004 "Interferon (substance)"
    // $atcde#L03AB "Interferone"

* $sct#74964007 "Other (qualifier value)" // Andere
* $sct#260413007 "None (qualifier value)" // Keine
* $sct#261665006 "Unknown (qualifier value)" // Unbekannt
