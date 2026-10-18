---
id: SRC-20260916-ops-operating-checklist
type: source
fed_kind: runbook
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/operating/operating-checklist.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/operating/operating-checklist.md"
dcterms_title: "Operating checklist — one inquiry end to end, as revised by the discovery round (step 8 customer confirmation, 2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-pricing-and-partner-selection]]"]
---

# Operating checklist — one inquiry, end to end

> Imported verbatim from `fs-vault-sync:vault-ops/operating/operating-checklist.md` (file time 2026-09-16 12:21, sha256 `d4d5716e6d0405ec…`) on 2026-10-11: ten steps where the repository's seed (`fs:instances/vault-ops/operating/operating-checklist.md@89d77d2`) has nine; the notes of 2026-08-27 and 2026-09-16 inline. Recorded fields: title: Operating checklist, tags: [ops, checklist]. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

During **iteration 1** you (with Claude Desktop assisting) run this by hand against the real
`order@factory.sale` inbox and Bitrix24. Follow the [[SRC-fs-process-flow]]. ^k01

1. **New inquiry** arrives at `order@factory.sale` → ensure it's in Bitrix24. ^k02
2. **Read product data** from Bitrix24: width, height, length, weight, quantity. Note (2026-08-27):
   the order-notification email itself only has product name/qty/price/customer info, not
   dimensions — look up the product name in `data/huum-toodete-kaalud-moodud.xlsx` for
   width/depth/height/weight (see [[SRC-20260827-ops-classification-rule]]). ^k03
3. **Classify**: standard pallet or not? See [[SRC-20260827-ops-classification-rule]] for the actual
   rule and thresholds (added 2026-08-27) — a single product is always standard; a shipment of
   multiple products together is non-standard if their summed L/W/H/weight exceed
   1200×800×1000mm / 200kg. ^k04
   - **Standard** → compute the fast-track price, then go to step 7 (human review). ^k05
   - **Non-standard** → continue. ^k06
4. **Draft outreach** to suitable partners — see [[SRC-20260909-ops-offer-selection-rule]] (added
   2026-09-16) for the eligibility filter (e.g. Delamode specifically for private-individual
   shipments to UK/Northern Ireland/Norway) before picking who to ask. Do **not** send yet — see
   [[SRC-20260916-ops-approval-gate]]. Outreach is meant to go out as `sales@factory.sale` — see
   `fs-vault-sync:vault-ops/operating/connecting-sales-email.md` for current connection status. ^k07
5. **Send** (after your approval) and **monitor** for replies (label `transport-sales`). Follow up
   per `fs-vault-sync:vault-ops/operating/timeouts.md`. ^k08
6. **Record offers**: for each partner reply, log price, dates, locations in `fs-vault-sync:vault-ops/operating/offer-log.md`.
   Apply the customer markup (×1.3). Ask partners for a like-for-like quote (same currency/basis,
   total for the whole shipment, delivery dates) — see
   [[FIND-FS-0006]] for what happens when they aren't. ^k09
7. **Review & choose**: compare eligible offers — see [[SRC-20260909-ops-offer-selection-rule]] for
   the actual rule: prefer the trusted/higher-quality partner unless a competitor is >10% cheaper,
   then fall back to delivery time. In the log record **which offer you'd choose** — this is the
   training signal (finalized once the customer accepts, see step 8). ^k10
8. **Get the customer's confirmation first** (added 2026-09-16). Compile the customer-facing price
   (transport cost × 1.3) and send it to the customer yourself — this is not currently delegated.
   **Wait for the customer's explicit "yes" before doing anything else below.** See
   [[OPP-FS-0006]]. ^k11
9. **Confirm** with the selected partner (after your approval) — only after step 8's customer
   confirmation, never before. If the partner drops/doesn't confirm in time, move to the next
   best. ^k12
10. **Proceed to order** once confirmed. ^k13

At every step: if something doesn't fit this checklist, **file a finding**
(`fs-vault-sync:vault-ops/operating/findings-inbox/_how-to-file-a-finding.md`). ^k14

## Zero-offer fallback
If no partner offers in time and the shipment goes to the UK or has unusual dimensions, handle
it manually. Otherwise keep following up within the limits in `fs-vault-sync:vault-ops/operating/timeouts.md`. ^k15
