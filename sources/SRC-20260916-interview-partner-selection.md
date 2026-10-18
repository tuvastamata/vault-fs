---
id: SRC-20260916-interview-partner-selection
type: source
fed_kind: interview
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/interviews/interview-transportation-partner-selection.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/interviews/interview-transportation-partner-selection.md"
dcterms_title: "Interview record — transportation partner selection (three sessions: 2026-08-27, 2026-09-09, 2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-email-channel]]", "[[LINE-fs-data-sources]]", "[[LINE-fs-build]]"]
---

# Interview record — Transportation partner selection

> Imported verbatim from `fs-vault-sync:vault-ops/interviews/interview-transportation-partner-selection.md` (file time 2026-09-16 12:49, sha256 `c928be9e4c62a8ce…`) on 2026-10-11: raw notes and quotes of the process-discovery interview, written by the operator's Claude Desktop (skill process-discovery) in English with the operator's words verbatim in Estonian and a translation in brackets; the operator's quotes carry the anchors `^q01` …, the other blocks `^s01` …. Recorded fields: title: "Interview record — Transportation partner selection", process: Transportation partner selection, interviewee: Operator (order@factory.sale), interviewer: Claude Desktop (initiated by Factory.Sale), interview_language: Estonian, date: 2026-09-16, tags: [discovery, interview, notes]. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

Raw notes and quotes backing [[SRC-20260916-map-current-state]],
[[SRC-20260916-map-desired-state]], the the opportunities [[OPP-FS-0001]] ... [[OPP-FS-0006]], and the
[[SRC-20260916-discovery-report|discovery report]].
Conducted across three sessions: framing + live test-run (2026-08-27), real-order walkthrough
(2026-09-09), and closing topics (2026-09-16). Quoted verbatim in Estonian with an English
translation in brackets, per process-discovery (`fs-vault-sync:vault-ops/skills/process-discovery/SKILL.md`)'s
evidence rule. ^s01

## 1. Frame

- Process chosen: **Transportation partner selection**. ^s02
- Boundary confirmed: "inquiry arrives → order placed" — the operator owns the entire process end
  to end, no handoff to a colleague. ^s03
- Experience: ~2 years doing this role; volume 5–20 inquiries/week (varies). ^s04
- Systems named up front: Bitrix24 (order source), Gmail (`order@factory.sale` →
  `evaprual.factorysale@gmail.com` for order data; `sales@factory.sale` for partner
  communication, hosted on zone.ee/Radicenter), the offer-log Google Sheet, the HUUM product
  dimension spreadsheet. ^s05
- Deliberate design decision surfaced here: keep order-data and transport-partner-communication
  channels on two separate addresses. Logged as
  [[FIND-FS-0002]] and the connection guide
  `fs-vault-sync:vault-ops/operating/connecting-sales-email.md` / draft ADR
  [[ADR-FS-0009]]. ^s06

## 2. Classification rule (2026-08-27)

