---
id: FIND-FS-0010
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-classification-thresholds-not-given.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Standard/non-standard thresholds still not numeric"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.classify]]", "[[SRC-fs-srs#^FR-1-02]]", "[[ADR-FS-0013]]", "[[SRC-20260827-ops-classification-rule]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: resolved
sw_statusNote: "resolved 2026-08-27: L 1200, W 800, H 1000 mm and 200 kg on the summed dimensions of a multi-item shipment (ADR-FS-0013); the single-item edge case is FIND-FS-0011"
sw_severity: medium
sw_covers: ["fs:fstransport/**", "fs:vault/10-spec/reconciled-spec.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/data-gap]
---

# FIND-FS-0010: Standard/non-standard thresholds still not numeric

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-classification-thresholds-not-given.md` (file time 2026-08-27 15:31, sha256 `1c2a7dd386033532…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: data-gap, severity: medium. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Operator described the classification rule on 2026-08-27: each product is standard alone; a
shipment becomes non-standard when multiple products are shipped together and their **summed**
L/W/H/weight exceed a threshold — but the message left the actual numbers blank ("L= mm, W= mm,
H= mm, m= kg"), and a supplied product sheet (`HUUM toodete kaalud-mõõdud...xlsx`) has per-product
dimensions/weight and a `Transpordi info` shipping-method column, but no explicit combined
threshold either.

## What I expected / wanted instead
The actual numeric thresholds (or a pointer to where they're defined, if not in the operator's
head).

## What I did about it
Asked the operator directly for the L/W/H/weight cutoff numbers before applying the rule to any
multi-item test case.

## Resolution (2026-08-27)
Operator provided the thresholds: L=1200mm, W=800mm, H=1000mm, m=200kg, applied to the **summed**
dimensions/weight of a multi-product shipment. Documented at
[[SRC-20260827-ops-classification-rule]]. Note: this surfaced a further edge case — CLIFF/STEEL
heaters exceed the 1000mm height threshold individually — see
[[FIND-FS-0011]] (not yet resolved).
