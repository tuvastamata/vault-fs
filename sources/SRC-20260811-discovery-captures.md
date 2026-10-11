---
id: SRC-20260811-discovery-captures
type: source
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops (rclone snapshot of 2026-08-27 of the shared Drive folder, remote andrei:)"
dcterms_title: "Captures of the first operator session (2026-08-11): findings-inbox and the ADR draft"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-11
fed_condition: full
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]", "[[LINE-fs-email-channel]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Source: the captures of the first operator session, 2026-08-11 — two findings and a draft decision in the operator's instance vault

What the operator's Claude Desktop wrote into the instance vault `vault-ops` during the first process-discovery session on 2026-08-11 (the session stalled at framing — no happy-path walkthrough, no report; HANDOFF 2026-08-27), as it lies in the shared Drive folder `fs-vault-sync`: two findings in `operating/findings-inbox/` and a draft decision in `decisions/`. The operator who spoke is not named in the captures; the writer is the Claude Desktop agent on the company account. The developer curated them on 2026-08-27 into the repository's `FIND-0001`, `FIND-0002` and `ADR-0009` ([[FIND-FS-0001]], [[FIND-FS-0002]], [[ADR-FS-0009]] here).

**Condition `full`:** the texts below are the files' bodies verbatim (their frontmatter rendered as a line), read from the rclone snapshot `~/factory.sale/fs-vault-sync` pulled on 2026-08-27 from the shared folder (remote `andrei:`); the files on the shared folder are unchanged since (Drive listing of 2026-10-10, [[FACT-FS-0001]]). Headings demoted by three levels; the first paragraph of each file carries the anchor `^cap1` … `^cap3`.

### File 1: `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-11-offer-log-is-gsheet-not-csv.md`

Recorded fields: date: 2026-08-11, type: confusing, severity: low. File time 2026-08-11 15:27; sha256 `c0e19620cecca475…`.

#### offer-log data source is a Google Sheet, not CSV

##### What happened
`operating/offer-log.md` described the live structured data as living in
`data/offer-log.csv` "on the dev side." The operator clarified during process discovery that the
actual live offer log is a **Google Sheet** (`offer-log.gsheet`, at the root of this vault) —
`data/offer-log.template.csv` is only the column template/schema, not the live data. ^cap1

##### What I expected / wanted instead
`operating/offer-log.md` to point at the real live source so the operator (and anyone reading the
vault) doesn't look for a CSV that isn't being kept up to date.

##### What I did about it
Corrected the note in this vault's `operating/offer-log.md` to reference the Google Sheet as the
live source and the CSV as template/schema only. Filing this finding so the developer updates the
master vault's equivalent note and confirms whether the future offer-ranker training pipeline
should read from the Sheet directly (e.g. via a Google Sheets connector) rather than expecting a
CSV export.

### File 2: `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-11-sales-email-channel-decision.md`

Recorded fields: date: 2026-08-11, type: extra-need, severity: medium. File time 2026-08-11 15:13; sha256 `53a87065f496d7ff…`.

#### Decision registered: keep sales@factory.sale as its own channel, needs connecting

##### What happened
During process discovery for the transportation partner-selection process, the operator
clarified the real email topology (not previously documented in `reference/process-flow`): ^cap2

- `order@factory.sale` (Bitrix24 order data) → redirected to Gmail `evaprual.factorysale@gmail.com`.
- `sales@factory.sale` is the actual channel for transportation partner outreach and offers
  (outbound inquiries sent from it, partner offers arrive to it). Domain on zone.ee, mailbox
  hosted on Radicenter.

The operator asked to keep these two channels separate (good workflow design) and to connect
`sales@factory.sale` for the process/agent tooling. A draft decision record was written:
`decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md`. A connection guide was
also drafted and delivered to the operator the same day.

##### What I expected / wanted instead
`reference/process-flow` and `operating/operating-checklist` currently just say "email" for the
outreach/offer steps — they should name `sales@factory.sale` explicitly once it's connected.

##### What I did about it
Filed the draft ADR above and produced a connection guide. Needs developer follow-up to:
1. Assign a real ADR number and fold the draft into master `20-decisions/`.
2. Confirm/complete the actual connection (see guide) so `sales@factory.sale` is usable by
   whoever/whatever runs steps 4–8 of the checklist.
3. Update `reference/process-flow` and `operating/operating-checklist` to name the channel
   explicitly.

### File 3: `fs-vault-sync:vault-ops/decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md`

Recorded fields: title: "ADR-DRAFT: Separate email channel for transportation communications", date: 2026-08-11, status: proposed, tags: [decision, adr-draft, ops, email]. File time 2026-08-11 15:13; sha256 `12ed62572c54c9fa…`.

#### ADR-DRAFT: Keep transportation-partner communications on a separate email channel from order data

##### Context
Two distinct data/communication flows exist in the transportation partner-selection process: ^cap3

- **Order data.** Inbound to `order@factory.sale`, redirected to Gmail `evaprual.factorysale@gmail.com`.
  Sourced from Bitrix24 product-order records (width, height, length, weight, quantity).
- **Transportation communications.** All outreach to transportation partners is sent **from**
  `sales@factory.sale`, and all partner offers/replies arrive **to** `sales@factory.sale`. The
  `factory.sale` domain is registered at zone.ee; the mailbox itself is hosted on Radicenter's
  mail servers (separate infrastructure from the Gmail redirect used for order data).

Stated by the operator during process discovery (2026-08-11), before the happy-path walkthrough,
while clarifying which systems are touched at each step of [[SRC-fs-process-flow]].

##### Decision
Keep the two channels **separate**, and connect `sales@factory.sale` as its own channel rather
than folding it into the order-data Gmail:

1. `order@factory.sale` → `evaprual.factorysale@gmail.com` remains the order-data channel only.
2. `sales@factory.sale` (zone.ee / Radicenter) remains the dedicated channel for transportation
   partner outreach and offers, and gets connected to the operator/agent tooling in its own
   right.

##### Rationale
Operator's stated reasoning: separating the two channels is good workflow design. It keeps
order-fulfillment data and partner-negotiation communications from mixing in one inbox, reduces
the risk of a partner offer getting missed or misfiled among order emails, and keeps the future
offer-ranker's training data (`fs-vault-sync:vault-ops/operating/offer-log.md`) sourced from a clean, single-purpose
inbox.

##### Consequences / follow-up
- `sales@factory.sale` needs a connection method — it isn't Gmail/Outlook, so the existing Gmail
  connector doesn't reach it directly. See the delivered guide "Connecting sales@factory.sale"
  (2026-08-11) for options.
- Once connected, `fs-vault-sync:vault-ops/operating/operating-checklist.md` steps 4–8 (outreach, offer logging,
  confirmation) should name `sales@factory.sale` explicitly as the system touched, rather than a
  generic "email."
- Needs folding into the master `20-decisions/` with a real ADR number by the developer — this is
  a draft/proposed record from the instance vault, not yet numbered against the master sequence
  (which is currently at ADR-0004 per `fs-vault-sync:vault-ops/operating/timeouts.md`).

##### Status
Proposed — pending developer review and folding into the master vault ADR sequence.
