---
id: SRC-fs-stakeholder-questions
type: source
fed_kind: doc
pav_importedFrom: "fs:vault/40-iterations/iteration-1-stakeholder-questions.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/40-iterations/iteration-1-stakeholder-questions.md@89d77d2"
dcterms_title: "Stakeholder question sheet — before iteration 2 (v1)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-06
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-email-channel]]"]
---

# Transportation Agent — Questions before we build (v1)

> Imported verbatim from `fs:vault/40-iterations/iteration-1-stakeholder-questions.md@89d77d2` on 2026-10-11 (first committed 2026-08-06): the question sheet to be answered by operations and the technical team; unanswered on 2026-10-11. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

A few decisions block the coded build. Short answers are fine; each maps to a design choice.
Please fill the **Answer** lines. Owner tag in brackets.

---

## For Operations

**Q1 — Standard-pallet partner selection.** `[ops]`
For a *standard* pallet we compute a price automatically, but it's unspecified *which* carrier
handles it. Is there a fixed carrier / contracted rate for standard pallets, or should the
human pick the carrier at the review dashboard?
Answer:

**Q2 — Follow-up limit.** `[ops]`
We already agreed: wait 2 days for an offer (12–18h fast-track), 2 days for confirmation.
How many automated follow-up emails should a partner get before we mark them **"No Bid"** and
move on?
Answer:

**Q3 — Pricing formula confirmation.** `[ops]`
Standard-pallet price = `fuel_cost_index × transport_list_price × number_of_pallets`.
Is `transport_list_price` a **per-pallet** rate (so we multiply by pallet count), or is it
already a **per-shipment** figure (so we don't)?
Answer:

**Q4 — Partner directory.** `[ops]`
We need a partner list with, per partner: contact email, fleet weight/dimension min & max,
and serviced country routes (to target who we email). Does this list exist today, and where
(spreadsheet, Bitrix24, elsewhere)?
Answer:

---

## For Technical team

**Q5 — `fuel_cost_index` source.** `[tech]`
Where does `fuel_cost_index` live — internal DB, external API, a spreadsheet? How often does it
change, and is that change regular (e.g. weekly) or occasional?
Answer:

**Q6 — Email infrastructure.** `[tech]`
For sending outreach/confirmation emails and reading partner replies at `order@factory.sale`,
do you prefer a standard **IMAP/SMTP** mailbox, or an **email API** (SendGrid / Mailgun with an
inbound-parse webhook)? Any existing setup we should reuse?
Answer:

**Q7 — Historical decisions data.** `[tech]`
Do we have any record of *past* transportation decisions (the offers received + which one was
chosen)? Even a rough spreadsheet helps — it's what we'd use to train the offer-ranking model
later. If none exists, we start collecting it during iteration 1.
Answer:

---

*Each answer becomes an ADR in `20-decisions/`. Open items: ADR-0002, ADR-0004 (follow-up cap),
ADR-0006, ADR-0008; confirmations feed ADR-0001, ADR-0007, and reconciled-spec gap G5.*
