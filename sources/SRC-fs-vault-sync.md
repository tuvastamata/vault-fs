---
id: SRC-fs-vault-sync
type: source
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
prov_wasAttributedTo: [eva, juri]
pav_retrievedFrom: "andrei: (rclone remote of the shared Google Drive folder fs-vault-sync) → ~/factory.sale/fs-vault-sync"
dcterms_title: "Shared Drive folder fs-vault-sync as pulled on 2026-10-11"
dcterms_language: en
dcterms_type: Collection
dcterms_date: 2026-10-11
fed_condition: full
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]"]
---

# Source: the shared Google Drive folder `fs-vault-sync` — hub of the project's hub-and-spoke documentation flow, as pulled on 2026-10-11

The shared folder of the small team ([[ELM-drive.sync]]): the operator's instance vault `vault-ops/` and the stakeholders' `vault-sh/`, mirrored to their desktops by Google Drive for desktop; a `findings-inbox/` at the root for quick drops (empty); the live offer log as a Google Sheet (`offer-log`, exported by rclone as `offer-log.xlsx`, header row only on 2026-08-11) and the CSV template. The developer has no Drive client on Linux and pulls the folder by hand as the rclone snapshot `~/factory.sale/fs-vault-sync` (remote `andrei:`, [[ELM-iteration1.developerMachine.snapshot]]).

**Condition `full`:** pulls so far — a zip export of 2026-08-18 08:41Z, an rclone pull on 2026-08-27 13:37 (backup `.rclone-backups/fs-vault-sync-before-andrei-pull-20260827T133716`), an `rclone copy` on 2026-10-11 18:09Z after the listing of the same day (backup `.rclone-backups/fs-vault-sync-before-andrei-pull-20261011T180949`). Between the two pulls the operator's side added or changed 40 files in `vault-ops/` on 2026-08-27 (afternoon), 2026-09-09 and 2026-09-16 — the process-discovery round ([[FACT-FS-0002]]); `vault-sh/` holds only the seed of 2026-08-27. A path is cited as `fs-vault-sync:path`.

## What this vault took from it on 2026-10-11

