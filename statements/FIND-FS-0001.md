---
id: FIND-FS-0001
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-11
pav_importedFrom: "fs:vault/30-findings/FIND-0001-offer-log-live-source-is-gsheet.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Offer log live source is a Google Sheet, not CSV"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-drive.offerLog]]", "[[ADR-FS-0007]]", "[[SRC-fs-srs#^FR-4-03]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_severity: low
sw_covers: ["fs:data/README.md", "fs:instances/vault-ops/operating/offer-log.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/data-gap]
---

# FIND-FS-0001: Offer log live source is a Google Sheet, not CSV

## Trigger
During 2026-08-11 discovery, the operator clarified the live offer/decision log is a Google Sheet
(`offer-log.gsheet` at the fs-vault-sync root), not `data/offer-log.csv`. The CSV is only the
column template/schema.

## Current behavior
Master `data/README.md` and the operator `operating/offer-log.md` described the live data as a CSV
"on the dev side".

## Desired behavior
Docs point at the Google Sheet as the live source; CSV is labelled template/schema only.

## Proposed handling
Correct `data/README.md` (done in this curation run). Open question for the ranker pipeline
(ADR-0007): should it read the Sheet directly (Google Sheets connector) rather than a CSV export?
→ flag, may need an ADR later.

## Evidence / attachments
`fs-vault-sync/vault-ops/operating/findings-inbox/finding-2026-08-11-offer-log-is-gsheet-not-csv.md`
