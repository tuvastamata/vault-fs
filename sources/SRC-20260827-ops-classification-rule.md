---
id: SRC-20260827-ops-classification-rule
type: source
fed_kind: rule
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/reference/classification-rule.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/reference/classification-rule.md"
dcterms_title: "Standard vs. non-standard shipment — the classification rule as the operator stated it (2026-08-27, confirmed 2026-09-09)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-27
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-data-sources]]"]
---

# Standard vs. non-standard shipment

> Imported verbatim from `fs-vault-sync:vault-ops/reference/classification-rule.md` (file time 2026-09-09 11:24, sha256 `0999ee99985a14bf…`) on 2026-10-11: the thresholds, the lookup source for dimensions, the open single-item edge case, the worked example of the test run. Recorded fields: title: Standard vs. non-standard shipment — classification rule, tags: [ops, reference, rule], date: 2026-08-27. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

Documented from the operator during process discovery (2026-08-27), replacing the vague "by size,
qty, weight" note in [[SRC-20260916-ops-operating-checklist]] step 3. ^c01

## The rule
- **Each product on its own is standard**, regardless of its individual dimensions/weight. ^c02
- A shipment becomes **non-standard** when **multiple products must be shipped together as one
  set/order**, and their **summed** dimensions or weight exceed: ^c03

| Dimension | Threshold |
|---|---|
| Length (L) | 1200 mm |
| Width (W) | 800 mm |
| Height (H) | 1000 mm |
| Weight (m) | 200 kg |

If the combined shipment exceeds **any one** of these, treat it as non-standard and go to the
outreach branch ([[SRC-20260916-ops-operating-checklist]] step 4). ^c04

## Where to get per-product width/height/length/weight
Order-notification emails (`order@factory.sale`, subject "Uus Factory.Sale päring") do **not**
include physical dimensions — only product name, quantity, price, and customer info (see
[[FIND-FS-0009]]). Look up the
product by name in `data/huum-toodete-kaalud-moodud.xlsx` (columns: width mm, depth mm, height mm,
weight kg, plus a "Transpordi info" column noting the manufacturer's own shipping method, e.g.
`Pakiautomaat` for parcel-locker-sized items). That sheet is the actual source of truth for
dimensions/weight, not the order email. ^c05

## Known open edge case
CLIFF 6/9/11 and STEEL 6/9/11 heaters are 1030–1040 mm tall **individually** — already past the
1000 mm height threshold before any bundling. The rule as stated ("single item is always
standard") doesn't obviously cover this. See
[[FIND-FS-0011]] — not yet
resolved. ^c06

**Confirmed with real data (2026-09-09):** Deal #7131 (ICON 125 sauna + accessories, a single
line item) was a 200×120×130 cm / 700 kg package — far over every threshold (L2000×W1200×H1300mm
/ 700kg vs. the 1200×800×1000mm/200kg limits) on its own, no bundling involved, and it was
correctly run through the non-standard/partner-outreach branch. So in practice, single large
items **do** get checked against the threshold — the written rule just doesn't say so. Recommend
rewording the rule to check both (a) a single product's own dimensions/weight and (b) a multi-item
order's summed dimensions/weight, each against the same thresholds. ^c07

## Worked example (2026-08-27 test run)
Order #249481 ("UKU control panel Classic / Black", qty 1, 140×100×30 mm, 0.1 kg) is a single unit
of one product → **standard** by this rule (and the product sheet already marks it
`Pakiautomaat`/parcel-locker shipping, consistent with that). It was *not* a valid case for
testing the non-standard/partner-outreach branch; a synthetic 10×Hive 18 bundle
(246 kg combined, well over both the weight and footprint thresholds) was used instead — see
[[FIND-FS-0003]]. ^c08
