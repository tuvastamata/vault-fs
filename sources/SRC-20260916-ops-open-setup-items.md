---
id: SRC-20260916-ops-open-setup-items
type: source
fed_kind: doc
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/operating/open-setup-items.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/operating/open-setup-items.md"
dcterms_title: "Open setup items of the discovery round — fifteen items, three resolved (2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]", "[[LINE-fs-email-channel]]", "[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Open setup items (not yet completed)

> Imported verbatim from `fs-vault-sync:vault-ops/operating/open-setup-items.md` (file time 2026-09-16 12:49, sha256 `a45dda88afdd1ce0…`) on 2026-10-11: the running list of what the round left open; the first paragraph of item N carries the anchor `^item-N`. Recorded fields: title: "Open setup items — transportation partner-selection discovery", tags: [ops, setup, todo], date: 2026-09-16. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

Running list compiled during the 2026-08-27 to 2026-09-16 process-discovery work (live test-run,
then real Deal #7131 walkthrough). Each item links to the finding/decision/opportunity it came
from. Updated 2026-09-16. ^i01

## 1. Confirm the `sales@factory.sale` send-as status
Two of three test outreach emails went out as `From: sales@factory.sale` from the *already
connected* Gmail account, even though nothing in the tooling can choose a "from" address — see
[[FIND-FS-0007]]. **Action:** check Gmail Settings
→ Accounts and Import → "Send mail as" on the connected account (`evaprual.factorysale@gmail.com`)
to confirm whether `sales@factory.sale` is already verified there, and whether it can also
*receive* mail (not just send). Not done yet. ^item-1

## 2. Update the connection guide/ADR once (1) is confirmed
`fs-vault-sync:vault-ops/operating/connecting-sales-email.md` and
[[ADR-FS-0009]] both currently assume a new
dedicated Gmail + forwarding setup is needed (Option B). If (1) confirms the alias already exists,
these need simplifying. Not done yet — flagged inline in both files. ^item-2

## 3. Fold the draft ADR into the master vault
`decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md` is a proposed record from
this instance vault with no real ADR number. **Action (developer):** assign a number and fold into
master `20-decisions/`. Not done yet. ^item-3

## 4. Name `sales@factory.sale` explicitly in the process docs
[[SRC-fs-process-flow]] (read-only copy — edit the master) and [[SRC-20260916-ops-operating-checklist]] still
say generic "email" for the outreach/offer steps. **Action:** once (1)–(2) are settled, update the
master process-flow diagram and this checklist to name the channel explicitly. Not done yet. ^item-4

## 5. Resolve the CLIFF/STEEL height edge case
CLIFF/STEEL heaters are 1030–1040mm tall individually — already over the 1000mm non-standard
height threshold, even though the stated rule says a single item is always standard. Real data
(Deal #7131) confirms single large items are, in practice, already checked against the threshold
— see [[FIND-FS-0011]] and
[[SRC-20260827-ops-classification-rule]]. **Action:** operator/developer to formally reword the rule
to cover single-item dimensions, not just multi-item sums. Not done yet. ^item-5

## 6. Get comparable offers for the 2026-08-27 test shipment
The three test offers (Kristo, Alvin, Myynti) aren't comparable — different pricing basis, missing
dates, and one price that looks like an error/joke (1,000,000 EUR). See
[[FIND-FS-0006]]. **Action:** decide whether to follow
up with each "partner" for a standardized quote, or log the test as-is and treat the comparison
step as unfinished. Not done yet — test run is paused here (superseded in evidentiary value by the
real Deal #7131 walkthrough, which did reach a real, comparable decision). ^item-6

## 7. Decide whether/how to log the test offers in the offer log
Step 4 of the original test request ("log each offer on a separate TEST tab, don't mix with real
data") hasn't been done — blocked on item 6 above (no clean numbers to log yet). Not done yet. ^item-7

## 8. Automate/streamline the product-dimension lookup
Order emails don't carry width/height/length/weight; the operator now has to manually match the
order's product name against `data/huum-toodete-kaalud-moodud.xlsx`. See
[[FIND-FS-0009]]. **Action:** no owner yet —
worth deciding if this lookup should eventually be automated (e.g. by SKU/Art.Nr. instead of
free-text product name matching). ^item-8

## 9. Fix the Gmail thread-collision risk
All order-notification emails share the identical subject "Uus Factory.Sale päring", so unrelated
orders can land in the same Gmail thread. See
[[FIND-FS-0004]]. **Action (developer/webshop side):**
consider putting the inquiry number in the subject line. Not done yet. ^item-9

## 10. Sync Bitrix24-direct outreach into the visible mail channel
Confirmed 2026-09-09: Bitrix24 can send partner outreach directly (e.g. the Gerava request on
Deal #7131), bypassing the connected Gmail account entirely, so that request is currently
invisible to anyone/anything working from Gmail. Operator says this is being worked on. **Action:**
finish whatever connects Bitrix24's outbound partner emails into the same visible trail as
`sales@factory.sale`/Gmail — otherwise `fs-vault-sync:vault-ops/operating/offer-log.md` and any future automation will silently miss
partners contacted this way. See [[FIND-FS-0012]]. Not
done yet (in progress, per operator). ^item-10

## 11. ~~Document the "trusted partner" list~~ — RESOLVED 2026-09-16
There is no fixed trusted-partner list. Operator decides case-by-case, mainly by a
destination/customer-type eligibility rule (e.g. Delamode specifically for private-individual
shipments to UK/Northern Ireland/Norway, for customs-declaration reasons). Documented in
[[SRC-20260909-ops-offer-selection-rule]] Step 0. [[OPP-FS-0005]]
now needs to encode this as a hard eligibility filter, not a soft preference list — still open as
a build task, but the underlying rule is no longer unknown. ^item-11

## 12. ~~Document the missing customer price-confirmation step~~ — RESOLVED 2026-09-16
Confirmed: customer confirmation always happens **before** partner confirmation (never the
reverse), and the operator always drafts/sends the customer-facing offer personally. Documented as
the new step 8 in [[SRC-20260916-ops-operating-checklist]] (partner-confirm and proceed-to-order shifted to 9/10),
and resolved in [[OPP-FS-0006]]. Still open:
[[SRC-fs-process-flow]] itself (master, read-only here) needs the same update — that's a
developer action, not done yet. ^item-12

## 13. Clarify the delegation boundary for a future agent — RESOLVED 2026-09-16, CORRECTED 2026-09-16
~~Confirmed: email-sending approval ([[SRC-20260916-ops-approval-gate]]) stays in place regardless of
what else gets automated — "100% delegate except the final decision" does not include letting the
agent send partner/customer emails unreviewed.~~ ^item-13

**Correction:** the operator later clarified this was wrong. Email-sending approval is a
*graduated* control, not permanent: after **20 successful full inquiry-to-order cycles**
end-to-end, the agent may send all emails itself, partner and customer alike, without per-send
approval — operator, verbatim: "Peale 20 edukat päringut võib agent ise kõiki kirju välja saata."
The 20-cycle count is process-wide, not per step/email-type. See
[[SRC-20260916-ops-agent-trust-criteria]] (Correction, 2026-09-16) and
[[SRC-20260916-ops-approval-gate]] (Graduation criterion). ^i02

**Mechanism, clarified 2026-09-16:** no automated counting or logging system decides this —
the operator (Factory.Sale) will tell the agent directly once 20 cycles have been completed
successfully. Operator, verbatim: "Me anname ise teada, kui 20 tsüklit on edukalt läbitud." ["We
will let you know ourselves once 20 cycles have been successfully completed."] So the graduation
trigger is an explicit operator go-ahead, not a self-reported or automatically-detected count —
until the operator says so, [[SRC-20260916-ops-approval-gate]] stays in its mandatory per-send form
regardless of how many cycles have actually run. Still open: whether a log of cycles is kept
anywhere in the meantime so the operator has something to judge against (the log itself is still
required per [[SRC-20260916-ops-agent-trust-criteria]], just not the trigger for graduation). ^i03

## 14. Investigate the ACE/Raktio Oy request tool's input mechanism
[[OPP-FS-0004]]: the operator manually re-types shipment data
to trigger the ACE price request, even though the data already exists in the order/product sheet.
**Action:** find out how that tool actually accepts input (web form? Bitrix24 automation button?)
before this can be spec'd as an automation. Not done yet. ^item-14

## 15. Still open from before this discovery round
- Max follow-ups before marking a partner "No Bid" — still undecided (see `fs-vault-sync:vault-ops/operating/timeouts.md`). ^item-15
- [[SRC-fs-process-flow]] (master) needs updating for: named `sales@factory.sale` channel
  (item 4), and the customer-confirmation step in the correct order (item 12). ^i04
