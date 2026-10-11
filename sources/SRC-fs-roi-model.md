---
id: SRC-fs-roi-model
type: source
fed_kind: doc
pav_importedFrom: "fs:vault/50-playbook/roi-model.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/50-playbook/roi-model.md@89d77d2"
dcterms_title: "ROI model"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-06
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-build]]"]
---

# ROI model

> Imported verbatim from `fs:vault/50-playbook/roi-model.md@89d77d2` on 2026-10-11 (first committed 2026-08-06): the costing method of the playbook; assumptions unfilled. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

Consistent, transparent method for costing each opportunity. Keep assumptions here so every
number in [[SRC-fs-playbook]] is comparable and auditable. Mark estimates as ~.

## Assumptions (fill for this company)
| Assumption | Value | Note |
|------------|-------|------|
| Loaded labour rate (per hour) | ~€__ | ops staff, fully loaded |
| Working weeks / year | ~46 | after holidays |
| Tool / LLM cost per instance | ~€__ | filled once the agent runs |
| Implementation cost (one-off) | per opportunity | dev time × rate |

## Per-opportunity calculation
For each opportunity, from the discovery **measurements**:

```
annual_volume        = instances_per_week × working_weeks
time_saved_per_inst  = current_handson_time − expected_handson_time   (hours)
gross_annual_saving  = annual_volume × time_saved_per_inst × labour_rate
+ error/rework saving = annual_volume × rework_rate_reduction × rework_cost
− annual_running_cost = annual_volume × tool_cost_per_instance
= net_annual_benefit
payback_months       = implementation_cost / (net_annual_benefit / 12)
```

Also capture non-monetary benefits (speed to partner, fewer dropped inquiries, staff
experience) qualitatively — they often drive the decision even when the euro figure is modest.

## Prioritization
Rank by a simple score until there's reason for more: **net_annual_benefit ÷ implementation
cost**, with payback under ~12 months flagged as quick wins. Note dependencies (some
opportunities unlock others).
