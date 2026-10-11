---
id: ADR-FS-0006
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0006-fuel-cost-index-source.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Source and refresh cadence of fuel_cost_index"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.engine.pricing]]", "[[SRC-fs-srs#^FR-2-01]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: proposed
sw_statusNote: "open: awaiting tech input (question sheet Q5); blocks iteration 2"
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0006: Source and refresh cadence of fuel_cost_index

## Status
open — awaiting tech input (SRS technical Q1).

## Context
Fast-track pricing depends on `fuel_cost_index`. Unknown: where it lives (internal DB vs
external API), how often it changes, and whether the change is regular or occasional.

## Decision
_TBD — fill during iteration 1._

## Consequences
_TBD — determines whether the value is cached, polled, or fetched per calculation._
