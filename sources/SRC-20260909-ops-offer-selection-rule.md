---
id: SRC-20260909-ops-offer-selection-rule
type: source
fed_kind: rule
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/reference/offer-selection-rule.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/reference/offer-selection-rule.md"
dcterms_title: "Offer selection rule — eligibility first, then the trusted partner unless a competitor is more than 10 % cheaper (2026-09-09, refined 2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-09
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Choosing between partner offers

> Imported verbatim from `fs-vault-sync:vault-ops/reference/offer-selection-rule.md` (file time 2026-09-16 12:21, sha256 `c3cf909415ede678…`) on 2026-10-11: replaces the checklist's 'best price, then delivery time'. Recorded fields: title: Offer selection rule — choosing between partner quotes, tags: [ops, reference, rule], date: 2026-09-09. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

Documented from the operator during process discovery (2026-09-09, Deal #7131; refined
2026-09-16), replacing the plain "best price, then delivery time" line in
[[SRC-20260916-ops-operating-checklist]] step 7 — that line is directionally right but misses two real rules:
which partners are even eligible for a given shipment, and how trust/quality weighs against price. ^o01

## Step 0 — partner eligibility (customs/destination/customer-type filter)
There's no fixed "trusted partner" list — the operator decides case-by-case, mainly driven by
**destination country and customer type**: ^o02
- **Delamode** is used specifically for **private-individual (eraisik)** shipments to **UK,
  Northern Ireland, and Norway** — because Delamode can declare customs for private-individual
  shipments into those third countries; other partners may not be able to handle that customs
  declaration for a private customer at all. ^o03
- For other destinations/customer types, eligibility and preference are judged case-by-case
  rather than from a fixed list. ^o04

**This filter runs first** — only partners actually capable of handling the shipment's customs/
destination/customer-type requirements are asked for a quote at all; the price/quality comparison
below only applies among eligible partners. ^o05

## Step 1 — compare eligible offers: 10%-threshold + quality rule
Prefer the **trusted/higher-quality partner** unless a competitor is **more than ~10% cheaper**.
Concretely: ^o06
- Compare the trusted partner's price to the cheapest offer. ^o07
- If the cheapest offer is **≤10% cheaper**, still choose the trusted partner. ^o08
- If the cheapest offer is **>10% cheaper**, the price advantage outweighs the quality preference
  — go with the cheaper offer (falling back to delivery time as the next tiebreaker, per the
  original checklist wording). ^o09

Worked example (Deal #7131): ACE 593.68 € vs. Delamode 600.00 €. ACE was actually cheaper here, so
this case doesn't test the threshold directly — but the operator confirmed that even if ACE had
quoted 650 € (≈8% more than Delamode's 600 €, i.e. inside the 10% band), ACE would still have won
on quality. ^o10

## What "quality" means here
As stated by the operator, in order given: ^o11
1. Fewer damages. ^o12
2. Better communication. ^o13
3. More accurate delivery times (quotes that hold up). ^o14

## Resolved (2026-09-16)
"Trusted partner" is **not** a fixed per-partner reputation list — the operator judges it
case-by-case, mainly by the eligibility rule in Step 0 above (e.g. Delamode specifically for
private-individual UK/NI/Norway shipments). No standing "ACE is always preferred" list exists
beyond that kind of routing rule. This means a future ranker needs the eligibility/routing logic
as a hard filter (Step 0), not just a soft preference score. ^o15

## Why this matters
`fs-vault-sync:vault-ops/operating/offer-log.md` trains a future offer-ranker off the "chosen" column. Without both of these
rules, a ranker trained on price+delivery-time alone would (a) request quotes from partners who
can't legally/practically handle a shipment, and (b) systematically pick the cheapest offer where
the operator would not have. See
[[FIND-FS-0014]]. ^o16
