---
id: ELM-desktop.gmailConnector
type: element
dcterms_identifier: desktop.gmailConnector
sw_kind: container
sw_parent: "[[ELM-desktop]]"
sw_technology: Anthropic connector
sw_tags: [Element, Container, Iteration1]
sw_views: ["[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# desktop.gmailConnector — Gmail connector

Container of [[ELM-desktop]] (Claude Desktop (company account)) · tags `Iteration1`.

Native connector, one Google account; searches, drafts and sends with per-action approval, which is the approval gate. It has no from parameter: mail goes out as the account's own address or as a verified alias picked by the human in the Gmail UI (FIND-FS-0007, FIND-FS-0008). The agent's scope is the label transport-sales only.

**Technology:** Anthropic connector

## Relationships

### Outgoing

- → [[ELM-mail.gmail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-mail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)* · from [[ELM-desktop.gmailConnector]] → [[ELM-mail.gmail]]

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.operatorMachine.claudeApp]] (Claude Desktop)

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
