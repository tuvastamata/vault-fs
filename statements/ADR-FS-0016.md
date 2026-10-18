---
id: ADR-FS-0016
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredBy: eva
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_authoredOn: 2026-09-16
dcterms_title: "Trust and delegation: everything but the final choice; a step is trusted after 20 successful runs with a log; the send-approval gate lifts after 20 full cycles on the operator's word"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-20260916-interview-partner-selection]]"]
prov_wasQuotedFrom: ["[[SRC-20260916-interview-partner-selection#^q07]]", "[[SRC-20260916-interview-partner-selection#^q10]]", "[[SRC-20260916-interview-partner-selection#^q11]]", "[[SRC-20260916-interview-partner-selection#^q12]]"]
prov_wasDerivedFrom: ["[[FIND-FS-0015]]", "[[SRC-20260916-ops-agent-trust-criteria]]", "[[SRC-20260916-ops-approval-gate]]", "[[SRC-20260916-map-desired-state]]"]
dcterms_subject: ["[[ELM-fs.engine.hitl]]", "[[ELM-desktop.gmailConnector]]", "[[ELM-fs.dashboard]]", "[[ADR-FS-0003]]", "[[SRC-fs-srs#^FR-5-01]]", "[[PLAN-FS-0001]]", "[[PLAN-FS-0002]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: accepted
sw_statusNote: "the operator's rule of 2026-09-16, corrected the same day from 'permanent' to 'graduated'; nothing counts cycles yet (setup item 13); the SRS and the approval-gate seed still describe a permanent gate (DC-FS-0003)"
sw_covers: ["fs:instances/vault-ops/operating/approval-gate.md", "fs:vault/10-spec/SRS.md", "fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0016: Trust and delegation: everything but the final choice; a step is trusted after 20 successful runs with a log; the send-approval gate lifts after 20 full cycles on the operator's word

**Decision** (the operator, 2026-09-16):
1. Delegate everything to the agent except the final decision — the choice of the offer stays with the operator ([[SRC-20260916-interview-partner-selection#^q07]]).
2. An automated step is trusted after 20 successful trial runs, with a log of every run the operator can review ([[SRC-20260916-interview-partner-selection#^q10]], [[SRC-20260916-ops-agent-trust-criteria#^t02]]).
3. The approval of outbound email is a graduated control: after 20 successful full inquiry-to-order cycles the agent may send all emails itself, partner and customer alike ([[SRC-20260916-interview-partner-selection#^q11]], [[SRC-20260916-ops-approval-gate#^g08]]).
4. Graduation is triggered by the operator's explicit word, not by a counter ([[SRC-20260916-interview-partner-selection#^q12]], [[SRC-20260916-ops-agent-trust-criteria#^t07]]).

**Context:**
- Earlier the same day the gate had been recorded as permanent; the operator corrected it unprompted ([[FIND-FS-0015]], [[SRC-20260916-ops-agent-trust-criteria#^t04]]).
- The SRS routes every recommendation through human review ([[SRC-fs-srs#^FR-5-01]]); the iteration-1 gate is the per-action approval of Claude Desktop ([[ADR-FS-0003]], [[ELM-desktop.gmailConnector]]).
- Outreach sent from Bitrix24 is invisible to the agent and cannot count toward the cycles ([[HZ-FS-0003]], [[SRC-20260916-map-desired-state#^n07]]).

**Consequences:**
- The service keeps the human-review interrupt for the offer choice permanently; the send approvals — outreach, customer price, partner confirmation — are a setting the operator lifts, with a reviewable log of cycles kept from the first run ([[ELM-fs.engine.hitl]]).
- Open: where the running log of cycles lives meanwhile — nothing keeps it today ([[SRC-20260916-ops-open-setup-items#^item-13]]); whether "successful" is judged per run by the operator.
- For [[PLAN-FS-0001]] and [[PLAN-FS-0002]] the 20 cycles are a go-live criterion of autonomous sending, not an iteration gate.
