<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# ADR 0001: Use Typst for the reproducible brand manual

Status: accepted for initial implementation.

## Context

The current brand manual is stored in a closed authoring format. The canonical manual should be reviewable in Git, buildable in CI, capable of high-quality visual layout, and able to generate accessible PDF output.

We compared:
- LaTeX;
- Pandoc with PDF backends;
- Typst.

## Decision

Use **Typst** as the primary manual source and PDF toolchain.

## Reasons

- Typst is open source under Apache-2.0.
- Source is text-based and diff-friendly.
- The tool is designed for modern document layout with a lower maintenance burden than a custom LaTeX stack.
- Current Typst PDF export writes Tagged PDF by default and supports PDF/UA-1 validation-oriented export.
- It supports PDF/A profiles for archival output.
- It has first-class SVG/image support suitable for brand manuals.
- The CLI is straightforward to pin and run in CI.

## Accessibility

The manual build should target PDF/UA-1 where practical and use semantic headings, lists, figures, tables, alt descriptions, document language, and metadata.

Automated conformance is not sufficient by itself; releases still require visual and accessibility review.

## Alternatives

### LaTeX

LaTeX remains capable and its tagged-PDF work has improved substantially, especially in current releases with LuaLaTeX. It is not selected initially because brand-manual layout would require more TeX-specific expertise and package compatibility management.

### Pandoc

Pandoc remains useful as an interchange layer, but adding it between the canonical source and the PDF backend does not currently provide enough value for this design-heavy manual. It may still be used later for derived formats.

## Consequences

- canonical manual source lives under `manual/` as Typst files;
- generated PDFs are release/CI artifacts;
- Typst version must be pinned in CI;
- fonts used by the manual must have redistributable licenses compatible with CI and embedding;
- source assets must come from canonical repository paths.
