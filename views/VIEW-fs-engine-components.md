---
id: VIEW-fs-engine-components
type: view
dcterms_identifier: fs-engine-components
sw_kind: component
sw_scope: "[[ELM-fs.engine]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-engine-components — Component View: FS Transportation Selection Agent - Orchestration engine

component view of [[ELM-fs.engine]] (Orchestration engine) · automatic layout LeftRight.

The LangGraph nodes of the process and their external calls

## Elements (13)

- [[ELM-bitrix24]] — Bitrix24 (software system)
- [[ELM-fs.db]] — Database (container)
- [[ELM-fs.engine.classify]] — Pallet classifier (component)
- [[ELM-fs.engine.hitl]] — Human review interrupt (component)
- [[ELM-fs.engine.outreach]] — Outreach and follow-up (component)
- [[ELM-fs.engine.parseEmail]] — Email parser (component)
- [[ELM-fs.engine.pricing]] — Fast-track pricing (component)
- [[ELM-fs.engine.proceed]] — Proceed to order (component)
- [[ELM-fs.engine.ranker]] — Offer ranker (component)
- [[ELM-fs.engine.readOrder]] — Read Bitrix24 data (component)
- [[ELM-fs.mailAdapter]] — Mail adapter (container)
- [[ELM-llm]] — LLM API (software system)
- [[ELM-orderWebhook]] — Order webhook consumer (software system)

## Relationships (6)

- [[ELM-fs.engine.hitl]] → [[ELM-fs.db]] — Flushes the state at the interrupt (PostgresSaver) *(SQL)*
- [[ELM-fs.engine.outreach]] → [[ELM-fs.mailAdapter]] — Sends inquiries, follow-ups and confirmation requests *(in-process)*
- [[ELM-fs.engine.parseEmail]] → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)*
- [[ELM-fs.engine.proceed]] → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)*
- [[ELM-fs.engine.readOrder]] → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)*
- [[ELM-fs.mailAdapter]] → [[ELM-fs.engine.parseEmail]] — Delivers partner replies *(in-process)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
