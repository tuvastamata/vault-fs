---
id: ELM-desktop
type: element
dcterms_identifier: desktop
sw_kind: softwareSystem
sw_tags: [Element, Software System, Iteration1]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-email-channels]]", "[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# desktop — Claude Desktop (company account)

Software system · tags `Iteration1`.

Iteration-1 operator tooling: Claude Desktop on the company account, where the connectors and credentials live, operating the process by hand with the operator's approval before every outbound email.

## Contains

- [[ELM-desktop.chrome]] — Chrome (Claude in Chrome) (container)
- [[ELM-desktop.driveConnector]] — Google Drive connector (container)
- [[ELM-desktop.gmailConnector]] — Gmail connector (container)
- [[ELM-desktop.vault]] — Instance vault (container)

## Relationships

### Outgoing

- → [[ELM-drive.huum]] — Reads product data from the locally synced folder (interim) *(local files)*

### Incoming

- ← [[ELM-operator]] — Runs the process by hand with the agent; approves every outbound email *(Claude Desktop)*
- ← [[ELM-stakeholder]] — Discovery interviews and planning (vault-sh, process-discovery skill) *(Claude Desktop)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Reads and writes captures and the offer log *(Drive API)* · from [[ELM-desktop.driveConnector]] → [[ELM-drive.sync]]
- → [[ELM-drive.sync]] — Reads and writes captures and the offer log *(Drive API)* · from [[ELM-desktop.driveConnector]] → [[ELM-drive.sync]]
- → [[ELM-mail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)* · from [[ELM-desktop.gmailConnector]] → [[ELM-mail.gmail]]
- → [[ELM-mail.gmail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)* · from [[ELM-desktop.gmailConnector]] → [[ELM-mail.gmail]]
- → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)* · from [[ELM-desktop.chrome]] → [[ELM-woocommerce]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-email-channels]] — Container View: Email channels
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
