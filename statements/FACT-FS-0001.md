---
id: FACT-FS-0001
type: statement
fed_kind: fact
fed_modality: opinion
fed_status: proposed
pav_authoredBy: claude-agent
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-10-10
dcterms_title: "State of the repository, the clone, the Drive snapshot and the shared folder on 2026-10-10: dormant since 2026-08-27, eleven uncommitted files"
dcterms_language: en
prov_hadPrimarySource: ["[[SRC-fs-repo]]", "[[SRC-20261010-text-vault-fs]]"]
dcterms_subject: ["[[ELM-drive.sync]]", "[[ELM-drive.offerLog]]", "[[ELM-iteration1.developerMachine.gitMaster]]", "[[ELM-iteration1.developerMachine.snapshot]]", "[[ELM-fs]]"]
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]"]
sw_covers: ["fs:*", "fs:fstransport/**", "fs:skills/vault-curation/.curation-log.md"]
sw_repos: [fs]
---

# FACT-FS-0001: State of the repository, the clone, the Drive snapshot and the shared folder on 2026-10-10: dormant since 2026-08-27, eleven uncommitted files

**Fact:** Nothing in the project moved between 2026-08-27 and 2026-10-10 — not the repository, not the shared Drive folder; the developer's clone holds edits of 2026-08-27 that were never committed.

| date | measurement | value |
|---|---|---|
| 2026-10-10 | last commit of `fs` (`git log -1`), `origin/main` after `git fetch` | `89d77d2`, 2026-08-27 13:57 +0300, author Juri; `origin/main` = local `HEAD`, nothing ahead or behind |
| 2026-10-10 | commits in the repository, authors | 9 (2026-07-16 … 2026-08-27), all by Juri (one as `fs <fs@local>`) |
| 2026-10-10 | files modified in the clone, uncommitted (`git status`) | 11, all with mtime 2026-08-27 13:59: `.env.example`, `HANDOFF.md`, `SETUP.md`, `instances/vault-ops/reference/process-flow.md`, `skills/vault-curation/.curation-log.md`, `vault/10-spec/process-flow.md`, `vault/10-spec/reconciled-spec.md`, `vault/20-decisions/ADR-0008-email-infrastructure.md`, `vault/20-decisions/ADR-0009-separate-transport-email-channel.md`, `vault/20-decisions/README.md`, `vault/60-guides/connecting-sales-email.md` (+90 −35 lines); untracked `.idea/` |
| 2026-10-10 | markdown files in `vault/` at `89d77d2` | 30 |
| 2026-10-10 | `fstransport/` | `pyproject.toml` placeholder, `src/` and `tests/` empty (`.gitkeep`) |
| 2026-10-10 | shared Drive folder (`rclone lsd andrei:`), newest change per top-level folder | `vault-sh` 2026-08-27 13:45; `vault-ops` 2026-08-18 12:07; `findings-inbox` 2026-08-11 13:29; `.obsidian` 2026-08-18 12:16 |
| 2026-10-10 | local snapshot `~/factory.sale/fs-vault-sync`, last pull | 2026-08-27 13:37 (backup `.rclone-backups/fs-vault-sync-before-andrei-pull-20260827T133716`); first copy a zip export of 2026-08-18 08:41Z |
| 2026-10-10 | captures in the snapshot | 2 findings + 1 ADR draft of 2026-08-11 in `vault-ops` ([[SRC-20260811-discovery-captures]]); `vault-sh` and `findings-inbox` empty |
| 2026-10-10 | offer-log Sheet snapshot (`offer-log.xlsx`, 2026-08-11) | header row only; 11 columns `inquiry_id … reason`, no `thread_id` / `message_id` |
| 2026-09-13 | transfer memo (`.docx` beside the clone, not in git) | 40 paragraphs; "iteration 1 has not been operated (no real partner traffic yet); no agent code" ([[SRC-20260913-memo-transfer#^m16]]) |

**Tempo:** one burst of work 2026-08-06 … 2026-08-27 (7 commits), the transfer on 2026-09-13, silence since.

**Check:**
- `git -C ~/factory.sale/fs fetch && git -C ~/factory.sale/fs status -sb && git -C ~/factory.sale/fs log -1 --format='%h %ci %an'`
- `git -C ~/factory.sale/fs diff --stat`
- `rclone lsd andrei:` and `rclone lsl andrei:vault-ops | sort -k2,3 | tail`
- `ls -la --time-style=long-iso ~/factory.sale/.rclone-backups/`

**Update 2026-10-11:** the Drive row of the table is wrong, and with it the headline "nothing moved" as far as the shared folder goes. The measurement of 2026-10-10 was `rclone lsd andrei:`, which shows the top-level folders' own modification times, not their contents'. A recursive `rclone lsl andrei:` on 2026-10-11 shows 73 files against 33 in the local snapshot, and 40 files added or changed after the snapshot of 2026-08-27 13:37, all in the operator's instance `vault-ops`: on 2026-08-27 14:38 … 15:46 (eight findings, the HUUM weights sheet `data/huum-toodete-kaalud-moodud.xlsx`, the ADR draft and the email guide revised), on 2026-09-09 11:13 … 12:04 (five findings, among them `finding-2026-09-09-gerava-no-email-trail` — a partner request sent from Bitrix24 leaves no trace in the Gmail mailbox; the classification rule; opportunities OPP-0001 … OPP-0005) and on 2026-09-16 12:21 … 12:49 (`finding-2026-09-16-approval-gate-graduates-after-20-runs`, OPP-0006, the operating checklist, the offer-selection rule, the agent-trust criteria, `open-setup-items`, the current- and desired-state maps, the interview on transportation-partner selection, the discovery report). The repository's dormancy stands: `origin/main` is still `89d77d2`. So the discovery process was run from the operator's side up to three days after the transfer memo; none of it is in the vault yet — the sweep is logged as pending in `log.md`.
