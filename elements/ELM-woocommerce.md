---
id: ELM-woocommerce
type: element
dcterms_identifier: woocommerce
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# woocommerce — WooCommerce shop

Software system · tags `External`.

WordPress/WooCommerce storefront of factory.sale: product data today, the intended home of the product and logistics-rule data (ADR-FS-0010). No API for the agent yet: interim access through the WordPress admin in Chrome (ADR-FS-0011).

## Properties

- evidence: `transfer memo 2026-09-13 (SRC-20260913-memo-transfer), section 3`

## Relationships

### Incoming

- ← [[ELM-desktop.chrome]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- ← [[ELM-stakeholder]] — Defines the product and logistics-rule data *(workshop)*

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.wordpress]] (WordPress hosting)
- **Iteration 2 - target** — [[ELM-iteration2.wordpress]] (WordPress hosting)

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)
- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz
- [[VIEW-fs-deployment-iteration-2]] — Deployment View: Iteration 2 - target

## Records

Hazards, decisions and deferred changes that refer to this element (live query):

```base
filters:
  and:
    - 'note.type == "statement"'
    - 'file.hasLink(this.file)'
views:
  - type: table
    name: Records
    groupBy:
      property: note.fed_kind
      direction: ASC
    order:
      - file.name
      - note.dcterms_title
      - note.sw_logStatus
      - note.sw_severity
```

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
