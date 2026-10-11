---
id: ADR-FS-0008
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredOn: 2026-07-16
pav_importedFrom: "fs:vault/20-decisions/ADR-0008-email-infrastructure.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
dcterms_title: "Email infrastructure (IMAP vs API)"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_subject: ["[[ELM-fs.mailAdapter]]", "[[ELM-fs.api]]", "[[ELM-mail.sales]]", "[[SRC-fs-srs#^FR-3-03]]"]
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
sw_logStatus: proposed
sw_statusNote: "proposed; blocks iteration 2 (question sheet Q6). The uncommitted edit of 2026-08-27 in the clone adds the iteration-2 leaning towards an IMAP/SMTP adapter against Radicenter"
sw_covers: ["fs:fstransport/**", "fs:.env.example"]
sw_repos: [fs]
---

# ADR-FS-0008: Email infrastructure (IMAP vs API)

## Status
proposed — informed by discovery 2026-08-11 (see ADR-0009 / FIND-0002).

## Context
The agent must send outreach/confirmation emails and monitor `order@factory.sale` for replies.
Options: standard IMAP/SMTP inbox vs an email API (SendGrid/Mailgun with inbound parse webhook).

## Decision
_TBD._ Iteration 1 operates the real inbox by hand ([[ADR-FS-0003]]);
that experience should inform the iteration-2 choice.

Update (2026-08-11): the transportation offer channel is `sales@factory.sale` (Radicenter). No
IMAP connector exists, so the working approach is forward-to-Gmail + "send mail as" (Option B),
matching the order channel. Channel-separation decision and steps: see
[[ADR-FS-0009]].

## Consequences
_TBD — affects the `POST /v1/webhooks/email/incoming` design in [[SRC-fs-system-architecture]]._
