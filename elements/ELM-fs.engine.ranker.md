---
id: ELM-fs.engine.ranker
type: element
dcterms_identifier: fs.engine.ranker
sw_kind: component
sw_parent: "[[ELM-fs.engine]]"
sw_technology: "LangGraph node, scikit-learn later"
sw_tags: [Element, Component]
sw_views: ["[[VIEW-fs-engine-components]]"]
dcterms_language: en
prov_wasDerivedFrom: ["[[SRC-fs-workspace-dsl]]"]
pav_createdWith: structurizr-wrap.py
---

# fs.engine.ranker — Offer ranker

Component of [[ELM-fs.engine]] (Orchestration engine).

Computes price_apply = price_offer x 1.3, compiles the comparison list and ranks: a transparent scoring rule first (best price, then delivery time), a decision tree once the labelled offer log supports it (FR-4.02 to FR-4.04, ADR-FS-0007).

**Technology:** LangGraph node, scikit-learn later

## Views

- [[VIEW-fs-engine-components]] — Component View: FS Transportation Selection Agent - Orchestration engine

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
