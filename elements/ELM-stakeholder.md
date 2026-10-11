---
id: ELM-stakeholder
type: element
dcterms_identifier: stakeholder
sw_kind: person
sw_tags: [Element, Person]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-shared-folders]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# stakeholder — Stakeholder

Person.

Management and the project manager: answer the question sheet, define the WooCommerce data, keep the Logistika folder current, own the iteration gates.

## Relationships

### Outgoing

- → [[ELM-desktop]] — Discovery interviews and planning (vault-sh, process-discovery skill) *(Claude Desktop)*
- → [[ELM-drive.logistika]] — Keeps rules and operational data current *(Google Drive)*
- → [[ELM-woocommerce]] — Defines the product and logistics-rule data *(workshop)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Keeps rules and operational data current *(Google Drive)* · from [[ELM-stakeholder]] → [[ELM-drive.logistika]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
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
