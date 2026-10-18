---
id: ELM-mail.gmail
type: element
dcterms_identifier: mail.gmail
sw_kind: container
sw_parent: "[[ELM-mail]]"
sw_technology: Gmail
sw_tags: [Element, Container, Mailbox, Iteration1]
sw_views: ["[[VIEW-fs-email-channels]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# mail.gmail — evaprual.factorysale@gmail.com

Container of [[ELM-mail]] (Email channels) · tags `Mailbox`, `Iteration1`.

Gmail inbox of the operator and the account connected to Claude Desktop: order@ is redirected here; sales@factory.sale is a working send-as alias on it (two of three test mails of 2026-08-27 went out as 'Eva Prual / Factory.Sale <sales@factory.sale>', FIND-FS-0007), whether sales@ mail also arrives here is unconfirmed (open setup item 1); the planned separation of the two streams is by the labels transport-sales and transport-orders (ADR-FS-0009). Order notifications share one subject, so unrelated inquiries thread together (FIND-FS-0004).

**Technology:** Gmail

## Relationships

### Outgoing

- → [[ELM-mail.sales]] — Sends as sales@factory.sale (send-as alias) *(SMTP 465)*

### Incoming

- ← [[ELM-desktop.gmailConnector]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*
- ← [[ELM-mail.order]] — Redirected *(mail forwarding)*
- ← [[ELM-mail.sales]] — Forwarded with copy, labelled transport-sales (iteration 1) *(mail forwarding)*
- ← [[ELM-operator]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.google]] (Google)
- **Iteration 2 - target** — [[ELM-iteration2.google]] (Google)

## Views

- [[VIEW-fs-email-channels]] — Container View: Email channels
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
