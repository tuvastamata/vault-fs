---
id: ELM-llm
type: element
dcterms_identifier: llm
sw_kind: softwareSystem
sw_tags: [Element, Software System, External, Planned]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-containers]]", "[[VIEW-fs-engine-components]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# llm — LLM API

Software system · tags `External`, `Planned`.

Model provider for parsing partner emails into structured offers and confirmations; the model is confirmed at build time and recorded as a decision.

## Relationships

### Incoming

- ← [[ELM-fs.engine.parseEmail]] — Structured extraction of offers and confirmations *(HTTPS)*

## Deployed

- **Iteration 2 - target** — [[ELM-iteration2.llmProvider]] (LLM provider)

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
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