- `vault-ops/interviews/interview-transportation-partner-selection.md` → [[SRC-20260916-interview-partner-selection]]
- `vault-ops/discovery/reports/discovery-report-transportation-partner-selection.md` → [[SRC-20260916-discovery-report]]
- `vault-ops/discovery-maps/current-state.md` → [[SRC-20260916-map-current-state]]
- `vault-ops/discovery-maps/desired-state.md` → [[SRC-20260916-map-desired-state]]
- `vault-ops/reference/classification-rule.md` → [[SRC-20260827-ops-classification-rule]]
- `vault-ops/reference/offer-selection-rule.md` → [[SRC-20260909-ops-offer-selection-rule]]
- `vault-ops/reference/agent-trust-criteria.md` → [[SRC-20260916-ops-agent-trust-criteria]]
- `vault-ops/operating/approval-gate.md` → [[SRC-20260916-ops-approval-gate]]
- `vault-ops/operating/operating-checklist.md` → [[SRC-20260916-ops-operating-checklist]]
- `vault-ops/operating/open-setup-items.md` → [[SRC-20260916-ops-open-setup-items]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-test-order-likely-not-freight-case.md` → [[FIND-FS-0003]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-gmail-thread-collision.md` → [[FIND-FS-0004]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-order-249481-confirmed-standard.md` → [[FIND-FS-0005]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-offers-not-comparable.md` → [[FIND-FS-0006]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md` → [[FIND-FS-0007]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-cannot-send-as-sales-address.md` → [[FIND-FS-0008]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md` → [[FIND-FS-0009]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-classification-thresholds-not-given.md` → [[FIND-FS-0010]]
- `vault-ops/operating/findings-inbox/finding-2026-08-27-cliff-steel-height-exceeds-alone.md` → [[FIND-FS-0011]]
- `vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md` → [[FIND-FS-0012]]
- `vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md` → [[FIND-FS-0013]]
- `vault-ops/operating/findings-inbox/finding-2026-09-09-price-not-only-decision-factor.md` → [[FIND-FS-0014]]
- `vault-ops/operating/findings-inbox/finding-2026-09-16-approval-gate-graduates-after-20-runs.md` → [[FIND-FS-0015]]
- `vault-ops/opportunities/OPP-0001-site-access-failures.md` → [[OPP-FS-0001]]
- `vault-ops/opportunities/OPP-0002-customer-forgets-unloading.md` → [[OPP-FS-0002]]
- `vault-ops/opportunities/OPP-0003-new-development-addresses.md` → [[OPP-FS-0003]]
- `vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md` → [[OPP-FS-0004]]
- `vault-ops/opportunities/OPP-0005-automate-offer-ranking.md` → [[OPP-FS-0005]]
- `vault-ops/opportunities/OPP-0006-missing-customer-confirmation-step.md` → [[OPP-FS-0006]]
- `vault-ops/data/huum-toodete-kaalud-moodud.xlsx` → [[SRC-20260827-huum-product-sheet]]
- the dated additions in `vault-ops/decisions/ADR-DRAFT-…`, `vault-ops/operating/connecting-sales-email.md`, `vault-ops/00-index.md` → [[SRC-20260827-ops-instance-edits]]

Not taken: the files that equal the repository's seeds byte for byte (`vault-ops/operating/{offer-log,timeouts,test-run,setup-transport-email}.md`, `_how-to-file-a-finding.md`, the skills and templates, `vault-ops/reference/process-flow.md`, all of `vault-sh/`), the Obsidian state, the offer-log export (unchanged since 2026-08-11, [[FACT-FS-0001]]). The two captures of 2026-08-11 are [[SRC-20260811-discovery-captures]].

## Files in the snapshot on 2026-10-11

| path | file time | bytes | sha256 |
|---|---|---|---|
| `offer-log.template.csv` | 2026-08-06 16:45 | 106 | `1f16729076af` |
| `offer-log.xlsx` | 2026-08-11 14:01 | 5167 | `b9d78d897d06` |
| `vault-ops/00-index.md` | 2026-09-16 12:35 | 2367 | `555704c186cf` |
| `vault-ops/data/huum-toodete-kaalud-moodud.xlsx` | 2026-08-27 15:31 | 62315 | `ddaa289a03d6` |
| `vault-ops/data/offer-log.template.csv` | 2026-08-27 12:03 | 127 | `21e96062def3` |
| `vault-ops/decisions/ADR-DRAFT-2026-08-11-separate-transport-email-channel.md` | 2026-08-27 15:31 | 3767 | `56da92c8552e` |
| `vault-ops/discovery/reports/discovery-report-transportation-partner-selection.md` | 2026-09-16 12:49 | 8832 | `874ad1c0e62d` |
| `vault-ops/discovery-maps/current-state.md` | 2026-09-16 12:30 | 3619 | `f6eb5de24918` |
| `vault-ops/discovery-maps/desired-state.md` | 2026-09-16 12:49 | 7579 | `ccb84274db55` |
| `vault-ops/interviews/interview-transportation-partner-selection.md` | 2026-09-16 12:49 | 14331 | `c928be9e4c62` |
| `vault-ops/operating/approval-gate.md` | 2026-09-16 12:49 | 1820 | `8eddf00c4b62` |
| `vault-ops/operating/connecting-sales-email.md` | 2026-08-27 15:31 | 7191 | `ea4671854333` |
| `vault-ops/operating/findings-inbox/_how-to-file-a-finding.md` | 2026-08-06 16:08 | 914 | `ebc4a5a253a9` |
| `vault-ops/operating/findings-inbox/finding-2026-08-11-offer-log-is-gsheet-not-csv.md` | 2026-08-11 15:27 | 1097 | `c0e19620cecc` |
| `vault-ops/operating/findings-inbox/finding-2026-08-11-sales-email-channel-decision.md` | 2026-08-11 15:13 | 1656 | `53a87065f496` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-cannot-send-as-sales-address.md` | 2026-08-27 15:31 | 2179 | `c3e0047846c4` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-classification-thresholds-not-given.md` | 2026-08-27 15:31 | 1326 | `1c2a7dd38603` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-cliff-steel-height-exceeds-alone.md` | 2026-09-09 11:24 | 1875 | `c26cb08b217b` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-gmail-thread-collision.md` | 2026-08-27 14:38 | 1060 | `5321bd80520b` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-offers-not-comparable.md` | 2026-08-27 15:22 | 1489 | `1c549341cb9b` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-order-249481-confirmed-standard.md` | 2026-08-27 14:59 | 1756 | `14752a6be0eb` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md` | 2026-08-27 15:31 | 1636 | `3217e6d2313e` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-sales-alias-already-works.md` | 2026-08-27 15:22 | 1925 | `b5d333d122dc` |
| `vault-ops/operating/findings-inbox/finding-2026-08-27-test-order-likely-not-freight-case.md` | 2026-08-27 14:38 | 1230 | `0ac9fcf13940` |
| `vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md` | 2026-09-09 11:45 | 2370 | `83c5322632d5` |
| `vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md` | 2026-09-09 11:36 | 1714 | `f6f2c3184eca` |
| `vault-ops/operating/findings-inbox/finding-2026-09-09-price-not-only-decision-factor.md` | 2026-09-09 11:45 | 2258 | `3ca98b698c79` |
| `vault-ops/operating/findings-inbox/finding-2026-09-16-approval-gate-graduates-after-20-runs.md` | 2026-09-16 12:49 | 2712 | `fb671d65d541` |
| `vault-ops/operating/offer-log.md` | 2026-08-27 12:03 | 1237 | `fc5a2f032447` |
| `vault-ops/operating/open-setup-items.md` | 2026-09-16 12:49 | 8616 | `a45dda88afdd` |
| `vault-ops/operating/operating-checklist.md` | 2026-09-16 12:21 | 3319 | `d4d5716e6d04` |
| `vault-ops/operating/setup-transport-email.md` | 2026-08-27 13:45 | 4727 | `9771be05777a` |
| `vault-ops/operating/test-run.md` | 2026-08-27 13:57 | 3796 | `891c65e41091` |
| `vault-ops/operating/timeouts.md` | 2026-08-06 16:07 | 901 | `69d81bfbae48` |
| `vault-ops/opportunities/OPP-0001-site-access-failures.md` | 2026-09-09 12:04 | 1375 | `33311921941c` |
| `vault-ops/opportunities/OPP-0002-customer-forgets-unloading.md` | 2026-09-09 12:04 | 1596 | `537c4902a131` |
| `vault-ops/opportunities/OPP-0003-new-development-addresses.md` | 2026-09-09 12:04 | 1208 | `6996ee9ffc7d` |
| `vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md` | 2026-09-09 12:04 | 1539 | `524ded5c220e` |
| `vault-ops/opportunities/OPP-0005-automate-offer-ranking.md` | 2026-09-09 12:04 | 1407 | `fa7490c04984` |
| `vault-ops/opportunities/OPP-0006-missing-customer-confirmation-step.md` | 2026-09-16 12:21 | 2681 | `9a8f2a92b057` |
| `vault-ops/reference/agent-trust-criteria.md` | 2026-09-16 12:49 | 3293 | `18ab3ca0e007` |
| `vault-ops/reference/classification-rule.md` | 2026-09-09 11:24 | 3120 | `0999ee99985a` |
| `vault-ops/reference/offer-selection-rule.md` | 2026-09-16 12:21 | 3343 | `c3cf909415ed` |
| `vault-ops/reference/process-flow.md` | 2026-08-06 16:08 | 892 | `df9df43b283f` |
| `vault-ops/skills/README-install.md` | 2026-08-06 16:47 | 817 | `9a66425ec779` |
| `vault-ops/skills/process-discovery/SKILL.md` | 2026-08-27 13:45 | 5783 | `1f6c7e53f249` |
| `vault-ops/skills/process-discovery/references/interview-guide.md` | 2026-08-27 15:46 | 2245 | `12cdca9aed53` |
| `vault-ops/skills/process-discovery/templates/interview-report.md` | 2026-08-27 13:45 | 1470 | `486367525946` |
| `vault-ops/skills/process-discovery/templates/opportunity.md` | 2026-08-06 16:46 | 1179 | `e624b8efd0da` |
| `vault-ops/skills/process-discovery/templates/process-map.md` | 2026-08-06 16:46 | 881 | `aaf88d7e94fd` |
| `vault-sh/00-index.md` | 2026-08-27 13:45 | 1346 | `9d10ddb88f4a` |
| `vault-sh/how-to-run-a-discovery-session.md` | 2026-08-27 13:45 | 1386 | `54ec9e174532` |
| `vault-sh/interviews/_index.md` | 2026-08-27 13:45 | 360 | `e289c14cd76d` |
| `vault-sh/maps/_index.md` | 2026-08-27 13:45 | 361 | `1d8ffec1f413` |
| `vault-sh/opportunities/_index.md` | 2026-08-27 13:45 | 474 | `66aed72c078b` |
| `vault-sh/reference/setup-transport-email.md` | 2026-08-27 13:45 | 4727 | `9771be05777a` |
| `vault-sh/reference/vision.md` | 2026-08-27 13:45 | 797 | `7e90d583ab07` |
| `vault-sh/reports/_index.md` | 2026-08-27 13:45 | 433 | `91b39c55cbc4` |
| `vault-sh/skills/README-install.md` | 2026-08-27 13:45 | 1353 | `358c0d8b91d0` |
| `vault-sh/skills/process-discovery/SKILL.md` | 2026-08-27 13:45 | 5783 | `1f6c7e53f249` |
| `vault-sh/skills/process-discovery/references/interview-guide.md` | 2026-08-27 13:45 | 2245 | `12cdca9aed53` |
| `vault-sh/skills/process-discovery/templates/interview-report.md` | 2026-08-27 13:45 | 1470 | `486367525946` |
| `vault-sh/skills/process-discovery/templates/opportunity.md` | 2026-08-27 13:45 | 1179 | `e624b8efd0da` |
| `vault-sh/skills/process-discovery/templates/process-map.md` | 2026-08-27 13:45 | 881 | `aaf88d7e94fd` |
