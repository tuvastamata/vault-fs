---
id: FIND-FS-0007
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "sales@factory.sale may already work as a send-as alias on the connected mailbox"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-mail.gmail]]", "[[ELM-mail.sales]]", "[[ELM-desktop.gmailConnector]]", "[[ADR-FS-0009]]", "[[DC-FS-0001]]", "[[HZ-FS-0002]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
sw_logStatus: open
sw_statusNote: "open setup item 1: confirm the send-as alias in Gmail settings and whether sales@ mail also arrives in the account; then item 2, simplify the guide and the ADR"
sw_severity: high
sw_covers: ["fs:vault/60-guides/connecting-sales-email.md", "fs:instances/vault-ops/operating/connecting-sales-email.md", "fs:instances/vault-ops/operating/setup-transport-email.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/extra-need]
---

# FIND-FS-0007: sales@factory.sale may already work as a send-as alias on the connected mailbox

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md` (file time 2026-08-27 15:22, sha256 `b5d333d122dc195f…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: extra-need, severity: high. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Three identical draft emails were created via the same tool call, from the same connected Gmail
account, with no "from" override available (confirmed: the create_draft/send tools have no
`from` parameter). All three were then sent by a human reviewer. Checking the sent copies:
- To kristo@factory.sale → went out as `evaprual.factorysale@gmail.com`.
- To alvin@factory.sale and myynti@factory.sale → went out as `sales@factory.sale`
  ("Eva Prual / Factory.Sale <sales@factory.sale>").

Since the tool itself can't select a "from" address, this strongly suggests a human manually
picked "sales@factory.sale" as the send-as identity in Gmail's compose UI for two of the three —
which would mean `sales@factory.sale` is **already configured as a verified send-as alias on this
same connected Gmail account**, contradicting the assumption in
[[ADR-FS-0009]] and
`fs-vault-sync:vault-ops/operating/connecting-sales-email.md` that a brand-new, separate mailbox/connector was needed.

## What I expected / wanted instead
If true, this changes the connection guide significantly: no new Gmail account or forwarding
setup needed — just consistently choosing the `sales@factory.sale` send-as identity (and possibly
setting it as default) on the account already connected here. It also means the "separate
channel" decision needs re-checking: if both addresses are aliases on one account, the two
channels are less separated at the infrastructure level than the ADR assumed.

## What I did about it
Flagged this to the operator to confirm directly (check Gmail Settings → Accounts and Import →
"Send mail as" on this account) rather than assuming either way, and to decide whether the ADR and
the connection guide need updating once confirmed.
