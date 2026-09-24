<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Visual identity

The historical LibreCode visual identity manual (2021) and its source package have now been reviewed.

## Primary logo

The manual defines a stacked LibreCode wordmark with the connected-node symbol.

The source package contains SVG, ODG, PNG, JPG, Illustrator/PDF, and PDF logo sheets. Canonical vectors should be selected from these sources after geometry comparison; raster exports are derivatives.

## Institutional colors

The historical manual specifies:

### Primary
- Pantone 485 C
  - CMYK: C 5 / M 95 / Y 95 / K 0
  - RGB: R 229 / G 51 / B 42
  - digital equivalent used in the archived SVGs: approximately `#e5332a`

- Pantone Cool Grey 9 C
  - CMYK: C 55 / M 45 / Y 45 / K 10
  - RGB: R 124 / G 123 / B 123

### Supporting
- Pantone Cool Grey 2 C
  - CMYK: C 15 / M 10 / Y 15 / K 0
  - RGB: R 219 / G 219 / B 219

The migrated manual should distinguish documented Pantone references, print-process CMYK values, and digital RGB/HEX values rather than presenting them as perfectly interchangeable color spaces.

## Typography

The historical manual specifies **Krona One**.

The archived package includes `KronaOne-Regular.ttf`, whose embedded metadata identifies Sorkin Type Co. and a reserved font name. Font redistribution must preserve the font's own license and must not be covered by the brand repository's CC BY-SA annotation.

## Clear space

The manual defines a protection area around the logo using a repeated internal unit `x`. The new manual should recreate the geometry in vector form and explain how to derive the unit.

## Minimum size

The historical manual defines a minimum reduction of **20 mm base width** for the complete logo.

## Color applications

The historical manual includes:
- primary-color application on white;
- application on Cool Grey 2 C;
- application on Cool Grey 9 C;
- one-color applications;
- 60% and 100% black positive/negative versions;
- examples of incorrect use.

These should be reconstructed as reusable examples rather than embedded screenshots.

## Known defect in the historical manual

The section titled **Concepção da Marca** contains placeholder Lorem Ipsum rather than approved brand rationale. It must **not** be migrated as authoritative content.

The new brand story should use the reviewed LibreCode positioning maintained in `guidelines/brand-story.md`.

## Historical deliverables

The 2021 design agreement explicitly required logo/manual deliverables and open source artwork formats. The archive contains Illustrator/PDF and other open/editable formats consistent with that deliverable history. Contract documents remain provenance records and should not be published as public brand assets.

## Migration rule

Rebuild the manual from structured source. Preserve validated geometry, color specifications, typography, protection area, minimum size, variants, and misuse examples; replace placeholder/incomplete narrative content with approved current guidance.
