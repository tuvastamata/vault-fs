---
id: VIEW-fs-iteration-1-tooling
type: view
dcterms_identifier: fs-iteration-1-tooling
sw_kind: container
sw_scope: "[[ELM-desktop]]"
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-iteration-1-tooling — Container View: Claude Desktop (company account)

container view of [[ELM-desktop]] (Claude Desktop (company account)) · automatic layout LeftRight.

Claude Desktop on the company account: connectors, the browser, the instance vault

## Elements (7)

- [[ELM-desktop.chrome]] — Chrome (Claude in Chrome) (container)
- [[ELM-desktop.driveConnector]] — Google Drive connector (container)
- [[ELM-desktop.gmailConnector]] — Gmail connector (container)
- [[ELM-desktop.vault]] — Instance vault (container)
- [[ELM-drive]] — Google Drive shared folders (software system)
- [[ELM-mail]] — Email channels (software system)
- [[ELM-woocommerce]] — WooCommerce shop (software system)

## Relationships (4)

- [[ELM-desktop.chrome]] → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- [[ELM-desktop.driveConnector]] → [[ELM-drive]] — Reads and writes captures and the offer log *(Drive API)*
- [[ELM-desktop.gmailConnector]] → [[ELM-mail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*
- [[ELM-desktop.vault]] → [[ELM-drive]] — Mirrored to and from the shared folder *(Google Drive for desktop)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
