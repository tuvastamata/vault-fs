---
id: ADR-FS-0005
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0005-zero-offer-fallback.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Zero-offer fallback for non-standard shipments"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.engine.outreach]]", "[[ELM-fs.engine.hitl]]", "[[SRC-fs-srs#^FR-3-03]]", "[[SRC-fs-srs#^FR-3-04]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: accepted
sw_statusNote: "accepted for v1 2026-07-16; the next-phase ideas are deferred"
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0005: Zero-offer fallback for non-standard shipments

## Status
accepted for v1 (2026-07-16).

## Context
SRS stakeholder question 4 — what to do if zero partners submit an offer in time.

## Decision
**v1:** a human requests the transportation offer manually if the shipment goes to the UK or
the package has specific (out-of-range) dimensions; otherwise continue the follow-up sequence.

**Deferred to next phase:** (a) agent asks partners by email why they skipped, to tune future
requests; (b) agent uses historical data to price without any partner outreach.

## Consequences
- v1 needs a "route to human / manual request" terminal state for the zero-offer case.
- The next-phase ideas depend on the historical dataset from [[ADR-FS-0007]].
