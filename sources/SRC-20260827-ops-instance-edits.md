---
id: SRC-20260827-ops-instance-edits
type: source
fed_kind: doc
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops (rclone copy of 2026-10-11 of the shared Drive folder, remote andrei:)"
dcterms_title: "Instance edits of 2026-08-27 and 2026-09-16: the ADR draft's update, the connection guide's note, the index"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-27
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-email-channel]]", "[[LINE-fs-documentation-and-sync]]"]
---

# Source: the operator's edits of 2026-08-27 and 2026-09-16 to instance files that otherwise mirror the repository

Three files of the operator's instance vault on the shared Drive folder differ from the repository's seed only by a dated addition; the additions are kept here verbatim, the unchanged remainder is the repository's text (`fs:instances/vault-ops/...@89d77d2`). The files that equal the repository's seed byte for byte (checklist seeds, skills, templates, `vault-sh/*`) were not taken.

**Condition `full`:** the texts below are the added passages verbatim, read from the snapshot pulled on 2026-10-11; headings demoted by two levels; the first block of each edit carries the anchor `^e1` … `^e3`.

### Edit 1: `fs-vault-sync:vault-ops/decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md`

File time 2026-08-27 15:31; sha256 `56da92c8552e2bbc…`. the draft decision of 2026-08-11 ([[SRC-20260811-discovery-captures#^cap3]], curated as [[ADR-FS-0009]]) got an update section and a longer status line on 2026-08-27; the rest is unchanged.

##### Update (2026-08-27) — connection status may already be partly resolved
A live test-run sent mail to two external-looking addresses and, without any code path able to
choose a "from" address, two of three outbound test emails went out as `sales@factory.sale`
anyway — see `operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md`. This
suggests `sales@factory.sale` may already be a verified send-as alias on the same Gmail account
connected here, which would mean the two "channels" share infrastructure at the account level
even if the addresses themselves stay distinct. Not yet confirmed. If confirmed, re-open this
ADR's consequences section — the connection guide's Option B (new dedicated Gmail + forwarding)
may be unnecessary, and the "separate channel" decision may need a narrower restatement (separate
addresses, not necessarily separate accounts). ^e1

#### Status
Proposed — pending developer review and folding into the master vault ADR sequence. Also pending
confirmation of the alias question above before the connection guide is finalized.

### Edit 2: `fs-vault-sync:vault-ops/operating/connecting-sales-email.md`

File time 2026-08-27 15:31; sha256 `ea4671854333062c…`. the operator's copy is still the guide of 2026-08-11 ('Connecting sales@factory.sale', Option B: a new Gmail plus forwarding) with this note added on 2026-08-27; the repository rewrote the file on 2026-08-27 13:57 as 'Working with the transport email' (single inbox, labels) and that version never reached the shared folder ([[DC-FS-0002]]).

> **Check this first (added 2026-08-27):** a live test sent two emails that came out
> `From: sales@factory.sale` from the *already-connected* Gmail account, with no way in the
> tooling to have chosen that address deliberately. Before doing anything in Option B below, check
> Gmail Settings → Accounts and Import → "Send mail as" on the connected account. If
> `sales@factory.sale` is already listed and verified there, most of Option B is already done —
> skip to just picking it as the default send-as identity, and confirm whether it can also
> **receive** mail (i.e. is it also an alias/forward on the *incoming* side, not just outgoing).
> See `operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md`. ^e2

### Edit 3: `fs-vault-sync:vault-ops/00-index.md`

File time 2026-09-16 12:35; sha256 `555704c186cf52fa…`. the instance index gained the reference rules and the discovery section on 2026-09-16.

- [[SRC-20260827-ops-classification-rule]] — standard vs. non-standard shipment thresholds ^e3
- [[SRC-20260909-ops-offer-selection-rule]] — how a partner is actually chosen (eligibility + 10%/quality rule)
- [[SRC-20260916-ops-agent-trust-criteria]] — what it takes to trust an automated step

#### Process discovery (2026-09-16)
A full discovery interview on transportation partner selection is documented here:
- [[SRC-20260916-discovery-report|Discovery report]] — headline findings, measurements, top opportunities
- [[SRC-20260916-map-current-state]] — current-state process map
- [[SRC-20260916-map-desired-state]] — desired-state proposal
- [[SRC-20260916-interview-partner-selection]] — full interview notes and quotes
- [[OPP-FS-0001|opportunities/]] — OPP-0001 through OPP-0006
- [[SRC-20260916-ops-open-setup-items]] — what's still not done from this round

> This vault is a copy. Your findings and offer log are pushed to the shared Drive folder
> periodically; the developer folds them into the master. See instances README (`fs:instances/README.md@89d77d2`).
