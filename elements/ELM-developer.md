---
id: ELM-developer
type: element
dcterms_identifier: developer
sw_kind: person
sw_tags: [Element, Person]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# developer — Developer

Person.

Owns the git master of the project documentation, curates the machines' captures into it, builds the agent in iteration 2.

## Relationships

### Outgoing

- → [[ELM-drive.logistika]] — Derives the data model and the interim datastore *(analysis)*
- → [[ELM-drive.offerLog]] — Takes the labelled dataset for the ranker *(export)*
- → [[ELM-drive.sync]] — Pulls captures as an rclone snapshot; pushes back reference notes *(rclone)*
- → [[ELM-fs]] — Builds in iteration 2 from the vault's spec and findings *(Claude Code)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Pulls captures as an rclone snapshot; pushes back reference notes *(rclone)* · from [[ELM-developer]] → [[ELM-drive.sync]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
- [[VIEW-fs-shared-folders]] — Container View: Google Drive shared folders

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
