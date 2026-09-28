<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

<p align="center">
  <img src="source/artwork/librecode-master.svg" alt="LibreCode" width="460">
</p>

# LibreCode brand

Canonical, version-controlled source for the current LibreCode brand system.

Public guide: https://librecode.coop/brand

## Brand manual formats

The brand manual is published in two PDF layouts generated from the same canonical Typst source and the same brand rules:

| Format | Intended use | Latest build |
| --- | --- | --- |
| A4 portrait | Document-oriented reading, review, and printing | [LibreCode brand manual — A4](https://github.com/LibreCodeCoop/brand/releases/download/latest/librecode-brand-manual.pdf) |
| 16:9 widescreen | Screen-oriented reading and presentation | [LibreCode brand manual — 16:9](https://github.com/LibreCodeCoop/brand/releases/download/latest/librecode-brand-manual-slides.pdf) |

The 16:9 edition is not a separate manual or an abridged speaker deck. Both formats are rendered from `manual/main.typ`; only the layout adapts to the target page ratio. Some topics may therefore span more than one 16:9 page.

## Contract

- This repository contains the **current** brand system.
- Canonical artwork lives under `source/artwork/`.
- PNG/PDF derivatives are generated from canonical SVG source by CI.
- The repository-level `LICENSE` is **CC BY-SA 4.0**, the primary license for documentation and official artwork.
- Build scripts and automation are licensed under **AGPL-3.0-or-later**.
- Third-party fonts keep their upstream licenses.
- Per-file SPDX metadata and `LICENSES/` remain authoritative where a file uses a different license.
- Trademark permission is governed separately by `TRADEMARKS.md`.

## Layout

- `guidelines/` — normative brand rules.
- `source/artwork/` — canonical editable artwork.
- `assets/` — asset distribution policy.
- `manual/` — Typst source.
- `docs/` — architecture, decisions, references, registrations, and review guidance.
- `LICENSES/` and `REUSE.toml` — licensing metadata.


## Publication status

The `latest` release is a mutable **homologation build** generated from `main`. It is intentionally not a stable versioned release and may change whenever the brand source changes.

The first stable versioned release will only be created after external review and explicit approval. See [`docs/external-homologation.md`](docs/external-homologation.md) for the review scope and feedback process.
