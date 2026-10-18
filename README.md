# vault-fs — the factory.sale transportation-agent project

The owner's vault about the FS Transportation Selection Agent project of factory.sale: the model of the system and its surroundings, the records written around it, and the sources they come from. The project's own documentation is the repository `fs` (github.com/aviov/fs, clone at `~/factory.sale/fs`): an Obsidian vault as the single source of truth, a hub-and-spoke flow of operator and stakeholder instances over a shared Google Drive folder, the developer as the only writer of the master. That stays as it is and in its own form; this vault lives in the project catalog `~/factory.sale/vault-fs` beside the clone, enters the federation root by the symlink `~/knowledge-vaults/vault-fs` (as `vault-its` does), cites the repository one way as `fs:path@commit`, and never writes into it. Opened 2026-10-10 ([[STM-20261010-tuvastamata-vault-fs]] in the metavault); first content imported 2026-10-11 ([[INGEST-20261011]]).

Rules — the metavault; digest `metavault/AGENTS.md` (`python3 metavault/tools/fed.py compile --federation .` from the federation root; there is no digest in this vault); check — `python3 metavault/tools/fed.py lint vault-fs --federation .`.

## What is where

```
~/factory.sale/vault-fs/        ← symlinked as ~/knowledge-vaults/vault-fs
├── structurizr/workspace.dsl   ← the model of the project's structure (C4, Structurizr DSL) — the master
├── structurizr/layouts/        ← hand-laid views, one file per view key (none yet)
├── elements/  ELM-*, index.md  ← one page per model element — built from the model, never edited by hand
├── views/     VIEW-*, index.md ← one page per model view — built, as elements/
├── statements/                 ← the records: decisions ADR-FS-*, hazards HZ-FS-*, deferred changes DC-FS-*, findings FIND-FS-*,
│                                 opportunities OPP-FS-*, facts FACT-FS-*, plans PLAN-FS-*, analyses ANL-FS-*, ingest reports INGEST-*
├── sources/   SRC-*            ← passports of the repository and the shared Drive folder, their documents (full text with block
│                                 anchors), the original PDFs, the transfer memo, the operator captures, the HUUM sheet, the model
├── lines/     LINE-fs-*        ← topics
├── persons/   PER-*            ← the project's people, the company and the transport partners, by handle
├── history/                    ← frozen texts of living records (none yet)
├── *.base                      ← live lists (Obsidian Bases): Decisions, Findings, Hazards, Deferred changes, Facts, Plans, Documents, Sources
├── templates/                  ← templates of new records (core plugin Templates): Decision, Hazard, Deferred change, Finding, Fact
├── 00 FS transportation agent.md ← start page: the open lists embedded
├── log.md                      ← sweeps: which commit of the repository was read, what changed in the model and the records
├── inbox/  sandbox/            ← the intake without form and the drafts; outside the graph
├── _generated/                 ← scratch of the build (gitignored)
├── .obsidian/                  ← this folder's Obsidian settings: templates folder, core plugins Bases and Templates, history/ excluded
└── _meta/BINDING.md            ← this folder's settings: language, profile
```

Open the folder as an Obsidian vault (Obsidian 1.9 or newer for the live lists), or the federation root as one vault (the symlink). Commands below run from the federation root `~/knowledge-vaults`, where `vault-fs` is the symlink. Per-user Obsidian state is not committed.

## Language

1. **Canonical English, accepted Estonian** (`_meta/BINDING.md`). Everything written here is English; an Estonian record is legal and carries `dcterms_language: et`.
2. **Terms as in the code, the configuration and the repository:** approval gate, fast-track, offer log, label, send-as alias, findings-inbox, push-back, Wizard-of-Oz; element names as in the model.
3. **What the owner says in Russian is translated into the record, not quoted;** the words are quoted in the source (the session passport in the metavault).
4. **The machine layer is not translated:** ids, file names, frontmatter keys and values, commands, paths.

## Working with the model

