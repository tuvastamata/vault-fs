---
id: SRC-20260916-discovery-report
type: source
fed_kind: report
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/discovery/reports/discovery-report-transportation-partner-selection.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/discovery/reports/discovery-report-transportation-partner-selection.md"
dcterms_title: "Discovery report — transportation partner selection (2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Discovery report — Transportation partner selection

> Imported verbatim from `fs-vault-sync:vault-ops/discovery/reports/discovery-report-transportation-partner-selection.md` (file time 2026-09-16 12:49, sha256 `874ad1c0e62d36ee…`) on 2026-10-11: the one-page summary the skill writes after the interview: headline findings, baseline measurements, opportunities, automation candidates, open questions. Recorded fields: title: "Discovery report — Transportation partner selection — 2026-09-16", process: Transportation partner selection, interviewee: Operator (order@factory.sale), interviewer: Claude Desktop (initiated by Factory.Sale), interview_language: Estonian, date: 2026-09-16, tags: [discovery, report]. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

One-page summary after a three-session interview (2026-08-27, 2026-09-09, 2026-09-16) covering a
live test-run (order #249481) and a real non-standard order walkthrough (Deal #7131). Full detail
in [[SRC-20260916-interview-partner-selection]]. ^r01

## Headline findings
- **Price is not the decision rule — trust-weighted quality is.** The operator picks the
  trusted/higher-quality partner unless a competitor is more than 10% cheaper; quality means fewer
  damages, better communication, more accurate delivery times, in that order [Deal #7131: ACE
  €593.68 chosen over Delamode €600.00, and operator confirmed ACE would still win even at €650].
  See [[FIND-FS-0014]] and
  [[SRC-20260909-ops-offer-selection-rule]]. ^r02
- **A whole confirmation step was undocumented.** The customer must say "yes" to the marked-up
  price *before* the partner is ever confirmed — never the reverse — and the operator always
  drafts/sends that customer email personally. This didn't appear in any existing process doc
  until this interview [operator, 2026-09-16: "Ootan alati kliendi 'jah' ära, enne ei kinnita
  midagi."]. See [[OPP-FS-0006]]. ^r03
- **There is no fixed trusted-partner list.** Eligibility is decided case-by-case, mainly by
  destination and customer type — e.g. Delamode only for private-individual shipments to
  UK/Northern Ireland/Norway, for customs-declaration reasons [operator, 2026-09-16]. See
  [[SRC-20260909-ops-offer-selection-rule]] Step 0. ^r04
- **Product dimensions aren't in the order data at all.** The operator manually looks up
  width/height/length/weight in a separate spreadsheet for every inquiry, and the "single item is
  always standard" rule is already contradicted in practice (a single CLIFF/STEEL heater exceeds
  the height threshold alone) [Deal #7131]. See
  [[FIND-FS-0009]],
  [[FIND-FS-0011]]. ^r05
- **The most "automated" partner channel is the most manual for the operator.** ACE's semi-automated
  request tool is described as tedious specifically because the operator must manually re-key
  shipment data to trigger it — the plain Delamode email is comparatively less friction to send
  [operator, 2026-09-09: "automaatne on tüütu ja aeganõudev kuna ma pean ise seda käsitsi
  täitma."]. See [[OPP-FS-0004]]. ^r06

## Measurements (baseline)

| Metric | Value | Source |
|--------|-------|--------|
| Volume (instances / week) | 5–20, varies by week | interviewee |
| End-to-end cycle time | not measured | — |
| Longest wait-state | ~30–90 min (partner reply turnaround, Deal #7131) | reconstructed from Gmail timestamps |
| Rework rate (% redone) | not measured | — |
| Hands-on time per instance | not measured | — |
| Number of handoffs | 0 internal (operator runs the entire process solo, end to end) | interviewee |
| Systems touched | Bitrix24, Gmail (`order@factory.sale`, `sales@factory.sale`), ACE/Raktio Oy request tool, offer-log Google Sheet, HUUM product dimension spreadsheet | interviewee, observed |
| Manual re-keying points | 2 confirmed: (1) product dimension lookup by name-matching against the spreadsheet; (2) shipment data re-entry into the ACE/Raktio Oy tool | observed (test-run + Deal #7131) |

## Biggest opportunities
1. [[OPP-FS-0005|OPP-0005]] — automate offer ranking using
   the confirmed 10%-plus-quality rule (impact: high — this is the actual decision logic, now
   fully specified). ^r07
2. [[OPP-FS-0004|OPP-0004]] — remove the manual re-entry
   step that feeds the ACE/Raktio Oy tool (the real friction point, not the Delamode email side). ^r08
3. [[OPP-FS-0003|OPP-0003]] — new-development addresses
   that can't be found (data-gap, agent-candidate). ^r09
4. [[OPP-FS-0002|OPP-0002]] — customer forgets they
   must organize unloading (handoff-gap, agent-candidate). ^r10
5. [[OPP-FS-0001|OPP-0001]] — truck can't access site
   (broken-loop, exception handling). ^r11

Also structurally important but not agent-automatable on its own:
[[OPP-FS-0006|OPP-0006]] — now resolved as a
documentation gap (see [[SRC-20260916-ops-operating-checklist]] step 8), but the underlying question
of whether that customer email could ever be agent-drafted is carried into the desired-state map
as an open design question. ^r12

## Automation candidates
- Product dimension lookup, classification against the 1200×800×1000mm/200kg threshold, and
  partner eligibility filtering: fully rule-based already (see
  [[SRC-20260827-ops-classification-rule]], [[SRC-20260909-ops-offer-selection-rule]]) — good
  candidates for an agent to run, with the operator reviewing output until the
  [[SRC-20260916-ops-agent-trust-criteria|20-runs-plus-log]] bar is met. ^r13
- Offer logging/normalization and ranking: rule is specified ([[SRC-20260909-ops-offer-selection-rule]])
  but partner replies still arrive in non-comparable formats — normalization needs solving before
  ranking can be trusted end to end. ^r14
- Outreach drafting to partners: agent can draft directly from Bitrix24/product-sheet data,
  removing the ACE manual re-entry step ([[OPP-FS-0004]]) —
  pending investigation of how the ACE/Raktio Oy tool actually accepts input. ^r15
- What stays with a human, permanently: the final offer-choice decision (operator, 2026-09-16:
  "agendile annaksin üle kõik peale lõpliku otsuse tegemise" — delegate everything except the
  final decision). ^r16
- What stays with a human, until a milestone is met: every outbound email send, partner or
  customer, under [[SRC-20260916-ops-approval-gate|approval-gate]] — **corrected 2026-09-16**: this
  is a graduated control, not permanent. After 20 successful full inquiry-to-order cycles
  end-to-end, the agent may send all emails itself without per-send approval (operator, verbatim:
  "Peale 20 edukat päringut võib agent ise kõiki kirju välja saata"). Graduation is triggered by
  the operator saying so directly ("Me anname ise teada, kui 20 tsüklit on edukalt läbitud") —
  not an automated counter — see [[SRC-20260916-ops-open-setup-items]] item #13. ^r17

## Open questions / decisions needed
- Whether `sales@factory.sale` is already a verified Gmail send-as alias, or a dedicated mailbox
  still needs setting up — blocks finalizing `fs-vault-sync:vault-ops/operating/connecting-sales-email.md` and the
  draft [[ADR-FS-0009]]. See
  [[SRC-20260916-ops-open-setup-items]] item #1. ^r18
- Whether the agent should ever draft the customer-facing price email (currently always
  personally sent by the operator) — flagged as an explicit open design question on
  [[SRC-20260916-map-desired-state]], not yet asked directly. ^r19
- How the ACE/Raktio Oy tool actually accepts input (web form vs. Bitrix24 automation) — needed
  before [[OPP-FS-0004]] can be spec'd. See
  [[SRC-20260916-ops-open-setup-items]] item #14. ^r20
- Whether/how to sync Bitrix24-direct partner outreach (e.g. the Gerava case) into the same
  visible trail as `sales@factory.sale`/Gmail — in progress per the operator. See
  [[SRC-20260916-ops-open-setup-items]] item #10. ^r21
- Formal rewording of the classification rule to cover single-item dimensions, not only summed
  multi-item totals. See [[SRC-20260916-ops-open-setup-items]] item #5. ^r22
- Full list of remaining setup/decision items: [[SRC-20260916-ops-open-setup-items]]. ^r23

## Artifacts
- Interview notes: [[SRC-20260916-interview-partner-selection]] ^r24
- Current-state map: [[SRC-20260916-map-current-state]] ^r25
- Desired-state map: [[SRC-20260916-map-desired-state]] ^r26
- Opportunities: [[OPP-FS-0001|OPP-0001]] –
  [[OPP-FS-0006|OPP-0006]] ^r27
- Reference rules: [[SRC-20260827-ops-classification-rule]], [[SRC-20260909-ops-offer-selection-rule]],
  [[SRC-20260916-ops-agent-trust-criteria]] ^r28
- Open setup items: [[SRC-20260916-ops-open-setup-items]] ^r29
