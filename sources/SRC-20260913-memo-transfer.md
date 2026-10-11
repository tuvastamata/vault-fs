---
id: SRC-20260913-memo-transfer
type: source
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
prov_wasAttributedTo: [juri]
dcterms_audience: [liis, tuvastamata]
pav_retrievedFrom: "~/factory.sale/Transpordiagent_state_and_next_steps.docx"
dcterms_title: "Project Transfer — FactorySale Transportation Agent (memo, 2026-09-13)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-13
fed_condition: full
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-data-sources]]"]
---

# Source: transfer memo of 2026-09-13 — «Project Transfer — FactorySale Transportation Agent», from Juri to Liis and the developer

The memo with which Juri handed the project over on 2026-09-13 to the project manager Liis and to the owner as software developer: what is received, the development technique and the three iterations, the state of the project, the current thinking on data sources (WooCommerce, the Logistika folder, the Huum product folder, the email routing) and the next actions per role. The file `Transpordiagent_state_and_next_steps.docx` lies in `~/factory.sale/` beside the clone, not in git. Its section 3 asks the developer to log its points 1–3 as decisions — [[ADR-FS-0010]], [[ADR-FS-0011]], [[ADR-FS-0012]]; its section 4 is [[PLAN-FS-0004]].

**Condition `full`:** the text below is the document's, paragraph by paragraph, with block anchors `^m01` … `^m31`; headings as in the document. sha256 of the docx: `653fb6398221c1bfadc0a9655b8d9433582fef40805506516ea6df9ff15c3650`.

## Text

To: Project Manager Liis and Software Developer Andrei · From: Juri ^m01

Date: 2026-09-13 ^m02

Automates transportation-partner selection: read order/product data, classify pallets, run vendor email outreach, rank offers, route a recommendation to a human, confirm with the partner. ^m03


### What you're receiving

Repo: github.com/aviov/fs — documentation-driven; the Obsidian vault (vault/) is the single source of truth; agent code will live in fstransport/. ^m04

Start here: README.md, HANDOFF.md (how to resume on another machine/account), SETUP.md (provisioning), vault/00-index.md (map of spec, decisions, findings, playbook). ^m05

Live sync: fs-vault-sync Google Drive folder mirrors per-machine vaults (operator, stakeholder) hub-and-spoke; the developer is the only writer of the git master. ^m06


### 1 · Development technique & plan

Documentation-driven, three iterations, human-in-the-loop throughout (every outbound partner email is drafted then approved by a person — the "approval gate"). ^m07

Iteration 1 — Claude Agent. Claude Desktop operates the process by hand on the company account against real data. Goals: harvest edge-case findings, collect a labelled offer dataset (offers + human choice) for the future ranker, and resolve open decisions. ^m08

Iteration 2 — Codify. Build the agent (LangGraph orchestration per vault/10-spec/system-architecture) from the findings; deterministic branches get unit tests, email parsing gets an eval set from real iteration-1 emails. ^m09

Iteration 3 — Harden. Work through accumulated findings; promote the ML ranker over the deterministic baseline once data supports it. ^m10

Working rules: decisions are ADRs (vault/20-decisions), surprises are findings (vault/30-findings), spec conflicts resolve in vault/10-spec/reconciled-spec. Two skills support the loop: process-discovery (interview → map → opportunities, any language, English artifacts) and vault-curation (human-reviewed pull of machine captures into master — never auto-commits). Accounts: develop on a builder account against the secret-free repo; operate on the company account where connectors/credentials live. ^m11


### 2 · State of the project

Vault scaffolded; source PDFs converted to Markdown + Mermaid; reconciled spec captures 2 known conflicts (pricing n_pallets; standard-pallet partner selection). ^m12

9 ADRs. Accepted: iteration-1-on-real-data (0003), zero-offer fallback v1 (0005), email channel separation with a temporary single-inbox exception (0009). Open/blocking iteration 2: partner selection (0002), follow-up cap (0004), fuel_cost_index source (0006), email infra (0008), ranker cold-start (0007, proposed). ^m13

Findings FIND-0001 (offer log is a Google Sheet) and FIND-0002 (transport channel is sales@factory.sale) curated from the first discovery session. ^m14

Operator and stakeholder instance vaults deployed to fs-vault-sync; email single-inbox setup + daily-use guides written; a bilingual (EE/EN) test-run guide is ready. ^m15

Not yet done: iteration 1 has not been operated (no real partner traffic yet); no agent code (fstransport/ is empty); the stakeholder question sheet is unanswered. Real partner traffic can be also exercised after test runs successful. ^m16


### 3 · Data sources & integration direction (current thinking)

WooCommerce review with stakeholders (to schedule). Stakeholders will define what product data and what generic logistics-rule data goes into WooCommerce. ^m17

Interim access until a WooCommerce API exists: the agent reads WooCommerce via the Chrome browser through the WordPress admin page, and uses product data from the Huum product folder (shared, synced locally via Google Drive desktop). ^m18

Rules & operational data currently come from the Logistika folder. Plan: developer + agent iteratively form a data model, store it in a structured datastore (interim), and later build a parser that refreshes the datastore on each Logistika update. That datastore is expected to eventually live in WooCommerce tables. ^m19

Email routing: finish mailbox labels + send-as so outbound routes from Eva's Gmail as sales@factory.sale (see setup-transport-email): forward-with-copy, verify the sent From header, route send-as via Radicenter SMTP, check SPF/DMARC, and set "reply from same address". ^m20


### 4 · Next logical actions


### Project Manager

Get stakeholder answers to vault/40-iterations/iteration-1-stakeholder-questions.md — the 4 open ADRs (0002, 0004, 0006, 0008) block iteration 2. ^m21

Schedule the WooCommerce review workshop to define product + logistics-rule data. ^m22

Coordinate the iteration-1 test run (2–3 colleagues as stand-in partners) and the real operating start; own timing of the ADR-0009 two-mailbox "sunset". ^m23

Track the iteration-1 → iteration-2 gate (findings triaged, ADRs accepted, data model drafted). ^m24


### Software Developer

Finish email setup and verify it (From header, SMTP route, SPF/DMARC, labels). ^m25

Support the iteration-1 dry run; curate captures into master via the vault-curation skill. ^m26

Start the data model from the Logistika folder; stand up an interim structured datastore; design the Chrome/WordPress-admin + Huum-folder access path; plan WooCommerce-as-datastore and the future parser. ^m27

Prepare the iteration-2 LangGraph build once the open ADRs, data model, and enough labelled offer data exist. Log points 1–3 above as ADRs so they're authoritative, not just in this memo. ^m28


### Stakeholders

Answer the question sheet; confirm fuel_cost_index source, the partner directory (location + fields), the follow-up cap, and standard-pallet partner selection. ^m29

Define the WooCommerce data (product + logistics rules) and keep Logistika current. ^m30

Perform test run and reply realistically as "partners". ^m31
