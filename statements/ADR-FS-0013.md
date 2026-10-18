---
id: ADR-FS-0013
type: statement
fed_kind: adr
fed_modality: decision
fed_status: accepted
pav_authoredBy: eva
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-08-27
dcterms_title: "Standard or non-standard shipment: thresholds L 1200 × W 800 × H 1000 mm and 200 kg, dimensions from the HUUM sheet"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-20260916-interview-partner-selection]]"]
prov_wasQuotedFrom: ["[[SRC-20260916-interview-partner-selection#^q01]]"]
prov_wasDerivedFrom: ["[[SRC-20260827-ops-classification-rule]]", "[[FIND-FS-0010]]", "[[FIND-FS-0011]]", "[[SRC-20260827-huum-product-sheet]]"]
dcterms_subject: ["[[ELM-fs.engine.classify]]", "[[ELM-mail.order]]", "[[ADR-FS-0001]]", "[[SRC-fs-srs#^FR-1-02]]", "[[SRC-fs-reconciled-spec#^gaps]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-data-sources]]"]
sw_logStatus: accepted
sw_statusNote: "in force in operations since the operator stated it on 2026-08-27; the wording for a single item is open (setup item 5, FIND-FS-0011); not yet in the repository's spec (DC-FS-0003)"
sw_covers: [fs:fstransport/**, fs:vault/10-spec/SRS.md, fs:vault/20-decisions/ADR-0001-standard-pallet-pricing-formula.md]
sw_repos: [fs]
dcterms_dateAccepted: 2026-10-18
pav_curatedBy: [tuvastamata]
---

# ADR-FS-0013: Standard or non-standard shipment: thresholds L 1200 × W 800 × H 1000 mm and 200 kg, dimensions from the HUUM sheet

**Decision** (the operator, 2026-08-27; confirmed on a real order 2026-09-09):
1. A shipment is non-standard when its dimensions or weight exceed any of L 1200 mm, W 800 mm, H 1000 mm, m 200 kg ([[SRC-20260916-interview-partner-selection#^q01]]).
2. For several products shipped together as one order the thresholds apply to the summed dimensions and weight ([[SRC-20260827-ops-classification-rule#^c03]]).
3. As practised, a single product is checked against the same thresholds: Deal #7131, one ICON 125 sauna package of 200 × 120 × 130 cm and 700 kg, went to partner outreach ([[SRC-20260827-ops-classification-rule#^c07]]). The written rule still says "each product on its own is standard" ([[SRC-20260827-ops-classification-rule#^c02]]); the rewording is open ([[SRC-20260916-ops-open-setup-items#^item-5]]).
4. Dimensions and weight come from the HUUM product sheet, looked up by product name; the order notification carries none ([[SRC-20260827-ops-classification-rule#^c05]], [[SRC-20260827-huum-product-sheet]]).

**Context:**
- The SRS leaves the classification to size, quantity and weight without numbers ([[SRC-fs-srs#^FR-1-02]]); the formula of [[ADR-FS-0001]] needs `n_transported_pallets`, which this rule does not give.
- The thresholds were asked for and given during the test run of 2026-08-27 ([[FIND-FS-0010]]); the sheet lists ten products over 1000 mm tall on their own — CLIFF 6/9/11, STEEL 6/9/11, HIVE Flow — at 16–83 kg ([[SRC-20260827-huum-product-sheet]], [[FIND-FS-0011]]).
- The sheet's shipping-method hint (`Pakiautomaat`, the pallet notes) is the manufacturer's packaging guidance, not the rule.

**Consequences:**
- The classifier ([[ELM-fs.engine.classify]]) checks a single item and a multi-item sum against the same four thresholds and reads the sheet, not the mail; the lookup by free-text product name wants a key (SKU / Art.Nr., setup item 8).
- The repository's spec and ADR-0001 need the numbers and the lookup source ([[DC-FS-0003]]).
- Open: the single-item wording; whether a 1030–1040 mm heater is standard by some packaging convention — the operator's call ([[FIND-FS-0011]]).
