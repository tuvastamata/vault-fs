---
id: OPP-FS-0005
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0005-automate-offer-ranking.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0005: Automate offer comparison using the 10%-threshold + quality rule"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.ranker]]", "[[ELM-drive.offerLog]]", "[[ADR-FS-0014]]", "[[ADR-FS-0007]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "opportunity type automation-candidate, impact high, frequency every-time, agent candidate true; next step and evidence in the text"
sw_severity: high
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/automation-candidate]
---

# OPP-FS-0005: Automate offer comparison using the 10%-threshold + quality rule

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0005-automate-offer-ranking.md` (file time 2026-09-09 12:04, sha256 `fa7490c0498457f9…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0005: Automate offer comparison using the 10%-threshold + quality rule", id: OPP-0005, process: Transportation partner selection, date: 2026-09-09, type: automation-candidate, impact: high, frequency: every-time, status: open, agent_candidate: true, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Review & choose step ([[SRC-20260916-ops-operating-checklist]] step 7).

## What happens now
The operator compares offers in their head using an until-now undocumented rule: prefer a
trusted/higher-quality partner unless a competitor is more than ~10% cheaper (see
[[SRC-20260909-ops-offer-selection-rule]]).

## Why it costs
Not costly today (the operator does it correctly), but it isn't written down anywhere a future
agent or a ranker could learn from directly — a ranker trained only on `fs-vault-sync:vault-ops/operating/offer-log.md`'s
price/delivery-time columns would systematically diverge from the real decision.

## Opportunity
Build the offer-ranker around the documented rule (10% price band + quality factors: damages,
communication, delivery accuracy) instead of price alone.

## Next step
Needs a decision first — a documented list of which partners count as "trusted" and why (open
question in [[SRC-20260909-ops-offer-selection-rule]]) before the rule can be automated reliably.

## Evidence
[[SRC-20260909-ops-offer-selection-rule]]; Deal #7131.
