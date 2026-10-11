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

Gmail inbox of the operator: order@ is redirected here; for iteration 1 sales@ is forwarded here too (forward-with-copy), sales@ is a send-as alias, and the two streams are separated by the labels transport-sales and transport-orders.

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
