---
id: ADR-FS-0015
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredBy: eva
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_authoredOn: 2026-09-16
dcterms_title: "The customer confirms the marked-up price before any partner is confirmed; the operator sends that offer personally"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-20260916-interview-partner-selection]]"]
prov_wasQuotedFrom: ["[[SRC-20260916-interview-partner-selection#^q06]]", "[[SRC-20260916-interview-partner-selection#^q08]]"]
prov_wasDerivedFrom: ["[[OPP-FS-0006]]", "[[SRC-20260916-ops-operating-checklist]]", "[[SRC-20260916-map-current-state]]"]
dcterms_subject: ["[[ELM-fs.engine.customerConfirm]]", "[[ELM-fs.engine.hitl]]", "[[ELM-customer]]", "[[ELM-operator]]", "[[SRC-fs-srs#^FR-5-03]]", "[[SRC-fs-process-flow]]", "[[SRC-fs-process-steps]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-build]]"]
sw_logStatus: accepted
sw_statusNote: "the practised order of steps, stated 2026-09-09 and confirmed 2026-09-16; in the operator's checklist as step 8; absent from the SRS, the process steps, the process flow and the checklist seed (DC-FS-0003)"
sw_covers: ["fs:vault/10-spec/process-flow.md", "fs:vault/10-spec/process-steps.md", "fs:vault/10-spec/SRS.md", "fs:instances/vault-ops/operating/operating-checklist.md", "fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0015: The customer confirms the marked-up price before any partner is confirmed; the operator sends that offer personally

**Decision** (the operator, 2026-09-09 and 2026-09-16):
1. After the offers are compared the operator compiles the customer price (transport cost × 1.3) and sends it to the customer; nothing is confirmed with a partner until the customer says yes ([[SRC-20260916-interview-partner-selection#^q06]], [[SRC-20260916-interview-partner-selection#^q08]]).
2. The customer-facing offer is drafted and sent by the operator personally; it is not delegated to the agent today ([[SRC-20260916-interview-partner-selection#^q08]]).
3. Partner confirmation and "proceed to order" follow the customer's yes — steps 8, 9, 10 of the revised checklist ([[SRC-20260916-ops-operating-checklist#^k11]]).

**Context:**
- Neither the SRS, the process steps, the process flow nor the checklist seed has the step ([[SRC-fs-srs#^FR-5-03]], [[SRC-fs-process-flow]]); it surfaced in the handoffs question of the interview ([[OPP-FS-0006]]).
- Confirming the partner before the customer's yes would be a process bug, not a documentation gap ([[OPP-FS-0006]]).
- The ×1.3 markup of FR-4.02 is confirmed as practice.

**Consequences:**
- The service gets a customer-confirmation wait state between the ranking and the partner confirmation ([[ELM-fs.engine.customerConfirm]]).
- Whether the agent may draft the customer email is open: after graduation it may send every email ([[ADR-FS-0016]]), but the operator was not asked about this email by name ([[SRC-20260916-map-desired-state#^n05]]).
- The repository's spec and flow need the step ([[DC-FS-0003]]).
