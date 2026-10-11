---
id: ELM-fs
type: element
dcterms_identifier: fs
sw_kind: softwareSystem
sw_tags: [Element, Software System, Planned]
sw_views: ["[[VIEW-fs-landscape]]", "[[VIEW-fs-context]]", "[[VIEW-fs-email-channels]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs — FS Transportation Selection Agent

Software system · tags `Planned`.

The iteration-2 service: reads order data from Bitrix24, classifies pallets, prices standard pallets, runs partner outreach by email, parses offers, ranks them and routes a recommendation to a human before confirming with the partner. Repository fs, package fstransport (empty until iteration 2).

## Properties

- evidence: `fs:vault/10-spec/system-architecture.md@89d77d2`
- path: `fstransport/`
- repo: `fs`

## Contains

- [[ELM-fs.api]] — API gateway (container)
- [[ELM-fs.cache]] — Cache (container)
- [[ELM-fs.dashboard]] — Review dashboard (container)
- [[ELM-fs.db]] — Database (container)
- [[ELM-fs.engine]] — Orchestration engine (container)
- [[ELM-fs.mailAdapter]] — Mail adapter (container)

## Relationships

### Incoming

- ← [[ELM-developer]] — Builds in iteration 2 from the vault's spec and findings *(Claude Code)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)* · from [[ELM-fs.engine.readOrder]] → [[ELM-bitrix24]]
- → [[ELM-langsmith]] — Traces per thread, prompt logging *(HTTPS)* · from [[ELM-fs.engine]] → [[ELM-langsmith]]
- → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)* · from [[ELM-fs.engine.parseEmail]] → [[ELM-llm]]
- → [[ELM-mail]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)* · from [[ELM-fs.mailAdapter]] → [[ELM-mail.sales]]
- → [[ELM-mail.sales]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)* · from [[ELM-fs.mailAdapter]] → [[ELM-mail.sales]]
- → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)* · from [[ELM-fs.engine.proceed]] → [[ELM-orderWebhook]]

## Views

- [[VIEW-fs-landscape]] — System Landscape View
- [[VIEW-fs-context]] — System Context View: FS Transportation Selection Agent
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
