---
id: OPP-FS-0002
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0002-customer-forgets-unloading.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0002: Customer forgets they must organize their own unloading"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.customerConfirm]]", "[[ADR-FS-0015]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "opportunity type handoff-gap, impact medium, frequency sometimes, agent candidate true; next step and evidence in the text"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/handoff-gap]
---

# OPP-FS-0002: Customer forgets they must organize their own unloading

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0002-customer-forgets-unloading.md` (file time 2026-09-09 12:04, sha256 `537c4902a131db37…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0002: Customer forgets they must organize their own unloading", id: OPP-0002, process: Transportation partner selection, date: 2026-09-09, type: handoff-gap, impact: medium, frequency: sometimes, status: open, agent_candidate: true, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Customer-facing confirmation, tied to the delivery method chosen (semi-trailer requiring the
customer's own unloading capability, vs. a tail-lift truck unloaded by forklift from the truck —
see the variation factors in [[SRC-20260827-ops-classification-rule]] / handoffs interview notes).

## What happens now
Whether the shipment needs the customer to arrange their own unloading (forklift, manpower)
depends on the delivery method. This isn't always clearly confirmed with the customer in advance,
so it's sometimes forgotten — leading to a failed or delayed delivery attempt.

## Why it costs
Wasted delivery attempt, delay, possible extra cost (re-delivery, waiting time charged by the
carrier), customer frustration.

## Opportunity
Bake an explicit unloading-responsibility confirmation into the customer-facing offer/confirmation
message whenever the delivery method requires it — the agent could draft this consistently every
time, removing reliance on the operator remembering to mention it.

## Next step
Ready to spec — add a standard clause to the customer confirmation template, conditional on
delivery method.

## Evidence
Operator, 2026-09-09: "klient on unustanud, et peab ise mahalaadimise organiseerima."
