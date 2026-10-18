---
id: ELM-aceTool
type: element
dcterms_identifier: aceTool
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# aceTool — ACE price-request tool (Raktio Oy)

Software system · tags `External`.

Semi-automated price request of the partner ACE Logistics: the operator re-keys the shipment data (weight, volume, dimensions, tail-lift flags, planned date) into it, the request goes out as a system message from askforoffer@ace.ee, and ACE's priced reply returns to the mailbox within the hour (Deal #7131: 31 minutes). The tedious step of the process for the operator. How it accepts input - web form or a Bitrix24 button - is open (setup item 14, OPP-FS-0004).

## Properties

- evidence: `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md; fs-vault-sync:vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md`

## Relationships

### Outgoing

- → [[ELM-partner]] — Structured price request from askforoffer@ace.ee *(email)*

### Incoming

- ← [[ELM-operator]] — Re-keys the shipment data to trigger ACE's price request *(web form (to confirm))*

## Views

- [[VIEW-fs-landscape]] — System Landscape View

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
