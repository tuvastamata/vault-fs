---
id: OPP-FS-0006
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/opportunities/OPP-0006-missing-customer-confirmation-step.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "OPP-0006: Documented process is missing the customer price-confirmation step"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.customerConfirm]]", "[[ADR-FS-0015]]", "[[SRC-fs-process-flow]]", "[[SRC-fs-process-steps#^step-5]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: triaged
sw_statusNote: "opportunity type data-gap, impact medium, frequency every-time, agent candidate false; next step and evidence in the text"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/opportunities/"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/opportunity, nav/data-gap]
---

# OPP-FS-0006: Documented process is missing the customer price-confirmation step

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/opportunities/OPP-0006-missing-customer-confirmation-step.md` (file time 2026-09-16 12:21, sha256 `9a8f2a92b057ed3c…`), imported verbatim on 2026-10-11; recorded fields: title: "OPP-0006: Documented process is missing the customer price-confirmation step", id: OPP-0006, process: Transportation partner selection, date: 2026-09-09, type: data-gap, impact: medium, frequency: every-time, status: triaged, agent_candidate: false, tags: [discovery, opportunity]. An opportunity of the process-discovery skill, kept here as a finding tagged nav/opportunity; the project's number OPP-000N is the vault's OPP-FS-000N. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## Where in the process
Between "review & choose" (step 7) and "confirm with partner" (now step 9) in
[[SRC-20260916-ops-operating-checklist]] — **confirmed 2026-09-16: in that exact order.** The customer must say
"yes" before the partner gets confirmed at all, not after.

## What happens now
The operator picks the best eligible offer, compiles a customer-facing price (transport cost ×
1.3), and sends it to the customer — always drafted and sent by the operator personally, not
delegated. Nothing is confirmed with the transport partner until the customer replies "yes." Only
then does the (now renumbered) step 9 "confirm with partner" happen. This full sequence didn't
appear anywhere in [[SRC-20260916-ops-operating-checklist]] or [[SRC-fs-process-flow]] until this finding.

## Why it costs
An undocumented step is invisible to anyone new to the role and to any future agent design —
process-discovery (`fs-vault-sync:vault-ops/skills/process-discovery/SKILL.md`)'s whole purpose is mapping what
*actually* happens, and this is a real, every-time, order-critical step that was missing from the
official record. Getting the order wrong (e.g. confirming with a partner before the customer has
agreed to the price) would be a real process bug, not just a documentation gap.

## Opportunity
Document the customer-confirmation step explicitly, in the correct order, in
[[SRC-20260916-ops-operating-checklist]] and (via a finding, since it's read-only here)
[[SRC-fs-process-flow]].

## Resolution (2026-09-16)
Operator confirmed: (a) customer confirmation always happens before partner confirmation, no
exceptions; (b) the operator always drafts and sends the customer-facing offer personally — this
is not currently something Claude drafts, unlike partner emails. Added to
[[SRC-20260916-ops-operating-checklist]] as the new step 8 (partner-confirm and proceed-to-order shifted to
steps 9 and 10). Whether this could ever be delegated (with the same approval-gate treatment as
partner emails) is a separate, still-open design question for the desired-state map — not decided
either way here.

## Evidence
Operator, 2026-09-09: "Ootan ära transpordipartnerite vastused, koostan pakkumise, saadan
kliendile ja jään ootama kliendi vastust." Operator, 2026-09-16: "Ootan alati kliendi 'jah' ära,
enne ei kinnita midagi. Kliendile saadan pakkumise alati ise."
