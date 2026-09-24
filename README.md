<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# LibreCode brand

Canonical, version-controlled source for the LibreCode and LibreCode Coop brand system.

This repository contains the current brand guidelines, approved assets, editable source material, licensing metadata, and the source used to generate distributable brand documentation.

## Source of truth

This repository is the canonical source for the LibreCode brand. Files kept in shared drives or Nextcloud folders are working material or historical archives unless explicitly stated otherwise.

The public, human-facing guidelines are published at <https://librecode.coop/brand>.

## Principles

LibreCode uses **Libre** in the sense of freedom: the ability to understand, adapt, integrate, operate, maintain, and choose how technology evolves. The brand should communicate that freedom as practical autonomy rather than simply as zero price.

## Repository layout

- `guidelines/` — naming, pronunciation, visual identity, voice, accessibility, and usage guidance.
- `source/` — editable canonical artwork and manual sources.
- `assets/` — approved exports intended for public reuse.
- `examples/` — examples of correct and incorrect brand use.
- `manual/` — reproducible source for the generated brand manual.
- `archive/` — historical material retained for provenance; not current guidance.
- `LICENSES/` and `REUSE.toml` — machine-readable licensing metadata.

## Licensing and trademarks

Documentation and brand artwork are intended to be openly licensed under **CC BY-SA 4.0**, unless a file states otherwise. Build scripts and automation are licensed under **AGPL-3.0-or-later**.

Copyright licensing does **not** grant permission to use LibreCode names or logos in a way that creates confusion about origin, affiliation, sponsorship, or endorsement. See `TRADEMARKS.md`.

This repository follows the REUSE Specification and SPDX identifiers.

## Manual

The current closed-format manual will be migrated to reproducible, text-based source. The exact publishing stack is tracked in the repository roadmap; the goal is deterministic PDF generation without making PDF the source of truth.

## Contributing

Changes to brand rules and canonical assets should be reviewed through pull requests. Avoid introducing exported files without documenting their source and intended use.
