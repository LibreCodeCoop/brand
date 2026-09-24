<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Brand manual editorial contract

The LibreCode and LibreSign manuals share the same editorial architecture.

## Required sequence

1. Cover
2. Contents
3. Foundations
   - official name
   - meaning of Libre
   - pronunciation
4. Logo
   - canonical artwork
   - composition
5. Visual system
   - colors
   - typography
   - clear space
   - minimum size
6. Usage
   - correct use
   - incorrect use
   - background/application guidance
7. Accessibility
8. Licensing, trademark, and canonical source
9. Back cover

## Shared visual grammar

Both manuals use:
- A4 portrait format;
- one primary idea per page;
- generous negative space;
- full-page section openers;
- a shared type scale and spacing rhythm;
- canonical logo artwork as the primary visual object;
- large color fields and swatches;
- technical diagrams drawn from reproducible source;
- the same information hierarchy and page logic.

## Brand-specific expression

The manuals are not visually identical. Each theme controls:
- core colors;
- official typefaces;
- logo;
- decorative motif;
- contrast treatment;
- cover and section-field expression.

## Dependency rule

The editorial engine is maintained in `manual/components.typ`.
Brand tokens live in `manual/theme.typ`.
Content lives in `manual/main.typ`.

Third-party Typst packages may be added only when they provide a concrete capability that is materially better than the standard library, with an exact version and compatible open-source license.

See `docs/decisions/0002-typst-dependencies.md`.
