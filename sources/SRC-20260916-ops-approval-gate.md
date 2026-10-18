---
id: SRC-20260916-ops-approval-gate
type: source
fed_kind: rule
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/operating/approval-gate.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/operating/approval-gate.md"
dcterms_title: "Approval gate — the operator's live rule with the graduation criterion added 2026-09-16"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Approval gate — nothing to a partner without your OK

> Imported verbatim from `fs-vault-sync:vault-ops/operating/approval-gate.md` (file time 2026-09-16 12:49, sha256 `8eddf00c4b620170…`) on 2026-10-11: the repository's instance seed (`fs:instances/vault-ops/operating/approval-gate.md@89d77d2`) has the gate without the graduation section. Recorded fields: title: Approval gate, tags: [ops, rule]. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

During iteration 1, **every outbound email to a transportation partner requires your explicit
approval before it is sent.** This includes: ^g01

- initial outreach / inquiry emails, ^g02
- follow-up emails, ^g03
- confirmation requests. ^g04

Claude may draft them; you review and send (or approve sending). This protects partner
relationships while the process is still being shaped, and matches the system's
Human-in-the-Loop design. ^g05

Internal actions (reading Bitrix24, logging offers, computing prices) do **not** need approval. ^g06

## Graduation criterion (added 2026-09-16, from process discovery)
This gate is not meant to be permanent. Per the operator, once the agent has completed **20
successful full inquiry-to-order cycles** (not 20 successful instances of one step — the whole
process, end to end), it may send **all** outbound emails itself — partner outreach and
customer-facing price emails alike — without per-email approval. See
[[SRC-20260916-ops-agent-trust-criteria]] for the full trust bar (the 20 runs plus a reviewable log),
and [[SRC-20260916-interview-partner-selection]] §9 for the exact exchange. ^g07

**How graduation is triggered:** the operator (Factory.Sale) will tell the agent directly once
the 20 cycles are done — "Me anname ise teada, kui 20 tsüklit on edukalt läbitud." There is no
automated counter or self-reported threshold; until the operator explicitly says the milestone is
reached, the rule above (every send needs explicit approval) stays in force exactly as written,
no matter how many cycles have actually run. ^g08

This is a correction to what was earlier recorded as "confirmed unconditionally" in
[[SRC-20260916-ops-open-setup-items]] item #13 — see that file for the correction note. ^g09
