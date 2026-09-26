<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Brand manual

`main.typ` is the canonical manual source. The PDF is generated.

The manual does **not** consume editable artwork directly. It consumes deterministic derivatives from `build/assets/`, generated from the single canonical SVG and `brand-assets.json`.

## Requirements

- Typst 0.15.1
- Python 3
- Inkscape CLI
- the fonts vendored under `source/fonts/`

## Local build

```bash
rm -rf build
python scripts/build_assets.py --output build/assets
typst compile \
  --root . \
  --font-path source/fonts \
  --pdf-standard ua-1 \
  manual/main.typ \
  build/brand-manual.pdf

typst compile \
  --root . \
  --font-path source/fonts \
  --pdf-standard ua-1 \
  --input format=slides \
  manual/main.typ \
  build/brand-manual-slides.pdf
```

The same asset generator is used by local builds, CI, the continuous `latest` release, and versioned releases.

The 16:9 PDF uses the same Typst source and brand rules. It is a widescreen reading format, not an abridged speaker deck; individual topics can flow onto more than one slide. Review both PDFs at their intended display size before publishing.
