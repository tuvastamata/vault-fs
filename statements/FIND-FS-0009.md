---
id: FIND-FS-0009
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Order-data emails don't include width/height/length/weight"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-mail.order]]", "[[ELM-woocommerce]]", "[[ELM-bitrix24]]", "[[ELM-fs.engine.readOrder]]", "[[SRC-fs-srs#^FR-1-01]]", "[[SRC-fs-srs#^data-product]]", "[[SRC-20260827-huum-product-sheet]]"]
dcterms_isPartOf: ["[[LINE-fs-data-sources]]", "[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: resolved
sw_statusNote: "the lookup source is the HUUM sheet (resolved 2026-08-27); open setup item 8: the lookup by free-text product name is manual, automate it by SKU / Art.Nr."
sw_severity: high
sw_covers: ["fs:instances/vault-ops/operating/operating-checklist.md", "fs:vault/10-spec/SRS.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/data-gap]
---

# FIND-FS-0009: Order-data emails don't include width/height/length/weight

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md` (file time 2026-08-27 15:31, sha256 `3217e6d2313e3252…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: data-gap, severity: high. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
During a live test-run of the process (order #249481, "HUUM UKU Classic juhtpaneel - Must",
qty 1, €90.00, customer in Haaslava, Estonia), the order-notification email received at
`order@factory.sale` (subject "Uus Factory.Sale päring") contains only: product name, quantity,
price, and customer contact/delivery info. It does **not** contain width, height, length, or
weight — the fields [[SRC-20260916-ops-operating-checklist|operating-checklist]] step 2 says to read "from
Bitrix24."

## What I expected / wanted instead
Either the order email itself should carry the dimensional data, or the checklist should say
explicitly where to get it (e.g. look up the product by name/SKU in a separate Bitrix24 product
catalog, since it isn't in the order notification).

## What I did about it
Paused the live test at the classification step (checklist step 3) and asked the operator how
they normally source width/height/length/weight in practice — this needs a real answer before the
"standard vs non-standard" classification step can be tested meaningfully.

## Resolution (2026-08-27)
Operator supplied the product master sheet (now stored at `data/huum-toodete-kaalud-moodud.xlsx`),
which carries width/depth/height/weight and a shipping-method hint per product, keyed by product
name. Documented as the lookup source in [[SRC-20260827-ops-classification-rule]]. Still open: nothing
in the checklist automates matching an order line's free-text product name to a row in that
sheet — currently a manual lookup.
