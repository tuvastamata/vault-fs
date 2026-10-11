---
id: ADR-FS-0009
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-08-11
pav_importedFrom: "fs:vault/20-decisions/ADR-0009-separate-transport-email-channel.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Keep transportation-partner comms on a separate email channel"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-mail.sales]]", "[[ELM-mail.gmail]]", "[[ELM-mail.order]]", "[[ELM-desktop.gmailConnector]]", "[[SRC-fs-srs#^FR-3-01]]", "[[SRC-fs-srs#^FR-3-03]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
sw_logStatus: accepted
sw_statusNote: "accepted with the iteration-1 single-inbox exception (2026-08-27); the frontmatter at this commit still says proposed, the uncommitted edit of 2026-08-27 in the clone corrects it; the exception's sunset is DC-FS-0001"
sw_covers: ["fs:vault/60-guides/connecting-sales-email.md", "fs:instances/vault-ops/operating/connecting-sales-email.md", "fs:instances/vault-ops/operating/setup-transport-email.md"]
sw_repos: [fs]
---

# ADR-FS-0009: Keep transportation-partner comms on a separate email channel

## Status
accepted with a temporary exception (2026-08-27). Long-term target = two separate mailboxes;
iteration 1 runs a single-inbox merge (see "Temporary exception for iteration 1").

## Context
Discovery (2026-08-11) clarified the real email topology, previously undocumented:
- **Order data** — inbound to `order@factory.sale`, redirected to Gmail
  `evaprual.factorysale@gmail.com`; sourced from Bitrix24 order records.
- **Transportation comms** — all partner outreach is sent from, and all offers arrive to,
  `sales@factory.sale`. Domain registered at zone.ee; mailbox hosted on Radicenter (separate
  infrastructure from the order-data Gmail).

This concretely informs the open [[ADR-FS-0008]].

## Decision
Keep the two channels **separate**:
1. `order@factory.sale` → `evaprual.factorysale@gmail.com` stays the order-data channel only.
2. `sales@factory.sale` (zone.ee / Radicenter) stays the dedicated transportation channel and is
   connected in its own right.

**Target connection method** (long-term): forward `sales@factory.sale` into its own dedicated
Gmail and connect that account separately — either via a multi-account MCP server (the native
Gmail connector holds only one Google account) or a shared-inbox tool.

### Temporary exception for iteration 1 (2026-08-27)
Because Claude's native Gmail connector supports only **one** Google account, and the two-mailbox
route requires a higher-friction MCP setup, iteration 1 runs a pragmatic **single-inbox merge**:

- Both `order@` and `sales@` forward into `evaprual.factorysale@gmail.com`.
- `sales@factory.sale` is added as a **"send mail as" alias** so outbound partner emails still
  originate from the transport channel.
- The two streams are separated **inside** the one inbox with Gmail filters/labels
  (`transport-sales`, `transport-orders`); prompts tell Claude which label to read/act on.

This uses the native connector (with its per-send approval, matching the approval gate) and needs
no MCP server. Full setup: [[SRC-fs-connecting-sales-email]].

**Why this is acceptable:** ADR-0009 was written before the single-account limitation was
confirmed. The value of separation is real, but a temporary single-inbox compromise lets
iteration 1 ship and learn rather than block on the MCP setup.

**Sunset condition:** revert to two separate mailboxes once a self-hosted multi-account MCP
server (or shared-inbox tool) is ready. Track as a follow-up; supersede this exception then.

**Trade-offs accepted for now:**
- Order emails and partner emails share one inbox again; rely on filters/labels + explicit prompts.
- Higher risk of the agent confusing the two streams, or the operator missing a partner reply.
- Ranker training data is less clean because both streams are mixed (see
  [[FIND-FS-0001]] / [[ADR-FS-0007]]).

### Mitigations (do these now — they neutralize most of the above)
1. **The agent gets orders from Bitrix24, not email.** Its email scope is **only**
   `label:transport-sales` (partner outreach + offers). Order email (`transport-orders`) is for
   human/Bitrix intake and is out of the agent's query entirely — so a mislabeled order email
   can't confuse the agent. In iteration 2 this label filter is a fixed query constant on the
   email node, not LLM-dependent (see [[SRC-fs-system-architecture]] and
   [[PLAN-FS-0002]]).
2. **Verify the forward-through filter actually tags `sales@` mail.** Forwarding can rewrite
   headers, so a `to:sales@factory.sale` filter may miss mail arriving via the Radicenter→Gmail
   forward. Confirm it labels reliably (filter on `Delivered-To`/original recipient, or use
   plus-addressing). If it misfires, everything here leans on a broken filter.
3. **Ranker data stays clean by construction.** Training data is the human-maintained offer log
   (populated from `transport-sales` offers + the chosen-offer label), not raw inbox contents.
   The residual risk is only a *missed* partner reply (incomplete data) — covered by mitigation 2.
   The offer log carries `thread_id`/`message_id` for provenance and eval fixtures.

## Rationale
Separation keeps order-fulfillment data and partner-negotiation comms from mixing in one inbox,
reduces the risk of a partner offer being missed, and keeps the future ranker's training data
sourced from a clean, single-purpose inbox. The iteration-1 exception trades some of that for a
faster path to shipping, mitigated by labels and explicit prompts.

## Consequences / follow-up
- Confirm exact Radicenter IMAP/SMTP settings before configuring (guide "What we could confirm").
- Decide full-redirect vs forward-with-copy for `sales@factory.sale` (with-copy keeps a Radicenter backup).
- Set up the send-as alias and the `transport-sales` / `transport-orders` filters/labels.
- Update [[SRC-fs-process-flow]] and the operator checklist to name `sales@factory.sale`
  explicitly at the outreach/offer steps (tracked in FIND-0002).
- Partially resolves [[ADR-FS-0008]] → single-inbox forward + alias for now.
- **Sunset:** create the two-mailbox split (multi-account MCP or shared-inbox tool) and supersede
  the exception.
