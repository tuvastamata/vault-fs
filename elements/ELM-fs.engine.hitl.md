---
id: ELM-fs.engine.hitl
type: element
dcterms_identifier: fs.engine.hitl
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: LangGraph interrupt
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.hitl — Human review interrupt

Component of [[ELM-fs.engine]] (Orchestration engine).

LangGraph state interruption before the human-review node; the graph resumes on the dashboard decision and drops a rejected offer (FR-5.01 to FR-5.03). The final offer choice stays with the operator; the approval of every outbound email is a graduated control that lifts after 20 successful full cycles on the operator's explicit go-ahead (ADR-FS-0016).

**Technology:** LangGraph interrupt

## Relationships

### Outgoing

- → [[ELM-fs.db]] — Flushes the state at the interrupt (PostgresSaver) *(SQL)*

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
