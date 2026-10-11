---
id: ADR-FS-0010
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredBy: juri
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-09-13
dcterms_title: "WooCommerce becomes the home of the product and logistics-rule data"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-20260913-memo-transfer]]"
prov_wasQuotedFrom: ["[[SRC-20260913-memo-transfer#^m17]]", "[[SRC-20260913-memo-transfer#^m19]]", "[[SRC-20260913-memo-transfer#^m28]]"]
dcterms_subject: ["[[ELM-woocommerce]]", "[[ELM-drive.logistika]]", "[[ELM-bitrix24]]", "[[SRC-fs-srs#^FR-1-01]]"]
dcterms_isPartOf: ["[[LINE-fs-data-sources]]"]
sw_logStatus: proposed
sw_statusNote: "the current thinking of the transfer memo (2026-09-13), which asks the developer to log it as a decision; not yet an ADR in the repository; the WooCommerce review workshop is to be scheduled"
sw_covers: ["fs:vault/20-decisions/**", "fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0010: WooCommerce becomes the home of the product and logistics-rule data

**Decision:**
1. The product data and the generic logistics-rule data the agent needs live in WooCommerce; which fields, the stakeholders define in a WooCommerce review workshop (to schedule).
2. Until WooCommerce holds them, the interim paths of [[ADR-FS-0011]] (access) and [[ADR-FS-0012]] (the data model and datastore) apply; that datastore is expected to end up in WooCommerce tables.

**Context:** The transfer memo of 2026-09-13, section 3: "WooCommerce review with stakeholders (to schedule). Stakeholders will define what product data and what generic logistics-rule data goes into WooCommerce" ([[SRC-20260913-memo-transfer#^m17]]); "That datastore is expected to eventually live in WooCommerce tables" (^m19). The memo asks the developer to "log points 1–3 above as ADRs so they're authoritative, not just in this memo" (^m28). The SRS names only Bitrix24 as the source of order and product data ([[SRC-fs-srs#^FR-1-01]]); the split between the order record in Bitrix24 and the product catalogue in WooCommerce is written nowhere else.

**Consequences:**
- The workshop is the project manager's action ([[PLAN-FS-0004]]); the data definition is the stakeholders'.
- The data model of [[ADR-FS-0012]] is designed to land in WooCommerce tables.
- Open: what stays in Bitrix24 (the order and its quantities) and what the classifier reads from WooCommerce (product dimensions and weight); the model draws both ([[ELM-bitrix24]], [[ELM-woocommerce]]).
- This record is the owner's reading of Juri's words; the project still has to take the decision in its own repository (`vault/20-decisions`, in the repository's form) — this vault does not write there.
