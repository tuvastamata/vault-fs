---
id: ADR-FS-0004
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0004-timeouts-and-follow-ups.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Offer/confirmation timeouts and follow-up limits"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.engine.outreach]]", "[[ELM-fs.dashboard]]", "[[SRC-fs-srs#^FR-3-04]]", "[[SRC-fs-srs#^FR-5-04]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: proposed
sw_statusNote: "partially answered 2026-07-16: timeouts agreed, the follow-up cap open (question sheet Q2); blocks iteration 2"
sw_covers: ["fs:fstransport/**", "fs:instances/vault-ops/operating/timeouts.md"]
sw_repos: [fs]
---

# ADR-FS-0004: Offer/confirmation timeouts and follow-up limits

## Status
partially-answered (2026-07-16).

## Context
SRS stakeholder questions 1-3.

## Decision
- **Initial-offer timeout before follow-up:** 2 days (normal tempo); 12-18 hours (fast-track).
  Dashboard exposes a **fast-track checkbox per shipment**.
- **Confirmation-reply timeout before moving to next best offer:** 2 days (normal tempo).
- **Max automated follow-ups before "No Bid":** _OPEN — needs ops answer._

## Consequences
- State needs a per-shipment `fast_track: bool` and configurable timeout values.
- Follow-up counter (`current_retry_count`) needs a cap once the max is decided.
