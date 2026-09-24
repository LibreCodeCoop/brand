<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Contributing

Brand changes affect public identity and should be reviewed with the same care as product changes.

## Workflow

1. Open or reference an issue describing the need and intended audience.
2. Change canonical source material, not only an exported derivative.
3. Keep filenames stable and semantic.
4. Add or update SPDX/REUSE licensing metadata.
5. Regenerate derived assets when applicable.
6. Explain migration impact when a rule or asset changes.
7. Submit a pull request.

## Commits

Use clear, scoped commit messages. Signed-off commits are encouraged where that is the organization convention.

## Binary assets

Do not add unexplained binary files. Every binary must have:
- a documented purpose;
- known provenance;
- an identified copyright holder;
- licensing metadata;
- a canonical editable source when one exists.

## Generated files

Generated PDF/PNG assets must be reproducible from tracked source whenever practical. Do not manually edit generated outputs.


## Privacy and historical sources

Do not commit raw contracts, proposals, briefs, exported office documents, or other historical files solely for provenance when they contain personal data or unrelated commercial information.

Extract and document only the facts needed by the brand system. See `docs/privacy-and-provenance.md`.

Before importing artwork, remove unnecessary editor metadata and confirm the correct SPDX/REUSE classification.
