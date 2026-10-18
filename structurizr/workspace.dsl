# @aspect: FS Transportation Selection Agent (factory.sale) - the process, its iteration-1 tooling and the planned iteration-2 service (Structurizr workspace, C4 L1-L3 + deployment)
# @mode:   as-is for iteration 1 (Wizard-of-Oz tooling, the mail channels, the shared folders); the agent system `fs`, its host and its providers are the planned iteration-2 build (tag Planned)
# @repos:  fs (github.com/aviov/fs)
# @covers: fs:vault/10-spec/system-architecture.md, fs:vault/10-spec/process-steps.md, fs:vault/10-spec/process-flow.md, fs:vault/20-decisions/ADR-0009-separate-transport-email-channel.md, fs:vault/60-guides/connecting-sales-email.md, fs:HANDOFF.md, fs:SETUP.md, fs:instances/README.md; fs-vault-sync:vault-ops/** (the operator's discovery round, 2026-08-27 ... 2026-09-16)
# @test:   structurizr validate + export (README, "Regenerating the pages")
#
# STATUS: agent draft of 2026-10-11 from the repository documents at 89d77d2 and the transfer memo of
# 2026-09-13; master of the project's structure in this vault. Passport with provenance and open facts:
# ../sources/SRC-fs-workspace-dsl.md. Edits here are proposals until the owner commits them.
# Revised 2026-10-11 from the operator's discovery round of 2026-08-27 ... 2026-09-16 on the shared Drive folder
# (interview, maps, rules, findings - sources SRC-202608*/SRC-202609*, FIND-FS-0003..0015, OPP-FS-*, log.md): the shop's
# order notification, Bitrix24's own outreach path, the ACE request tool, the classification and selection rules as
# practised, the customer-confirmation step, the graduated approval gate.
#
# Conventions:
#   hierarchical identifiers; block form with keywords, no positional strings for tags;
#   relationships only in the model; every view has autolayout; properties carry join keys
#   (repo, path, evidence), not catalogue data.
#   Tags: External (not ours), Planned (written, deployed nowhere - the iteration-2 build),
#   Iteration1 (the tooling of the Wizard-of-Oz phase), Database, Folder, Mailbox, Web.
#   Deployment facts of iteration 1 come from HANDOFF.md, SETUP.md and instances/README.md
#   of the repository and from the transfer memo; nothing here was measured by the agent.

