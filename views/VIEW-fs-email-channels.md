---
id: VIEW-fs-email-channels
type: view
dcterms_identifier: fs-email-channels
sw_kind: container
sw_scope: "[[ELM-mail]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-email-channels — Container View: Email channels

container view of [[ELM-mail]] (Email channels) · automatic layout LeftRight.

The two mailboxes and the iteration-1 single-inbox merge (ADR-FS-0009)

## Elements (8)

- [[ELM-desktop]] — Claude Desktop (company account) (software system)
- [[ELM-fs]] — FS Transportation Selection Agent (software system)
- [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com (container)
- [[ELM-mail.order]] — order@factory.sale (container)
- [[ELM-mail.sales]] — sales@factory.sale (container)
- [[ELM-operator]] — Transportation operator (person)
- [[ELM-partner]] — Transport partner (person)
- [[ELM-woocommerce]] — WooCommerce shop (software system)

## Relationships (12)

- [[ELM-desktop]] → [[ELM-mail.gmail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*
- [[ELM-desktop]] → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- [[ELM-fs]] → [[ELM-mail.sales]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- [[ELM-mail.gmail]] → [[ELM-mail.sales]] — Sends as sales@factory.sale (send-as alias) *(SMTP 465)*
- [[ELM-mail.order]] → [[ELM-mail.gmail]] — Redirected *(mail forwarding)*
- [[ELM-mail.sales]] → [[ELM-mail.gmail]] — Forwarded with copy, labelled transport-sales (iteration 1) *(mail forwarding)*
- [[ELM-mail.sales]] → [[ELM-partner]] — Inquiry, follow-up, confirmation request *(email)*
- [[ELM-operator]] → [[ELM-desktop]] — Runs the process by hand with the agent; approves every outbound email *(Claude Desktop)*
- [[ELM-operator]] → [[ELM-fs]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)*
- [[ELM-operator]] → [[ELM-mail.gmail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*
- [[ELM-partner]] → [[ELM-mail.sales]] — Offer, confirmation reply *(email)*
- [[ELM-woocommerce]] → [[ELM-mail.order]] — Order notification 'Uus Factory.Sale päring' *(email)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
