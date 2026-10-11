---
id: SRC-fs-repo
type: source
pav_createdBy: claude-agent
pav_createdWith: "Claude (Fable 5.1)"
pav_createdOn: 2026-10-11
prov_wasAttributedTo: [juri]
pav_retrievedFrom: fs@89d77d2
dcterms_title: "Repository fs (github.com/aviov/fs) as of 89d77d2"
dcterms_language: en
dcterms_type: Software
dcterms_date: 2026-08-27
fed_condition: full
dcterms_isPartOf: ["[[LINE-fs-documentation-and-sync]]", "[[LINE-fs-build]]"]
---

# Source: repository `fs` (github.com/aviov/fs) at `89d77d2` — the project's documentation-driven repository

The git repository of the FS Transportation Selection Agent project, remote `git@github.com:aviov/fs.git`, read at commit `89d77d2` (2026-08-27, the last commit of the author Juri; `origin/main` had nothing newer on 2026-10-10). The repository is **documentation-driven**: its Obsidian vault `vault/` is the project's single source of truth, code is to be generated from it (`fstransport/`, empty), and the hub-and-spoke process around it — operator and stakeholder instance vaults, a shared Google Drive folder, the developer as the only writer of the master — is described in `README.md`, `HANDOFF.md`, `SETUP.md`, `vault/CONTRIBUTING.md` and `instances/README.md`. Those process documents and the two Claude Desktop skills (`skills/process-discovery`, `skills/vault-curation`) are the project's own conventions and stay in the repository; this vault only cites them.

**Condition `full`:** the clone is at `~/factory.sale/fs`; a path is cited as `fs:path@commit`. The clone also carries 11 files modified on 2026-08-27 13:59 and never committed ([[FACT-FS-0001]]); they are not part of this passport.

## Commits (9)

- `89d77d2` 2026-08-27 — ops: add bilingual (EE+EN) test-run dry-run guide with stand-in partners; link from operator index (Juri)
- `eba1cfb` 2026-08-27 — L process-discovery: interview in any language, document in English; add self-contained transport-email setup guide (ops + sh); repoint daily-use guide locally (Juri)
- `6d84520` 2026-08-27 — Curate 2026-08-11 discovery: ADR-0009 (+single-inbox exception & mitigations), FIND-0001/0002, connecting-sales-email guide, offer-log provenance cols, iteration-2 email scoping (Juri)
- `2670613` 2026-08-27 — L chore: stop tracking Obsidian workspace.json (Juri)
- `baa4f00` 2026-08-27 — L docs(skills): add vault-curation skill for updates into repo vault from fs-vault-sync google drive (Juri)
- `8ef7c97` 2026-08-11 — L obsidian vault worspnace.json updated (Juri)
- `96c04be` 2026-08-06 — L Offer-log template, discovery report + skill in instances, ROI playbook (Juri)
- `b919ef9` 2026-08-06 — L Reorg assets+code, add process-discovery skill, vault instances, sync topology (Juri)
- `258784d` 2026-07-16 — Scaffold repo + Obsidian vault: reconciled spec, ADRs, findings templates, iteration plans (fs)

## What this vault took from it on 2026-10-11

- `vault/10-spec/*` (5), `vault/60-guides/connecting-sales-email.md`, `vault/40-iterations/iteration-1-stakeholder-questions.md`, `vault/50-playbook/playbook.md`, `vault/50-playbook/roi-model.md` → sources `SRC-fs-*` with the text verbatim and block anchors;
- `vault/20-decisions/ADR-0001..0009` → [[ADR-FS-0001]] … [[ADR-FS-0009]]; `vault/30-findings/FIND-0001..0002` → [[FIND-FS-0001]], [[FIND-FS-0002]]; `vault/40-iterations/iteration-{1,2,3}-*.md` → [[PLAN-FS-0001]] … [[PLAN-FS-0003]] — statements with the text verbatim, `pav_importedFrom` naming the file and this commit;
- `vault/assets/**` → the passport [[SRC-fs-source-docs]] (the files themselves stay in the repository).

Not taken: the index tables and templates of the vault (`00-index.md`, `*/README.md`, `ADR-template.md`, `finding-template.md`) — replaced here by the Bases and `templates/`; the process documents, the instance seeds, the skills, `data/offer-log.template.csv`, `.env.example` — cited where a record needs them.

