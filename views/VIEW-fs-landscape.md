---
id: VIEW-fs-landscape
type: view
dcterms_identifier: fs-landscape
sw_kind: systemLandscape
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-landscape — System Landscape View

systemLandscape view · automatic layout LeftRight.

People, the systems as they are and the agent: iteration-1 tooling in light blue, the planned iteration-2 service dashed

## Elements (14)

- [[ELM-bitrix24]] — Bitrix24 (software system)
- [[ELM-customer]] — Customer (person)
- [[ELM-desktop]] — Claude Desktop (company account) (software system)
- [[ELM-developer]] — Developer (person)
- [[ELM-drive]] — Google Drive shared folders (software system)
- [[ELM-fs]] — FS Transportation Selection Agent (software system)
- [[ELM-langsmith]] — LangSmith (software system)
- [[ELM-llm]] — LLM API (software system)
- [[ELM-mail]] — Email channels (software system)
- [[ELM-operator]] — Transportation operator (person)
- [[ELM-orderWebhook]] — Order webhook consumer (software system)
- [[ELM-partner]] — Transport partner (person)
- [[ELM-stakeholder]] — Stakeholder (person)
- [[ELM-woocommerce]] — WooCommerce shop (software system)

## Relationships (22)

- [[ELM-bitrix24]] → [[ELM-fs]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
- [[ELM-customer]] → [[ELM-mail]] — Sends an order inquiry *(email)*
- [[ELM-desktop]] → [[ELM-drive]] — Reads and writes captures and the offer log *(Drive API)*
- [[ELM-desktop]] → [[ELM-mail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*
- [[ELM-desktop]] → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- [[ELM-developer]] → [[ELM-drive]] — Pulls captures as an rclone snapshot; pushes back reference notes *(rclone)*
- [[ELM-developer]] → [[ELM-fs]] — Builds in iteration 2 from the vault's spec and findings *(Claude Code)*
- [[ELM-fs]] → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)*
- [[ELM-fs]] → [[ELM-langsmith]] — Traces per thread, prompt logging *(HTTPS)*
- [[ELM-fs]] → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)*
- [[ELM-fs]] → [[ELM-mail]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- [[ELM-fs]] → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)*
- [[ELM-mail]] → [[ELM-partner]] — Inquiry, follow-up, confirmation request *(email)*
- [[ELM-operator]] → [[ELM-bitrix24]] — Transfers the inquiry from email; reads order and product data *(browser)*
- [[ELM-operator]] → [[ELM-desktop]] — Runs the process by hand with the agent; approves every outbound email *(Claude Desktop)*
- [[ELM-operator]] → [[ELM-drive]] — Logs every offer and which one was chosen *(Google Sheets)*
- [[ELM-operator]] → [[ELM-fs]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)*
- [[ELM-operator]] → [[ELM-mail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*
- [[ELM-partner]] → [[ELM-mail]] — Offer, confirmation reply *(email)*
- [[ELM-stakeholder]] → [[ELM-desktop]] — Discovery interviews and planning (vault-sh, process-discovery skill) *(Claude Desktop)*
- [[ELM-stakeholder]] → [[ELM-drive]] — Keeps rules and operational data current *(Google Drive)*
- [[ELM-stakeholder]] → [[ELM-woocommerce]] — Defines the product and logistics-rule data *(workshop)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
