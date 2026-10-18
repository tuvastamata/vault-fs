---
id: SRC-20260916-ops-agent-trust-criteria
type: source
fed_kind: rule
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/reference/agent-trust-criteria.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/reference/agent-trust-criteria.md"
dcterms_title: "Trust criteria for automating a process step — 20 successful full cycles and a log; the approval gate graduates (2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-build]]"]
---

# What it takes to trust an automated step

> Imported verbatim from `fs-vault-sync:vault-ops/reference/agent-trust-criteria.md` (file time 2026-09-16 12:49, sha256 `18ab3ca0e007058b…`) on 2026-10-11: with the struck-through earlier reading and the correction of the same day. Recorded fields: title: Trust criteria for automating a process step, tags: [ops, reference, rule], date: 2026-09-16. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

Documented from the operator during process discovery (2026-09-16). Applies to any step being
considered for delegation to an agent — e.g. [[OPP-FS-0004|OPP-0004]] (ACE
request auto-fill) or [[OPP-FS-0005|OPP-0005]] (offer ranking). ^t01

## The bar
- **20 successful trial runs**, before the agent is trusted to run without the operator checking
  every instance. Per the 2026-09-16 correction below, this is counted as 20 full
  inquiry-to-order cycles end to end, not 20 instances of a single isolated step. ^t02
- **A log is required** — every automated run needs a record the operator can review (what the
  step did, on what input, with what result). Not specified yet: whether this log needs to be
  reviewed proactively or is just available on demand; whether "successful" is judged by the
  operator per run or against some other criterion. Not asked further — reasonable to treat as an
  open detail to settle when a specific step is actually being automated. ^t03

## What this does not change (superseded — see Correction below)
~~[[SRC-20260916-ops-approval-gate]] stays in force regardless: no outbound email (partner or customer) goes out
without the operator's explicit approval, no matter how many successful trial runs a step has
behind it. The 20-runs-plus-log bar is about trusting the *internal* work (data lookup,
classification, ranking, drafting) — not about ever skipping the send-approval step.~~ ^t04

## Correction (2026-09-16)
The operator has since clarified this is wrong: **the 20-run bar does eventually lift the
send-approval requirement itself.** Once the agent has completed 20 successful full
inquiry-to-order cycles (the whole process end to end, not one step in isolation), it "may send
all emails itself" — operator, verbatim: "Peale 20 edukat päringut võib agent ise kõiki kirju
välja saata." ["After 20 successful requests, the agent can send all emails itself."] This
applies to the process as a whole, not per individual step/email-type — confirmed directly when
asked to disambiguate. ^t05

This means [[SRC-20260916-ops-approval-gate]] is a graduated control, not a permanent one: mandatory per-send
approval until the 20-cycle bar is met (with the log this criterion already requires), then
agent-autonomous sending. See [[SRC-20260916-ops-approval-gate]]'s own "Graduation criterion" section, and
[[SRC-20260916-ops-open-setup-items]] item #13 for the corrected status of that item. ^t06

**Trigger mechanism, clarified 2026-09-16:** the 20-cycle count is not self-detected by the agent
or read off a log automatically — the operator will tell the agent directly when the milestone is
reached ("Me anname ise teada, kui 20 tsüklit on edukalt läbitud"). The log requirement above
still stands (so there's something to point to when that conversation happens), but it is not
itself the graduation trigger. ^t07

## Other friction points
Asked directly whether there's friction elsewhere in the process besides the ACE manual
data-entry point already logged in [[OPP-FS-0004]] — operator said no. Time
and friction section of the interview can be treated as closed. ^t08
