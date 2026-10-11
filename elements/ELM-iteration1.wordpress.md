---
id: ELM-iteration1.wordpress
type: element
dcterms_identifier: iteration1.wordpress
sw_kind: deploymentNode
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: "WordPress, WooCommerce"
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.wordpress — WordPress hosting

Deployment node · environment **Iteration 1 - Wizard-of-Oz**.

Host of the factory.sale shop; not identified.

**Technology:** WordPress, WooCommerce

## Hosts

- [[ELM-woocommerce]] — WooCommerce shop

## Views

- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz

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
