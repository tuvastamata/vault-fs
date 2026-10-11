---
id: ELM-drive.offerLog
type: element
dcterms_identifier: drive.offerLog
sw_kind: container
sw_parent: "[[ELM-drive]]"
sw_technology: Google Sheet
sw_tags: [Element, Container, Folder, Iteration1]
sw_views: ["[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# drive.offerLog — Offer log

Container of [[ELM-drive]] (Google Drive shared folders) · tags `Folder`, `Iteration1`.

Live offer/decision log of iteration 1: one row per offer received (inquiry, route, partner, prices, delivery time); chosen yes/no is the label for the future ranker. A Google Sheet at the root of fs-vault-sync (FIND-FS-0001); the CSV in the repository is only the schema.

**Technology:** Google Sheet

## Relationships

### Incoming

- ← [[ELM-developer]] — Takes the labelled dataset for the ranker *(export)*
- ← [[ELM-operator]] — Logs every offer and which one was chosen *(Google Sheets)*

## Views

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
