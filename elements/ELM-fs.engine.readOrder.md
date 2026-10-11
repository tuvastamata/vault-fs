---
id: ELM-fs.engine.readOrder
type: element
dcterms_identifier: fs.engine.readOrder
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: LangGraph node
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.readOrder — Read Bitrix24 data

Component of [[ELM-fs.engine]] (Orchestration engine).

Deterministic: order and product data through the Bitrix24 REST API (FR-1.01).

**Technology:** LangGraph node

## Relationships

### Outgoing

- → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)*

## Views

- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine

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
