---
id: VIEW-fs-containers
type: view
dcterms_identifier: fs-containers
sw_kind: container
sw_scope: "[[ELM-fs]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-containers — Container View: FS Transportation Selection Agent

container view of [[ELM-fs]] (FS Transportation Selection Agent) · automatic layout LeftRight.

Containers of the agent service and what they talk to

## Elements (12)

- [[ELM-bitrix24]] — Bitrix24 (software system)
- [[ELM-fs.api]] — API gateway (container)
- [[ELM-fs.cache]] — Cache (container)
- [[ELM-fs.dashboard]] — Review dashboard (container)
- [[ELM-fs.db]] — Database (container)
- [[ELM-fs.engine]] — Orchestration engine (container)
- [[ELM-fs.mailAdapter]] — Mail adapter (container)
- [[ELM-langsmith]] — LangSmith (software system)
- [[ELM-llm]] — LLM API (software system)
- [[ELM-mail]] — Email channels (software system)
- [[ELM-operator]] — Transportation operator (person)
- [[ELM-orderWebhook]] — Order webhook consumer (software system)

## Relationships (16)

- [[ELM-bitrix24]] → [[ELM-fs.api]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
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
- [[ELM-fs.mailAdapter]] → [[ELM-mail]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- [[ELM-operator]] → [[ELM-bitrix24]] — Transfers the inquiry from email; reads order and product data *(browser)*
- [[ELM-operator]] → [[ELM-fs.dashboard]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)*
- [[ELM-operator]] → [[ELM-mail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
