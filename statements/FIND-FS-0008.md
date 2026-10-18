---
id: FIND-FS-0008
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-cannot-send-as-sales-address.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Can't actually send/draft \"From: sales@factory.sale\" yet"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-desktop.gmailConnector]]", "[[ELM-mail.gmail]]", "[[ELM-mail.sales]]", "[[ADR-FS-0009]]", "[[FIND-FS-0007]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
sw_logStatus: open
sw_statusNote: "its premise (no connection of sales@ exists) is probably wrong, see FIND-FS-0007; what stands: the connector has no from parameter, the sender identity is picked by the human in the Gmail UI"
sw_severity: blocker
sw_covers: ["fs:instances/vault-ops/operating/connecting-sales-email.md", "fs:instances/vault-ops/operating/test-run.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/bug]
---

# FIND-FS-0008: Can't actually send/draft "From: sales@factory.sale" yet

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-cannot-send-as-sales-address.md` (file time 2026-08-27 15:31, sha256 `c3e0047846c4c608…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: bug, severity: blocker. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Asked to run a live end-to-end test (order #249481, colleagues standing in as transport
partners), with outreach/confirmation emails to go out as `sales@factory.sale`. The only Gmail
account connected to this session is the order-data mailbox
(`evaprual.factorysale@gmail.com`, which `order@factory.sale` redirects to) — it has no
"transport-sales" label yet, and there is no evidence it has `sales@factory.sale` configured as a
verified "send mail as" alias. The Gmail draft/send tools available here also have no `from`
parameter at all — they can only send as the connected account's own address or its verified
aliases.

## What I expected / wanted instead
A way to draft/send genuinely as `sales@factory.sale`, per the approved decision to keep it
separate from the order-data channel ([[ADR-FS-0009]],
`fs-vault-sync:vault-ops/operating/connecting-sales-email.md`).

## What I did about it
Stopped before drafting the outreach emails and asked the operator to choose: (a) connect
`sales@factory.sale` first per the delivered guide, then resume the test, (b) run this specific
test using the currently connected mailbox as a clearly-marked stand-in sender (accepting it
won't really say `sales@factory.sale`), or (c) something else. Did not silently send mail under a
sender identity that wasn't actually authorized/connected.

## Update (2026-08-27) — this assumption may be wrong
Operator chose (b). When the reviewer actually sent the three drafts, two of three went out with
the envelope `From: sales@factory.sale`, not the connected account's own address — see
[[FIND-FS-0007]]. Since the send/draft tools have no `from`
parameter, that strongly suggests `sales@factory.sale` is **already** a verified "send mail as"
alias on this same Gmail account. Not confirmed yet — pending the operator checking Gmail
Settings → Accounts and Import. If confirmed, this finding's premise (no connection exists) is
wrong and the connecting-sales-email guide needs a much simpler update.
