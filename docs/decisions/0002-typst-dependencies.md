<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# ADR 0002: Keep the brand manual dependency-light

Status: accepted.

## Decision

The brand manual uses Typst's standard library for its visual system and reusable components.

Third-party Typst templates are **not** used as the base layout. The brand manual itself defines its page architecture, hierarchy, spacing, color components, examples, and artwork presentation.

## Why

- the manual must express this brand, not a template author's visual language;
- fewer dependencies improve reproducibility and long-term maintenance;
- a package upgrade must not unexpectedly redesign the manual;
- standard Typst functionality is sufficient for page layout, grids, typography, images, swatches, callouts, and most normative examples.

## Typst Universe

Packages are evaluated by need, license, maintenance, and reproducibility. Exact versions must be pinned.

### CeTZ

CeTZ is the preferred optional package if a genuinely complex vector construction diagram is required. It provides a TikZ/Processing-inspired drawing API and is available under LGPL-3.0-or-later.

Do not add CeTZ until a diagram requires functionality that would be meaningfully harder or less maintainable with Typst's built-in primitives.

### Templates

Report/manual templates such as min-manual, basic-report, or metropole-report may be studied for ideas but are not runtime dependencies.

### Exam packages

Exam-oriented packages (examify, examy, quest, mcx, g-exam, examine-ib, exm, grape-suite exercise features) are out of scope for a brand manual.

## Hosted Typst service

The build does not depend on Typst's proprietary web application. The open-source Apache-2.0 Typst compiler is sufficient for local and CI generation.
