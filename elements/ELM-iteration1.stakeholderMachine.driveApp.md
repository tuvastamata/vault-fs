---
id: ELM-iteration1.stakeholderMachine.driveApp
type: element
dcterms_identifier: iteration1.stakeholderMachine.driveApp
sw_kind: deploymentNode
sw_parent: "[[ELM-iteration1.stakeholderMachine]]"
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: sync client
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.stakeholderMachine.driveApp — Google Drive for desktop

Deployment node of [[ELM-iteration1.stakeholderMachine]] (Stakeholder machine) · environment **Iteration 1 - Wizard-of-Oz**.

Mirrors fs-vault-sync/vault-sh to disk.

**Technology:** sync client

## Hosts

- [[ELM-desktop.vault]] — Instance vault

## Relationships

### Outgoing

- → [[ELM-iteration1.google]] — Mirrors the shared folder *(Google Drive for desktop)*

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
