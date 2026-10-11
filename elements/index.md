# Elements — wrappers of the Structurizr model (built)

Built by `structurizr-wrap.py` from the workspace *FS Transportation Selection Agent* — workspace JSON supplied by the caller (`structurizr-cli export -format json` of `structurizr/workspace.dsl`); DSL sha256 `552acd54bb2b074325498793b96aad703208f952cc7e2b01203d85cd26070743`; passport [[SRC-fs-workspace-dsl]]. Class 3: do not edit — rebuild. 62 elements, 9 views.

Keys are DSL identifiers (`ELM-<identifier>`); instances are listed under the deployment nodes that host them.

## People

- [[ELM-customer]] — Customer
- [[ELM-developer]] — Developer
- [[ELM-operator]] — Transportation operator
- [[ELM-partner]] — Transport partner
- [[ELM-stakeholder]] — Stakeholder

## Software systems

- [[ELM-bitrix24]] — Bitrix24
- [[ELM-desktop]] — Claude Desktop (company account)
  - [[ELM-desktop.chrome]] — Chrome (Claude in Chrome) (container)
  - [[ELM-desktop.driveConnector]] — Google Drive connector (container)
  - [[ELM-desktop.gmailConnector]] — Gmail connector (container)
  - [[ELM-desktop.vault]] — Instance vault (container)
- [[ELM-drive]] — Google Drive shared folders
  - [[ELM-drive.huum]] — Huum product folder (container)
  - [[ELM-drive.logistika]] — Logistika folder (container)
  - [[ELM-drive.offerLog]] — Offer log (container)
  - [[ELM-drive.sync]] — fs-vault-sync (container)
- [[ELM-fs]] — FS Transportation Selection Agent
  - [[ELM-fs.api]] — API gateway (container)
  - [[ELM-fs.cache]] — Cache (container)
  - [[ELM-fs.dashboard]] — Review dashboard (container)
  - [[ELM-fs.db]] — Database (container)
  - [[ELM-fs.engine]] — Orchestration engine (container)
    - [[ELM-fs.engine.classify]] — Pallet classifier (component)
    - [[ELM-fs.engine.hitl]] — Human review interrupt (component)
    - [[ELM-fs.engine.outreach]] — Outreach and follow-up (component)
    - [[ELM-fs.engine.parseEmail]] — Email parser (component)
    - [[ELM-fs.engine.pricing]] — Fast-track pricing (component)
    - [[ELM-fs.engine.proceed]] — Proceed to order (component)
    - [[ELM-fs.engine.ranker]] — Offer ranker (component)
    - [[ELM-fs.engine.readOrder]] — Read Bitrix24 data (component)
  - [[ELM-fs.mailAdapter]] — Mail adapter (container)
- [[ELM-langsmith]] — LangSmith
- [[ELM-llm]] — LLM API
- [[ELM-mail]] — Email channels
  - [[ELM-mail.gmail]] — evaprual.factorysale@gmail.com (container)
  - [[ELM-mail.order]] — order@factory.sale (container)
  - [[ELM-mail.sales]] — sales@factory.sale (container)
- [[ELM-orderWebhook]] — Order webhook consumer
- [[ELM-woocommerce]] — WooCommerce shop

## Deployment

### Iteration 1 - Wizard-of-Oz

- [[ELM-iteration1.bitrixCloud]] — Bitrix24 cloud (deployment node)
  - [[ELM-bitrix24]]
- [[ELM-iteration1.developerMachine]] — Developer machine (deployment node)
  - [[ELM-iteration1.developerMachine.gitMaster]] — git master (infrastructure node)
  - [[ELM-iteration1.developerMachine.snapshot]] — rclone snapshot (infrastructure node)
  - [[ELM-iteration1.developerMachine.vaultFs]] — vault-fs (infrastructure node)
- [[ELM-iteration1.google]] — Google (deployment node)
  - [[ELM-drive]]
  - [[ELM-mail.gmail]]
- [[ELM-iteration1.operatorMachine]] — Operator machine (deployment node)
  - [[ELM-iteration1.operatorMachine.claudeApp]] — Claude Desktop (deployment node)
    - [[ELM-desktop.chrome]]
    - [[ELM-desktop.driveConnector]]
    - [[ELM-desktop.gmailConnector]]
  - [[ELM-iteration1.operatorMachine.driveApp]] — Google Drive for desktop (deployment node)
    - [[ELM-desktop.vault]]
- [[ELM-iteration1.radicenter]] — Radicenter mail hosting (deployment node)
  - [[ELM-mail.order]]
  - [[ELM-mail.sales]]
- [[ELM-iteration1.stakeholderMachine]] — Stakeholder machine (deployment node)
  - [[ELM-iteration1.stakeholderMachine.claudeApp]] — Claude Desktop (deployment node)
    - [[ELM-desktop.driveConnector]]
  - [[ELM-iteration1.stakeholderMachine.driveApp]] — Google Drive for desktop (deployment node)
    - [[ELM-desktop.vault]]
- [[ELM-iteration1.wordpress]] — WordPress hosting (deployment node)
  - [[ELM-woocommerce]]

### Iteration 2 - target

- [[ELM-iteration2.agentHost]] — Agent host (deployment node)
  - [[ELM-fs.api]]
  - [[ELM-fs.cache]]
  - [[ELM-fs.dashboard]]
  - [[ELM-fs.db]]
  - [[ELM-fs.engine]]
  - [[ELM-fs.mailAdapter]]
- [[ELM-iteration2.bitrixCloud]] — Bitrix24 cloud (deployment node)
  - [[ELM-bitrix24]]
- [[ELM-iteration2.google]] — Google (deployment node)
  - [[ELM-drive]]
  - [[ELM-mail.gmail]]
- [[ELM-iteration2.langsmithCloud]] — LangSmith (deployment node)
  - [[ELM-langsmith]]
- [[ELM-iteration2.llmProvider]] — LLM provider (deployment node)
  - [[ELM-llm]]
- [[ELM-iteration2.operatorMachine]] — Operator machine (deployment node)
  - [[ELM-desktop.vault]]
- [[ELM-iteration2.orderSystem]] — Order system (deployment node)
  - [[ELM-orderWebhook]]
- [[ELM-iteration2.radicenter]] — Radicenter mail hosting (deployment node)
  - [[ELM-mail.order]]
  - [[ELM-mail.sales]]
- [[ELM-iteration2.wordpress]] — WordPress hosting (deployment node)
  - [[ELM-woocommerce]]

