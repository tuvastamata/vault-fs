---
id: PLAN-FS-0002
type: statement
fed_kind: plan
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/40-iterations/iteration-2-langgraph-mvp.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Iteration 2 — Codify (LangGraph MVP)"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs]]", "[[SRC-fs-system-architecture]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
sw_logStatus: proposed
sw_statusNote: "planned; entry gate: iteration-1 findings triaged, ADRs 0001–0008 accepted or parked"
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
---

# PLAN-FS-0002: Iteration 2 — Codify (LangGraph MVP)

Claude Desktop + Claude Code reconcile the vault, then build the agent from iteration-1
findings, following [[SRC-fs-system-architecture]].

## Entry (reconciliation gate)
- All iteration-1 findings triaged; conflicts in [[SRC-fs-reconciled-spec]] resolved.
- ADRs 0001-0008 accepted or explicitly parked.

## Build scope
- LangGraph orchestration of the process graph; Pydantic state; HITL interrupt before the
  human-review node.
- Deterministic nodes: classification, pricing (per [[ADR-FS-0001]]),
  follow-up timing, webhook POST.
- LLM nodes: email parsing (offers, confirmation).
- Email node: read/act on partner mail **only** via a fixed `label:transport-sales` query
  constant (not LLM-chosen). Order data comes from Bitrix24, not email — the email node never
  touches `transport-orders`. This is the deterministic form of the [[ADR-FS-0009]]
  single-inbox mitigation.
- Ranker: deterministic baseline first ([[ADR-FS-0007]]).

## Verification (required)
- Unit tests in `tests/` for every deterministic branch (classification thresholds, pricing,
  timeout logic).
- LLM-parsing **eval set** built from real iteration-1 emails.
- Acceptance: agent reproduces the human decisions logged in iteration 1 on a held-out set.

## Then
Operate the built agent; it registers findings back to `fs:vault/30-findings/README.md@89d77d2`.
