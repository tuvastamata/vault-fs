---
id: ELM-iteration2.orderSystem
type: element
dcterms_identifier: iteration2.orderSystem
sw_kind: deploymentNode
sw_environment: Iteration 2 - target
sw_technology: to be decided
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration2.orderSystem — Order system

Deployment node · environment **Iteration 2 - target**.

Consumer of the final webhook; not identified.

**Technology:** to be decided

## Hosts

- [[ELM-orderWebhook]] — Order webhook consumer

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
