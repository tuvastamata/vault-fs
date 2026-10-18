---
id: ELM-bitrix24
type: element
dcterms_identifier: bitrix24
sw_kind: softwareSystem
sw_tags: [Element, Software System, External]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-containers]]", "[[VIEW-fs-engine-components]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# bitrix24 — Bitrix24

Software system · tags `External`.

CRM of factory.sale: order and product records (width, height, length, weight, quantity). Order data enters the process from here, never from email. No first-party Claude connector: browser and paste in iteration 1, REST webhooks later. Can send partner outreach itself, outside Gmail (Gerava, Deal #7131, 2026-09-09); the Bitrix24-Gmail connection is being worked on (open setup item 10, HZ-FS-0003).

## Properties

- evidence: `fs:vault/10-spec/SRS.md@89d77d2 FR-1.01; fs:SETUP.md@89d77d2 Part D; fs:vault/20-decisions/ADR-0009-separate-transport-email-channel.md@89d77d2; fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md`

## Relationships

### Outgoing

- → [[ELM-fs.api]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
- → [[ELM-partner]] — Partner outreach sent directly from Bitrix24 (Gerava, Deal #7131) - invisible in Gmail *(email)*

### Incoming

- ← [[ELM-fs.engine.readOrder]] — Reads order and product data *(Bitrix24 REST API)*
- ← [[ELM-operator]] — Transfers the inquiry from email; reads order and product data *(browser)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-fs]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)* · from [[ELM-bitrix24]] → [[ELM-fs.api]]

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.bitrixCloud]] (Bitrix24 cloud)
- **Iteration 2 - target** — [[ELM-iteration2.bitrixCloud]] (Bitrix24 cloud)

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine
- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz
- [[VIEW-fs-deployment-iteration-2]] — Deployment View: Iteration 2 - target

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
