---
id: ADR-FS-0012
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredBy: juri
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-09-13
dcterms_title: "Logistics rules: from the Logistika folder to a data model, an interim structured datastore and a parser"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-20260913-memo-transfer]]"
prov_wasQuotedFrom: ["[[SRC-20260913-memo-transfer#^m19]]", "[[SRC-20260913-memo-transfer#^m27]]"]
dcterms_subject: ["[[ELM-drive.logistika]]", "[[ELM-woocommerce]]", "[[ELM-fs.db]]", "[[ADR-FS-0010]]"]
dcterms_isPartOf: ["[[LINE-fs-data-sources]]"]
sw_logStatus: proposed
sw_statusNote: "the current thinking of the transfer memo (2026-09-13); not yet an ADR in the repository; the data model is not started"
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0012: Logistics rules: from the Logistika folder to a data model, an interim structured datastore and a parser

**Decision:**
1. The rules and operational data of logistics are taken from the Logistika folder as the business keeps them today ([[ELM-drive.logistika]]).
2. The developer and the agent form a data model from it iteratively and store it in a structured datastore (interim).
3. Later a parser refreshes the datastore on each update of the Logistika folder.
4. The datastore is expected to end up in WooCommerce tables ([[ADR-FS-0010]]).

**Context:** The transfer memo, section 3: "Rules & operational data currently come from the Logistika folder. Plan: developer + agent iteratively form a data model, store it in a structured datastore (interim), and later build a parser that refreshes the datastore on each Logistika update. That datastore is expected to eventually live in WooCommerce tables" ([[SRC-20260913-memo-transfer#^m19]]); the developer's action "start the data model from the Logistika folder; stand up an interim structured datastore" (^m27). The SRS data requirements name the partner directory, offer state and system variables ([[SRC-fs-srs#^data-partner]], [[SRC-fs-srs#^data-system]]) but not the logistics rules; the folder's contents are not described anywhere in the repository.

**Consequences:**
- The first developer task of the plan ([[PLAN-FS-0004]]); the iteration-1 → 2 gate counts a drafted data model among its conditions.
- The interim datastore's technology is open: the PostgreSQL of the planned service ([[ELM-fs.db]]) or a sheet; the parser is a deterministic job.
- The Logistika folder has to be read by the developer: on the Linux machine only through rclone ([[HZ-FS-0001]]).
- As [[ADR-FS-0010]]: the owner's reading of Juri's words; the project's own ADR is still to be written in the repository.
