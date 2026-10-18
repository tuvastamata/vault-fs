---
id: FIND-FS-0015
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-16
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-16-approval-gate-graduates-after-20-runs.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Approval-gate is a graduated control, not a permanent one"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.hitl]]", "[[ELM-desktop.gmailConnector]]", "[[ADR-FS-0016]]", "[[SRC-20260916-ops-approval-gate]]", "[[SRC-20260916-ops-agent-trust-criteria]]", "[[SRC-fs-srs#^FR-5-01]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: resolved
sw_statusNote: "resolved 2026-09-16: the gate lifts after 20 successful full cycles on the operator's explicit word (ADR-FS-0016); open: whether a running log of cycles is kept meanwhile"
sw_severity: high
sw_covers: ["fs:instances/vault-ops/operating/approval-gate.md", "fs:vault/10-spec/SRS.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/correction]
---

# FIND-FS-0015: Approval-gate is a graduated control, not a permanent one

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-16-approval-gate-graduates-after-20-runs.md` (file time 2026-09-16 12:49, sha256 `fb671d65d541804a…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-09-16, type: correction, severity: high, tags: [finding, discovery]. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
During process-discovery closing questions, the operator was recorded (item #13 in
[[SRC-20260916-ops-open-setup-items]]) as confirming that email-sending approval stays in place regardless of
what else gets automated. Later the same day, when asked whether the agent should ever draft the
customer-facing price email, the operator volunteered, unprompted:

> "Peale 20 edukat päringut võib agent ise kõiki kirju välja saata."
> ["After 20 successful requests, the agent can send all emails itself."]

Asked to disambiguate scope, the operator confirmed this is counted **per the whole process**
(20 full inquiry-to-order cycles end to end), not per individual step or email type.

## What I expected
That [[SRC-20260916-ops-approval-gate]]'s send-approval requirement was an unconditional, permanent control,
as the operator had stated earlier the same day and as I had documented in
[[SRC-20260916-ops-agent-trust-criteria]] and closed out as item #13.

## What I did about it
Treated this as a correction rather than silently overwriting the earlier record:
- Struck through and corrected item #13 in [[SRC-20260916-ops-open-setup-items]].
- Added a "Correction (2026-09-16)" section to [[SRC-20260916-ops-agent-trust-criteria]].
- Added a "Graduation criterion" section to [[SRC-20260916-ops-approval-gate]] itself (the live operating rule
  operators follow day to day), so the daily-use doc reflects the eventual autonomy path, while
  keeping the current mandatory-approval rule intact and unambiguous until the 20-cycle bar is
  met.
- Updated [[SRC-20260916-map-desired-state]] and the
  [[SRC-20260916-discovery-report|discovery report]]
  to show the graduated state rather than a permanent approval gate.

## Resolution (2026-09-16)
Asked how the 20 cycles would actually be counted/certified — operator answered:

> "Me anname ise teada, kui 20 tsüklit on edukalt läbitud."
> ["We will let you know ourselves once 20 cycles have been successfully completed."]

So the graduation trigger is an explicit operator go-ahead, not an automated counter or
self-reported threshold the agent detects on its own. Updated [[SRC-20260916-ops-approval-gate]],
[[SRC-20260916-ops-agent-trust-criteria]], [[SRC-20260916-ops-open-setup-items]] item #13, and
[[SRC-20260916-map-desired-state]] to state this plainly. Still open: whether a running log of
completed cycles is kept anywhere in the meantime for the operator to judge against when that
conversation happens — the log itself remains required per
[[SRC-20260916-ops-agent-trust-criteria]], it's just not the trigger.
