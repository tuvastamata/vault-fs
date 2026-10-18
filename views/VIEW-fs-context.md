---
id: VIEW-fs-context
type: view
dcterms_identifier: fs-context
sw_kind: systemContext
sw_scope: "[[ELM-fs]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-context — System Context View: FS Transportation Selection Agent

systemContext view of [[ELM-fs]] (FS Transportation Selection Agent) · automatic layout LeftRight.

The planned agent service in its context

## Elements (9)

- [[ELM-bitrix24]] — Bitrix24 (software system)
- [[ELM-customer]] — Customer (person)
- [[ELM-developer]] — Developer (person)
- [[ELM-fs]] — FS Transportation Selection Agent (software system)
- [[ELM-langsmith]] — LangSmith (software system)
- [[ELM-llm]] — LLM API (software system)
- [[ELM-mail]] — Email channels (software system)
- [[ELM-operator]] — Transportation operator (person)
- [[ELM-orderWebhook]] — Order webhook consumer (software system)

## Relationships (12)

- [[ELM-bitrix24]] → [[ELM-fs]] — Order inquiry webhook *(HTTPS, POST /v1/webhooks/bitrix24)*
- [[ELM-developer]] → [[ELM-fs]] — Builds in iteration 2 from the vault's spec and findings *(Claude Code)*
- [[ELM-fs]] → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)*
- [[ELM-fs]] → [[ELM-customer]] — Price offer; waits for the customer's yes *(email)*
- [[ELM-fs]] → [[ELM-langsmith]] — Traces per thread, prompt logging *(HTTPS)*
- [[ELM-fs]] → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)*
- [[ELM-fs]] → [[ELM-mail]] — Sends as sales@; reads partner replies *(IMAP 993 / SMTP 465)*
- [[ELM-fs]] → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)*
- [[ELM-operator]] → [[ELM-bitrix24]] — Transfers the inquiry from email; reads order and product data *(browser)*
- [[ELM-operator]] → [[ELM-customer]] — Sends the customer price offer personally; waits for the yes *(email)*
- [[ELM-operator]] → [[ELM-fs]] — Reviews the recommended offer; approves or rejects; sets fast-track *(browser)*
- [[ELM-operator]] → [[ELM-mail]] — Reads order inquiries (transport-orders) and partner mail (transport-sales) *(Gmail web)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
