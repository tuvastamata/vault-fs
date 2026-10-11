---
id: SRC-fs-connecting-sales-email
type: source
fed_kind: runbook
pav_importedFrom: "fs:vault/60-guides/connecting-sales-email.md@89d77d2"
pav_importedBy: claude-agent
pav_importedOn: 2026-10-11
pav_retrievedFrom: "fs:vault/60-guides/connecting-sales-email.md@89d77d2"
dcterms_title: "Connecting sales@factory.sale (developer/admin setup)"
dcterms_language: en
dcterms_type: Text
dcterms_date: 2026-08-27
fed_condition: full
prov_hadPrimarySource: "[[SRC-fs-repo]]"
dcterms_isPartOf: ["[[LINE-fs-email-channel]]"]
---

# Connecting sales@factory.sale (developer/admin setup)

> Imported verbatim from `fs:vault/60-guides/connecting-sales-email.md@89d77d2` on 2026-10-11 (first committed 2026-08-27): one-time setup guide of the transport mail channel; at this commit without step 5 (reply from the same address) and the filter warning, which the uncommitted edit of 2026-08-27 in the clone adds. Wiki-links are rewritten to this vault's ids; a link to a repository file that is not a node reads `fs:path@commit`. The repository's copy may move on, this text does not — a sweep records changes as new records or `Update` lines.

One-time setup to make the transportation channel usable by Claude Desktop. Companion decision:
[[ADR-FS-0009]]. For daily operator use in the
merged inbox, see the operator guide `instances/vault-ops/operating/connecting-sales-email.md`.

## The channels

| Channel | Purpose | Where it lives |
|---|---|---|
| `order@factory.sale` | Incoming product-order data (from Bitrix24) | Forwarded to Gmail `evaprual.factorysale@gmail.com` — **already connected** (native Gmail connector, OAuth) |
| `sales@factory.sale` | Transportation-partner outreach (sent) + offers (received) | Domain on **zone.ee**, mailbox on **Radicenter** |

## Iteration-1 default: single-inbox merge (temporary)

The native Gmail connector holds **one** Google account at a time, and the clean two-mailbox
route needs a higher-friction MCP setup. So for iteration 1 we merge both channels into the
already-connected `evaprual.factorysale@gmail.com` and separate them with labels. This is a
**deliberate temporary exception** to ADR-0009 with a sunset condition — see that ADR. The
long-term target is two separate mailboxes ("Target architecture" below).

### Setup steps

**1. Forward `sales@factory.sale` → `evaprual.factorysale@gmail.com`.**
In the Radicenter/DirectAdmin panel → Email → Forwarders, add a forwarder from
`sales@factory.sale` to `evaprual.factorysale@gmail.com`. Choose **forward-with-copy** (keeps a
backup on Radicenter — safer) or full redirect (simpler). 

**2. Add `sales@factory.sale` as a "Send mail as" alias in `evaprual...`.**
Gmail → Settings → Accounts and Import → Send mail as → Add another email address. Use Radicenter
SMTP: host `mail.factory.sale`, port `465`, SSL/TLS, username `sales@factory.sale`, and the
mailbox password. Gmail sends a verification email to `sales@factory.sale`; because it forwards
to `evaprual`, you'll receive the link and can confirm the alias.

**3. Send from the alias.**
When Claude drafts/sends partner outreach, explicitly instruct `From: sales@factory.sale`. The
native Gmail connector can send from any **verified alias** of the connected account, so this
works without an MCP server — with per-send approval (matching the
[[FIND-FS-0002|approval gate]]). Replies go to
`sales@factory.sale` and forward back into `evaprual`.

**4. Separate the two streams inside the one inbox.**
Create Gmail filters/labels:
- `to:sales@factory.sale` → label **`transport-sales`** (partner outreach + offers)
- `to:order@factory.sale` → label **`transport-orders`** (order inquiries)

In prompts, tell Claude which label to use — e.g. *"check `label:transport-sales` for new partner
offers"* vs *"read the latest `label:transport-orders` inquiry."*

### Trade-offs (accepted for iteration 1)
- Order and partner emails share one inbox again; rely on labels + explicit prompts.
- Higher risk of confusing the two streams, or the operator missing a partner reply.
- Ranker training data is less clean because both streams are mixed
  ([[ADR-FS-0007]]).

## Confirm the Radicenter mail settings first

Generic Radicenter (DirectAdmin) pattern — verify the real values before configuring:

| Setting | Value |
|---|---|
| IMAP host | `mail.<yourdomain>` (i.e. `mail.factory.sale`) |
| IMAP port | 993, SSL/TLS |
| SMTP host | `mail.<yourdomain>` |
| SMTP port | 465, SSL/TLS |
| Username | full email (`sales@factory.sale`) |
| Password | the mailbox password |

`mail.factory.sale` is the generic pattern, **not a confirmed value**. Verify via the
Radicenter/zone.ee panel's live **E-mail settings generator**
([ca.radicenter.eu/en/client/email/settings](https://ca.radicenter.eu/en/client/email/settings)),
the DirectAdmin panel, or `support@radicenter.eu`. Radicenter's stricter mail policy from July 1st
([KB2052](https://kb.radicenter.eu/KB2052)) may affect TLS/auth.

## Target architecture (post–iteration 1)

Two separate mailboxes, so partner comms never mix with order data:

1. Create a dedicated Gmail `sales.factorysale@gmail.com`; forward `sales@factory.sale` into it;
   add the send-as alias there (steps 1–3 above, against the new account).
2. Connect it as a **second** account. Since the native connector is single-account, use an
   **MCP server** for the second inbox:

   ```json
   {
     "mcpServers": {
       "gmail-sales": {
         "command": "uvx",
         "args": ["workspace-mcp", "--tools", "gmail"],
         "env": {
           "GOOGLE_OAUTH_CLIENT_ID": "YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com",
           "GOOGLE_OAUTH_CLIENT_SECRET": "YOUR_GOOGLE_CLIENT_SECRET"
         }
       }
     }
   }
   ```
   Config file: macOS `~/Library/Application Support/Claude/claude_desktop_config.json`
   (Windows `%APPDATA%\Claude\claude_desktop_config.json`). Create the OAuth client in Google
   Cloud Console (Credentials → OAuth 2.0 Client ID, Desktop App). Trade-off: a **client secret
   on disk** (keep it out of synced/committed folders) and the `uvx` server to maintain.

   Or adopt a shared-inbox tool that supports multiple mailboxes.

This is the **sunset target** for the ADR-0009 exception.

## Open items
- Confirm exact Radicenter IMAP/SMTP host/ports for `factory.sale`.
- Decide full-redirect vs forward-with-copy for `sales@factory.sale`.
- After connecting, update [[SRC-fs-process-flow]] and the operator checklist to name
  `sales@factory.sale` explicitly (tracked in [[FIND-FS-0002]]).
- Plan the two-mailbox split to satisfy the ADR-0009 sunset condition.

## Sources
- [Use Google Workspace connectors — Anthropic Help Center](https://support.claude.com/en/articles/10166901-use-google-workspace-connectors) (native Gmail connector sends from verified aliases with approval; one Google account per connection)
- [Use connectors to extend Claude's capabilities — Anthropic Help Center](https://support.claude.com/en/articles/11176164-use-connectors-to-extend-claude-s-capabilities)
- [Radicenter Thunderbird setup](https://www.radicenter.ee/kuidas-seadistada-e-posti-kontot-thunderbird-programmis/); [Radicenter security policy KB2052](https://kb.radicenter.eu/KB2052); [Radicenter e-mail settings generator](https://ca.radicenter.eu/en/client/email/settings)
