---
id: VIEW-fs-deployment-iteration-2
type: view
dcterms_identifier: fs-deployment-iteration-2
sw_kind: deployment
sw_environment: Iteration 2 - target
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-deployment-iteration-2 — Deployment View: Iteration 2 - target

deployment view · environment **Iteration 2 - target** · automatic layout LeftRight.

Where the service would run; the agent host is not decided

## Elements (25)

- [[ELM-iteration2.agentHost]] — Agent host (deployment node)
  - [[ELM-fs.api]] — API gateway
  - [[ELM-fs.cache]] — Cache
  - [[ELM-fs.dashboard]] — Review dashboard
  - [[ELM-fs.db]] — Database
  - [[ELM-fs.engine]] — Orchestration engine
  - [[ELM-fs.mailAdapter]] — Mail adapter
- [[ELM-iteration2.bitrixCloud]] — Bitrix24 cloud (deployment node)
  - [[ELM-bitrix24]] — Bitrix24
- [[ELM-iteration2.google]] — Google (deployment node)
  - [[ELM-drive]] — Google Drive shared folders
  - [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com
- [[ELM-iteration2.langsmithCloud]] — LangSmith (deployment node)
  - [[ELM-langsmith]] — LangSmith
- [[ELM-iteration2.llmProvider]] — LLM provider (deployment node)
  - [[ELM-llm]] — LLM API
- [[ELM-iteration2.operatorMachine]] — Operator machine (deployment node)
  - [[ELM-desktop.vault]] — Instance vault
- [[ELM-iteration2.orderSystem]] — Order system (deployment node)
  - [[ELM-orderWebhook]] — Order webhook consumer
- [[ELM-iteration2.radicenter]] — Radicenter mail hosting (deployment node)
  - [[ELM-mail.order]] — order@factory.sale
  - [[ELM-mail.sales]] — sales@factory.sale
- [[ELM-iteration2.wordpress]] — WordPress hosting (deployment node)
  - [[ELM-woocommerce]] — WooCommerce shop

## Relationships (17)

- [[ELM-bitrix24]] → [[ELM-fs.api]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
- [[ELM-desktop.vault]] → [[ELM-drive]] — Mirrored to and from the shared folder *(Google Drive for desktop)*
- [[ELM-fs.api]] → [[ELM-fs.cache]] — Throttling, session tokens *(Redis protocol)*
- [[ELM-fs.api]] → [[ELM-fs.engine]] — Triggers or resumes the graph thread *(in-process)*
- [[ELM-fs.dashboard]] → [[ELM-fs.api]] — Lists pending reviews; submits approve or reject *(REST)*
- [[ELM-fs.engine]] → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)*
- [[ELM-fs.engine]] → [[ELM-fs.db]] — Checkpoints the state; stores offers, comparison lists and audits *(SQL)*
- [[ELM-fs.engine]] → [[ELM-fs.db]] — Flushes the state at the interrupt (PostgresSaver) *(SQL)*
- [[ELM-fs.engine]] → [[ELM-fs.mailAdapter]] — Sends inquiries, follow-ups and confirmation requests *(in-process)*
- [[ELM-fs.engine]] → [[ELM-langsmith]] — Traces per thread, prompt logging *(HTTPS)*
- [[ELM-fs.engine]] → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)*
- [[ELM-fs.engine]] → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)*
- [[ELM-fs.mailAdapter]] → [[ELM-fs.engine]] — Delivers partner replies *(in-process)*
- [[ELM-fs.mailAdapter]] → [[ELM-mail.sales]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- [[ELM-mail.gmail]] → [[ELM-mail.sales]] — Sends as sales@factory.sale (send-as alias) *(SMTP 465)*
- [[ELM-mail.order]] → [[ELM-mail.gmail]] — Redirected *(mail forwarding)*
- [[ELM-mail.sales]] → [[ELM-mail.gmail]] — Forwarded with copy, labelled transport-sales (iteration 1) *(mail forwarding)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
