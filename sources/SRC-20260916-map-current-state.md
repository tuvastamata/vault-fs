---
id: SRC-20260916-map-current-state
type: source
fed_kind: diagram
prov_wasAttributedTo: [eva]
pav_importedFrom: "fs-vault-sync:vault-ops/discovery-maps/current-state.md@2026-09-16"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs-vault-sync:vault-ops/discovery-maps/current-state.md"
dcterms_title: "Transportation partner selection — current-state process map (2026-09-16)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-09-16
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_isPartOf: ["[[LINE-fs-build]]", "[[LINE-fs-outreach-and-offers]]"]
---

# Transportation partner selection — Current state

> Imported verbatim from `fs-vault-sync:vault-ops/discovery-maps/current-state.md` (file time 2026-09-16 12:30, sha256 `f6eb5de24918e20d…`) on 2026-10-11: the Mermaid map of the process as practised, with the pain points; the notes below the diagram carry the anchors. Recorded fields: title: "Transportation partner selection — Current state", process: Transportation partner selection, state: current, interviewee: Operator (order@factory.sale), date: 2026-09-16, tags: [process, discovery, diagram]. Written in the operator's instance vault by the operator's Claude Desktop during the discovery round; the operator is Eva, [[PER-eva]]. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`. The shared folder's copy may move on, this text does not.

> Node legend: `[rect]` deterministic/system step · `{diamond}` decision ·
> `([round])` start/end · **⚠️** pain point (see the opportunities [[OPP-FS-0001]] ... [[OPP-FS-0006]] for details). ^q01

```mermaid
flowchart TD
    Start(["Inquiry arrives<br/>order@factory.sale"]) --> BX["Sync to Bitrix24"]
    BX --> RD["Read product data<br/>⚠️ no width/height/length/weight<br/>in the order email itself"]
    RD --> LOOKUP["Look up dims/weight in<br/>product sheet (data/huum-...xlsx)"]
    LOOKUP --> CLS{"Classify:<br/>standard or not?<br/>(single item OR summed<br/>multi-item vs 1200×800×1000mm/200kg)"}
    CLS -- Standard --> FT["Compute fast-track price"]
    FT --> CUST
    CLS -- Non-standard --> ELIG["Filter eligible partners<br/>by destination + customer type<br/>(e.g. Delamode: private+UK/NI/Norway)"]
    ELIG --> DRAFT["Draft outreach per partner<br/>⚠️ ACE/Raktio Oy path needs<br/>manual re-entry of shipment data"]
    DRAFT --> APR1{{"APPROVAL REQUIRED<br/>(approval-gate)"}}
    APR1 --> SEND["Send outreach<br/>(sales@factory.sale —<br/>⚠️ connection status unclear)"]
    SEND --> WAIT["Wait / follow up<br/>per timeouts.md<br/>(real Deal #7131: ~30–90 min)"]
    WAIT --> LOG["Log offers, apply ×1.3<br/>⚠️ partners often reply in<br/>non-comparable formats"]
    LOG --> CMP["Compare eligible offers:<br/>trusted partner unless a<br/>competitor is &gt;10% cheaper<br/>+ quality (damages, comms, ETA)"]
    CMP --> CUST["Compile customer price (×1.3),<br/>send to customer yourself<br/>(always manual, not delegated)"]
    CUST --> CWAIT{"Customer says yes?<br/>⚠️ nothing proceeds<br/>until this happens"}
    CWAIT -- No / silence --> CUST
    CWAIT -- Yes --> CONF["Confirm with selected partner"]
    CONF --> APR2{{"APPROVAL REQUIRED<br/>(approval-gate)"}}
    APR2 --> PCONF{"Partner confirmed?"}
    PCONF -- No --> CMP
    PCONF -- Yes --> ORD(["Proceed to order"])

    BX -.->|"⚠️ Bitrix24 can also send<br/>outreach directly, bypassing<br/>Gmail entirely (seen with Gerava)"| DRAFT
```

## Notes
- Systems touched: Bitrix24, `order@factory.sale` → Gmail (`evaprual.factorysale@gmail.com`),
  `sales@factory.sale` (partner channel, connection status open — see
  [[SRC-20260916-ops-open-setup-items]] #1–2), the ACE/Raktio Oy semi-automated request tool, the
  offer-log Google Sheet, the HUUM product dimension sheet. ^n01
- Handoffs: Bitrix24/webshop → operator (in); operator → transport partners → operator (offer
  round-trip); operator → customer → operator (price confirmation round-trip); operator → chosen
  partner (final confirm). One person (the operator) holds the entire process end to end — no
  handoff to a colleague was identified. ^n02
- Exceptions not shown as a step (they interrupt at delivery, not before): truck can't access
  site (road conditions), customer forgets they must organize unloading, new-development address
  can't be found — see [[OPP-FS-0001]],
  [[OPP-FS-0002]],
  [[OPP-FS-0003]]. ^n03
- Pain points marked ⚠️ above are detailed in the opportunities list
  ([[OPP-FS-0001|OPP-0001]] through
  [[OPP-FS-0006|OPP-0006]]) and in
  `operating/findings-inbox/`. ^n04
