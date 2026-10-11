---
id: ELM-fs.api
type: element
dcterms_identifier: fs.api
sw_kind: container
sw_parent: "[[ELM-fs]]"
sw_technology: "Python, FastAPI"
sw_tags: [Element, Container, Planned]
sw_views: ["[[VIEW-fs-containers]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.api — API gateway

Container of [[ELM-fs]] (FS Transportation Selection Agent) · tags `Planned`.

Stateless FastAPI router with OpenAPI and OAuth2 at the entrypoints: webhooks for Bitrix24 inquiries and incoming partner email, the pending-review list and the approve endpoint for the dashboard.

**Technology:** Python, FastAPI

## Relationships

### Outgoing

- → [[ELM-fs.cache]] — Throttling, session tokens *(Redis protocol)*
- → [[ELM-fs.engine]] — Triggers or resumes the graph thread *(in-process)*

### Incoming

- ← [[ELM-bitrix24]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
- ← [[ELM-fs.dashboard]] — Lists pending reviews; submits approve or reject *(REST)*

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
