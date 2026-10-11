---
id: ELM-mail
type: element
dcterms_identifier: mail
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-containers]]", "[[VIEW-fs-iteration-1-tooling]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# mail — Email channels

Software system · tags `External`.

The mailboxes of the process: order intake and the transport-partner channel, merged into one Gmail inbox for iteration 1 (ADR-FS-0009).

## Contains

- [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com (container)
- [[ELM-mail.order]] — order@factory.sale (container)
- [[ELM-mail.sales]] — sales@factory.sale (container)

## Relationships

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-partner]] — Inquiry, follow-up, confirmation request *(email)* · from [[ELM-mail.sales]] → [[ELM-partner]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)

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
