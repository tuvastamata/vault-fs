---
id: ELM-woocommerce
type: element
dcterms_identifier: woocommerce
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-email-channels]]", "[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# woocommerce — WooCommerce shop

Software system · tags `External`.

WordPress/WooCommerce storefront of factory.sale: product data today, the intended home of the product and logistics-rule data (ADR-FS-0010). No API for the agent yet: interim access through the WordPress admin in Chrome (ADR-FS-0011). Sends the order notification 'Uus Factory.Sale päring' to order@factory.sale - product name, quantity, price, customer and delivery details, no dimensions (FIND-FS-0009).

## Properties

- evidence: `transfer memo 2026-09-13 (SRC-20260913-memo-transfer), section 3; fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md`

## Relationships

### Outgoing

- → [[ELM-mail.order]] — Order notification 'Uus Factory.Sale päring' *(email)*

### Incoming

- ← [[ELM-customer]] — Places an order *(web shop)*
- ← [[ELM-desktop.chrome]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- ← [[ELM-stakeholder]] — Defines the product and logistics-rule data *(workshop)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-mail]] — Order notification 'Uus Factory.Sale päring' *(email)* · from [[ELM-woocommerce]] → [[ELM-mail.order]]

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.wordpress]] (WordPress hosting)
- **Iteration 2 - target** — [[ELM-iteration2.wordpress]] (WordPress hosting)

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-email-channels]] — Container View: Email channels
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
