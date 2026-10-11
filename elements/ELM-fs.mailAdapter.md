---
id: ELM-fs.mailAdapter
type: element
dcterms_identifier: fs.mailAdapter
sw_kind: container
sw_parent: "[[ELM-fs]]"
sw_technology: "IMAP/SMTP, or SendGrid/Mailgun webhook"
sw_tags: [Element, Container, Planned]
sw_views: ["[[VIEW-fs-containers]]", "[[VIEW-fs-engine-components]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.mailAdapter — Mail adapter

Container of [[ELM-fs]] (FS Transportation Selection Agent) · tags `Planned`.

Sends outreach and reads partner replies on the transport channel only: an IMAP/SMTP adapter against the Radicenter mailbox (the leaning of ADR-FS-0008) or an email-API inbound-parse webhook; order mail is never read.

**Technology:** IMAP/SMTP, or SendGrid/Mailgun webhook

## Relationships

### Outgoing

- → [[ELM-fs.engine.parseEmail]] — Delivers partner replies *(in-process)*
- → [[ELM-mail.sales]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*

### Incoming

- ← [[ELM-fs.engine.outreach]] — Sends inquiries, follow-ups and confirmation requests *(in-process)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-fs.engine]] — Delivers partner replies *(in-process)* · from [[ELM-fs.mailAdapter]] → [[ELM-fs.engine.parseEmail]]
- → [[ELM-mail]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)* · from [[ELM-fs.mailAdapter]] → [[ELM-mail.sales]]

## Deployed

- **Iteration 2 - target** — [[ELM-iteration2.agentHost]] (Agent host)

## Views

- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine
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
