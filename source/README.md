<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Canonical artwork source

The only editable logo source is `librecode-master.svg`.

`brand-assets.json` is the machine-readable contract for:
- normalization and safe framing;
- approved color variants;
- clear-space reference geometry;
- export sizes and formats.

Do not edit public SVG/PNG/PDF variants manually. Generate them with:

```bash
python scripts/build_assets.py --output build/assets
```

The generator uses Inkscape's drawing bounds, applies the repository-defined safety padding, derives approved color variants, and exports SVG/PDF/PNG from the same source.
