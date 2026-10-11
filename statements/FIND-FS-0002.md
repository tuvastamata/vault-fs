---
id: FIND-FS-0002
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-11
pav_importedFrom: "fs:vault/30-findings/FIND-0002-transport-email-channel.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Transportation email channel is sales@factory.sale"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-mail.sales]]", "[[ELM-mail.order]]", "[[ADR-FS-0008]]", "[[ADR-FS-0009]]", "[[SRC-fs-srs#^FR-3-01]]", "[[SRC-fs-srs#^FR-3-03]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
sw_logStatus: open
sw_severity: medium
sw_covers: ["fs:vault/10-spec/process-flow.md", "fs:instances/vault-ops/operating/operating-checklist.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/extra-need]
---

# FIND-FS-0002: Transportation email channel is sales@factory.sale

## Trigger
Discovery (2026-08-11) surfaced the real email topology: `sales@factory.sale` (zone.ee/Radicenter)
is the outreach/offer channel, separate from `order@factory.sale` → Gmail (order data).

## Current behavior
`10-spec/process-flow` and the operator checklist say generic "email" at the outreach/offer steps.

## Desired behavior
Those steps name `sales@factory.sale` (send + receive) explicitly, and order intake names
`order@factory.sale` → Gmail.

## Proposed handling
Decision logged as ADR-0009 (channel separation + connection). Reconciled-spec gap G6 tracks the
process-flow/checklist naming update once the channel is connected.

## Evidence / attachments
`fs-vault-sync/vault-ops/operating/findings-inbox/finding-2026-08-11-sales-email-channel-decision.md`;
`.../decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md`
