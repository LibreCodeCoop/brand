<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Asset conventions

## Directory roles

- `source/`: preferred editable/canonical source.
- `assets/`: approved exports for consumption.
- `archive/`: superseded/historical material, never the default source.
- `examples/`: usage examples, not canonical artwork.

## Filenames

Use semantic, stable names. Prefer patterns such as:

- `librecode-logo.svg`
- `librecode-logo-monochrome.svg`
- `librecode-logomark.svg`
- `librecode-logo-horizontal.png`

Avoid `final`, `new`, dates, arbitrary sequence numbers, or design-tool export suffixes when they do not communicate a semantic variant.

Git history and releases provide version history.

## Formats

- **SVG:** preferred digital/scalable artwork.
- **PNG:** presentations, social media, and general raster use.
- **PDF:** professional print/interchange when a vector PDF is useful.
- **EPS:** only if a real print/vendor workflow requires it.

Every export should have documented purpose and provenance.
