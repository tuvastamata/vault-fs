---
id: ELM-iteration2.langsmithCloud
type: element
dcterms_identifier: iteration2.langsmithCloud
sw_kind: deploymentNode
sw_environment: Iteration 2 - target
sw_technology: API
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration2.langsmithCloud — LangSmith

Deployment node · environment **Iteration 2 - target**.

SaaS or self-hosted; not decided.

**Technology:** API

## Hosts

- [[ELM-langsmith]] — LangSmith

## Views

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
