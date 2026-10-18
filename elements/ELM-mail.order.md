---
id: ELM-mail.order
type: element
dcterms_identifier: mail.order
sw_kind: container
sw_parent: "[[ELM-mail]]"
sw_technology: factory.sale mail
sw_tags: [Element, Container, Mailbox]
sw_views: ["[[VIEW-fs-email-channels]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# mail.order — order@factory.sale

Container of [[ELM-mail]] (Email channels) · tags `Mailbox`.

Order-intake address of the factory.sale domain, redirected to the operator's Gmail inbox. Receives the shop's order notification 'Uus Factory.Sale päring': product name, quantity, price, customer and delivery details, no dimensions (FIND-FS-0009). Read by a human (process step 3); the agent never reads it.

**Technology:** factory.sale mail

## Relationships

### Outgoing

- → [[ELM-mail.gmail]] — Redirected *(mail forwarding)*

### Incoming

- ← [[ELM-woocommerce]] — Order notification 'Uus Factory.Sale päring' *(email)*

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
