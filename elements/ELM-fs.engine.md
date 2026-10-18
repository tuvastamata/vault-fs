---
id: ELM-fs.engine
type: element
dcterms_identifier: fs.engine
sw_kind: container
sw_parent: "[[ELM-fs]]"
sw_technology: "Python, LangGraph"
sw_tags: [Element, Container, Planned]
sw_views: ["[[VIEW-fs-containers]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine — Orchestration engine

Container of [[ELM-fs]] (FS Transportation Selection Agent) · tags `Planned`.

Stateful LangGraph graph of the process with a Pydantic state (is_standard_pallet, offers_list, current_retry_count, fast_track) and an interrupt before the human-review node; state checkpoints in PostgreSQL (PostgresSaver).

**Technology:** Python, LangGraph

## Contains

- [[ELM-fs.engine.classify]] — Pallet classifier (component)
- [[ELM-fs.engine.customerConfirm]] — Customer price confirmation (component)
- [[ELM-fs.engine.hitl]] — Human review interrupt (component)
- [[ELM-fs.engine.outreach]] — Outreach and follow-up (component)
- [[ELM-fs.engine.parseEmail]] — Email parser (component)
- [[ELM-fs.engine.pricing]] — Fast-track pricing (component)
- [[ELM-fs.engine.proceed]] — Proceed to order (component)
- [[ELM-fs.engine.ranker]] — Offer ranker (component)
- [[ELM-fs.engine.readOrder]] — Read Bitrix24 data (component)

## Relationships

### Outgoing

- → [[ELM-fs.db]] — Checkpoints the state; stores offers, comparison lists and audits *(SQL)*
- → [[ELM-langsmith]] — Traces per thread, prompt logging *(HTTPS)*

### Incoming

- ← [[ELM-fs.api]] — Triggers or resumes the graph thread *(in-process)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-bitrix24]] — Reads order and product data *(Bitrix24 REST API)* · from [[ELM-fs.engine.readOrder]] → [[ELM-bitrix24]]
- → [[ELM-customer]] — Price offer; waits for the customer's yes *(email)* · from [[ELM-fs.engine.customerConfirm]] → [[ELM-customer]]
- → [[ELM-fs.db]] — Flushes the state at the interrupt (PostgresSaver) *(SQL)* · from [[ELM-fs.engine.hitl]] → [[ELM-fs.db]]
- → [[ELM-fs.mailAdapter]] — Sends inquiries, follow-ups and confirmation requests *(in-process)* · from [[ELM-fs.engine.outreach]] → [[ELM-fs.mailAdapter]]
- → [[ELM-llm]] — Structured extraction of offers and confirmations *(HTTPS)* · from [[ELM-fs.engine.parseEmail]] → [[ELM-llm]]
- → [[ELM-orderWebhook]] — POST on final confirmation *(HTTPS webhook)* · from [[ELM-fs.engine.proceed]] → [[ELM-orderWebhook]]

## Deployed

- **Iteration 2 - target** — [[ELM-iteration2.agentHost]] (Agent host)

## Views

- [[VIEW-fs-containers]] — Container View: FS Transportation Selection Agent
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
