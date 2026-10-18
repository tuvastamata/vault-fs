---
id: ELM-mail.sales
type: element
dcterms_identifier: mail.sales
sw_kind: container
sw_parent: "[[ELM-mail]]"
sw_technology: Radicenter mailbox (DirectAdmin)
sw_tags: [Element, Container, Mailbox]
sw_views: ["[[VIEW-fs-email-channels]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# mail.sales — sales@factory.sale

Container of [[ELM-mail]] (Email channels) · tags `Mailbox`.

Dedicated transport channel: outreach, follow-ups and confirmation requests are sent from it, offers and confirmations arrive to it. Domain registered at zone.ee, mailbox hosted at Radicenter: IMAP 993 and SMTP 465, no API; the host name is to be confirmed in the Radicenter panel. Delamode's request of Deal #7131 went out from it by hand, through the Gmail alias (FIND-FS-0013).

**Technology:** Radicenter mailbox (DirectAdmin)

## Relationships

### Outgoing

- → [[ELM-mail.gmail]] — Forwarded with copy, labelled transport-sales (iteration 1) *(mail forwarding)*
- → [[ELM-partner]] — Inquiry, follow-up, confirmation request *(email)*

### Incoming

- ← [[ELM-fs.mailAdapter]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- ← [[ELM-mail.gmail]] — Sends as sales@factory.sale (send-as alias) *(SMTP 465)*
- ← [[ELM-partner]] — Offer, confirmation reply *(email)*

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.radicenter]] (Radicenter mail hosting)
- **Iteration 2 - target** — [[ELM-iteration2.radicenter]] (Radicenter mail hosting)

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
