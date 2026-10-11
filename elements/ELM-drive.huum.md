---
id: ELM-drive.huum
type: element
dcterms_identifier: drive.huum
sw_kind: container
sw_parent: "[[ELM-drive]]"
sw_technology: Google Drive folder
sw_tags: [Element, Container, Folder]
sw_views: ["[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# drive.huum — Huum product folder

Container of [[ELM-drive]] (Google Drive shared folders) · tags `Folder`.

Product data folder shared with the team and synced to desktops by Google Drive for desktop; the interim product-data source until WooCommerce has an API (ADR-FS-0011).

**Technology:** Google Drive folder

## Relationships

### Incoming

- ← [[ELM-desktop]] — Reads product data from the locally synced folder (interim) *(local files)*

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
