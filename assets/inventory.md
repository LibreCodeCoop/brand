<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Asset inventory

Status legend: **approved-current**, **canonical-candidate**, **needs-review**, **cross-brand**, **historical**.

## Current LibreCode website

| Current path | Proposed canonical role | Status | Notes |
|---|---|---|---|
| `source/assets/images/logo/librecode.png` | public PNG derivative | approved-current | Current site logo export. |
| `source/assets/images/logo/librecode_large.png` | public PNG derivative | approved-current | Current larger site export. |
| `source/assets/images/logo/librecode_author.jpg` | not brand core | needs-review | Determine whether this is author/profile artwork. |
| `source/assets/images/logo/libresign.png` | do not migrate here | cross-brand | Belongs to LibreSign. |
| `source/assets/images/logo/somoscoop-horizontal-light.png` | third-party/cooperative mark | needs-review | Verify provenance and redistribution terms. |

## Historical brand package reviewed

### Final-logo folder

The historical `Logo/Versão final/` directory contains:
- bicolor and white SVG variants;
- gray/red and gray/blue SVG/PNG variants;
- ODG editable drawings;
- square symbol/shape assets;
- raster exports at several sizes.

These are useful sources, but filenames are inconsistent and some variants may reflect older color decisions. Canonical status must follow the validated manual plus current brand direction.

### Manual source package

The archive includes:
- `Manual Libre Code_A4_2.ai` — Illustrator file stored as a 24-page PDF-compatible document;
- `Manual Libre Code_A4_2.pdf` — matching 24-page manual;
- `Logo Libre Code_versoes.ai` / `.pdf` — eight-page vector variant sheet;
- `Logo Libre Code_versao principal.pdf` — one-page primary artwork reference;
- `KronaOne-Regular.ttf` — historical typography file; preserve its own font license.

### Rebranding provenance

The `Reestruturação da marca/` documents contain the briefing, commercial scope, design references, and deliverable history. They are provenance/reference material, not public approved brand assets.

The original design scope explicitly required logo/manual source artwork in open/editable formats.

## Known manual issue

The 24-page manual has a placeholder Lorem Ipsum section under `Concepção da Marca`. It must not be treated as approved narrative content.

## Migration rule

Select a canonical vector master after comparing the SVG/ODG/Illustrator geometry. Generate stable semantic exports from that master. Preserve historical/provenance documents separately rather than mixing them into the approved asset directory.
