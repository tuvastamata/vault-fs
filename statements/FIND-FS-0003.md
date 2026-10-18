---
id: FIND-FS-0003
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-test-order-likely-not-freight-case.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Chosen test order (#249481) doesn't look like a real freight-partner case"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.classify]]", "[[SRC-fs-srs#^FR-1-02]]", "[[FIND-FS-0005]]", "[[SRC-20260827-ops-classification-rule]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: resolved
sw_statusNote: "resolved the same day: a synthetic 10 x Hive 18 bundle stood in for the non-standard branch; the rule itself came the same afternoon (FIND-FS-0010, ADR-FS-0013)"
sw_severity: low
sw_covers: ["fs:instances/vault-ops/operating/operating-checklist.md", "fs:instances/vault-ops/operating/test-run.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/edge-case]
---

# FIND-FS-0003: Chosen test order (#249481) doesn't look like a real freight-partner case

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-test-order-likely-not-freight-case.md` (file time 2026-08-27 14:38, sha256 `0ac9fcf139402f64…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: edge-case, severity: low. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
The order picked for the live test — #249481, "HUUM UKU Classic juhtpaneel - Must", qty 1,
€90.00 — is a single small electronics control panel. Nothing in the order data suggests it's
oversized/heavy pallet freight; on the available evidence it reads like a normal
courier-parcel item, not a case that would realistically need a transportation-partner quote.
No standard/non-standard threshold is documented anywhere in the vault ([[SRC-20260916-ops-operating-checklist]]
just says "by size, qty, weight" with no numbers) to check this against.

## What I expected / wanted instead
Either a documented rule for "standard pallet or not," or a genuinely oversized/heavy real order
to use as the test case, so the classification step is tested against realistic data instead of
being forced.

## What I did about it
Paused rather than silently forcing this order into the "non-standard" branch. Asked the operator
whether to (a) supply the actual standard/non-standard rule and/or manual dimensions for this
product, or (b) pick a different, genuinely non-standard real order for the test.
