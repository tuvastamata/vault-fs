---
id: ELM-desktop.vault
type: element
dcterms_identifier: desktop.vault
sw_kind: container
sw_parent: "[[ELM-desktop]]"
sw_technology: Markdown folder (Obsidian)
sw_tags: [Element, Container, Folder, Iteration1]
sw_views: ["[[VIEW-fs-iteration-1-tooling]]", "[[VIEW-fs-deployment-iteration-1]]", "[[VIEW-fs-deployment-iteration-2]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# desktop.vault — Instance vault

Container of [[ELM-desktop]] (Claude Desktop (company account)) · tags `Folder`, `Iteration1`.

Plain folder on the machine's disk opened as the working folder: operating checklist, approval gate, timeouts, offer-log guide, findings-inbox and the process-discovery skill (vault-ops for the operator, vault-sh for stakeholders). Seeded from the repository, synced to fs-vault-sync by Google Drive for desktop. The operator's copy carries the discovery round of 2026-08-27 ... 2026-09-16 (reference rules, maps, interview, report, opportunities, open setup items) that the repository has not absorbed (DC-FS-0003).

**Technology:** Markdown folder (Obsidian)

## Properties

- path: `instances/vault-ops, instances/vault-sh`
- repo: `fs`

## Relationships

### Outgoing

- → [[ELM-drive.sync]] — Mirrored to and from the shared folder *(Google Drive for desktop)*

### Implied

Derived by the parser from relationships of children; the fact lives in the origin relationship.

- → [[ELM-drive]] — Mirrored to and from the shared folder *(Google Drive for desktop)* · from [[ELM-desktop.vault]] → [[ELM-drive.sync]]

## Deployed

- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.operatorMachine.driveApp]] (Google Drive for desktop)
- **Iteration 1 - Wizard-of-Oz** — [[ELM-iteration1.stakeholderMachine.driveApp]] (Google Drive for desktop)
- **Iteration 2 - target** — [[ELM-iteration2.operatorMachine]] (Operator machine)

## Views

- [[VIEW-fs-iteration-1-tooling]] — Container View: Claude Desktop (company account)
- [[VIEW-fs-deployment-iteration-1]] — Deployment View: Iteration 1 - Wizard-of-Oz
- [[VIEW-fs-deployment-iteration-2]] — Deployment View: Iteration 2 - target

## Records

Hazards, decisions and deferred changes that refer to this element (live query):

```base
filters:
  and:
    - 'note.type == "statement"'
    - 'file.hasLink(this.file)'
views:
  - type: table
    name: Records
    groupBy:
      property: note.fed_kind
      direction: ASC
    order:
      - file.name
      - note.dcterms_title
      - note.sw_logStatus
      - note.sw_severity
```

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
