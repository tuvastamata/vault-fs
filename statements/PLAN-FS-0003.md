---
id: PLAN-FS-0003
type: statement
fed_kind: plan
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/40-iterations/iteration-3-harden.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Iteration 3 — Harden"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs]]", "[[ELM-langsmith]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
sw_logStatus: proposed
sw_statusNote: planned
sw_covers: ["fs:fstransport/**"]
sw_repos: [fs]
---

# PLAN-FS-0003: Iteration 3 — Harden

Claude Desktop + Claude Code enhance the agent and work through the accumulated findings.

## Scope
- Resolve open findings from iteration-2 operation.
- Promote the Decision-Tree ranker over the deterministic baseline once it beats it on a
  held-out set ([[ADR-FS-0007]]).
- Next-phase items parked earlier: skip-reason outreach, historical pricing without outreach,
  special-request negotiation.
- Observability (LangSmith), security hardening (OAuth2/mTLS) per [[SRC-fs-system-architecture]].

## Verification
- Regression suite green; new findings each have a fixture or an ADR.
