---
id: ELM-customer
type: element
dcterms_identifier: customer
sw_kind: person
sw_tags: [Element, Person, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-email-channels]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# customer — Customer

Person · tags `External`.

Places an order with factory.sale; the inquiry arrives at order@factory.sale.

## Relationships

### Outgoing

- → [[ELM-mail.order]] — Sends an order inquiry *(email)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-mail]] — Sends an order inquiry *(email)* · from [[ELM-customer]] → [[ELM-mail.order]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-email-channels]] — Container View: Email channels

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