1. **The master is `structurizr/workspace.dsl`**, not any server (there is none yet: the fields `sw_structurizrUrl`, `sw_workspaceId`, `sw_mcpUrl` are absent from the binding until one exists). Changing the structure is changing the DSL; every DSL change gets a line in `log.md`.
2. **Keys are the DSL identifiers and the view keys:** `fs.engine.ranker`, `mail.sales`, `drive.offerLog`; `fs-landscape`, `fs-deployment-iteration-1`. View keys carry the prefix `fs-` so that they do not collide with the keys of other vaults when the federation root is opened as one Obsidian vault.
3. **The pages in `elements/` and `views/` are built from the model:** name, description, technology, tags, properties, parent, relationships as `[[ELM-…]]` links (the Obsidian graph is the C4 graph), deployment, the views an element appears in. Do not edit them — rebuild. Named instances get no page; they are listed inside the deployment node that hosts them.
4. **Records point at element and view pages:** `[[ELM-mail.gmail]]`, `[[VIEW-fs-email-channels]]`. A view's diagram would be embedded as `![[VIEW-<key>#Diagram]]` once the pages carry one (step 7).
5. **One direction:** DSL → pages. A structural fact missing from the model is a DSL change, not a page's.
6. **Model first.** What exists and how it is connected — a system, its containers and components, their technology and purpose, where they run, who talks to whom — is a DSL change: descriptions, `properties`, relationships, deployment. Pages follow. A record is written only for what the model cannot hold: why (decisions, `ADR-FS-*`), what can go wrong (`HZ-FS-*`), what is put off (`DC-FS-*`), what was measured and how to check it (`FACT-FS-*`), what surprised us while operating the process (`FIND-FS-*`). A record points at its element (`dcterms_subject`) and does not describe it again.
7. **Rebuilding the pages** (the only place to update when the tools move). Check the DSL: `java -jar <structurizr>/structurizr-1.0.0.war validate -w structurizr/workspace.dsl`. Export: `java -jar <structurizr>/structurizr-1.0.0.war export -w structurizr/workspace.dsl -f json -o _generated`. Build: `python3 <tools>/structurizr-wrap.py vault-fs --json vault-fs/_generated/workspace.json` from the federation root (`--check` shows the drift and writes nothing). Diagrams: not built yet — they need the laid-out copy of `rebuild-copy.py` and `structurizr export -f svg` with Playwright browsers, as `vault-its/README.md` item 7 describes; until then the view pages carry no diagram section. Today `<structurizr>` is the owner's local build (`~/structurizr/structurizr-application/target`) and `<tools>` is `metavault/tools`.
8. **Sweep after a push.** At the start of every session that touches the project, and at least weekly: `git -C ~/factory.sale/fs fetch`, then the commits since the last line of `log.md` (`git log <from>..origin/main`); first the model — a DSL change for every structural change, then a rebuild; then the records — new `FACT-FS-*` / `HZ-FS-*` / `FIND-FS-*` for what was learned, a status change or an `Update <date>` paragraph for records the change makes stale (earlier text is never rewritten); a document the repository changed is a new source or a dated `Update` on the old one, never an edit of the imported text; lint; one line in `log.md`. The shared Drive folder is swept the same way: `rclone lsl andrei:` (recursive — folder times do not change when files inside do) against the last line for `fs-vault-sync` here; if anything is newer, back the snapshot up (`cp -a fs-vault-sync .rclone-backups/fs-vault-sync-before-andrei-pull-<UTC stamp>`) and pull it (`rclone copy andrei: fs-vault-sync`, nothing is deleted); new captures and documents go through `metavault/tools/fs-import/fs_import.py --drive` (extend its tables, dry run, then `--write`) — documents as sources with anchors, captures as records verbatim; the operator's words become decisions authored by her handle `eva`. The owner commits.
9. **Where a project-facing decision goes.** The project takes its decisions in its own repository (`vault/20-decisions`, the repository's form, by the project's process). A decision the owner takes as developer is written here first as `ADR-FS-*`, then — if the project needs it — into the repository by that process; the record here names the repository's id when it exists.

## The record is theses, not prose

Templates carry the fields.

