---
id: ELM-iteration1.stakeholderMachine
type: element
dcterms_identifier: iteration1.stakeholderMachine
sw_kind: deploymentNode
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: Windows or macOS
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.stakeholderMachine — Stakeholder machine

Deployment node · environment **Iteration 1 - Wizard-of-Oz**.

Desktop of a stakeholder; vault-sh for discovery interviews.

**Technology:** Windows or macOS

## Children

- [[ELM-iteration1.stakeholderMachine.claudeApp]] — Claude Desktop (deployment node)
- [[ELM-iteration1.stakeholderMachine.driveApp]] — Google Drive for desktop (deployment node)

## Views

- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz

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
