<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Generated brand assets

Public logo assets are generated artifacts. They are not edited in this directory or committed as alternate sources of truth.

Canonical inputs:
- `../source/artwork/librecode-master.svg`
- `../source/artwork/brand-assets.json`

Build command:

```bash
python scripts/build_assets.py --output build/assets
```

The build produces primary, reversed, and monochrome variants in SVG/PDF plus standard PNG sizes. The stable primary aliases `librecode-logo.svg`, `librecode-logo.pdf`, and `librecode-logo.png` are generated from the primary variant.
