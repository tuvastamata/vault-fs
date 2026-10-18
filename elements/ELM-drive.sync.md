---
id: ELM-drive.sync
type: element
dcterms_identifier: drive.sync
sw_kind: container
sw_parent: "[[ELM-drive]]"
sw_technology: Google Drive folder
sw_tags: [Element, Container, Folder, Iteration1]
sw_views: ["[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# drive.sync — fs-vault-sync

Container of [[ELM-drive]] (Google Drive shared folders) · tags `Folder`, `Iteration1`.

Hub of the hub-and-spoke documentation flow: the operator and stakeholder instances (vault-ops, vault-sh) pushed by Google Drive for desktop, a findings-inbox for quick drops, the offer log. The developer pulls it as an rclone snapshot. Since the discovery round of 2026-08-27 ... 2026-09-16 vault-ops also holds the product dimension sheet data/huum-toodete-kaalud-moodud.xlsx (SRC-20260827-huum-product-sheet), the reference rules, the discovery maps, the interview, the report, six opportunities and the open setup items.

**Technology:** Google Drive folder

## Relationships

### Incoming

- ← [[ELM-desktop.driveConnector]] — Reads and writes captures and the offer log *(Drive API)*
- ← [[ELM-desktop.vault]] — Mirrored to and from the shared folder *(Google Drive for desktop)*
- ← [[ELM-developer]] — Pulls captures as an rclone snapshot; pushes back reference notes *(rclone)*

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
