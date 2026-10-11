---
id: ELM-desktop.chrome
type: element
dcterms_identifier: desktop.chrome
sw_kind: container
sw_parent: "[[ELM-desktop]]"
sw_technology: Chrome browser
sw_tags: [Element, Container, Iteration1]
sw_views: ["[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# desktop.chrome — Chrome (Claude in Chrome)

Container of [[ELM-desktop]] (Claude Desktop (company account)) · tags `Iteration1`.

Browser access to WooCommerce through the WordPress admin page while the shop has no API for the agent (ADR-FS-0011).

**Technology:** Chrome browser

## Relationships

### Outgoing

- → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)*

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.operatorMachine.claudeApp]] (Claude Desktop)

## Views

- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)
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
