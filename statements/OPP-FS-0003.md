---
id: OPP-FS-0003
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0003-new-development-addresses.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0003: New-development delivery addresses can't be found"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.readOrder]]", "[[ELM-fs.engine.outreach]]", "[[ELM-fs.engine.customerConfirm]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-data-sources]]"]
sw_logStatus: open
sw_statusNote: "opportunity type data-gap, impact medium, frequency sometimes, agent candidate true; next step and evidence in the text"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/data-gap]
---

# OPP-FS-0003: New-development delivery addresses can't be found

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0003-new-development-addresses.md` (file time 2026-09-09 12:04, sha256 `6996ee9ffc7d032c…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0003: New-development delivery addresses can't be found", id: OPP-0003, process: Transportation partner selection, date: 2026-09-09, type: data-gap, impact: medium, frequency: sometimes, status: open, agent_candidate: true, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Address/destination handling, before or during booking transport.

## What happens now
For deliveries to new real-estate developments, the address sometimes doesn't resolve on maps or
in carrier systems yet (too new), making it hard to book/communicate the delivery location
correctly.

## Why it costs
Delay, back-and-forth communication with the customer and/or partner, risk of misdelivery.

## Opportunity
When an address fails to resolve on a mapping check, proactively ask the customer for GPS
coordinates or a landmark/description, before the transport request goes out rather than after a
failed delivery attempt.

## Next step
Needs more data — how often this occurs and whether a simple map-resolution check before sending
the transport request would catch it early.

## Evidence
Operator, 2026-09-09: "uusarenduste puhul ei leita aadressi."
