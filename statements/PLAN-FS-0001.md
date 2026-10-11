---
id: PLAN-FS-0001
type: statement
fed_kind: plan
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/40-iterations/iteration-1-wizard-of-oz.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Iteration 1 — Wizard-of-Oz"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-desktop]]", "[[ELM-mail.gmail]]", "[[ELM-bitrix24]]", "[[ELM-drive.offerLog]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
sw_logStatus: proposed
sw_statusNote: "planned, not started (HANDOFF 2026-08-27; memo 2026-09-13: no real partner traffic yet)"
sw_covers: ["fs:instances/vault-ops/**", "fs:data/**"]
sw_repos: [fs]
---

# PLAN-FS-0001: Iteration 1 — Wizard-of-Oz

Claude Desktop operates the [[SRC-fs-process-steps|process]] by hand against the **real
`order@factory.sale` inbox and Bitrix24 data** ([[ADR-FS-0003]]).
No LangGraph stack is built. Human approval is required before any outbound partner email.

## Goals (the three deliverables)
1. **Findings** — every edge case / extra need logged in `fs:vault/30-findings/README.md@89d77d2`.
2. **Labelled dataset** — each processed inquiry records the offer set + the human's chosen
   offer, in a fixed schema, to seed the ranker ([[ADR-FS-0007]]).
3. **Decisions** — resolve the open ADRs (0002, 0004 follow-up cap, 0006, 0008) from real
   operating experience.

## Tooling
- Bitrix24 (read order/product data), Gmail/`order@factory.sale` (send/monitor), a sheet or
  `data/` CSV for the offer/decision log.
- Connectors to wire up: Bitrix24, Gmail, Google Sheets/Drive.

## Exit criteria (reconciliation gate → iteration 2)
- N real inquiries processed end-to-end (agree N with ops).
- Open ADRs resolved or explicitly parked.
- Reconciled-spec conflicts C1/C2 decided.
- Enough labelled rows to define (if not yet train) the ranking baseline.

## Retro
_(fill at end of iteration)_
