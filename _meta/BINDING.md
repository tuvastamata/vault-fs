---
id: BINDING
type: vault
pav_curatedBy: [tuvastamata]
pav_createdOn: 2026-10-10
dcterms_language: en
fed_languages: [en, et]
fed_rules: ../../knowledge-vaults/metavault
fed_profile: software
---

# Binding — vault-fs: the factory.sale transportation-agent project

The owner's vault about the FS Transportation Selection Agent project of factory.sale: the model of the system and its surroundings, the decisions, hazards, deferred changes, facts, findings and plans, and the sources they come from. The project's own documentation is the repository `fs` (github.com/aviov/fs) with its hub-and-spoke process; this vault lives in the project catalog `~/factory.sale/vault-fs`, beside the clone and never inside it, and enters the federation root by the symlink `~/knowledge-vaults/vault-fs` — as `vault-its` does for the ITS estate. It links to the repository one way as `fs:path@commit`. Opened 2026-10-10 by the owner's decision ([[STM-20261010-tuvastamata-vault-fs]] in the metavault): a separate vault rather than the repository's own vault folder, so that the colleagues' documents keep their form; placed in the project catalog by the owner's correction of 2026-10-11.

**Language.** Canonical English (`dcterms_language: en`), accepted Estonian (`fed_languages: [en, et]`). Terms as in the code, the configuration and the repository (approval gate, fast-track, offer log, label). What the owner says in Russian is translated into a record, the words quoted in the source. A node carries the language it was said in ([[CON-language]]).

**Profile `software`.** Statements of kind `adr`, `hazard`, `deferred`, `fact`, `plan`, `analysis`, `report` as in the profile, plus the project's own kind `finding` — a surprise met while operating the process (edge case, extra need, data gap), with a severity and a lifecycle like a hazard. The structure lives in `structurizr/workspace.dsl`; the pages `elements/` and `views/` are built from it (`README.md`). No documentation server yet: the fields `sw_structurizrUrl`, `sw_workspaceId`, `sw_mcpUrl` are absent until one exists.

Rules — the metavault; digest `metavault/AGENTS.md` (`python3 metavault/tools/fed.py compile --federation .` from the federation root; no digest in this vault) · check: `python3 metavault/tools/fed.py lint vault-fs --federation .`
