---
id: ELM-fs.engine.parseEmail
type: element
dcterms_identifier: fs.engine.parseEmail
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: "LangGraph node, LLM call"
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.parseEmail — Email parser

Component of [[ELM-fs.engine]] (Orchestration engine).

LLM: extracts price, dates and locations from partner replies into the offer schema; parses confirmation replies (FR-4.01, FR-5.04).

**Technology:** LangGraph node, LLM call

## Relationships

### Outgoing

- → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)*

### Incoming

- ← [[ELM-fs.mailAdapter]] — Delivers partner replies *(in-process)*

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
