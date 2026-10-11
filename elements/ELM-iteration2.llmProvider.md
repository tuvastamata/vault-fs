---
id: ELM-iteration2.llmProvider
type: element
dcterms_identifier: iteration2.llmProvider
sw_kind: deploymentNode
sw_environment: Iteration 2 - target
sw_technology: API
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration2.llmProvider — LLM provider

Deployment node · environment **Iteration 2 - target**.

Anthropic or OpenAI; the model is confirmed at build time.

**Technology:** API

## Hosts

- [[ELM-llm]] — LLM API

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
