---
id: ELM-fs.engine.customerConfirm
type: element
dcterms_identifier: fs.engine.customerConfirm
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: "LangGraph node, interrupt"
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.customerConfirm — Customer price confirmation

Component of [[ELM-fs.engine]] (Orchestration engine).

Compiles the customer price (transport cost x 1.3), sends it to the customer and waits for the explicit yes before any partner confirmation - a step the SRS and the process flow do not have; today the operator drafts and sends it personally (ADR-FS-0015, OPP-FS-0006).

**Technology:** LangGraph node, interrupt

## Relationships

### Outgoing

- → [[ELM-customer]] — Price offer; waits for the customer's yes *(email)*

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
