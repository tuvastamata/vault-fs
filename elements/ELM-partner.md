---
id: ELM-partner
type: element
dcterms_identifier: partner
sw_kind: person
sw_tags: [Element, Person, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-email-channels]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# partner — Transport partner

Person · tags `External`.

Carrier that receives inquiries and follow-ups and replies with offers and confirmations by email. Named so far: ACE Logistics (its own request tool, replies within the hour), Delamode (manual email; declares customs for private customers to the UK, Northern Ireland and Norway), Gerava (reached from Bitrix24) - PER-ace, PER-delamode, PER-gerava.

## Relationships

### Outgoing

- → [[ELM-mail.sales]] — Offer, confirmation reply *(email)*

### Incoming

- ← [[ELM-aceTool]] — Structured price request from askforoffer@ace.ee *(email)*
- ← [[ELM-bitrix24]] — Partner outreach sent directly from Bitrix24 (Gerava, Deal #7131) - invisible in Gmail *(email)*
- ← [[ELM-mail.sales]] — Inquiry, follow-up, confirmation request *(email)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-mail]] — Offer, confirmation reply *(email)* · from [[ELM-partner]] → [[ELM-mail.sales]]

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
