---
id: OPP-FS-0001
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0001-site-access-failures.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0001: Truck can't access delivery site due to road conditions"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.customerConfirm]]", "[[ELM-fs.engine.outreach]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "opportunity type broken-loop, impact medium, frequency sometimes, agent candidate false; next step and evidence in the text"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/broken-loop]
---

# OPP-FS-0001: Truck can't access delivery site due to road conditions

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0001-site-access-failures.md` (file time 2026-09-09 12:04, sha256 `33311921941c2b89…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0001: Truck can't access delivery site due to road conditions", id: OPP-0001, process: Transportation partner selection, date: 2026-09-09, type: broken-loop, impact: medium, frequency: sometimes, status: open, agent_candidate: false, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Delivery, after the partner has been confirmed ([[SRC-20260916-ops-operating-checklist]] step 8-9) — discovered
too late, at the point of actual delivery.

## What happens now
Sometimes the truck physically cannot reach the delivery site because of road conditions (narrow
roads, unpaved access, etc.). This isn't checked before booking transport.

## Why it costs
Delivery delay, possible re-routing or re-booking with a different vehicle/partner, redoing the
confirmation step, unhappy customer.

## Opportunity
Ask the customer upfront about site access constraints (road width, surface, any known
restrictions) before booking — either as an order-form question or a proactive check the agent
runs when compiling the transport request.

## Next step
Needs more data — how often this actually happens and whether it's specific to certain regions
would help decide if a standing order-form question is worth adding.

## Evidence
Operator, 2026-09-09: "auto ei pääse objektile teeolude seisukorra tõttu ligi."
