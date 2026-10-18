---
id: FIND-FS-0012
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "No email trail at all for \"Gerava\" (Deal #7131)"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-bitrix24]]", "[[ELM-mail.gmail]]", "[[ELM-drive.offerLog]]", "[[HZ-FS-0003]]", "[[PER-gerava]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "explained 2026-09-09 (the request went out from Bitrix24); open setup item 10: the Bitrix24-Gmail connection, in progress per the operator (HZ-FS-0003)"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/operating/offer-log.md", "fs:fstransport/**"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/data-gap]
---

# FIND-FS-0012: No email trail at all for "Gerava" (Deal #7131)

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md` (file time 2026-09-09 11:36, sha256 `f6f2c3184eca79cc…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-09-09, type: data-gap, severity: medium. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Operator recalled requesting offers from Gerava, Delamode, and ACE for Deal #7131 (700 kg ICON
125 sauna, EE→PT), and that Gerava didn't respond. A full mailbox search (any spelling, all
folders including trash/spam) found **zero** messages to or from anything matching "Gerava" —
not a sent request, not a bounce, nothing. By contrast, both Delamode and ACE have a complete,
timestamped request→reply trail in this mailbox.

## What I expected / wanted instead
Either a sent request with no reply (confirming "didn't respond" from this mailbox), or an
explanation of where that contact actually happened (phone? a different email account? never
actually sent?).

## What I did about it
Flagged it back to the operator rather than assuming. If Gerava was contacted outside this
mailbox (phone, WhatsApp, a personal account), that's a gap in the evidence trail this discovery
process depends on — `fs-vault-sync:vault-ops/operating/offer-log.md` and any future automation need every partner contacted to
leave a record somewhere, not just the ones who replied by email.

## Resolution (2026-09-09)
Operator confirmed: the Gerava request was sent **directly from Bitrix24**, not through this
Gmail account — Bitrix24 can apparently send partner outreach on its own, independent of the
connected mailbox, and that path isn't yet synced/visible here. Operator says this Bitrix24↔Gmail
connection is actively being worked on. Until it is, **any partner contacted via Bitrix24 directly
is invisible to anyone (or any agent) working from the Gmail side** — added as an open setup item
in [[SRC-20260916-ops-open-setup-items]].
