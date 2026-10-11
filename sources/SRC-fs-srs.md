---
id: SRC-fs-srs
type: source
fed_kind: spec
pav_importedFrom: "fs:vault/10-spec/SRS.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/10-spec/SRS.md@89d77d2"
dcterms_title: "Software Requirements Specification (SRS) — Transportation Selection Agent"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-07-16
fed_condition: full
dcterms_isFormatOf: "[[SRC-fs-source-docs#^srs-pdf]]"
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
---

# SRS — Transportation Selection Agent

> Imported verbatim from `fs:vault/10-spec/SRS.md@89d77d2` on 2026-10-11 (first committed 2026-07-16): converted verbatim in the repository from the PDF `Software Requirements Specification (SRS) Transportation Selection Agent.pdf`; block anchors `^FR-x-yy` on the requirements, `^Q-ops-N` / `^Q-tech-N` on the stakeholder questions, `^data-*` on the data requirements. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

> Converted verbatim from the source PDF. Where this conflicts with the process steps or
> architecture, see [[SRC-fs-reconciled-spec]]. Do not edit requirement text here to "fix" a
> conflict — record the resolution as an ADR instead.

## 1. Executive Summary

**Objective:** Automate transportation partner selection, eliminate manual email outreach,
reduce manual data entry, and offer calculation and comparison logic for non-standard pallet
transportation.

**Business Value:** Reduces manual overhead, accelerates operational response times, and
standardizes vendor selection criteria.

**System Overview:** A hybrid automated workflow using deterministic business logic for
calculations and routing, statistical ML for offer ranking, and LLMs for extracting
structured data from unstructured vendor emails.

## 2. Scope

**Version 1:**

- Reading of product data via Bitrix24 API.
- Automated classification of pallet types (Standard vs. Non-Standard).
- Automated email sending, follow-up emails, and parsing of partner replies.
- ML-based ranking of transportation offers.
- Dashboard interface for Human-in-the-Loop (HITL) review and approval.
- Automated final confirmation loop with selected partners.

**Out of scope (later versions):**

- Submitting requests via partner web portals (form-filling bots).
- Direct API integrations with partner transportation systems.

## 3. Functional Requirements

### 3.1 Ingestion & classification

- **FR-1.01** — Read incoming order product data (width, height, length, weight, qty) from Bitrix24 via deterministic API calls. ^FR-1-01
- **FR-1.02** — Execute classification logic to determine "Standard Pallet" vs "Non-Standard Pallet". ^FR-1-02

### 3.2 Standard pallet workflow (Fast-Track)

- **FR-2.01** — If Standard, calculate cost as `fuel_cost_index × transport_list_price × n_transported_pallets`. ⚠️ See [[SRC-fs-reconciled-spec#^C1]] — process steps omit `n_transported_pallets`. ^FR-2-01
- **FR-2.02** — Bypass vendor outreach; route the calculated offer directly to the Human Review Dashboard (§3.5). ^FR-2-02

### 3.3 Non-Standard pallet workflow (Vendor Outreach)

- **FR-3.01** — Generate transportation inquiry emails from predefined templates and variables. ^FR-3-01
- **FR-3.02** — Filter the partner database by fleet capabilities (weight/dimension limits, active routes) to build a targeted recipient list. ^FR-3-02
- **FR-3.03** — Send emails and monitor the inbox for replies. ^FR-3-03
- **FR-3.04** — If a partner does not reply within a predefined timeframe, trigger a deterministic follow-up email sequence. ^FR-3-04

### 3.4 Data extraction & offer scoring

- **FR-4.01** — Use LLM to parse incoming partner emails and extract required variables (price, dates, locations) into a structured database format. ^FR-4-01
- **FR-4.02** — Calculate the final customer price as `price_apply = price_offer × 1.3`. ^FR-4-02
- **FR-4.03** — Compile a comparison list of all valid offers. ^FR-4-03
- **FR-4.04** — Evaluate offers with a statistical ML model (Decision Tree) against predefined criteria (price, delivery time, additional factors) and output a ranked recommendation. ^FR-4-04

### 3.5 Human-in-the-Loop (HITL) & final step

- **FR-5.01** — Post the top recommended offer to a UI Dashboard for human review. ^FR-5-01
- **FR-5.02** — If the human rejects the offer, drop it and loop back to FR-4.04 for the next best option. ^FR-5-02
- **FR-5.03** — If the human approves, email the confirmation request to the selected partner. ^FR-5-03
- **FR-5.04** — Use an LLM to parse the partner's confirmation reply; if the partner rejects/fails to confirm, loop back to the next best offer. ^FR-5-04
- **FR-5.05** — On final partner confirmation, POST to a designated webhook to proceed with the order. ^FR-5-05

## 4. Data Requirements

- **Product input data:** width, height, length, weight, quantity. ^data-product
- **Partner directory:** company name, contact person, email, fleet weight/dimension min & max, serviced country routes. ^data-partner
- **Offer state data:** thread ID, message ID, vendor email, origin, destination, base price, applied markup price, start date, end date, offer expiration timestamp. ^data-offer
- **System variables:** `fuel_cost_index`, `transport_list_price`, markup coefficient (currently fixed at `1.3`). ^data-system

## 5. Stakeholder Questions & Responses

Resolved answers are promoted to ADRs in 20-decisions (`fs:vault/20-decisions/README.md@89d77d2`). Status shown per item.

### Operations & management

1. **Initial-offer timeout before follow-up?** → *Answered:* 2 days in normal tempo; 12–18 hours for fast-track. Add a dashboard fast-track checkbox per shipment. → [[ADR-FS-0004]] ^Q-ops-1
2. **Confirmation-reply timeout before moving to next best?** → *Answered:* 2 days in normal tempo. → [[ADR-FS-0004]] ^Q-ops-2
3. **Max automated follow-ups before "No Bid"?** → ⚠️ *Open.* → [[ADR-FS-0004]] ^Q-ops-3
4. **Zero-offer fallback for non-standard shipment?** → *Answered (v1):* human requests manually if shipment goes to UK or package has specific dimensions. Next-phase ideas: ask partners why they skipped; use historical data to price without outreach. → [[ADR-FS-0005]] ^Q-ops-4
5. **Extra offer-selection criteria beyond price/delivery time?** → *Answered (v1):* best price and delivery time only. Next phase: detect special requests and negotiate with assistant. → [[ADR-FS-0002]] / ranking criteria ^Q-ops-5
6. **How is the partner selected for a standard pallet?** → ⚠️ *Open.* → [[SRC-fs-reconciled-spec#^C2]] / [[ADR-FS-0002]] ^Q-ops-6

### Technical team

1. **Where does `fuel_cost_index` live?** How is it fetched, how often does it change, regular or occasional? → ⚠️ *Open.* → [[ADR-FS-0006]] ^Q-tech-1
2. **ML training data:** Is there a clean exported dataset of historical decisions (offers + human choices), or do we start with a deterministic scoring model until data is collected? → ⚠️ *Open — drives iteration 1 goal (b).* → [[ADR-FS-0007]] ^Q-tech-2
3. **Email infrastructure:** IMAP inbox vs email API (SendGrid/Mailgun)? "Can do any of these." → ⚠️ *Open.* → [[ADR-FS-0008]] ^Q-tech-3
