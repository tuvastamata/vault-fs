---
id: ELM-fs.engine.outreach
type: element
dcterms_identifier: fs.engine.outreach
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: LangGraph node
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.outreach — Outreach and follow-up

Component of [[ELM-fs.engine]] (Orchestration engine).

Deterministic: inquiry, follow-up and confirmation-request emails from templates and variables; recipient list filtered from the partner directory; timeouts and the follow-up cap (FR-3.01 to FR-3.04, ADR-FS-0004).

**Technology:** LangGraph node

## Relationships

### Outgoing

- → [[ELM-fs.mailAdapter]] — Sends inquiries, follow-ups and confirmation requests *(in-process)*

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
