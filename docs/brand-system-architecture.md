<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Brand system architecture

This repository defines the current LibreCode brand system.

## Components

- naming and pronunciation;
- brand story and voice;
- canonical artwork;
- color and typography rules;
- accessibility;
- digital design-system contract;
- trademark policy;
- reproducible manual source;
- automated asset generation;
- SPDX/REUSE compliance.

## Asset model

`source/artwork/` contains canonical artwork. CI produces public derivatives.

## Licensing

- documentation and official artwork: CC BY-SA 4.0;
- automation/build code: AGPL-3.0-or-later;
- third-party fonts: upstream license;
- trademark permission: separate from copyright licensing.

## Authoring workflow

Use Typst 0.15.1 exactly for reproducible manual builds. Typstyle is the formatter enforced by CI. Tinymist is the recommended editor integration for Typst diagnostics, navigation, and local authoring feedback.

### Typst source conventions

- `manual/main.typ` contains editorial content and page composition.
- `manual/components.typ` contains reusable layout functions.
- `manual/theme.typ` contains LibreCode visual tokens.
- Use two-space indentation and kebab-case for functions and variables.
- Prefer `set` rules for defaults; use `show` rules only for structural transformations.
- Keep normative, source-derived geometry in deterministic generators rather than recalculating it in Typst.
- Run Typstyle before committing; CI is the final formatting gate.
- Do not add Typst packages unless they provide a concrete capability that the standard library cannot reasonably supply.

## Publication

Git repository → generated assets/manual → public website/releases.
