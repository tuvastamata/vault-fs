---
id: ADR-FS-0007
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0007-ranker-cold-start.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Ranker cold-start — deterministic scoring until data exists"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.engine.ranker]]", "[[ELM-drive.offerLog]]", "[[SRC-fs-srs#^FR-4-04]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: proposed
sw_statusNote: "proposed 2026-07-16; needs confirmation (question sheet Q7)"
sw_covers: ["fs:fstransport/**", "fs:data/**"]
sw_repos: [fs]
---

# ADR-FS-0007: Ranker cold-start — deterministic scoring until data exists

## Status
proposed (2026-07-16).

## Context
FR-4.04 / architecture call for a Decision-Tree ranker, but there is likely no clean dataset
of historical offers + human choices to train it (SRS technical Q2, open). A model trained on
no data cannot rank.

## Decision
1. Start with a **transparent deterministic scoring rule** over the agreed v1 criteria (best
   price, then delivery time) as the ranker in iteration 2.
2. Iteration 1 **collects the labelled dataset** — each processed inquiry logs the offer set
   and the human's chosen offer in a fixed schema (see `data/` + [[ADR-FS-0003]]).
3. Swap in the trained Decision Tree only once enough labelled examples exist and it beats the
   deterministic baseline on a held-out set. Record that switch as a new ADR.

## Consequences
- Removes the hard dependency on ML for a working v1.
- Defines a concrete iteration-1 deliverable (the dataset) and a clear promotion criterion.
- Deterministic rule doubles as the ML baseline and as a fallback if the model misbehaves.
