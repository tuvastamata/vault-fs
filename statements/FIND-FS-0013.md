---
id: FIND-FS-0013
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "ACE outreach is semi-automated; Delamode outreach is a manual email"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-aceTool]]", "[[ELM-mail.sales]]", "[[PER-ace]]", "[[PER-delamode]]", "[[OPP-FS-0004]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "logged as the opportunity OPP-FS-0004; open setup item 14: how the ACE / Raktio Oy tool accepts input"
sw_severity: low
sw_covers: ["fs:instances/vault-ops/operating/timeouts.md", "fs:fstransport/**"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/automation-candidate]
---

# FIND-FS-0013: ACE outreach is semi-automated; Delamode outreach is a manual email

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md` (file time 2026-09-09 11:45, sha256 `83c5322632d5d9ee…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-09-09, type: automation-candidate, severity: low, agent_candidate: true. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Reconstructed the real Deal #7131 timeline from the mailbox:
- **ACE**: a system message from `askforoffer@ace.ee` ("PRICE REQUEST FROM Raktio Oy, UNSENT
  ORDER: T126091934") went out automatically at 09:03 UTC with structured shipment data
  (weight, volume, dimensions, tail-lift flags, planned date). ACE's priced reply
  ("ACE Logistics pakkumine EE-63228 - PT-2500-273", 593.68 € + VAT, ~6-8 business days) came
  back at 09:34 UTC — **31 minutes** later. The same automated-request pattern (via a "Raktio Oy"
  system and `askforoffer@ace.ee`) recurs across many other historical shipments in this mailbox.
- **Delamode**: a manually composed email from `sales@factory.sale` ("Price request ref.#7131"),
  written out with loading/delivery addresses and package details by hand, went out around
  09:02 UTC. Delamode's reply (600.00 € excl. VAT, delivery till 30.09) came back at 10:31 UTC —
  **~1.5 hours** later.

Both replies arrived same-day, well inside the 2-day default in `fs-vault-sync:vault-ops/operating/timeouts.md` — no follow-up was
needed for either.

## What I expected / wanted instead
N/A — not a problem, but a notable asymmetry: one partner (ACE) already has a structured,
semi-automated request path; the other (Delamode) requires a human to type out the shipment
details every time.

## What I did about it
Logged this as an automation candidate rather than acting on it.

## Correction (2026-09-09) — got this backwards initially
Asked the operator directly whether the ACE-vs-Delamode difference is itself annoying. Answer:
the "automated" ACE path is actually the **tedious** one, because the operator has to manually
fill in the shipment data themselves into whatever feeds the `askforoffer@ace.ee` / "Raktio Oy"
request — the automation only kicks in *after* that manual entry. The Delamode email, despite
being hand-typed, doesn't have that extra upstream step. So the real automation opportunity isn't
"extend ACE's pattern to Delamode" — it's **removing the manual re-entry step that currently
feeds the ACE/Raktio Oy request**, likely by having it pull shipment data (dimensions, weight,
addresses) automatically from the order/Bitrix24 data instead of manual entry.
