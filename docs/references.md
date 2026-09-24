<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Research references

This repository's architecture and governance were reviewed against current brand-system, accessibility, licensing, and FOSS trademark references.

## Brand systems and visual identity

- Ribeiro, Rogério; Raposo, Daniel; Almendra, Rita; Neves, João Vasco. **Design Systems Applied to Visual Identities** (2026). Open-access record: https://hdl.handle.net/10400.11/10973
  - Relevant finding: contemporary design systems can evolve into Brand Visual Language Systems that connect directives, reusable modules, digital assets, and operational workflows.

- GitLab Brand Guidelines / Pajamas Design System:
  - https://design.gitlab.com/brand-introduction/
  - https://design.gitlab.com/get-started/brand-assets/
  - Relevant practice: public guidance combines principles, logo, colors, typography, voice, and downloadable assets rather than treating a static PDF as the whole brand system.

## Free/open-source trademarks

- Chestek, Pamela. **Trademarks**, in *Open Source Law, Policy and Practice*, 2nd ed. (Oxford University Press, 2022).
  - https://academic.oup.com/book/44727/chapter/378966672
  - Relevant finding: FOSS projects should explicitly address trademark ownership, community use, quality/source signaling, and governance rather than assuming the software license controls the mark.

- Mozilla Trademark Guidelines:
  - https://www.mozilla.org/en-US/foundation/trademarks/policy/
  - Relevant practice: open-source code rights and trademark permissions are separate.

- Mozilla Licensing Policies:
  - https://www.mozilla.org/en-US/foundation/licensing/
  - Relevant practice: openly licensed content can coexist with separately controlled trademarks.

- Nextcloud Trademark Guidelines:
  - https://nextcloud.com/trademarks/
  - Relevant practice: community use is encouraged while confusing or misleading use is constrained.

- Open Source Initiative brand and trademark guidelines:
  - https://opensource.org/about/brand-and-trademark-guidelines

## Licensing metadata

- REUSE Specification 3.3:
  - https://reuse.software/spec-3.3/
  - Relevant practice: each tracked file should have unambiguous, machine-readable copyright and license information; REUSE.toml is preferred over deprecated DEP5 for directory-level annotations.

## Reproducible manual publishing

- Typst PDF documentation:
  - https://typst.app/docs/reference/pdf/
- Typst Accessibility Guide:
  - https://typst.app/docs/guides/accessibility/
- LaTeX Tagged PDF Project:
  - https://tagging-project.latex-project.org/
- Pandoc User's Guide:
  - https://pandoc.org/MANUAL.html

## Decisions derived from the review

- Git is the canonical source; the website is the public presentation layer.
- A shared-drive/Nextcloud folder is workspace/archive, not canonical publication.
- Brand rules, assets, source, governance, licensing, and publishing workflow belong in the same versioned system.
- Copyright licensing and trademark permission are documented separately.
- Accessibility is part of the brand system, not a later website-only concern.
- PDF is generated from open, text-based source.
- The initial manual toolchain is Typst because it combines reproducible text source, strong visual layout, open licensing, Tagged PDF, and PDF/UA-1 support.
