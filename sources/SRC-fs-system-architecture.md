---
id: SRC-fs-system-architecture
type: source
fed_kind: spec
pav_importedFrom: "fs:vault/10-spec/system-architecture.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/10-spec/system-architecture.md@89d77d2"
dcterms_title: "System Architecture — Transportation Agent (iteration-2 reference)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-07-16
fed_condition: full
dcterms_isFormatOf: "[[SRC-fs-source-docs#^architecture-pdf]]"
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]"]
---

# System Architecture — Transportation Agent

> Imported verbatim from `fs:vault/10-spec/system-architecture.md@89d77d2` on 2026-10-11 (first committed 2026-07-16): converted in the repository from the PDF `System Architecture Transportation Agent.pdf`. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

> Reference architecture for the **iteration-2 build**. Iteration 1 (Wizard-of-Oz) does
> **not** stand this stack up — it validates process logic and content against the real
> inbox/Bitrix24 by hand. See [[PLAN-FS-0001]].

Separates a **Stateless API Gateway**, a **Stateful Orchestration Engine (LangGraph)**, and
an **Observability Layer (LangSmith)**.

## Architectural decisions embedded in the design

1. **Database split**
   - **PostgreSQL** — long-term business logic, transactional audit logs, transportation offer lists.
   - **Redis** — transient cache (API throttling / session tokens). The LangGraph `PostgresSaver` is the persistent state checkpointer for workflow recovery.
2. **Observability — LangSmith.** Track prompt performance, token usage, and capture unstructured parsing failures via LLM playground debugging (justified by LLM email parsing).
3. **HITL middleware.** LangGraph native state interrupts + a stateful DB checkpointer, exposed to the custom Dashboard UI via secured REST endpoints.

## Component specification

### 1. API endpoints (FastAPI + Swagger)

- `POST /v1/webhooks/bitrix24` — entrypoint when a Bitrix24 order inquiry arrives.
- `POST /v1/webhooks/email/incoming` — receives raw parsed email payloads (SendGrid/Mailgun) with partner offers. Scope to the transportation channel only (iteration-1: `label:transport-sales` on the shared inbox; see [[ADR-FS-0009]]). Order data enters via the Bitrix24 webhook, never the email node.
- `GET /v1/tasks/pending-review` — active graph states halted at the HITL checkpoint, for the Dashboard UI.
- `POST /v1/tasks/{task_id}/approve` — submits a human decision (`confirm: true/false`), clears the constraint and resumes the thread.

### 2. LangGraph state management & HITL

- **State definition:** Pydantic schema passed along the sequence — e.g. `is_standard_pallet: bool`, `offers_list: list[dict]`, `current_retry_count: int`.
- **HITL interrupt:** `.compile(checkpointer=memory, interrupt_before=["human_review_node"])`. LangGraph freezes execution before the human node and flushes its frame buffer to PostgreSQL. No secondary middleware needed.

### 3. Recommended models

- **LLM (parsing & structuring):** `gpt-4o-mini` or `claude-3-5-haiku` — cost-efficient, fast, support structured outputs (`response_format={"type":"json_object"}`) / Pydantic validation for email variables.
- **ML (transportation selection):** serialized scikit-learn `DecisionTreeClassifier` or XGBoost, containerized as a local dependency, runs deterministically in a tool node (<5 ms, no network).

### 4. Security & access control

- **OAuth2** at FastAPI entrypoints via `fastapi.security.OAuth2PasswordBearer`.
- System-to-system comms use signed mTLS tokens or secure API keys for future autonomous-agent callers.

### 5. LangSmith observability

- Each runtime iteration of the LangGraph state gets a discrete `thread_id`. On an extraction failure (e.g. a freight surcharge variable), LangSmith maps the specific node run so developers can view the prompt, trace variables, and adjust parsing without system restarts.

## Notes for the build

- Model choice above predates this repo; confirm current model availability at build time rather than hard-coding `claude-3-5-haiku` / `gpt-4o-mini`. Record the choice as an ADR.
- The ranker (§3) needs training data — see [[ADR-FS-0007]]; iteration 1 is the data-collection phase.
