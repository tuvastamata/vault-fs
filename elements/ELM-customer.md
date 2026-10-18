---
id: ELM-customer
type: element
dcterms_identifier: customer
sw_kind: person
sw_tags: [Element, Person, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-containers]]", "[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# customer — Customer

Person · tags `External`.

Places an order in the factory.sale shop; the shop's order notification arrives at order@factory.sale. Says yes to the marked-up transport price before any partner is confirmed (ADR-FS-0015).

## Relationships

### Outgoing

- → [[ELM-woocommerce]] — Places an order *(web shop)*

### Incoming

- ← [[ELM-fs.engine.customerConfirm]] — Price offer; waits for the customer's yes *(email)*
- ← [[ELM-operator]] — Sends the customer price offer personally; waits for the yes *(email)*

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine

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
