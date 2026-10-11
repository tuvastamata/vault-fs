---
id: ELM-fs.db
type: element
dcterms_identifier: fs.db
sw_kind: container
sw_parent: "[[ELM-fs]]"
sw_technology: PostgreSQL
sw_tags: [Element, Container, Planned, Database]
sw_views: ["[[VIEW-fs-containers]]", "[[VIEW-fs-engine-components]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.db — Database

Container of [[ELM-fs]] (FS Transportation Selection Agent) · tags `Planned`, `Database`.

Offers and comparison lists, audit log, LangGraph state checkpoints.

**Technology:** PostgreSQL

## Relationships

### Incoming

- ← [[ELM-fs.engine]] — Checkpoints the state; stores offers, comparison lists and audits *(SQL)*
- ← [[ELM-fs.engine.hitl]] — Flushes the state at the interrupt (PostgresSaver) *(SQL)*

## Deployed

- **Iteration 2 - target** — [[ELM-iteration2.agentHost]] (Agent host)

## Views

- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine
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
