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

## Publication

Git repository → generated assets/manual → public website/releases.
