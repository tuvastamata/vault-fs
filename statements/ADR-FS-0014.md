---
id: ADR-FS-0014
type: statement
fed_kind: adr
fed_modality: decision
fed_status: accepted
pav_authoredBy: eva
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-09-09
dcterms_title: "Offer selection: eligibility by destination and customer type first, then the trusted partner unless a competitor is more than 10 % cheaper"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-20260916-interview-partner-selection]]"]
prov_wasQuotedFrom: ["[[SRC-20260916-interview-partner-selection#^q02]]", "[[SRC-20260916-interview-partner-selection#^q04]]", "[[SRC-20260916-interview-partner-selection#^q09]]"]
prov_wasDerivedFrom: ["[[SRC-20260909-ops-offer-selection-rule]]", "[[FIND-FS-0014]]", "[[OPP-FS-0005]]"]
dcterms_subject: ["[[ELM-fs.engine.ranker]]", "[[ELM-fs.engine.outreach]]", "[[ELM-drive.offerLog]]", "[[ADR-FS-0007]]", "[[ADR-FS-0002]]", "[[SRC-fs-srs#^FR-4-02]]", "[[PER-delamode]]", "[[PER-ace]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: accepted
sw_statusNote: "the operator's practice, stated 2026-09-09 and clarified 2026-09-16; the repository's spec, the checklist seed and ADR-0007 still say 'best price, then delivery time' (DC-FS-0003); the eligibility rules beyond the Delamode case are unwritten"
sw_covers: [fs:fstransport/**, fs:vault/10-spec/SRS.md, fs:vault/20-decisions/ADR-0007-ranker-cold-start.md, fs:instances/vault-ops/operating/operating-checklist.md]
sw_repos: [fs]
dcterms_dateAccepted: 2026-10-18
pav_curatedBy: [tuvastamata]
---

# ADR-FS-0014: Offer selection: eligibility by destination and customer type first, then the trusted partner unless a competitor is more than 10 % cheaper

**Decision** (the operator, 2026-09-09 on Deal #7131; eligibility clarified 2026-09-16):
1. First the eligibility filter: only partners that can handle the shipment's destination country and customer type are asked at all; no fixed partner list, the operator decides case by case ([[SRC-20260916-interview-partner-selection#^q09]], [[SRC-20260909-ops-offer-selection-rule#^o02]]).
2. Delamode for private-individual shipments to the UK, Northern Ireland and Norway, because it declares customs for private customers in third countries ([[SRC-20260916-interview-partner-selection#^q09]], [[SRC-20260909-ops-offer-selection-rule#^o03]]).
3. Among eligible offers the trusted, higher-quality partner wins unless a competitor is more than 10 % cheaper; then price wins, delivery time as the next tiebreaker ([[SRC-20260916-interview-partner-selection#^q02]], [[SRC-20260909-ops-offer-selection-rule#^o08]], [[SRC-20260909-ops-offer-selection-rule#^o09]]).
4. Quality means, in the operator's order: fewer damages, better communication, more accurate delivery times ([[SRC-20260916-interview-partner-selection#^q04]], [[SRC-20260909-ops-offer-selection-rule#^o12]], [[SRC-20260909-ops-offer-selection-rule#^o13]], [[SRC-20260909-ops-offer-selection-rule#^o14]]).

**Context:**
- The SRS and the checklist say "best price, then delivery time" ([[SRC-fs-srs#^FR-4-02]], [[SRC-20260916-ops-operating-checklist#^k10]]). Deal #7131: ACE 593.68 € + VAT chosen over Delamode 600.00 €, and ACE would have been chosen at 650 € as well ([[SRC-20260916-interview-partner-selection#^q02]]).
- The offer log's `chosen` column is the ranker's training label ([[ADR-FS-0007]]); trained on price and delivery time alone it learns the wrong rule ([[FIND-FS-0014]]).
- [[ADR-FS-0002]] (partner selection for standard pallets) is still a stub; this decision covers the non-standard branch.

**Consequences:**
- The ranker ([[ELM-fs.engine.ranker]]) encodes a hard eligibility filter and the 10 % band before any learned model; the eligibility rules need a written routing table, of which only the Delamode case exists ([[SRC-20260909-ops-offer-selection-rule#^o15]]).
- Partner quality needs a record per partner — damages, communication, delivery accuracy — that nothing collects today; the offer log has no column for it.
- The spec, the checklist seed and ADR-0007 need updating ([[DC-FS-0003]]); [[OPP-FS-0005]] builds on this.
