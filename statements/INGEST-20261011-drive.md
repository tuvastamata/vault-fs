---
id: INGEST-20261011-drive
type: statement
fed_kind: report
fed_modality: opinion
fed_status: proposed
pav_authoredBy: claude-agent
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_authoredOn: 2026-10-11
dcterms_title: "Ingest report: the shared Drive folder swept on 2026-10-11 — the operator's discovery round into the model and the records"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-fs-vault-sync]]", "[[SRC-20260916-interview-partner-selection]]", "[[SRC-20260916-discovery-report]]"]
dcterms_subject: ["[[FACT-FS-0002]]", "[[DC-FS-0003]]", "[[CON-intake]]"]
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]"]
---

# Ingest report: the shared Drive folder swept on 2026-10-11 — the operator's discovery round into the model and the records

The owner asked for the sweep after the finding that the shared folder was not dormant ([[FACT-FS-0001]], Update of 2026-10-11). The snapshot was pulled with `rclone copy` after a backup (`.rclone-backups/fs-vault-sync-before-andrei-pull-20261011T180949`); 40 files of `vault-ops/` were new or changed since 2026-08-27 ([[FACT-FS-0002]]).

## What was done

- **Model first:** 19 edits of `structurizr/workspace.dsl` — the shop's order notification (customer → WooCommerce → order@), Bitrix24's own outreach path to partners, the new external system [[ELM-aceTool]], the new component [[ELM-fs.engine.customerConfirm]], the operator's relationship to the customer, and the descriptions of the operator, the partners, the mailboxes, the connector, the instance vault, the classifier, the ranker and the review interrupt; 64 elements, 9 views, pages rebuilt, no drift.
- **Sources (13):** the folder passport [[SRC-fs-vault-sync]]; ten documents of the round verbatim with block anchors — [[SRC-20260916-interview-partner-selection]] (the operator's quotes `^q01` … `^q12`), [[SRC-20260916-discovery-report]], [[SRC-20260916-map-current-state]], [[SRC-20260916-map-desired-state]], [[SRC-20260827-ops-classification-rule]], [[SRC-20260909-ops-offer-selection-rule]], [[SRC-20260916-ops-agent-trust-criteria]], [[SRC-20260916-ops-approval-gate]], [[SRC-20260916-ops-operating-checklist]], [[SRC-20260916-ops-open-setup-items]] (`^item-1` … `^item-15`); the HUUM sheet passport [[SRC-20260827-huum-product-sheet]] (159 products, read with the standard library); the small edits to files that mirror the repository, [[SRC-20260827-ops-instance-edits]].
- **Imported records (19):** the thirteen findings-inbox captures as [[FIND-FS-0003]] … [[FIND-FS-0015]] and the six opportunities as [[OPP-FS-0001]] … [[OPP-FS-0006]] — text verbatim, links rewritten, curated subjects, statuses and notes; written by the tool `metavault/tools/fs-import/fs_import.py --drive`, re-runnable.
- **The operator's decisions (4):** [[ADR-FS-0013]] classification thresholds and the sheet lookup; [[ADR-FS-0014]] eligibility first, then the 10 % rule; [[ADR-FS-0015]] customer confirmation before partner confirmation; [[ADR-FS-0016]] trust after 20 runs, the graduated send-approval gate — each quoting the interview, authored by Eva ([[PER-eva]]).
- **Agent records (4):** [[HZ-FS-0003]] Bitrix24 outreach invisible in Gmail (high); [[HZ-FS-0004]] thread collision of order notifications (medium); [[DC-FS-0003]] the developer's curation of the round into the repository; [[FACT-FS-0002]] the state of the shared folder.
- **People:** [[PER-ace]], [[PER-delamode]], [[PER-gerava]] new; [[PER-eva]] confirmed as the operator and updated.
- **Dated updates** on [[HZ-FS-0002]], [[DC-FS-0001]], [[PLAN-FS-0001]], [[PER-eva]]; a row in `log.md`; the README's sweep rule now says how the folder is pulled; `Findings.base` has an Opportunities view.

## What needs the owner's attention

- **The operator is Eva** — the owner confirmed it on 2026-10-11; the four decisions and the attributions of the round carry her handle `eva` ([[PER-eva]]); the role node `PER-fs-operator` written before the confirmation is listed for deletion.
- **Opportunities as findings.** OPP-FS-* are findings tagged `nav/opportunity` because the profile declares only `finding` as a project kind; a kind `opportunity` of its own is a BINDING change for the owner.
- **Finding numbers.** FIND-FS-0003 … 0015 follow the order of capture; the repository will assign its FIND-0003 … when the developer curates ([[DC-FS-0003]]) — keep the same numbers, or note the mapping in `sw_statusNote`.
- **The alias question** decides the shape of the email channel: FIND-FS-0007 against [[ADR-FS-0009]] and [[DC-FS-0001]]; setup items 1–2 are the operator's to check.
- **Three versions of the connection guide** exist (repository rewrite, clone's uncommitted step 5, operator's 2026-08-11 copy with a note); which is true is the developer's call ([[DC-FS-0003]] item 3).
- **The sweep rule was wrong once:** the Drive row of FACT-FS-0001 rested on folder mtimes; the README now prescribes the recursive listing and the copy with a backup.
- **Not taken:** `vault-sh/` and every file equal to the repository's seed; the offer-log Sheet (unchanged); the Obsidian state.

## The owner's acts

1. Commit this sweep in `~/factory.sale/vault-fs` and the tool change in the metavault (`tools/fs-import/fs_import.py`).
2. Accept or correct the four decisions of the operator and the two hazards (`fed.py accept`), or leave them proposed.
3. The curation into the repository ([[DC-FS-0003]]) by the project's process — a separate piece of work, with the eleven uncommitted files decided first ([[DC-FS-0002]]).
4. Tell the operator's side nothing is lost: the round is read; the open setup items 1, 2, 5, 9, 10, 14 wait for answers on their side.
