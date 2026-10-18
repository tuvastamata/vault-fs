---
id: FIND-FS-0006
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-08-27
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-offers-not-comparable.md@2026-08-27"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Test-run offers came back in three different, non-comparable formats"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.parseEmail]]", "[[ELM-fs.engine.ranker]]", "[[ELM-drive.offerLog]]", "[[SRC-fs-srs#^FR-4-01]]", "[[SRC-fs-srs#^FR-4-02]]"]
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: open
sw_statusNote: "open setup items 6 and 7: the test run is paused at the comparison and nothing of it is logged; superseded in evidence by Deal #7131, which reached a real comparison (FIND-FS-0014)"
sw_severity: medium
sw_covers: ["fs:fstransport/**", "fs:instances/vault-ops/operating/offer-log.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/edge-case]
---

# FIND-FS-0006: Test-run offers came back in three different, non-comparable formats

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-offers-not-comparable.md` (file time 2026-08-27 15:22, sha256 `1c549341cb9b4698…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-08-27, type: edge-case, severity: medium. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
Simulated outreach for the 10×Hive 18 (~246 kg) test shipment got three replies:
- Kristo: "1000000 EUR+KM" (pickup 30.08, delivery 02.09).
- Alvin: "250.- eurot alus + km" (per pallet) + 21% fuel surcharge, valid 2 weeks, no dates.
- Myynti/Rivo: "350 EUR + km" (flat, tail-lift unloading), no dates, no stated basis (per
  pallet? per shipment?).

None of the three used a common format: pricing basis differs (per-pallet vs. presumably flat),
only one mentions a fuel surcharge, only one gives delivery dates, and Kristo's price is off by
several orders of magnitude from the other two (likely a test artifact, but can't be told apart
from a real typo/error without asking).

## What I expected / wanted instead
A comparable set of offers (same currency/basis, delivery date, and total for the actual shipment)
so "best price, then delivery time" ([[SRC-20260916-ops-operating-checklist]] step 7) can be applied
mechanically. As received, comparing them fairly requires going back to each partner.

## What I did about it
Did not force a "best offer" pick out of incomparable data. Reported the raw offers and the gaps
to the operator and asked whether to follow up with each partner for a standardized quote (total
price for the whole 10-unit shipment, dates, and confirmation of what's included) before
recording a "chosen" row in `fs-vault-sync:vault-ops/operating/offer-log.md`.
