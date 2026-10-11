---
id: ADR-FS-0003
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0003-iteration1-real-inbox-bitrix24.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Iteration 1 runs on real inbox + Bitrix24"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-desktop]]", "[[ELM-mail.gmail]]", "[[ELM-bitrix24]]", "[[PLAN-FS-0001]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
sw_logStatus: accepted
sw_statusNote: "accepted 2026-07-16 in the repository"
sw_covers: ["fs:instances/vault-ops/**", "fs:data/**"]
sw_repos: [fs]
---

# ADR-FS-0003: Iteration 1 runs on real inbox + Bitrix24

## Status
accepted (2026-07-16).

## Context
Iteration 1 is a Wizard-of-Oz phase: Claude Desktop operates the process by hand to harvest
edge cases and collect ranker training data. The choice was whether to run against a
lightweight Google-Sheets/Gmail simulation or the real `order@factory.sale` inbox and
Bitrix24 data.

## Decision
Iteration 1 runs against the **real `order@factory.sale` inbox and real Bitrix24 order data**,
with **human approval required before any outbound partner email**.

## Consequences
- Findings on messy real vendor-email formats and Bitrix24 API quirks are captured early and
  transfer directly into the iteration-2 build.
- Requires real credentials/access from the start → see [[ADR-FS-0008]] and
  secrets handling (`.env.example`, never commit secrets).
- Human-approval gate on outbound protects real partner relationships during the noisy phase.
- Every real inquiry processed should yield: a labelled ranking example (offers + human
  choice) and any findings. This is the primary data-collection mechanism for
  [[ADR-FS-0007]].
