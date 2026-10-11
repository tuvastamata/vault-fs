# Sweeps

Append-only log of sweeps: which repository was read up to which commit and what changed because of it in the model (`structurizr/workspace.dsl`) and the records. A sweep starts from the commit named on the repository's last line here (see `README.md`, "Sweep after a push"). New lines go to the end.

| repository | branch | from | read up to | date | model / records |
|---|---|---|---|---|---|
| fs | `main` | `258784d` | `89d77d2` | 2026-10-11 | the whole history (9 commits, 2026-07-16 … 2026-08-27) read; documentation imported at `89d77d2` (11 sources, 14 statements); the model drafted from the documents and the transfer memo of 2026-09-13; the clone's uncommitted edits of 2026-08-27 noted in FACT-FS-0001 and DC-FS-0002, not imported |
| fs-vault-sync (Drive, remote `andrei:`) | — | 2026-08-27 snapshot | listing of 2026-10-10 | 2026-10-11 | no change on the shared folder since 2026-08-27 13:45; the three captures of 2026-08-11 imported as SRC-20260811-discovery-captures |