- Labelled fields in the template's order; a field is one line or a short list.
- One fact per line: what, where (`fs:path@commit#line`, `host:/path`), how much (number, unit, date).
- No introduction, no summary, no narrative. Plain words, short lines.
- Hazard: `Hazard` (what happens, when) · `Cause` · `Details` (facts with anchors) · `Consequences` · `Check` (commands) · `Mitigation` · `Log`.
- Deferred change: `Change` (numbered) · `Reason` · `Result` · `Constraints` · `Revisit trigger`.
- Decision: `Decision` (numbered; who, when) · `Context` · `Consequences` — as lists.
- Finding: `Trigger` (with the concrete example — inquiry id, partner, email excerpt, dimensions, so it can become a test fixture) · `Current behaviour` · `Desired behaviour` · `Handling` · `Evidence` · `Log`; `sw_severity` low | medium | high | blocker; a tag `nav/iteration-N` and one of `nav/edge-case`, `nav/extra-need`, `nav/bug`, `nav/data-gap`, `nav/doc-conflict`.
- Fact: `Fact` (one line) · measurements as tables by date · `Tempo` · `Check` (commands).
- Measurements live in a `FACT-FS-*` record and are referred to, not repeated.
- Ids: `ADR-FS-NNNN`, `HZ-FS-NNNN`, `DC-FS-NNNN`, `FIND-FS-NNNN`, `OPP-FS-NNNN` (an opportunity of the process-discovery skill: a finding tagged `nav/opportunity`), `FACT-FS-NNNN`, `PLAN-FS-NNNN`, `ANL-FS-NNNN`; the `FS` code keeps them apart from the other vaults' ids in the federation root. A record imported from the repository keeps the repository's number (`ADR-0009` → `ADR-FS-0009`) and names the file and commit in `pav_importedFrom`; a capture imported from the shared folder gets the next free number in order of capture and names the file and its date (`fs-vault-sync:path@date`).
- An imported record is a snapshot at the named commit, the repository's text verbatim with the links rewritten; the repository's copy may move on. A later change in an older or accepted record, or in another author's record, goes in as one dated line or an `Update` paragraph with the net result; earlier text is not rewritten there.
- Uncommitted text holds only the final state. A record still being worked on (`proposed`, same day or same piece of work) is rewritten whole.
- Status lives in `sw_logStatus` (`open`, `in-progress`, `mitigated`, `resolved`, `proposed`, `accepted`, `superseded`, `rejected`, `withdrawn`), the free-text state in `sw_statusNote`; acceptance of the record itself is `fed_status`, the owner's act (`fed.py accept`).
- Examples: [[HZ-FS-0002]], [[DC-FS-0001]], [[ADR-FS-0010]], [[FACT-FS-0001]], [[FIND-FS-0002]] (imported).

## How this vault relates to the repository

- **Taken from the repository on 2026-10-11 at `89d77d2`:** the five specification documents, the email guide, the question sheet, the playbook and the ROI model as full-text sources with block anchors (`^FR-2-01`, `^step-6-1`, `^C1`, `^gaps`); the nine decision records, the two findings and the three iteration plans as statements. The repository's index tables and templates were not taken — the Bases and `templates/` replace them here.
- **Not taken, only cited:** the process documents (`README.md`, `HANDOFF.md`, `SETUP.md`, `vault/CONTRIBUTING.md`, `instances/README.md`), the instance seeds, the two Claude Desktop skills, `data/`, `.env.example`. They are the project's conventions; an agent working in the repository follows them as the project's rules.
- **Outside git but taken:** the transfer memo of 2026-09-13 ([[SRC-20260913-memo-transfer]]) and the operator captures of 2026-08-11 from the Drive snapshot ([[SRC-20260811-discovery-captures]]).
- **Taken from the shared Drive folder on 2026-10-11** ([[SRC-fs-vault-sync]], [[INGEST-20261011-drive]]): the operator's discovery round of 2026-08-27 … 2026-09-16 — the interview, the report, the two maps, the four rules, the checklist and the open setup items as sources; the thirteen captures and six opportunities as records; the HUUM sheet's passport. Files equal to the repository's seeds are not taken twice. The operator's rules are decisions here ([[ADR-FS-0013]] … [[ADR-FS-0016]]); the repository gets them by the developer's curation ([[DC-FS-0003]]).
- **Links flow one way:** from here to `fs:path@commit`. Nothing of this vault — no digest, no pointer, no record — is written into the repository or the shared folder.
- **Where it lives:** `~/factory.sale/vault-fs`, its own git repository (the owner creates it), beside the clone `fs` and the Drive snapshot in the project catalog; the federation root reaches it through the symlink, as it reaches `vault-its` inside the ITS catalog.
