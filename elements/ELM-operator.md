---
id: ELM-operator
type: element
dcterms_identifier: operator
sw_kind: person
sw_tags: [Element, Person]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-containers]]", "[[VIEW-fs-email-channels]]", "[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# operator — Transportation operator

Person.

factory.sale staff member who runs the partner-selection process day to day and approves every outbound partner email - the approval gate.

## Relationships

### Outgoing

- → [[ELM-bitrix24]] — Transfers the inquiry from email; reads order and product data *(browser)*
- → [[ELM-desktop]] — Runs the process by hand with the agent; approves every outbound email *(Claude Desktop)*
- → [[ELM-drive.offerLog]] — Logs every offer and which one was chosen *(Google Sheets)*
- → [[ELM-fs.dashboard]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)*
- → [[ELM-mail.gmail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Logs every offer and which one was chosen *(Google Sheets)* · from [[ELM-operator]] → [[ELM-drive.offerLog]]
- → [[ELM-fs]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)* · from [[ELM-operator]] → [[ELM-fs.dashboard]]
- → [[ELM-mail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)* · from [[ELM-operator]] → [[ELM-mail.gmail]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
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
