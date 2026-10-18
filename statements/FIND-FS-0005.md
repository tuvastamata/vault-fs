---
id: FIND-FS-0005
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-249481-confirmed-standard.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Order #249481 matches a parcel-locker product — confirmed standard, not freight"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.classify]]", "[[SRC-20260827-huum-product-sheet]]", "[[SRC-20260827-ops-classification-rule]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-data-sources]]"]
sw_logStatus: resolved
sw_statusNote: "a confirmation, not a contradiction: one UKU control panel (140 x 100 x 30 mm, 0.1 kg, 'Pakiautomaat' in the sheet) is standard"
sw_severity: low
sw_covers: ["fs:instances/vault-ops/operating/test-run.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/edge-case]
---

# FIND-FS-0005: Order #249481 matches a parcel-locker product — confirmed standard, not freight

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-249481-confirmed-standard.md` (file time 2026-08-27 14:59, sha256 `14752a6be0ebc4f3…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: edge-case, severity: low. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Cross-checked order #249481 ("HUUM UKU Classic juhtpaneel - Must (ilma peamoodulita)", qty 1)
against the operator-supplied product weight/dimension sheet
(`HUUM toodete kaalud-mõõdud 04.10_HUUM 1.xlsx`). It matches "UKU control panel Classic / Black"
(Art.Nr. H2002041): 140×100×30 mm, 0.1 kg. The sheet's own "Transpordi info" column marks this
product `Pakiautomaat` (parcel locker) — the manufacturer's own shipping guidance says this ships
as a small parcel, not freight.

Per the classification rule the operator gave (2026-08-27): each product is standard on its own;
it only becomes non-standard when **multiple products are shipped together** and their **summed**
dimensions/weight exceed a threshold (L/W/H/weight — exact numbers not yet given, see the other
finding filed the same day). Order #249481 is a single unit of one small item, so under this rule
it is unambiguously **standard**, confirming the earlier suspicion.

## What I expected / wanted instead
N/A — this is a confirmation, not a contradiction. Recorded so the "must be non-standard" premise
of the 2026-08-27 test-run isn't silently forced onto data that doesn't support it.

## What I did about it
Reported the mismatch to the operator instead of manufacturing a false non-standard
classification, and asked whether to (a) simulate the non-standard branch synthetically (e.g. a
hypothetical multi-item bundle) or (b) pick a real order/product combination from the sheet that
would genuinely cross the threshold (e.g. HIVE/CLIFF/STEEL heaters, which run 13–24 kg and up to
~1040 mm tall even individually).
