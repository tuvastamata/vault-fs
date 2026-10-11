---
id: SRC-fs-playbook
type: source
fed_kind: doc
pav_importedFrom: "fs:vault/50-playbook/playbook.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/50-playbook/playbook.md@89d77d2"
dcterms_title: "Automation Playbook (living, scaffolded 2026-07-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-06
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]"]
---

# Automation Playbook

> Imported verbatim from `fs:vault/50-playbook/playbook.md@89d77d2` on 2026-10-11 (first committed 2026-08-06): the stakeholder-facing playbook, still the pre-discovery scaffold. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

> Living document. Updated by the user (with Claude) periodically or after a batch of discovery
> reports arrives. ROI figures use [[SRC-fs-roi-model]]. Empty tables fill as reports come in.

## Executive summary
_1–2 paragraphs: where the biggest, most confident wins are and what we recommend doing next._
_(fill after first reports)_

## Process inventory
Processes discovered so far and their state.

| Process | Mapped? | Volume/wk | Owner | Biggest pain | Agent candidate? |
|---------|---------|-----------|-------|--------------|------------------|
| Transportation partner selection | in progress | | | | yes (in build) |

## Opportunities — ranked by ROI
From discovery reports, costed with [[SRC-fs-roi-model]].

| # | Opportunity | Process | Net annual benefit | Impl. cost | Payback | Priority |
|---|-------------|---------|--------------------|-----------|---------|----------|
| _(none yet)_ | | | | | | |

## Measurement baseline
Current-state numbers we'll measure improvement against.

| Metric | Baseline | Source | Target |
|--------|----------|--------|--------|
| Transportation: hands-on time / inquiry | | | |
| Transportation: cycle time inquiry→confirmed | | | |
| Transportation: inquiries / week | | | |

## Agent roadmap
| Agent | Status | Depends on | Expected benefit |
|-------|--------|------------|------------------|
| Transportation selection | iteration 1 (Wizard-of-Oz) | stakeholder Q's, ranker data | reduce manual outreach + data entry |
| _(future agents from discovery)_ | | | |

## Decisions & risks
Link key ADRs and note open risks.
- Open ADRs: `fs:vault/20-decisions/README.md@89d77d2`
- Risks: _(fill)_

## Change log
| Date | Update |
|------|--------|
| 2026-07-16 | Playbook scaffolded (pre-discovery). |
