---
id: ADR-FS-0001
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0001-standard-pallet-pricing-formula.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Standard-pallet pricing formula"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.engine.pricing]]", "[[ELM-fs.engine.classify]]", "[[SRC-fs-srs#^FR-2-01]]", "[[SRC-fs-reconciled-spec#^C1]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]"]
sw_logStatus: proposed
sw_statusNote: "proposed 2026-07-16; needs ops confirmation (question sheet Q3)"
sw_covers: ["fs:fstransport/**", "fs:vault/10-spec/reconciled-spec.md"]
sw_repos: [fs]
---

# ADR-FS-0001: Standard-pallet pricing formula

## Status
proposed (2026-07-16) — needs ops confirmation.

## Context
Conflict [[SRC-fs-reconciled-spec#^C1]]. SRS FR-2.01 defines the
fast-track price as `fuel_cost_index × transport_list_price × n_transported_pallets`, but
process step 6.1 and the flow diagram drop `n_transported_pallets`.

## Decision
Use the SRS form including `n_transported_pallets`:

```
price = fuel_cost_index × transport_list_price × n_transported_pallets
```

A quantity-independent price would underprice multi-pallet standard loads.

## Consequences
- `n_transported_pallets` must be derived during classification (step 5) and carried in state.
- If ops confirms `transport_list_price` is already a per-shipment (not per-pallet) figure,
  revisit and supersede this ADR.
