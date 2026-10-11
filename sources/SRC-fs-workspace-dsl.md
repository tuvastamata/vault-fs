---
id: SRC-fs-workspace-dsl
type: source
prov_wasAttributedTo: [claude-agent]
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
dcterms_date: 2026-10-11
dcterms_language: en
dcterms_type: Dataset
fed_condition: full
pav_retrievedFrom: structurizr/workspace.dsl
prov_hadPrimarySource: ["[[SRC-fs-system-architecture]]", "[[SRC-fs-process-steps]]", "[[SRC-fs-process-flow]]", "[[SRC-fs-connecting-sales-email]]", "[[SRC-20260913-memo-transfer]]", "[[SRC-fs-repo]]"]
dcterms_isPartOf: ["[[LINE-fs-build]]"]
---

# Source: `structurizr/workspace.dsl` — the Structurizr model of the transportation-agent project, master of its structure

The master of the project's structure (class 2), living in this vault as `structurizr/workspace.dsl`. One workspace: `!identifiers hierarchical`, element properties `repo` / `path` / `evidence`; 5 people, 9 software systems with 20 containers and 8 components, two deployment environments (`Iteration 1 - Wizard-of-Oz` as it is, `Iteration 2 - target` as planned), 9 views with `autolayout`. Drafted by the agent on 2026-10-11 from the repository's documents at `89d77d2` — the system architecture, the process steps and flow, the email guide, HANDOFF, SETUP and the instances README — and from the transfer memo of 2026-09-13; nothing in it was measured by the agent against a running system, because none runs yet.

**Condition `full`:** the file is at `pav_retrievedFrom`, relative to this vault. The element identifiers and view keys of this file are the keys of the wrappers `elements/ELM-*` and `views/VIEW-*` (see the vault's `README.md`); view keys carry the prefix `fs-` so that they do not collide with the keys of other vaults in the federation root.

**What is as-is and what is planned.** As-is (iteration 1): the people, the two mailboxes and the Gmail merge, Bitrix24, the WooCommerce shop, the shared Drive folders, Claude Desktop on the company account with its connectors, the browser and the instance vault. Planned (tag `Planned`, dashed): the service `fs` with its API, LangGraph engine and nodes, dashboard, PostgreSQL, Redis and mail adapter, its providers (LLM API, LangSmith, the order webhook consumer) and the agent host.

**For the owner to confirm.** The order@factory.sale mailbox is drawn on the Radicenter hosting beside sales@ — the documents say only that it is redirected to Gmail. The agent host, the LLM provider, the LangSmith deployment and the order system are placeholders. The Bitrix24 integration of iteration 2 is drawn as the webhook of the architecture note; iteration 1 reads Bitrix24 in the browser. The `desktop -> drive.huum` relationship is the memo's interim path, not an observed one.
