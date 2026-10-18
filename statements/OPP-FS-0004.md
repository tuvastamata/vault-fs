---
id: OPP-FS-0004
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0004: Manual re-entry into the ACE/Raktio Oy price-request tool"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-aceTool]]", "[[ELM-fs.engine.outreach]]", "[[FIND-FS-0013]]", "[[PER-ace]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "opportunity type automation-candidate, impact medium, frequency often, agent candidate true; next step and evidence in the text"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/automation-candidate]
---

# OPP-FS-0004: Manual re-entry into the ACE/Raktio Oy price-request tool

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md` (file time 2026-09-09 12:04, sha256 `524ded5c220ee35a…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0004: Manual re-entry into the ACE/Raktio Oy price-request tool", id: OPP-0004, process: Transportation partner selection, date: 2026-09-09, type: automation-candidate, impact: medium, frequency: often, status: open, agent_candidate: true, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Outreach step ([[SRC-20260916-ops-operating-checklist]] step 4), specifically the ACE channel.

## What happens now
Even though ACE's price request (`askforoffer@ace.ee`, via a "Raktio Oy" system) is automated
once triggered, the operator has to manually type the shipment data into whatever feeds it — the
same data (dimensions, weight, addresses) already exists in the order/Bitrix24 and the product
sheet ([[SRC-20260827-ops-classification-rule]]).

## Why it costs
Described directly by the operator as "tüütu ja aeganõudev" (tedious and time-consuming) —
repeated manual data entry for every non-standard shipment sent to ACE.

## Opportunity
Auto-populate the ACE/Raktio Oy request directly from the order + product-dimension data instead
of manual entry — the agent (or a simpler integration) fills in what's already known.

## Next step
Needs more data — how the Raktio Oy tool actually accepts input (web form? Bitrix24 automation
button? something else?) before this can be spec'd concretely.

## Evidence
Operator, 2026-09-09, and the real Deal #7131 request/reply trail
([[FIND-FS-0013]]).
