---
id: ADR-FS-0011
type: statement
fed_kind: adr
fed_modality: decision
fed_status: proposed
pav_authoredBy: juri
pav_createdBy: claude-agent
pav_createdWith: Claude (Fable 5.1)
pav_authoredOn: 2026-09-13
dcterms_title: "Interim access to product data: WooCommerce through the WordPress admin in Chrome, and the Huum product folder"
dcterms_language: en
prov_hadPrimarySource: "[[SRC-20260913-memo-transfer]]"
prov_wasQuotedFrom: ["[[SRC-20260913-memo-transfer#^m18]]", "[[SRC-20260913-memo-transfer#^m27]]"]
dcterms_subject: ["[[ELM-desktop.chrome]]", "[[ELM-woocommerce]]", "[[ELM-drive.huum]]", "[[ADR-FS-0010]]"]
dcterms_isPartOf: ["[[LINE-fs-data-sources]]"]
sw_logStatus: proposed
sw_statusNote: "the current thinking of the transfer memo (2026-09-13); not yet an ADR in the repository; the access path is to be designed by the developer"
sw_covers: ["fs:instances/vault-ops/**", "fs:fstransport/**"]
sw_repos: [fs]
---

# ADR-FS-0011: Interim access to product data: WooCommerce through the WordPress admin in Chrome, and the Huum product folder

**Decision:**
1. Until WooCommerce exposes an API for the agent, the agent reads WooCommerce through the WordPress admin page in the Chrome browser ([[ELM-desktop.chrome]]).
2. Product data comes from the Huum product folder, shared with the team and synced to the desktops by Google Drive for desktop ([[ELM-drive.huum]]).
3. The developer designs this access path; it ends when WooCommerce holds the data per [[ADR-FS-0010]] or the datastore of [[ADR-FS-0012]] replaces it.

**Context:** The transfer memo, section 3: "Interim access until a WooCommerce API exists: the agent reads WooCommerce via the Chrome browser through the WordPress admin page, and uses product data from the Huum product folder (shared, synced locally via Google Drive desktop)" ([[SRC-20260913-memo-transfer#^m18]]); the developer's action "design the Chrome/WordPress-admin + Huum-folder access path" (^m27).

**Consequences:**
- Browser access is a human-paced path: fit for iteration 1 by hand, not for the iteration-2 service, which needs an API or the datastore.
- The Huum folder is a second copy of product data beside the shop; which one is of record is not said.
- The Linux developer machine has no Google Drive for desktop ([[HZ-FS-0001]]): the folder reaches it only by rclone.
- As [[ADR-FS-0010]]: the owner's reading of Juri's words; the project's own ADR is still to be written in the repository.
