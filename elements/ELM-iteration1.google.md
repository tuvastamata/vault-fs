---
id: ELM-iteration1.google
type: element
dcterms_identifier: iteration1.google
sw_kind: deploymentNode
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: cloud
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.google — Google

Deployment node · environment **Iteration 1 - Wizard-of-Oz**.

Google Drive and Gmail.

**Technology:** cloud

## Hosts

- [[ELM-drive]] — Google Drive shared folders
- [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com

## Relationships

### Incoming

- ← [[ELM-iteration1.developerMachine.snapshot]] — Pulls and pushes the shared folder by hand *(rclone)*
- ← [[ELM-iteration1.operatorMachine.driveApp]] — Mirrors the shared folder *(Google Drive for desktop)*
- ← [[ELM-iteration1.stakeholderMachine.driveApp]] — Mirrors the shared folder *(Google Drive for desktop)*

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
