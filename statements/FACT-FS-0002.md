---
id: FACT-FS-0002
type: statement
fed_kind: fact
fed_modality: opinion
fed_status: proposed
pav_authoredBy: claude-agent
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_authoredOn: 2026-10-11
dcterms_title: "State of the shared folder on 2026-10-11: the operator's discovery round of three sessions (2026-08-27, 2026-09-09, 2026-09-16) in vault-ops, nothing of it in the repository"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-fs-vault-sync]]", "[[SRC-20260916-discovery-report]]", "[[SRC-20260916-interview-partner-selection]]"]
prov_wasDerivedFrom: ["[[FIND-FS-0013]]", "[[FIND-FS-0012]]", "[[FIND-FS-0006]]", "[[FIND-FS-0007]]", "[[FACT-FS-0001]]"]
dcterms_subject: ["[[ELM-drive.sync]]", "[[ELM-desktop.vault]]", "[[ELM-iteration1.developerMachine.snapshot]]", "[[ELM-operator]]", "[[ELM-aceTool]]", "[[ELM-mail.gmail]]"]
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]", "[[LINE-fs-outreach-and-offers]]", "[[LINE-fs-email-channel]]"]
sw_logStatus: open
sw_statusNote: "measured on the snapshot pulled 2026-10-11; corrects the Drive row of FACT-FS-0001"
sw_covers: ["fs:instances/vault-ops/**"]
sw_repos: [fs]
---

# FACT-FS-0002: State of the shared folder on 2026-10-11: the operator's discovery round of three sessions (2026-08-27, 2026-09-09, 2026-09-16) in vault-ops, nothing of it in the repository

**Fact:** After the developer's pull of 2026-08-27 13:37 the operator's instance on the shared folder was worked in three sessions and holds the whole process-discovery round; the repository and the clone have none of it.

| date | measurement | value |
|---|---|---|
| 2026-10-11 | files on the shared folder vs the snapshot of 2026-08-27 (`rclone lsl andrei:`, recursive) | 73 vs 33; 40 added or changed, all under `vault-ops/` ([[SRC-fs-vault-sync]]) |
| 2026-08-27 14:38 … 15:46 | session 1: live test run on order #249481 with three colleagues as stand-in partners | 9 findings, the HUUM sheet, the ADR draft's update, the guide's note, `test-run.md` |
| 2026-09-09 11:13 … 12:04 | session 2: walkthrough of the real Deal #7131, reconstructed from the mailbox | 3 findings, 1 updated, `classification-rule.md`, OPP-0001 … OPP-0005 |
| 2026-09-16 12:21 … 12:49 | session 3: closing topics of the interview | 1 finding, OPP-0006, the offer-selection rule, the trust criteria, the gate's graduation section, checklist step 8, 15 open setup items, two maps, the interview, the report |
| 2026-09-16 | the operator (interview) | about 2 years in the role; 5–20 inquiries a week; the whole process alone, 0 internal handoffs ([[SRC-20260916-discovery-report]]) |
| 2026-09-09 | Deal #7131 (ICON 125 sauna, 200 × 120 × 130 cm, 700 kg, EE → PT): partner turnaround | ACE: request from the tool 09:03Z, reply 09:34Z, 593.68 € + VAT, 6–8 business days; Delamode: hand-written mail from sales@ 09:02Z, reply 10:31Z, 600.00 € excl. VAT, delivery till 30.09; Gerava: asked from Bitrix24, no trail ([[FIND-FS-0013]], [[FIND-FS-0012]]) |
| 2026-08-27 | test run: the three stand-in offers | 1 000 000 EUR + VAT; 250 € per pallet + 21 % fuel surcharge; 350 € flat — not comparable; the run paused at the comparison ([[FIND-FS-0006]]) |
| 2026-08-27 | sender identity of the three test mails | 2 as `sales@factory.sale` ("Eva Prual / Factory.Sale"), 1 as the Gmail address; the connector has no from parameter ([[FIND-FS-0007]]) |
| 2026-08-27 | order #249481: the notification's content | product name, quantity, price, customer and delivery details; no dimensions; subject "Uus Factory.Sale päring" ([[FIND-FS-0009]], [[FIND-FS-0004]]) |
| 2026-08-27 | HUUM sheet | 159 product rows; 10 over 1000 mm tall on their own; 104 without a shipping hint ([[SRC-20260827-huum-product-sheet]]) |
| 2026-10-11 | repository | `origin/main` still `89d77d2`; the 11 uncommitted files of the clone unchanged ([[FACT-FS-0001]]) |
| 2026-10-11 | `vault-sh/` (stakeholders' instance) | the seed of 2026-08-27 only: no interview, no capture |
| 2026-10-11 | `findings-inbox/` at the root, the offer-log Sheet | empty; header row only, as on 2026-08-11 |

**Tempo:** the operator's side — three sessions in three weeks, the last three days after the transfer memo of 2026-09-13; the developer's side — silent since 2026-08-27; the shared folder untouched since 2026-10-02 (Obsidian state only).

**Check:**
- `rclone lsl andrei: | awk '{ts=$2" "substr($3,1,8); if (ts >= "2026-08-27 13:37:00") print ts, $4}' | sort`
- `find ~/factory.sale/fs-vault-sync -type f -newermt "2026-08-27 13:37" -not -path "*/.obsidian/*" | wc -l`
- `git -C ~/factory.sale/fs fetch && git -C ~/factory.sale/fs status -sb && git -C ~/factory.sale/fs log -1 --format='%h %ci'`
