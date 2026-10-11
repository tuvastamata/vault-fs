---
id: VIEW-fs-deployment-iteration-1
type: view
dcterms_identifier: fs-deployment-iteration-1
sw_kind: deployment
sw_environment: Iteration 1 - Wizard-of-Oz
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs-deployment-iteration-1 — Deployment View: Iteration 1 - Wizard-of-Oz

deployment view · environment **Iteration 1 - Wizard-of-Oz** · automatic layout LeftRight.

Where the iteration-1 tooling runs

## Elements (24 distinct, 26 in the view)

- [[ELM-iteration1.bitrixCloud]] — Bitrix24 cloud (deployment node)
  - [[ELM-bitrix24]] — Bitrix24
- [[ELM-iteration1.developerMachine]] — Developer machine (deployment node)
  - [[ELM-iteration1.developerMachine.gitMaster]] — git master (infrastructure node)
  - [[ELM-iteration1.developerMachine.snapshot]] — rclone snapshot (infrastructure node)
  - [[ELM-iteration1.developerMachine.vaultFs]] — vault-fs (infrastructure node)
- [[ELM-iteration1.google]] — Google (deployment node)
  - [[ELM-drive]] — Google Drive shared folders
  - [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com
- [[ELM-iteration1.operatorMachine]] — Operator machine (deployment node)
  - [[ELM-iteration1.operatorMachine.claudeApp]] — Claude Desktop (deployment node)
    - [[ELM-desktop.chrome]] — Chrome (Claude in Chrome)
    - [[ELM-desktop.driveConnector]] — Google Drive connector
    - [[ELM-desktop.gmailConnector]] — Gmail connector
  - [[ELM-iteration1.operatorMachine.driveApp]] — Google Drive for desktop (deployment node)
    - [[ELM-desktop.vault]] — Instance vault
- [[ELM-iteration1.radicenter]] — Radicenter mail hosting (deployment node)
  - [[ELM-mail.order]] — order@factory.sale
  - [[ELM-mail.sales]] — sales@factory.sale
- [[ELM-iteration1.stakeholderMachine]] — Stakeholder machine (deployment node)
  - [[ELM-iteration1.stakeholderMachine.claudeApp]] — Claude Desktop (deployment node)
    - [[ELM-desktop.driveConnector]] — Google Drive connector
  - [[ELM-iteration1.stakeholderMachine.driveApp]] — Google Drive for desktop (deployment node)
    - [[ELM-desktop.vault]] — Instance vault
- [[ELM-iteration1.wordpress]] — WordPress hosting (deployment node)
  - [[ELM-woocommerce]] — WooCommerce shop

## Relationships (10 distinct, 12 in the view)

- [[ELM-desktop.chrome]] → [[ELM-woocommerce]] — Reads product data through the WordPress admin (interim) *(HTTPS)*
- [[ELM-desktop.driveConnector]] → [[ELM-drive]] — Reads and writes captures and the offer log *(Drive API)*
- [[ELM-desktop.gmailConnector]] → [[ELM-mail.gmail]] — Searches, drafts and sends with per-action approval; scope label:transport-sales *(Gmail API)*
- [[ELM-desktop.vault]] → [[ELM-drive]] — Mirrored to and from the shared folder *(Google Drive for desktop)*
- [[ELM-iteration1.developerMachine.snapshot]] → [[ELM-iteration1.google]] — Pulls and pushes the shared folder by hand *(rclone)*
- [[ELM-iteration1.operatorMachine.driveApp]] → [[ELM-iteration1.google]] — Mirrors the shared folder *(Google Drive for desktop)*
- [[ELM-iteration1.stakeholderMachine.driveApp]] → [[ELM-iteration1.google]] — Mirrors the shared folder *(Google Drive for desktop)*
- [[ELM-mail.gmail]] → [[ELM-mail.sales]] — Sends as sales@factory.sale (send-as alias) *(SMTP 465)*
- [[ELM-mail.order]] → [[ELM-mail.gmail]] — Redirected *(mail forwarding)*
- [[ELM-mail.sales]] → [[ELM-mail.gmail]] — Forwarded with copy, labelled transport-sales (iteration 1) *(mail forwarding)*

---
*Built by `structurizr-wrap.py` from the model parsed out of [[SRC-fs-workspace-dsl]] (class 3): do not edit — rebuild.*
