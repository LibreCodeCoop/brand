<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Brand system architecture

## Decision

The canonical LibreCode brand system lives in this Git repository. The official website is the human-facing publication layer. Shared-drive/Nextcloud material is working or historical storage, not the source of truth.

## Why

Modern brand systems are operational systems: rules, reusable assets, publishing workflows, and governance need to evolve together. Git gives reviewable history, diffs, releases, ownership, and automation that mutable shared folders do not.

For free/open-source projects, copyright licensing and trademark permission must remain explicit and separate. Openly licensing documentation or artwork does not itself grant trademark rights.

## Layers

1. **Canonical source** — this repository.
2. **Public guide** — https://librecode.coop/brand
3. **Generated distributions** — released PDFs and approved exports.
4. **Workspace/archive** — Nextcloud or other shared storage.

## Directory model

- `guidelines/`: normative brand rules.
- `source/`: preferred editable source.
- `assets/`: approved public exports.
- `manual/`: reproducible publication source.
- `examples/`: explanatory examples.
- `archive/`: historical material only.
- `LICENSES/` + `REUSE.toml`: licensing metadata.

## Research basis

- Ribeiro, Raposo, Almendra & Neves, “Design Systems Applied to Visual Identities” (2026): design systems increasingly operate as Brand Visual Language Systems joining directives, assets, modules, and workflows.
- GitLab Brand Guidelines: public guidelines combine logo, color, typography, voice, and asset distribution.
- Mozilla licensing/trademark guidance: open copyright licensing is distinct from trademark rights.
- Pamela Chestek, *Open Source Law, Policy and Practice*, chapter on trademarks (2022): FOSS projects should explicitly define ownership, community use, and trademark governance.
- REUSE Specification 3.3: file-level, machine-readable licensing and copyright metadata.

## Manual publication

PDF is a release artifact, not canonical source. Issue #3 tracks the decision between Typst, LaTeX, and Pandoc-based workflows.

## Migration rule

Do not revoke historical public links until every unique source and approved asset has been inventoried, migrated, licensed, and validated.
