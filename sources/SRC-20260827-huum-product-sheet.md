---
id: SRC-20260827-huum-product-sheet
type: source
fed_kind: dataset
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/data/huum-toodete-kaalud-moodud.xlsx"
dcterms_title: "HUUM product dimensions and weights sheet (huum-toodete-kaalud-moodud.xlsx, 2026-08-27)"
dcterms_language: et
dcterms_type: Dataset
dcterms_date: 2026-08-27
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-data-sources]]", "[[LINE-fs-pricing-and-partner-selection]]"]
---

# Source: the HUUM product dimensions and weights sheet — `huum-toodete-kaalud-moodud.xlsx`, uploaded by the operator on 2026-08-27

The product master sheet the operator supplied during the test run of 2026-08-27 when it turned out that order notifications carry no dimensions ([[FIND-FS-0009]]): one row per HUUM product with width, depth, height, weight and a shipping-method hint (`Transpordi info`, e.g. `Pakiautomaat` = parcel locker). The classification rule names it as the source of truth for dimensions and weight, looked up by product name ([[SRC-20260827-ops-classification-rule]], [[ADR-FS-0013]]). Who at HUUM made the sheet is not recorded. The file stays in the snapshot, `fs-vault-sync:vault-ops/data/huum-toodete-kaalud-moodud.xlsx` (file time 2026-08-27 15:31, sha256 `ddaa289a03d6fc10…`); this is its passport.

**Condition `full`:** read with the standard library on 2026-10-11. Sheet `Sheet1`: 159 product rows, columns `Product` · `model` · `Art.Nr.EU` · `Art.Nr.US` · `width mm` · `depth mm` · `height  mm` · `weight kg` · `Transpordi info`.

## Shipping-method hints (`Transpordi info`)

- `(blank)`: 104
- `Pakiautoaat`: 18
- `Pakitakse EUR alus alusele`: 10
- `Pakitakse poolkule alusele`: 9
- `Pakitakse kerisena eraldi pakina, kui kivid siis 1/2 alusele`: 8
- `Pakitakse kerisena eraldi pakina, kui kivid siis EUR alus alusele`: 6
- `Pakitakse kerisena eraldi pakina, kui kivid siis 1/2 alus alusele`: 4

## Products over the single-item thresholds of the rule (H > 1000 mm or m > 200 kg)

- CLIFF 6: height 1030.0 mm, weight 16.7 kg
- CLIFF 9: height 1030.0 mm, weight 17.2 kg
- CLIFF 11: height 1030.0 mm, weight 17.2 kg
- STEEL 6: height 1040.0 mm, weight 16.35 kg
- STEEL 9: height 1040.0 mm, weight 16.8 kg
- STEEL 11: height 1040.0 mm, weight 16.8 kg
- HIVE Flow regular: height 1040.0 mm, weight 76.0 kg
- HIVE Flow regular LS: height 1040.0 mm, weight 83.0 kg
- HIVE Flow Mini: height 1040.0 mm, weight 60.0 kg
- HIVE Flow Mini LS: height 1040.0 mm, weight 72.0 kg


## First rows

| Product | model | Art.Nr.EU | Art.Nr.US | width mm | depth mm | height  mm | weight kg | Transpordi info |
|---|---|---|---|---|---|---|---|---|
| UKU 4.1 - Wifi, Classic Black |  | H2004011 | H2004012 | 334.0 | 182.0 | 120.0 | 2.0 | Pakiautoaat |
| UKU 4.1 - Local, Classic Black |  | H2004021 | H2004022 | 334.0 | 182.0 | 120.0 | 2.0 | Pakiautoaat |
| UKU 4.1 - Wifi, Glass Black |  | H2004031 | H2004032 | 334.0 | 182.0 | 120.0 | 2.1 | Pakiautoaat |
| UKU 4.1 - 4G, Classic Black | Black | H2004041 | OBSOLETE! | 334.0 | 182.0 | 120.0 | 2.0 | Pakiautoaat |
| UKU 4.1 - Wifi, just powerbox | Wifi | H2004051 | H2004042 | 334.0 | 182.0 | 120.0 | 2.0 | Pakiautoaat |
| UKU 4.1 - Local, just powerbox | Local | H2004061 | H2004052 | 334.0 | 182.0 | 120.0 | 2.0 | Pakiautoaat |
| UKU control panel | wood | H2002011 | H2002012 | 140.0 | 100.0 | 30.0 | 0.1 | Pakiautoaat |
| UKU control panel Glass | Black | H2002021 | H2002022 | 140.0 | 100.0 | 30.0 | 0.25 | Pakiautoaat |
