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

factory.sale staff member who runs the partner-selection process day to day, alone and end to end: about two years in the role, 5-20 inquiries a week (interview of 2026-09-16). Looks dimensions up in the HUUM sheet, re-keys ACE requests, filters partners by destination and customer type, chooses by the 10 % rule, sends the customer price offer personally and approves every outbound email until 20 successful cycles are done (ADR-FS-0013 ... ADR-FS-0016).

## Relationships

### Outgoing

- → [[ELM-aceTool]] — Re-keys the shipment data to trigger ACE's price request *(web form (to confirm))*
- → [[ELM-bitrix24]] — Transfers the inquiry from email; reads order and product data *(browser)*
- → [[ELM-customer]] — Sends the customer price offer personally; waits for the yes *(email)*
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
