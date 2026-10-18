---
id: FIND-FS-0011
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-cliff-steel-height-exceeds-alone.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "CLIFF/STEEL heaters exceed the height threshold even as a single unit"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.classify]]", "[[ADR-FS-0013]]", "[[SRC-20260827-huum-product-sheet]]", "[[FIND-FS-0010]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: open
sw_statusNote: "open setup item 5: reword the rule so that a single item is checked against the thresholds too; practice already does so (Deal #7131, 2026-09-09)"
sw_severity: medium
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/edge-case]
---

# FIND-FS-0011: CLIFF/STEEL heaters exceed the height threshold even as a single unit

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-cliff-steel-height-exceeds-alone.md` (file time 2026-09-09 11:24, sha256 `c26cb08b217b36c0…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: edge-case, severity: medium. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
The operator's classification rule (2026-08-27): a single product is always standard; a shipment
only becomes non-standard when **multiple** products are shipped together and their **summed**
L/W/H/weight exceed L=1200mm, W=800mm, H=1000mm, m=200kg (see
[[SRC-20260827-ops-classification-rule]]).

Checking the product sheet (`data/huum-toodete-kaalud-moodud.xlsx`) against that rule: CLIFF 6/9/11
and STEEL 6/9/11 heaters are each **1030–1040 mm tall on their own** — already past the H=1000mm
threshold as a single unit, before any bundling. Under a literal reading of the rule ("single item
is always standard"), an order for one CLIFF 9 heater would be called standard despite being
taller than the non-standard height threshold by itself.

## What I expected / wanted instead
Either the rule should also check a single item's own dimensions against the threshold (not just
summed multi-item totals), or this is a known/accepted gap (e.g. because a single tall heater
still fits standard carriers some other way, like being packaged lying down).

## What I did about it
Filed this rather than silently deciding which reading is correct. Needs the operator's call on
whether single-item dimensions should also be checked against the threshold.

## Update (2026-09-09) — confirmed with a real order
Deal #7131 (real, not hypothetical): a single ICON 125 sauna package, 200×120×130 cm / 700 kg,
was correctly treated as non-standard and sent to partner outreach — well over every threshold on
its own, no bundling. So the operator's real-world practice already checks single items against
the threshold; only the written rule text says otherwise. See
[[SRC-20260827-ops-classification-rule]] for the recommended rewording.
