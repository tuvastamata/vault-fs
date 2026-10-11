---
id: ELM-iteration1.stakeholderMachine.claudeApp
type: element
dcterms_identifier: iteration1.stakeholderMachine.claudeApp
sw_kind: deploymentNode
sw_parent: "[[ELM-iteration1.stakeholderMachine]]"
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: desktop app
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.stakeholderMachine.claudeApp — Claude Desktop

Deployment node of [[ELM-iteration1.stakeholderMachine]] (Stakeholder machine) · environment **Iteration 1 - Wizard-of-Oz**.

**Technology:** desktop app

## Hosts

- [[ELM-desktop.driveConnector]] — Google Drive connector

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
