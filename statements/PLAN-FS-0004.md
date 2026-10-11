---
id: PLAN-FS-0004
type: statement
fed_kind: plan
fed_modality: decision
fed_status: proposed
pav_authoredBy: juri
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-09-13
dcterms_title: "Next actions after the transfer, per role (memo 2026-09-13)"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-20260913-memo-transfer]]"
prov_wasQuotedFrom: ["[[SRC-20260913-memo-transfer#^m21]]", "[[SRC-20260913-memo-transfer#^m25]]", "[[SRC-20260913-memo-transfer#^m29]]"]
dcterms_subject: ["[[ELM-fs]]", "[[ELM-woocommerce]]", "[[ELM-drive.logistika]]", "[[ELM-mail.gmail]]", "[[PLAN-FS-0001]]", "[[PLAN-FS-0002]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
sw_logStatus: proposed
sw_statusNote: "named in the transfer memo of 2026-09-13; none of the actions is recorded as done by 2026-10-11 (FACT-FS-0001: no commits, no Drive changes since 2026-08-27)"
sw_covers: ["fs:vault/40-iterations/**", "fs:vault/20-decisions/**"]
sw_repos: [fs]
---

# PLAN-FS-0004: Next actions after the transfer, per role (memo 2026-09-13)

Status: the memo's section 4, as written; progress is kept in the status note and the log below.

**Project manager** ([[PER-liis]]; [[SRC-20260913-memo-transfer#^m21]] … ^m24):
1. Get the stakeholder answers to the question sheet ([[SRC-fs-stakeholder-questions]]) — the four open decisions [[ADR-FS-0002]], [[ADR-FS-0004]], [[ADR-FS-0006]], [[ADR-FS-0008]] block iteration 2.
2. Schedule the WooCommerce review workshop to define the product and logistics-rule data ([[ADR-FS-0010]]).
3. Coordinate the iteration-1 test run (2–3 colleagues as stand-in partners) and the real operating start; own the timing of the two-mailbox sunset ([[DC-FS-0001]]).
4. Track the iteration-1 → iteration-2 gate: findings triaged, ADRs accepted, data model drafted ([[PLAN-FS-0002]]).

**Software developer** (the owner; ^m25 … ^m28):
1. Finish the email setup and verify it: From header, SMTP route, SPF/DMARC, labels ([[HZ-FS-0002]]).
2. Support the iteration-1 dry run; curate the captures into the master with the vault-curation skill.
3. Start the data model from the Logistika folder; stand up an interim structured datastore; design the Chrome/WordPress-admin and Huum-folder access path; plan WooCommerce as datastore and the future parser ([[ADR-FS-0011]], [[ADR-FS-0012]]).
4. Prepare the iteration-2 LangGraph build once the open ADRs, the data model and enough labelled offer data exist; log points 1–3 of the memo's section 3 as ADRs in the repository.

**Stakeholders** (^m29 … ^m31):
1. Answer the question sheet; confirm the fuel_cost_index source, the partner directory (location and fields), the follow-up cap and the standard-pallet partner selection.
2. Define the WooCommerce data (product and logistics rules) and keep Logistika current.
3. Perform the test run and reply realistically as "partners".

**Log:**
- 2026-09-13: written by Juri in the transfer memo.
- 2026-10-11: recorded here; nothing done since the memo as far as the repository, the shared folder and the clone show ([[FACT-FS-0001]]).
