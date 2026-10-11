---
id: ELM-drive
type: element
dcterms_identifier: drive
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# drive — Google Drive shared folders

Software system · tags `External`.

Shared folders of the small team: the documentation sync hub, the live offer log, the Logistika rules folder and the Huum product folder.

## Contains

- [[ELM-drive.huum]] — Huum product folder (container)
- [[ELM-drive.logistika]] — Logistika folder (container)
- [[ELM-drive.offerLog]] — Offer log (container)
- [[ELM-drive.sync]] — fs-vault-sync (container)

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.google]] (Google)
- **Iteration 2 - target** — [[ELM-iteration2.google]] (Google)

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)
- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz
- [[VIEW-fs-deployment-iteration-2]] — Deployment View: Iteration 2 - target

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
