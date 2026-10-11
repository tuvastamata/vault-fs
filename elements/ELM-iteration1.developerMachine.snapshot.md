---
id: ELM-iteration1.developerMachine.snapshot
type: element
dcterms_identifier: iteration1.developerMachine.snapshot
sw_kind: infrastructureNode
sw_parent: "[[ELM-iteration1.developerMachine]]"
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: "rclone, remote andrei:"
sw_tags: [Element, Infrastructure Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.developerMachine.snapshot — rclone snapshot

Infrastructure node of [[ELM-iteration1.developerMachine]] (Developer machine) · environment **Iteration 1 - Wizard-of-Oz**.

~/factory.sale/fs-vault-sync: a copy of the shared folder pulled by hand (last on 2026-08-27).

**Technology:** rclone, remote andrei:

## Relationships

### Outgoing

- → [[ELM-iteration1.google]] — Pulls and pushes the shared folder by hand *(rclone)*

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
