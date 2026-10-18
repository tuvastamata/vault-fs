---
id: FIND-FS-0014
type: statement
fed_kind: finding
fed_modality: opinion
fed_status: proposed
pav_authoredOn: 2026-09-09
pav_importedFrom: "fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-price-not-only-decision-factor.md@2026-09-09"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "\"Best price, then delivery time\" isn't the real decision rule — partner quality overrides small price gaps"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-vault-sync]]"
dcterms_subject: ["[[ELM-fs.engine.ranker]]", "[[ELM-drive.offerLog]]", "[[ADR-FS-0014]]", "[[ADR-FS-0007]]", "[[SRC-fs-srs#^FR-4-02]]", "[[SRC-20260909-ops-offer-selection-rule]]"]
dcterms_isPartOf: ["[[LINE-fs-pricing-and-partner-selection]]", "[[LINE-fs-outreach-and-offers]]"]
sw_logStatus: resolved
sw_statusNote: "resolved 2026-09-09: the 10 % band and the quality criteria (ADR-FS-0014); the repository's spec and ADR-FS-0007 still say 'best price, then delivery time' (DC-FS-0003)"
sw_severity: high
sw_covers: ["fs:fstransport/**", "fs:vault/10-spec/SRS.md", "fs:vault/20-decisions/ADR-0007-ranker-cold-start.md"]
sw_repos: [fs]
tags: [nav/iteration-1, nav/data-gap]
---

# FIND-FS-0014: "Best price, then delivery time" isn't the real decision rule — partner quality overrides small price gaps

> Capture in the operator's instance vault on the shared Drive folder, `fs-vault-sync:vault-ops/operating/findings-inbox/finding-2026-09-09-price-not-only-decision-factor.md` (file time 2026-09-09 11:45, sha256 `3ca98b698c79f841…`), imported verbatim on 2026-10-11; recorded fields: date: 2026-09-09, type: data-gap, severity: high. Not yet curated into the repository's `vault/30-findings/` — the number here is the vault's, in order of capture. Wiki-links are rewritten to this vault's ids; a file that is not a node reads `fs-vault-sync:path`.

## What happened
[[SRC-20260916-ops-operating-checklist]] step 7 says to choose the offer by "best price, then delivery time."
For Deal #7131, operator confirmed that even if ACE had quoted 650 € (i.e. **more** than
Delamode's 600 €), they would still have chosen ACE — because the price gap is small and ACE's
service quality is better. So the actual decision function is closer to: *prefer a trusted/
higher-quality partner unless the price difference is large*, not a strict cheapest-first sort.

## What I expected / wanted instead
A rule (or at least a rough threshold) for how big a price gap has to be before it overrides the
quality preference, and what "quality" concretely means (fewer damages, better communication,
reliability hitting dates, easier claims process, etc.).

## What I did about it
Didn't guess at a threshold or redefine the checklist unilaterally. Asked the operator directly:
(a) roughly how large a price gap would have to be before a cheaper-but-lesser partner wins, and
(b) what "ACE has better quality" concretely means to them.

## Resolution (2026-09-09)
Operator answered both:
- **Threshold:** ~10%. A cheaper competitor only wins if it's more than ~10% cheaper than the
  preferred/trusted partner; within 10%, go with the trusted partner.
- **"Quality" =** fewer damages, better communication, more accurate delivery times.

Documented as the actual selection rule in [[SRC-20260909-ops-offer-selection-rule]], replacing the
plain "best price, then delivery time" line in [[SRC-20260916-ops-operating-checklist]] step 7.

## Why this matters
`fs-vault-sync:vault-ops/operating/offer-log.md` exists specifically to train a future offer-ranker off the "chosen" column. If
the real decision includes an unstated quality/trust weighting per partner, a ranker trained only
on price+delivery-time will learn the wrong signal and keep recommending the cheapest offer even
when the operator would not have picked it. This is one of the most important findings from this
discovery round for process-discovery (`fs-vault-sync:vault-ops/skills/process-discovery/SKILL.md`)'s stated goal of
designing the agent's decision logic correctly.