workspace "FS Transportation Selection Agent" "Model of the factory.sale transportation-partner selection: the people, the mailboxes, Bitrix24, WooCommerce and the shared Drive folders as they are, the Claude Desktop tooling of iteration 1, and the LangGraph service planned for iteration 2 (dashed)." {

  !identifiers hierarchical

  model {

    # --- people ------------------------------------------------------------------
    customer = person "Customer" "Places an order in the factory.sale shop; the shop's order notification arrives at order@factory.sale. Says yes to the marked-up transport price before any partner is confirmed (ADR-FS-0015)." {
      tags "External"
    }
    operator = person "Transportation operator" "factory.sale staff member who runs the partner-selection process day to day, alone and end to end: about two years in the role, 5-20 inquiries a week (interview of 2026-09-16). Looks dimensions up in the HUUM sheet, re-keys ACE requests, filters partners by destination and customer type, chooses by the 10 % rule, sends the customer price offer personally and approves every outbound email until 20 successful cycles are done (ADR-FS-0013 ... ADR-FS-0016)."
    stakeholder = person "Stakeholder" "Management and the project manager: answer the question sheet, define the WooCommerce data, keep the Logistika folder current, own the iteration gates."
    developer = person "Developer" "Owns the git master of the project documentation, curates the machines' captures into it, builds the agent in iteration 2."
    partner = person "Transport partner" "Carrier that receives inquiries and follow-ups and replies with offers and confirmations by email. Named so far: ACE Logistics (its own request tool, replies within the hour), Delamode (manual email; declares customs for private customers to the UK, Northern Ireland and Norway), Gerava (reached from Bitrix24) - PER-ace, PER-delamode, PER-gerava." {
      tags "External"
    }

    # --- systems as they are -----------------------------------------------------
    bitrix24 = softwareSystem "Bitrix24" "CRM of factory.sale: order and product records (width, height, length, weight, quantity). Order data enters the process from here, never from email. No first-party Claude connector: browser and paste in iteration 1, REST webhooks later. Can send partner outreach itself, outside Gmail (Gerava, Deal #7131, 2026-09-09); the Bitrix24-Gmail connection is being worked on (open setup item 10, HZ-FS-0003)." {
      tags "External"
      properties {
        evidence "fs:vault/10-spec/SRS.md@89d77d2 FR-1.01; fs:SETUP.md@89d77d2 Part D; fs:vault/20-decisions/ADR-0009-separate-transport-email-channel.md@89d77d2; fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-gerava-no-email-trail.md"
      }
    }
    woocommerce = softwareSystem "WooCommerce shop" "WordPress/WooCommerce storefront of factory.sale: product data today, the intended home of the product and logistics-rule data (ADR-FS-0010). No API for the agent yet: interim access through the WordPress admin in Chrome (ADR-FS-0011). Sends the order notification 'Uus Factory.Sale päring' to order@factory.sale - product name, quantity, price, customer and delivery details, no dimensions (FIND-FS-0009)." {
      tags "External"
      properties {
        evidence "transfer memo 2026-09-13 (SRC-20260913-memo-transfer), section 3; fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-08-27-order-data-missing-dimensions.md"
      }
    }
    aceTool = softwareSystem "ACE price-request tool (Raktio Oy)" "Semi-automated price request of the partner ACE Logistics: the operator re-keys the shipment data (weight, volume, dimensions, tail-lift flags, planned date) into it, the request goes out as a system message from askforoffer@ace.ee, and ACE's priced reply returns to the mailbox within the hour (Deal #7131: 31 minutes). The tedious step of the process for the operator. How it accepts input - web form or a Bitrix24 button - is open (setup item 14, OPP-FS-0004)." {
      tags "External"
      properties {
        evidence "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-ace-vs-delamode-process-differs.md; fs-vault-sync:vault-ops/opportunities/OPP-0004-manual-ace-data-entry.md"
      }
    }
    mail = softwareSystem "Email channels" "The mailboxes of the process: order intake and the transport-partner channel, merged into one Gmail inbox for iteration 1 (ADR-FS-0009)." {
      tags "External"
      order = container "order@factory.sale" "Order-intake address of the factory.sale domain, redirected to the operator's Gmail inbox. Receives the shop's order notification 'Uus Factory.Sale päring': product name, quantity, price, customer and delivery details, no dimensions (FIND-FS-0009). Read by a human (process step 3); the agent never reads it." "factory.sale mail" {
        tags "Mailbox"
      }
      sales = container "sales@factory.sale" "Dedicated transport channel: outreach, follow-ups and confirmation requests are sent from it, offers and confirmations arrive to it. Domain registered at zone.ee, mailbox hosted at Radicenter: IMAP 993 and SMTP 465, no API; the host name is to be confirmed in the Radicenter panel. Delamode's request of Deal #7131 went out from it by hand, through the Gmail alias (FIND-FS-0013)." "Radicenter mailbox (DirectAdmin)" {
        tags "Mailbox"
      }
      gmail = container "evaprual.factorysale@gmail.com" "Gmail inbox of the operator and the account connected to Claude Desktop: order@ is redirected here; sales@factory.sale is a working send-as alias on it (two of three test mails of 2026-08-27 went out as 'Eva Prual / Factory.Sale <sales@factory.sale>', FIND-FS-0007), whether sales@ mail also arrives here is unconfirmed (open setup item 1); the planned separation of the two streams is by the labels transport-sales and transport-orders (ADR-FS-0009). Order notifications share one subject, so unrelated inquiries thread together (FIND-FS-0004)." "Gmail" {
        tags "Mailbox" "Iteration1"
      }
    }
    drive = softwareSystem "Google Drive shared folders" "Shared folders of the small team: the documentation sync hub, the live offer log, the Logistika rules folder and the Huum product folder." {
      tags "External"
      sync = container "fs-vault-sync" "Hub of the hub-and-spoke documentation flow: the operator and stakeholder instances (vault-ops, vault-sh) pushed by Google Drive for desktop, a findings-inbox for quick drops, the offer log. The developer pulls it as an rclone snapshot. Since the discovery round of 2026-08-27 ... 2026-09-16 vault-ops also holds the product dimension sheet data/huum-toodete-kaalud-moodud.xlsx (SRC-20260827-huum-product-sheet), the reference rules, the discovery maps, the interview, the report, six opportunities and the open setup items." "Google Drive folder" {
        tags "Folder" "Iteration1"
      }
      offerLog = container "Offer log" "Live offer/decision log of iteration 1: one row per offer received (inquiry, route, partner, prices, delivery time); chosen yes/no is the label for the future ranker. A Google Sheet at the root of fs-vault-sync (FIND-FS-0001); the CSV in the repository is only the schema." "Google Sheet" {
        tags "Folder" "Iteration1"
      }
      logistika = container "Logistika folder" "Rules and operational data of logistics as the business keeps them today; the source of the data model and the interim datastore (ADR-FS-0012)." "Google Drive folder" {
        tags "Folder"
      }
      huum = container "Huum product folder" "Product data folder shared with the team and synced to desktops by Google Drive for desktop; the interim product-data source until WooCommerce has an API (ADR-FS-0011)." "Google Drive folder" {
        tags "Folder"
      }
    }
    desktop = softwareSystem "Claude Desktop (company account)" "Iteration-1 operator tooling: Claude Desktop on the company account, where the connectors and credentials live, operating the process by hand with the operator's approval before every outbound email." {
      tags "Iteration1"
      gmailConnector = container "Gmail connector" "Native connector, one Google account; searches, drafts and sends with per-action approval, which is the approval gate. It has no from parameter: mail goes out as the account's own address or as a verified alias picked by the human in the Gmail UI (FIND-FS-0007, FIND-FS-0008). The agent's scope is the label transport-sales only." "Anthropic connector" {
        tags "Iteration1"
      }
      driveConnector = container "Google Drive connector" "Reads and writes the shared folders through the Drive API; optional, used for the offer log and quick findings." "Anthropic connector" {
        tags "Iteration1"
      }
      chrome = container "Chrome (Claude in Chrome)" "Browser access to WooCommerce through the WordPress admin page while the shop has no API for the agent (ADR-FS-0011)." "Chrome browser" {
        tags "Iteration1"
      }
      vault = container "Instance vault" "Plain folder on the machine's disk opened as the working folder: operating checklist, approval gate, timeouts, offer-log guide, findings-inbox and the process-discovery skill (vault-ops for the operator, vault-sh for stakeholders). Seeded from the repository, synced to fs-vault-sync by Google Drive for desktop. The operator's copy carries the discovery round of 2026-08-27 ... 2026-09-16 (reference rules, maps, interview, report, opportunities, open setup items) that the repository has not absorbed (DC-FS-0003)." "Markdown folder (Obsidian)" {
        tags "Folder" "Iteration1"
        properties {
          repo "fs"
          path "instances/vault-ops, instances/vault-sh"
        }
      }
    }

    # --- providers of the planned service ----------------------------------------
    llm = softwareSystem "LLM API" "Model provider for parsing partner emails into structured offers and confirmations; the model is confirmed at build time and recorded as a decision." {
      tags "External" "Planned"
    }
    langsmith = softwareSystem "LangSmith" "Observability of the LangGraph runs: a trace per thread, prompt logging, extraction failures." {
      tags "External" "Planned"
    }
    orderWebhook = softwareSystem "Order webhook consumer" "Subscriber of the final POST on partner confirmation (FR-5.05): proceeds with the order; in future a higher-level agent." {
      tags "External" "Planned"
    }

    # --- the planned service -----------------------------------------------------
    fs = softwareSystem "FS Transportation Selection Agent" "The iteration-2 service: reads order data from Bitrix24, classifies pallets, prices standard pallets, runs partner outreach by email, parses offers, ranks them and routes a recommendation to a human before confirming with the partner. Repository fs, package fstransport (empty until iteration 2)." {
      tags "Planned"
      properties {
        repo "fs"
        path "fstransport/"
        evidence "fs:vault/10-spec/system-architecture.md@89d77d2"
      }
      api = container "API gateway" "Stateless FastAPI router with OpenAPI and OAuth2 at the entrypoints: webhooks for Bitrix24 inquiries and incoming partner email, the pending-review list and the approve endpoint for the dashboard." "Python, FastAPI" {
        tags "Planned"
      }
      engine = container "Orchestration engine" "Stateful LangGraph graph of the process with a Pydantic state (is_standard_pallet, offers_list, current_retry_count, fast_track) and an interrupt before the human-review node; state checkpoints in PostgreSQL (PostgresSaver)." "Python, LangGraph" {
        tags "Planned"
        readOrder = component "Read Bitrix24 data" "Deterministic: order and product data through the Bitrix24 REST API (FR-1.01)." "LangGraph node"
        classify = component "Pallet classifier" "Deterministic: is_standard_pallet from the dimensions and weight looked up per product in the HUUM sheet - never from the order mail, which carries none - against L 1200 x W 800 x H 1000 mm and 200 kg, for a single item and for the sum of a multi-item order; derives n_transported_pallets (FR-1.02, ADR-FS-0001, ADR-FS-0013)." "LangGraph node"
        pricing = component "Fast-track pricing" "Deterministic: fuel_cost_index x transport_list_price x n_transported_pallets for standard pallets (FR-2.01, ADR-FS-0001); the fuel index source is open (ADR-FS-0006)." "LangGraph node"
        outreach = component "Outreach and follow-up" "Deterministic: inquiry, follow-up and confirmation-request emails from templates and variables; recipient list filtered from the partner directory; timeouts and the follow-up cap (FR-3.01 to FR-3.04, ADR-FS-0004)." "LangGraph node"
        parseEmail = component "Email parser" "LLM: extracts price, dates and locations from partner replies into the offer schema; parses confirmation replies (FR-4.01, FR-5.04)." "LangGraph node, LLM call"
        ranker = component "Offer ranker" "Computes price_apply = price_offer x 1.3, compiles the comparison list and ranks: first the eligibility filter by destination and customer type (Delamode alone declares customs for private customers to the UK, Northern Ireland and Norway), then the trusted partner unless a competitor is more than 10 % cheaper, delivery time as the tiebreaker; quality means fewer damages, better communication, accurate delivery times (FR-4.02 to FR-4.04; ADR-FS-0014 replacing 'best price, then delivery time'; a decision tree later, ADR-FS-0007). The chosen column of the offer log alone would teach the wrong rule." "LangGraph node, scikit-learn later"
        hitl = component "Human review interrupt" "LangGraph state interruption before the human-review node; the graph resumes on the dashboard decision and drops a rejected offer (FR-5.01 to FR-5.03). The final offer choice stays with the operator; the approval of every outbound email is a graduated control that lifts after 20 successful full cycles on the operator's explicit go-ahead (ADR-FS-0016)." "LangGraph interrupt"
        customerConfirm = component "Customer price confirmation" "Compiles the customer price (transport cost x 1.3), sends it to the customer and waits for the explicit yes before any partner confirmation - a step the SRS and the process flow do not have; today the operator drafts and sends it personally (ADR-FS-0015, OPP-FS-0006)." "LangGraph node, interrupt"
        proceed = component "Proceed to order" "Deterministic: POST to the subscribed webhook on final partner confirmation (FR-5.05)." "LangGraph node"
      }
      dashboard = container "Review dashboard" "UI of the human-in-the-loop: pending recommendations, approve or reject, the fast-track checkbox per shipment (ADR-FS-0004)." "React or Vue" {
        tags "Planned" "Web"
      }
      db = container "Database" "Offers and comparison lists, audit log, LangGraph state checkpoints." "PostgreSQL" {
        tags "Planned" "Database"
      }
      cache = container "Cache" "Transient cache: API throttling, session tokens." "Redis" {
        tags "Planned" "Database"
      }
      mailAdapter = container "Mail adapter" "Sends outreach and reads partner replies on the transport channel only: an IMAP/SMTP adapter against the Radicenter mailbox (the leaning of ADR-FS-0008) or an email-API inbound-parse webhook; order mail is never read." "IMAP/SMTP, or SendGrid/Mailgun webhook" {
        tags "Planned"
      }
    }

    # --- iteration 1: the process by hand ------------------------------------------
    customer -> woocommerce "Places an order" "web shop"
    woocommerce -> mail.order "Order notification 'Uus Factory.Sale päring'" "email"
    bitrix24 -> partner "Partner outreach sent directly from Bitrix24 (Gerava, Deal #7131) - invisible in Gmail" "email"
    operator -> aceTool "Re-keys the shipment data to trigger ACE's price request" "web form (to confirm)"
    aceTool -> partner "Structured price request from askforoffer@ace.ee" "email"
    operator -> customer "Sends the customer price offer personally; waits for the yes" "email"
    mail.order -> mail.gmail "Redirected" "mail forwarding"
    mail.sales -> mail.gmail "Forwarded with copy, labelled transport-sales (iteration 1)" "mail forwarding"
    mail.gmail -> mail.sales "Sends as sales@factory.sale (send-as alias)" "SMTP 465"
    mail.sales -> partner "Inquiry, follow-up, confirmation request" "email"
    partner -> mail.sales "Offer, confirmation reply" "email"
    operator -> mail.gmail "Reads order inquiries (transport-orders) and partner mail (transport-sales)" "Gmail web"
    operator -> bitrix24 "Transfers the inquiry from email; reads order and product data" "browser"
    operator -> desktop "Runs the process by hand with the agent; approves every outbound email" "Claude Desktop"
    operator -> drive.offerLog "Logs every offer and which one was chosen" "Google Sheets"
    desktop.gmailConnector -> mail.gmail "Searches, drafts and sends with per-action approval; scope label:transport-sales" "Gmail API"
    desktop.driveConnector -> drive.sync "Reads and writes captures and the offer log" "Drive API"
    desktop.vault -> drive.sync "Mirrored to and from the shared folder" "Google Drive for desktop"
    desktop.chrome -> woocommerce "Reads product data through the WordPress admin (interim)" "HTTPS"
    desktop -> drive.huum "Reads product data from the locally synced folder (interim)" "local files"
    stakeholder -> desktop "Discovery interviews and planning (vault-sh, process-discovery skill)" "Claude Desktop"
    stakeholder -> drive.logistika "Keeps rules and operational data current" "Google Drive"
    stakeholder -> woocommerce "Defines the product and logistics-rule data" "workshop"
    developer -> drive.sync "Pulls captures as an rclone snapshot; pushes back reference notes" "rclone"
    developer -> drive.logistika "Derives the data model and the interim datastore" "analysis"
    developer -> drive.offerLog "Takes the labelled dataset for the ranker" "export"
    developer -> fs "Builds in iteration 2 from the vault's spec and findings" "Claude Code"

    # --- iteration 2: the service --------------------------------------------------
    bitrix24 -> fs.api "Order inquiry webhook" "HTTPS, POST /v1/webhooks/bitrix24"
    fs.api -> fs.engine "Triggers or resumes the graph thread" "in-process"
    fs.api -> fs.cache "Throttling, session tokens" "Redis protocol"
    fs.engine.readOrder -> bitrix24 "Reads order and product data" "Bitrix24 REST API"
    fs.engine.outreach -> fs.mailAdapter "Sends inquiries, follow-ups and confirmation requests" "in-process"
    fs.mailAdapter -> mail.sales "Sends as sales@; reads partner replies" "IMAP 993 / SMTP 465"
    fs.mailAdapter -> fs.engine.parseEmail "Delivers partner replies" "in-process"
    fs.engine.parseEmail -> llm "Structured extraction of offers and confirmations" "HTTPS"
    fs.engine.hitl -> fs.db "Flushes the state at the interrupt (PostgresSaver)" "SQL"
    fs.engine -> fs.db "Checkpoints the state; stores offers, comparison lists and audits" "SQL"
    fs.engine.proceed -> orderWebhook "POST on final confirmation" "HTTPS webhook"
    fs.engine.customerConfirm -> customer "Price offer; waits for the customer's yes" "email"
    fs.engine -> langsmith "Traces per thread, prompt logging" "HTTPS"
    fs.dashboard -> fs.api "Lists pending reviews; submits approve or reject" "REST"
    operator -> fs.dashboard "Reviews the recommended offer; approves or rejects; sets fast-track" "browser"

    # --- deployment ----------------------------------------------------------------
    iteration1 = deploymentEnvironment "Iteration 1 - Wizard-of-Oz" {
      operatorMachine = deploymentNode "Operator machine" "Desktop of the transportation operator; the company's Claude Desktop account." "Windows or macOS" {
        claudeApp = deploymentNode "Claude Desktop" "" "desktop app" {
          containerInstance desktop.gmailConnector
          containerInstance desktop.driveConnector
          containerInstance desktop.chrome
        }
        driveApp = deploymentNode "Google Drive for desktop" "Mirrors fs-vault-sync/vault-ops to disk." "sync client" {
          containerInstance desktop.vault
        }
      }
      stakeholderMachine = deploymentNode "Stakeholder machine" "Desktop of a stakeholder; vault-sh for discovery interviews." "Windows or macOS" {
        claudeApp = deploymentNode "Claude Desktop" "" "desktop app" {
          containerInstance desktop.driveConnector
        }
        driveApp = deploymentNode "Google Drive for desktop" "Mirrors fs-vault-sync/vault-sh to disk." "sync client" {
          containerInstance desktop.vault
        }
      }
      developerMachine = deploymentNode "Developer machine" "Linux desktop of the developer: no Google Drive desktop client, the shared folder is pulled as an rclone snapshot." "Ubuntu" {
        gitMaster = infrastructureNode "git master" "Clone of github.com/aviov/fs at ~/factory.sale/fs: the only writer of the project documentation." "git"
        snapshot = infrastructureNode "rclone snapshot" "~/factory.sale/fs-vault-sync: a copy of the shared folder pulled by hand (2026-08-27, 2026-10-11)." "rclone, remote andrei:"
        vaultFs = infrastructureNode "vault-fs" "This vault at ~/factory.sale/vault-fs: the owner's record of the project in the federation's form, beside the clone; symlinked into the federation root." "Obsidian, federation vault"
      }
      google = deploymentNode "Google" "Google Drive and Gmail." "cloud" {
        softwareSystemInstance drive
        containerInstance mail.gmail
      }
      radicenter = deploymentNode "Radicenter mail hosting" "Mailboxes of the factory.sale domain (domain at zone.ee); order@ is assumed on the same hosting, to confirm." "DirectAdmin mail" {
        containerInstance mail.sales
        containerInstance mail.order
      }
      bitrixCloud = deploymentNode "Bitrix24 cloud" "" "SaaS" {
        softwareSystemInstance bitrix24
      }
      wordpress = deploymentNode "WordPress hosting" "Host of the factory.sale shop; not identified." "WordPress, WooCommerce" {
        softwareSystemInstance woocommerce
      }
      iteration1.developerMachine.snapshot -> iteration1.google "Pulls and pushes the shared folder by hand" "rclone"
      iteration1.operatorMachine.driveApp -> iteration1.google "Mirrors the shared folder" "Google Drive for desktop"
      iteration1.stakeholderMachine.driveApp -> iteration1.google "Mirrors the shared folder" "Google Drive for desktop"
    }

    iteration2 = deploymentEnvironment "Iteration 2 - target" {
      agentHost = deploymentNode "Agent host" "Where the service runs: not decided (cloud VM or a company server)." "to be decided" {
        tags "Planned"
        containerInstance fs.api
        containerInstance fs.engine
        containerInstance fs.dashboard
        containerInstance fs.mailAdapter
        containerInstance fs.db
        containerInstance fs.cache
      }
      operatorMachine = deploymentNode "Operator machine" "The operator reviews recommendations in the dashboard; Claude Desktop stays for discovery and captures." "Windows or macOS" {
        containerInstance desktop.vault
      }
      google = deploymentNode "Google" "" "cloud" {
        softwareSystemInstance drive
        containerInstance mail.gmail
      }
      radicenter = deploymentNode "Radicenter mail hosting" "" "DirectAdmin mail" {
        containerInstance mail.sales
        containerInstance mail.order
      }
      bitrixCloud = deploymentNode "Bitrix24 cloud" "" "SaaS" {
        softwareSystemInstance bitrix24
      }
      wordpress = deploymentNode "WordPress hosting" "" "WordPress, WooCommerce" {
        softwareSystemInstance woocommerce
      }
      llmProvider = deploymentNode "LLM provider" "Anthropic or OpenAI; the model is confirmed at build time." "API" {
        softwareSystemInstance llm
      }
      langsmithCloud = deploymentNode "LangSmith" "SaaS or self-hosted; not decided." "API" {
        softwareSystemInstance langsmith
      }
      orderSystem = deploymentNode "Order system" "Consumer of the final webhook; not identified." "to be decided" {
        softwareSystemInstance orderWebhook
      }
    }
  }

  views {
    systemLandscape "fs-landscape" "People, the systems as they are and the agent: iteration-1 tooling in light blue, the planned iteration-2 service dashed" {
      include *
      autolayout lr
    }
    systemContext fs "fs-context" "The planned agent service in its context" {
      include *
      autolayout lr
    }
    container fs "fs-containers" "Containers of the agent service and what they talk to" {
      include *
      autolayout lr
    }
    component fs.engine "fs-engine-components" "The LangGraph nodes of the process and their external calls" {
      include *
      autolayout lr
    }
    container mail "fs-email-channels" "The two mailboxes and the iteration-1 single-inbox merge (ADR-FS-0009)" {
      include *
      autolayout lr
    }
    container desktop "fs-iteration-1-tooling" "Claude Desktop on the company account: connectors, the browser, the instance vault" {
      include *
      autolayout lr
    }
    container drive "fs-shared-folders" "The shared Google Drive folders and who reads and writes them" {
      include *
      autolayout lr
    }
    deployment * "Iteration 1 - Wizard-of-Oz" "fs-deployment-iteration-1" "Where the iteration-1 tooling runs" {
      include *
      autolayout lr
    }
    deployment * "Iteration 2 - target" "fs-deployment-iteration-2" "Where the service would run; the agent host is not decided" {
      include *
      autolayout lr
    }

    styles {
      # what a diagram shows: the name and the kind with its technology; descriptions stay in the model,
      # in the diagram tooltip and on the element pages
      element "Element" {
        description false
        height 200
      }
      relationship "Relationship" {
        description false
      }
      element "Person" {
        shape person
        height 300
      }
      element "External" {
        background #bdbdbd
        color #000000
      }
      element "Iteration1" {
        background #e3f2fd
        color #000000
      }
      element "Planned" {
        border dashed
      }
      element "Database" {
        shape cylinder
      }
      element "Folder" {
        shape folder
      }
      element "Mailbox" {
        shape roundedBox
      }
      element "Web" {
        shape webBrowser
      }
    }
  }
}
