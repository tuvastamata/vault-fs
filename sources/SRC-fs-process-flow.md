---
id: SRC-fs-process-flow
type: source
fed_kind: diagram
pav_importedFrom: "fs:vault/10-spec/process-flow.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/10-spec/process-flow.md@89d77d2"
dcterms_title: "Process Flow (Mermaid)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-07-16
fed_condition: full
dcterms_isFormatOf: "[[SRC-fs-source-docs#^flowchart-svg]]"
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Process Flow

> Imported verbatim from `fs:vault/10-spec/process-flow.md@89d77d2` on 2026-10-11 (first committed 2026-07-16): redrawn in the repository from the flowchart SVG of 2026-06-18. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

Redrawn from the original flowchart SVG. Node kinds: **deterministic** (rectangles),
**decision** (diamonds), **LLM/agent parse**, **human**. See [[SRC-fs-process-steps]] for the
numbered narrative.

```mermaid
flowchart TD
    Start([Start]) --> A2[Inquiry to order@factory.sale]
    A2 --> A3[Inquiry from email to Bitrix24]
    A3 --> A4[Agent: read inquiry data from Bitrix24<br/>deterministic / API]
    A4 --> A5[Agent: detect is_standard_pallet<br/>deterministic]
    A5 --> D6{Standard pallet?}

    %% Standard / fast-track branch
    D6 -- Yes --> STD[Agent: calculate<br/>fuel_cost_index x transport_list_price<br/>x n_pallets ⚠️ see reconciled-spec C1]
    STD --> J((join))

    %% Non-standard / vendor outreach branch
    D6 -- No --> NB1[Agent: prepare inquiry email draft<br/>deterministic / templates]
    NB1 --> NB2[Agent: check offers submitted<br/>LLM parse]
    NB2 --> D7{Offer X submitted?}
    D7 -- No --> NB3[Agent: send follow-up to partner<br/>deterministic / is_inquiry_received]
    NB3 --> NB2
    D7 -- Yes --> NB4[Agent: add offer X to comparison list<br/>write to DB]
    NB4 --> NB5[Compute price_apply = price_offer x 1.3<br/>deterministic]
    NB5 --> NB6[Compile offers; criteria: price, delivery_time, ...<br/>deterministic]
    NB6 --> NB7[Agent: compare offers by criteria<br/>ML decision tree]
    NB7 --> REC[Agent: recommend offer to human<br/>deterministic / post to dashboard]
    REC --> J

    %% Human review + confirmation loop
    J --> H[Human: review transportation offer]
    H --> D13{Offer confirmed?}
    D13 -- "No: -1 offer" --> NB7
    D13 -- Yes --> CONF[Agent: send confirmation request<br/>to selected partner]
    CONF --> C15[Agent: read partner confirmation<br/>LLM parse]
    C15 --> D16{Partner confirmed?}
    D16 -- "No: -1 offer" --> NB7
    D16 -- Yes --> ORD[Agent: proceed to order<br/>deterministic / POST webhook]
    ORD --> End([End])
```

## Open callouts carried from the original diagram

- **How is the transportation partner selected for a standard pallet?** — the fast-track
  branch computes a price but the diagram leaves partner selection unspecified.
  See [[SRC-fs-reconciled-spec#^C2]].
- **List of criteria to select the best transportation offer** — currently `price` and
  `delivery_time` only (per stakeholder answer), with "additional factors" reserved.
