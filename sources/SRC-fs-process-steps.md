---
id: SRC-fs-process-steps
type: source
fed_kind: spec
pav_importedFrom: "fs:vault/10-spec/process-steps.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/10-spec/process-steps.md@89d77d2"
dcterms_title: "Transportation Agent — Process Steps"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-07-16
fed_condition: full
dcterms_isFormatOf: "[[SRC-fs-source-docs#^process-steps-pdf]]"
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Transportation Agent — Process Steps

> Imported verbatim from `fs:vault/10-spec/process-steps.md@89d77d2` on 2026-10-11 (first committed 2026-07-16): converted verbatim in the repository from the PDF `Transportation Agent Process Steps.pdf`; block anchors `^step-N` and `^step-N-M`. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

> Converted verbatim. Each step notes whether it is **deterministic**, an **LLM** task, or
> **human**. See [[SRC-fs-process-flow]] for the Mermaid diagram and [[SRC-fs-reconciled-spec]] for
> conflicts with the [[SRC-fs-srs]].

1. **Start** ^step-1
2. Receive inquiry at `order@factory.sale`. ^step-2
3. Transfer inquiry from email to Bitrix24. ^step-3
4. Agent reads inquiry product data from Bitrix24 — *deterministic, via API*. ^step-4
5. Agent detects `is_standard_pallet` by size, qty and weight — *deterministic calculation*. ^step-5
6. **Decision: standard_pallet?** — *deterministic if/else* ^step-6
   - **6.1 Yes:** Agent calculates `fuel_cost_index × transport_list_price`; continue to step 12. ⚠️ SRS FR-2.01 also multiplies by `n_transported_pallets` — see [[SRC-fs-reconciled-spec#^C1]]. ^step-6-1
   - **6.2 No:** Agent prepares transportation inquiry email draft (*deterministic: templates + variables*); sends to partners (*deterministic: recipient list*); reads submitted offers (*LLM: parse & extract offer data*); continue to step 7. ^step-6-2
7. **Decision: Offer X submitted?** ^step-7
   - **7.1 No:** Agent sends follow-up email to partner (*deterministic: templates*); loop back to read offers (*LLM: parse & detect emails*). ^step-7-1
   - **7.2 Yes:** Agent registers offer X to comparison list (*write to DB table*). ^step-7-2
8. Compute `price_apply = price_offer × 1.3` — *deterministic: read price from DB, calculate precise price*. ^step-8
9. Compile `list_transportation_offers`; define criteria `[price, delivery_time, additional factors]` — *deterministic: read from DB*. ^step-9
10. Agent compares offers by criteria — *statistical ML model, decision-tree algorithm*. ^step-10
11. Agent recommends transportation offer to human — *deterministic: post selected offer to dashboard*. ^step-11
12. **Human reviews transportation offer.** ^step-12
13. **Decision: offer confirmed?** ^step-13
    - **13.1 No:** remove 1 offer; loop to step 10 — *deterministic if/else*. ^step-13-1
    - **13.2 Yes:** Agent sends request for confirmation to selected partner — *deterministic if/else*. ^step-13-2
14. Agent sends transportation confirmation request to selected partner — *deterministic: template + variables*. ^step-14
15. Agent reads transportation confirmation response from selected partner — *LLM: parse & detect emails*. ^step-15
16. **Decision: partner confirmed?** ^step-16
    - **16.1 No:** remove 1 offer; loop to step 10 — *deterministic if/else*. ^step-16-1
    - **16.2 Yes:** Agent checks selected partner confirmed — *deterministic if/else*. ^step-16-2
17. Agent proceeds to order — *deterministic: POST to subscribed webhook, or in future respond to a higher-level agent*. ^step-17

> Note: the source PDF mislabels the step-16 sub-items as "14.1 / 14.2"; corrected to 16.1 / 16.2 above.
