---
id: ELM-fs.cache
type: element
dcterms_identifier: fs.cache
sw_kind: container
sw_parent: "[[ELM-fs]]"
sw_technology: Redis
sw_tags: [Element, Container, Planned, Database]
sw_views: ["[[VIEW-fs-containers]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.cache — Cache

Container of [[ELM-fs]] (FS Transportation Selection Agent) · tags `Planned`, `Database`.

Transient cache: API throttling, session tokens.

**Technology:** Redis

## Relationships

### Incoming

- ← [[ELM-fs.api]] — Throttling, session tokens *(Redis protocol)*

## Deployed

- **Iteration 2 - target** — [[ELM-iteration2.agentHost]] (Agent host)

## Views

- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
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
