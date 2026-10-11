---
id: SRC-fs-reconciled-spec
type: source
fed_kind: spec
pav_importedFrom: "fs:vault/10-spec/reconciled-spec.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/10-spec/reconciled-spec.md@89d77d2"
dcterms_title: "Reconciled Specification — conflicts and gaps"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-07-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-email-channel]]"]
---

# Reconciled Specification

> Imported verbatim from `fs:vault/10-spec/reconciled-spec.md@89d77d2` on 2026-10-11 (first committed 2026-07-16): the repository's living reconciliation note; block anchors `^C1`–`^C3` on the conflicts, `^gaps` on the gap table. At this commit the G6 row has no closing condition yet — the uncommitted edit of 2026-08-27 in the clone adds one. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

Single place where conflicts and gaps between the [[SRC-fs-srs]], [[SRC-fs-process-steps]], and
[[SRC-fs-process-flow]] are named and resolved. Code must follow the **resolution** column, not the
raw source docs. Each conflict links to the ADR that decides it.

## Conflicts

### C1 — pricing formula
- **SRS FR-2.01:** `fuel_cost_index × transport_list_price × n_transported_pallets` ^C1
- **Process step 6.1 / flow STD:** `fuel_cost_index × transport_list_price` (drops `n_transported_pallets`)
- **Resolution:** *proposed* — include `n_transported_pallets` (the SRS form); a per-pallet
  index that ignores quantity underprices multi-pallet standard loads. Confirm with ops.
- **Decision:** [[ADR-FS-0001]]

### C2 — standard-pallet partner selection
- **Gap:** the fast-track branch computes a price but no doc says *which* partner carries a
  standard pallet, or whether fast-track skips partner selection entirely (fixed carrier / list price). ^C2
- **SRS Q6** and the diagram callout both leave this open.
- **Resolution:** *open* — needs ops input. Until resolved, treat fast-track as "priced, human
  picks / confirms the carrier at the dashboard".
- **Decision:** [[ADR-FS-0002]]

### C3 — step numbering typo (informational)
- Process-steps PDF labels the step-16 sub-items "14.1/14.2". Corrected to 16.1/16.2 in
  [[SRC-fs-process-steps]]. No behavioral impact. ^C3

## Gaps to resolve before iteration-2 coding

| # | Gap | Owner | Decision |
|---|-----|-------|----------|
| G1 | Max automated follow-ups before "No Bid" | ops | [[ADR-FS-0004]] |
| G2 | `fuel_cost_index` source & refresh cadence | tech | [[ADR-FS-0006]] |
| G3 | Ranker cold-start (no training data yet) | tech | [[ADR-FS-0007]] |
| G4 | Email infrastructure (IMAP vs API) | tech | [[ADR-FS-0008]] |
| G5 | Partner directory data — does it exist, and where? (fleet limits, routes per FR-3.02) | ops/tech | _create ADR when raised_ |
| G6 | Process-flow & checklist say generic "email"; name `sales@factory.sale` (outreach/offers) and `order@factory.sale`→Gmail (order data) | ops/tech | [[ADR-FS-0009]] |

^gaps

> Keep this note current: when a finding reveals a new conflict, add a row and link an ADR.
