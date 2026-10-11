---
id: ELM-iteration1.operatorMachine.claudeApp
type: element
dcterms_identifier: iteration1.operatorMachine.claudeApp
sw_kind: deploymentNode
sw_parent: "[[ELM-iteration1.operatorMachine]]"
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: desktop app
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.operatorMachine.claudeApp — Claude Desktop

Deployment node of [[ELM-iteration1.operatorMachine]] (Operator machine) · environment **Iteration 1 - Wizard-of-Oz**.

**Technology:** desktop app

## Hosts

- [[ELM-desktop.chrome]] — Chrome (Claude in Chrome)
- [[ELM-desktop.driveConnector]] — Google Drive connector
- [[ELM-desktop.gmailConnector]] — Gmail connector

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