## Markdown files at this commit (73)

- `HANDOFF.md`
- `README.md`
- `SETUP.md`
- `data/README.md`
- `fstransport/README.md`
- `instances/README.md`
- `instances/vault-ops/00-index.md`
- `instances/vault-ops/operating/approval-gate.md`
- `instances/vault-ops/operating/connecting-sales-email.md`
- `instances/vault-ops/operating/findings-inbox/_how-to-file-a-finding.md`
- `instances/vault-ops/operating/offer-log.md`
- `instances/vault-ops/operating/operating-checklist.md`
- `instances/vault-ops/operating/setup-transport-email.md`
- `instances/vault-ops/operating/test-run.md`
- `instances/vault-ops/operating/timeouts.md`
- `instances/vault-ops/reference/process-flow.md`
- `instances/vault-ops/skills/README-install.md`
- `instances/vault-ops/skills/process-discovery/SKILL.md`
- `instances/vault-ops/skills/process-discovery/references/interview-guide.md`
- `instances/vault-ops/skills/process-discovery/templates/interview-report.md`
- `instances/vault-ops/skills/process-discovery/templates/opportunity.md`
- `instances/vault-ops/skills/process-discovery/templates/process-map.md`
- `instances/vault-sh/00-index.md`
- `instances/vault-sh/how-to-run-a-discovery-session.md`
- `instances/vault-sh/interviews/_index.md`
- `instances/vault-sh/maps/_index.md`
- `instances/vault-sh/opportunities/_index.md`
- `instances/vault-sh/reference/setup-transport-email.md`
- `instances/vault-sh/reference/vision.md`
- `instances/vault-sh/reports/_index.md`
- `instances/vault-sh/skills/README-install.md`
- `instances/vault-sh/skills/process-discovery/SKILL.md`
- `instances/vault-sh/skills/process-discovery/references/interview-guide.md`
- `instances/vault-sh/skills/process-discovery/templates/interview-report.md`
- `instances/vault-sh/skills/process-discovery/templates/opportunity.md`
- `instances/vault-sh/skills/process-discovery/templates/process-map.md`
- `skills/process-discovery/SKILL.md`
- `skills/process-discovery/references/interview-guide.md`
- `skills/process-discovery/templates/interview-report.md`
- `skills/process-discovery/templates/opportunity.md`
- `skills/process-discovery/templates/process-map.md`
- `skills/vault-curation/.curation-log.md`
- `skills/vault-curation/SKILL.md`
- `vault/00-index.md`
- `vault/10-spec/SRS.md`
- `vault/10-spec/process-flow.md`
- `vault/10-spec/process-steps.md`
- `vault/10-spec/reconciled-spec.md`
- `vault/10-spec/system-architecture.md`
- `vault/20-decisions/ADR-0001-standard-pallet-pricing-formula.md`
- `vault/20-decisions/ADR-0002-standard-pallet-partner-selection.md`
- `vault/20-decisions/ADR-0003-iteration1-real-inbox-bitrix24.md`
- `vault/20-decisions/ADR-0004-timeouts-and-follow-ups.md`
- `vault/20-decisions/ADR-0005-zero-offer-fallback.md`
- `vault/20-decisions/ADR-0006-fuel-cost-index-source.md`
- `vault/20-decisions/ADR-0007-ranker-cold-start.md`
- `vault/20-decisions/ADR-0008-email-infrastructure.md`
- `vault/20-decisions/ADR-0009-separate-transport-email-channel.md`
- `vault/20-decisions/ADR-template.md`
- `vault/20-decisions/README.md`
- `vault/30-findings/FIND-0001-offer-log-live-source-is-gsheet.md`
- `vault/30-findings/FIND-0002-transport-email-channel.md`
- `vault/30-findings/README.md`
- `vault/30-findings/finding-template.md`
- `vault/40-iterations/iteration-1-stakeholder-questions.md`
- `vault/40-iterations/iteration-1-wizard-of-oz.md`
- `vault/40-iterations/iteration-2-langgraph-mvp.md`
- `vault/40-iterations/iteration-3-harden.md`
- `vault/50-playbook/README.md`
- `vault/50-playbook/playbook.md`
- `vault/50-playbook/roi-model.md`
- `vault/60-guides/connecting-sales-email.md`
- `vault/CONTRIBUTING.md`
