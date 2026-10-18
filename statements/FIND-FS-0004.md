---
id: FIND-FS-0004
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-gmail-thread-collision.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Unrelated order inquiries land in the same Gmail thread"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-mail.gmail]]", "[[ELM-mail.order]]", "[[ELM-woocommerce]]", "[[ELM-drive.offerLog]]", "[[HZ-FS-0004]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]", "[[LINE-fs-data-sources]]"]
sw_logStatus: open
sw_statusNote: "open setup item 9: put the inquiry number in the notification's subject (webshop side); meanwhile key on the message id or on 'Päring #NNNNN' in the body, never on the Gmail thread id (HZ-FS-0004)"
sw_severity: medium
sw_covers: ["fs:instances/vault-ops/operating/offer-log.md", "fs:fstransport/**"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/bug]
---

# FIND-FS-0004: Unrelated order inquiries land in the same Gmail thread

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-gmail-thread-collision.md` (file time 2026-08-27 14:38, sha256 `5321bd80520b4f8b…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: bug, severity: medium. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Every order-notification email from the shop uses the identical subject line "Uus Factory.Sale
päring" with the inquiry number only inside the body. Gmail groups messages into threads by
subject (+ participants), so two unrelated inquiries — #249481 (24.08.2026, HUUM UKU juhtpaneel,
customer Gert Nurk) and #249493 (24.08.2026, Põrandalaud HLL 28x95, customer Mila Madison) — were
returned as two messages inside the **same thread**.

## What I expected / wanted instead
One thread per inquiry, so a specific `inquiry_id` can be looked up unambiguously (important for
`fs-vault-sync:vault-ops/operating/offer-log.md`, which is keyed by `inquiry_id`).

## What I did about it
Used the message ID (not thread ID) to isolate the correct order when reading #249481. Flagging
this because it will get worse as volume grows, and because any future automation that keys off
Gmail thread ID instead of the `Päring #NNNNN` in the body will silently mix up orders.
