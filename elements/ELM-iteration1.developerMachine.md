---
id: ELM-iteration1.developerMachine
type: element
dcterms_identifier: iteration1.developerMachine
sw_kind: deploymentNode
sw_environment: Iteration 1 - Wizard-of-Oz
sw_technology: Ubuntu
sw_tags: [Element, Deployment Node]
sw_views: ["[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# iteration1.developerMachine — Developer machine

Deployment node · environment **Iteration 1 - Wizard-of-Oz**.

Linux desktop of the developer: no Google Drive desktop client, the shared folder is pulled as an rclone snapshot.

**Technology:** Ubuntu

## Children

- [[ELM-iteration1.developerMachine.gitMaster]] — git master (infrastructure node)
- [[ELM-iteration1.developerMachine.snapshot]] — rclone snapshot (infrastructure node)
- [[ELM-iteration1.developerMachine.vaultFs]] — vault-fs (infrastructure node)

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