> "lisatud failis on loetletud tooted ja üksinda iga toode on standartne, aga kui komplektina on
> vaja transportida mitu tooteid korraga ja kui nende summaarsed mõõdud ja kaalud ületavad
> L=1200mm, W=800mm, H=1000mm, m=200kg, siis see on ebastandartne transport."
> ["The attached file lists the products and individually each product is standard, but if
> several products need to be transported together as a set and their summed dimensions/weight
> exceed L=1200mm, W=800mm, H=1000mm, 200kg, then it's non-standard transport."] ^q01

Uploaded `data/huum-toodete-kaalud-moodud.xlsx` as the authoritative dimension/weight source.
Documented in [[SRC-20260827-ops-classification-rule]]. Real evidence from Deal #7131 later showed a
**single** large item (CLIFF/STEEL heater, 1030–1040mm tall) is in practice also checked against
the threshold — contradicting the "single item always standard" wording. See
[[FIND-FS-0011]] and open item #5 in
[[SRC-20260916-ops-open-setup-items]]. ^s07

## 3. Live test-run (2026-08-27)

Simulated with real order #249481 and three colleagues role-playing transport partners
(`kristo@factory.sale`, `myynti@factory.sale`, `alvin@factory.sale`), under strict rules: draft
every email for approval, never send unapproved, never trigger the real "proceed to order"
webhook, log anything confusing as a finding, allowed to ask in Estonian. ^s08

Findings from the run: ^s09
- Order #249481 turned out to already be standard-sized (confirmed with the operator) — a useful
  negative case, not a non-standard example. See
  [[FIND-FS-0005]] and
  [[FIND-FS-0003]]. ^s10
- Order-notification emails don't carry width/height/length/weight — only product
  name/qty/price/customer info. See
  [[FIND-FS-0009]]. ^s11
- All order-notification emails share the identical subject "Uus Factory.Sale päring" — a thread
  collision risk. See [[FIND-FS-0004]]. ^s12
- Gmail draft/send tools have no "from" field — sender identity can't be chosen
  programmatically. Two of three test drafts nonetheless went out as
  `From: sales@factory.sale`, suggesting it may already be a verified send-as alias on the
  connected account. See [[FIND-FS-0008]]
  and [[FIND-FS-0007]]. ^s13
- The three test replies weren't comparable (different pricing basis, missing dates, one
  obviously-joke price of 1,000,000 EUR). See
  [[FIND-FS-0006]] — this run was left unfinished
  (open items #6–7) once the real Deal #7131 walkthrough gave a cleaner, real comparison. ^s14
- Classification thresholds weren't in any existing doc before this interview supplied them —
  [[FIND-FS-0010]]. ^s15

## 4. Real order walkthrough — Deal #7131 (2026-09-09)

Reconstructed from the actual Gmail/Bitrix24 history rather than the operator's recollection, per
the operator's instruction to check the mailbox directly. Confirmed non-standard due to
CLIFF/STEEL heater height. Two partners contacted: ACE (semi-automated request tool, via
`askforoffer@ace.ee` / Raktio Oy) and Delamode (manually written email). ^s16

Outcome: ^s17
> "Valik: ACE (593,68 €) oli veidi odavam kui Delamode (600,00 €) — klapib sellega, et valisid
> ACE. Kui ACE oleks pakkunud hinnaks nt. 650€ oleksime siiski ACE'i valinud kuna hinnavahe on nii
> väike, aga kvaliteet on ACE'il parem."
> ["The choice: ACE (€593.68) was slightly cheaper than Delamode (€600.00) — consistent with
> choosing ACE. If ACE had quoted e.g. €650 we would still have chosen ACE because the price gap
> is so small, but ACE's quality is better."] ^q02

This was the single most important discovery of the interview: partner selection is **not**
"cheapest wins," it's "prefer the trusted/quality partner unless a competitor is >10% cheaper." See
[[FIND-FS-0014]] (flagged high severity)
and [[SRC-20260909-ops-offer-selection-rule]]. ^s18

Follow-up on the ACE-vs-Delamode mechanics: ^s19
> "automaatne on tüütu ja aeganõudev kuna ma pean ise seda käsitsi täitma."
> ["The automated one [ACE] is tedious and time-consuming because I have to fill it in manually
> myself."] ^q03

This reversed my initial (wrong) read that the ACE path was the "less manual" one — the tedium is
the *upstream* manual data entry needed to trigger ACE's system, not the Delamode email. Corrected
in [[FIND-FS-0013]] (see its Correction
section) and captured as [[OPP-FS-0004]] / open item #14. ^s20

Quality criteria, asked directly: ^s21
> "vähem kahjustusi, parem suhtlus, täpsemad tarneajad need kindlasti."
> ["Fewer damages, better communication, more accurate delivery times — those for sure."] ^q04

Price-gap threshold, asked directly: **10%**. ^s22

Also confirmed: no other friction on this specific order beyond the ACE data-entry point already
logged. ^s23

Separately, re: Gerava (a different partner contacted the same period): ^s24
> "saatsin päringu läbi Bitrixi, gmailis see hetkel veel ei kajastu, töötame selle niel, et see
> ühendus teha."
> ["I sent the request through Bitrix, it doesn't show up in Gmail yet, we're working on
> connecting that."] ^q05

Confirms Bitrix24 can send partner outreach directly, bypassing Gmail entirely — currently
invisible to anything working from the mailbox. See
[[FIND-FS-0012]] and open item #10. ^s25

## 5. Remaining interview topics (2026-09-16)

**Handoffs:** ^s26
> "töö tuleb Bitrixisse, saadan transpordipäringu logistikapartneritele e-maili teel. Ootan ära
> transpordipartenrite vastused, koostan pakkumise, saadan kliendile ja jään ootama kliendi
> vastust."
> ["The job comes into Bitrix, I send the transport request to logistics partners by email. I
> wait for the transport partners' replies, put together an offer, send it to the customer, and
> wait for the customer's reply."] ^q06

This is the first time the customer price-confirmation step appeared explicitly — see §6 below and
[[OPP-FS-0006]]. ^s27

**Volume / variation drivers:** non-standard classification (dimension/weight thresholds),
destination country and customer type (private vs business — drives partner eligibility, e.g.
Delamode). ^s28

**Exceptions (not part of the main flow, surface at delivery):** ^s29
- "auto ei pääse objektile" ["the truck can't get to the site"] — road/access conditions. See
  [[OPP-FS-0001]]. ^s30
- "klient on unustanud [...]" ["the customer has forgotten [...]"] — customer forgets they must
  organize unloading themselves. See
  [[OPP-FS-0002]]. ^s31
- "uusarenduste puhul ei leita aadressi" ["for new developments, the address can't be found"]. See
  [[OPP-FS-0003]]. ^s32

**Desired state / delegation boundary:** ^s33
> "100% tööülesannetest delegeeriks sulle" ["I'd delegate 100% of the tasks to you"], immediately
> qualified: "agendile annaksin üle kõik peale lõpliku otsuse tegemise" ["I'd hand everything over
> to the agent except making the final decision"]. ^q07

Clarified on request that this does **not** relax [[SRC-20260916-ops-approval-gate]] — email-sending approval
stays in force regardless of what else is automated. Resolved as open item #13.
**Corrected in §9 below** — approval is a graduated control, not permanent. ^s34

## 6. Customer-confirmation step (clarified 2026-09-16)

Asked to clarify the exact ordering and who sends what: ^s35
> "Ootan alati kliendi 'jah' ära, enne ei kinnita midagi. Kliendile saadan pakkumise alati ise."
> ["I always wait for the customer's 'yes' first, I don't confirm anything before that. I always
> send the offer to the customer myself."] ^q08

Confirmed: customer confirmation always happens **before** partner confirmation, never the
reverse, and the operator always personally drafts/sends the customer-facing offer (not currently
something delegated). Added to [[SRC-20260916-ops-operating-checklist]] as step 8 (partner-confirm
and proceed-to-order renumbered to 9/10). Closes
[[OPP-FS-0006]] and open item #12. ^s36

## 7. Partner eligibility (clarified 2026-09-16)

> "otsustan tegelikult iga kord juhtumipõhiselt (nt sõltuvalt sihtriigist või veoliigist, mitte
> fikseeritud partneri-loend); Delamode'i kasutame eraisiku vedude puhul UK, Põhja-Iirimaa, Norra
> suundadel, seda sel põhjusel, et Delamode deklareerib eraisikute vedusid kolmandates riikides."
> ["I actually decide case-by-case each time (e.g. depending on destination country or shipment
> type, not a fixed partner list); we use Delamode for private-individual shipments to the UK,
> Northern Ireland, Norway, for the reason that Delamode declares private individuals' shipments
> in third countries."] ^q09

No fixed "trusted partner" list exists — eligibility is a case-by-case rule, with Delamode's
UK/NI/Norway/private-individual case as the one concrete, named example. Documented as Step 0 in
[[SRC-20260909-ops-offer-selection-rule]]; closes open item #11. ^s37

## 8. Trust criteria for automation (2026-09-16)

First attempt at this question was too abstract and the operator asked for clarification twice
("palun täpsusta, mida soovid" / "täpsusta palun"). Re-asked concretely and got: ^s38

> "1. 20 õnnestunud katset ja vajalik logi. 2. Ei."
> ["1. 20 successful trial runs and a required log. 2. No [no other friction elsewhere]."] ^q10

Answer 1 is the bar for trusting an automated step to run without per-instance checking: **20
successful trial runs plus a mandatory, reviewable log**. Documented in
[[SRC-20260916-ops-agent-trust-criteria]]. Answer 2 closes the "any other friction?" question — no
further friction points beyond [[OPP-FS-0004]] were
identified; the time/friction section of the interview is closed. ^s39

## 9. Correction — the 20-run bar also lifts send-approval (2026-09-16)

Immediately after closing the interview, in response to being asked directly whether the agent
should ever draft the customer-facing price email, the operator volunteered a correction to §5's
delegation-boundary answer: ^s40

> "Peale 20 edukat päringut võib agent ise kõiki kirju välja saata."
> ["After 20 successful requests, the agent can send all emails itself."] ^q11

This reverses what had been recorded as a closed, unconditional point (§5: "email-sending
approval stays in place regardless of what else gets automated"). Asked to disambiguate whether
the 20 count is per step/email-type or process-wide, the operator confirmed: **process-wide** — 20
successful full inquiry-to-order cycles, not 20 instances of one isolated step. So
[[SRC-20260916-ops-approval-gate]] is a graduated control: mandatory per-send approval until that
20-cycle bar is met, agent-autonomous sending after. See
[[SRC-20260916-ops-agent-trust-criteria]] (Correction section) and
[[FIND-FS-0015]]. ^s41

Asked next how the 20 cycles would actually be counted or certified: ^s42

> "Me anname ise teada, kui 20 tsüklit on edukalt läbitud."
> ["We will let you know ourselves once 20 cycles have been successfully completed."] ^q12

So graduation is triggered by an explicit operator go-ahead, not an automated counter or a
self-reported threshold the agent detects on its own. This closes the last open detail on item ^s43
#13 in [[SRC-20260916-ops-open-setup-items]] — what remains open is only whether a running log of
cycles is kept anywhere for the operator to judge against. ^s44

## Interview coverage check
All `references/interview-guide.md` topics were covered: happy path, inputs/outputs/systems per
step, decision points and rules, handoffs, exceptions, time/friction, desired state, and trust
conditions for automation. No topics remain open as interview questions; remaining items are
build/decision follow-ups tracked in [[SRC-20260916-ops-open-setup-items]]. ^s45
