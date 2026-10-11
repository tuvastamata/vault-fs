---
id: VIEW-fs-shared-folders
type: view
dcterms_identifier: fs-shared-folders
sw_kind: container
sw_scope: "[[ELM-drive]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-shared-folders — Container View: Google Drive shared folders

container view of [[ELM-drive]] (Google Drive shared folders) · automatic layout LeftRight.

The shared Google Drive folders and who reads and writes them

## Elements (8)

- [[ELM-desktop]] — Claude Desktop (company account) (software system)
- [[ELM-developer]] — Developer (person)
- [[ELM-drive.huum]] — Huum product folder (container)
- [[ELM-drive.logistika]] — Logistika folder (container)
- [[ELM-drive.offerLog]] — Offer log (container)
- [[ELM-drive.sync]] — fs-vault-sync (container)
- [[ELM-operator]] — Transportation operator (person)
- [[ELM-stakeholder]] — Stakeholder (person)

## Relationships (9)

- [[ELM-desktop]] → [[ELM-drive.huum]] — Reads product data from the locally synced folder (interim) *(local files)*
- [[ELM-desktop]] → [[ELM-drive.sync]] — Reads and writes captures and the offer log *(Drive API)*
- [[ELM-developer]] → [[ELM-drive.logistika]] — Derives the data model and the interim datastore *(analysis)*
- [[ELM-developer]] → [[ELM-drive.offerLog]] — Takes the labelled dataset for the ranker *(export)*
- [[ELM-developer]] → [[ELM-drive.sync]] — Pulls captures as an rclone snapshot; pushes back reference notes *(rclone)*
- [[ELM-operator]] → [[ELM-desktop]] — Runs the process by hand with the agent; approves every outbound email *(Claude Desktop)*
- [[ELM-operator]] → [[ELM-drive.offerLog]] — Logs every offer and which one was chosen *(Google Sheets)*
- [[ELM-stakeholder]] → [[ELM-desktop]] — Discovery interviews and planning (vault-sh, process-discovery skill) *(Claude Desktop)*
- [[ELM-stakeholder]] → [[ELM-drive.logistika]] — Keeps rules and operational data current *(Google Drive)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
