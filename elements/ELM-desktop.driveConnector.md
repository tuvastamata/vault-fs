---
id: ELM-desktop.driveConnector
type: element
dcterms_identifier: desktop.driveConnector
sw_kind: container
sw_parent: "[[ELM-desktop]]"
sw_technology: Anthropic connector
sw_tags: [Element, Container, Iteration1]
sw_views: ["[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# desktop.driveConnector — Google Drive connector

Container of [[ELM-desktop]] (Claude Desktop (company account)) · tags `Iteration1`.

Reads and writes the shared folders through the Drive API; optional, used for the offer log and quick findings.

**Technology:** Anthropic connector

## Relationships

### Outgoing

- → [[ELM-drive.sync]] — Reads and writes captures and the offer log *(Drive API)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Reads and writes captures and the offer log *(Drive API)* · from [[ELM-desktop.driveConnector]] → [[ELM-drive.sync]]

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.operatorMachine.claudeApp]] (Claude Desktop)
- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.stakeholderMachine.claudeApp]] (Claude Desktop)

## Views

- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)
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
