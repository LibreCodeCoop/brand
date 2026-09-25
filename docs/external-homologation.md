<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# External homologation guide

The LibreCode brand system is ready for external homologation through the mutable `latest` build.

## Review source

Use the current homologation PDF:

https://github.com/LibreCodeCoop/brand/releases/download/latest/librecode-brand-manual.pdf

The repository remains the source of truth. Reviewers should not edit or redistribute an extracted/redrawn logo as a substitute for the canonical assets in `source/artwork/`.

## What to review

Review the manual as a complete system, with attention to:

- whether the positioning, audience, free-software message, cooperative identity, community language, voice, and tone accurately represent LibreCode;
- whether the visual identity is clear, consistent, legible, and recognizably LibreCode;
- whether logo variants, clear space, minimum size, correct/incorrect use, color, and typography are understandable and usable;
- whether partner/third-party, trademark, licensing, ownership, and governance language is accurate and appropriately scoped;
- whether Portuguese is clear and direct;
- whether navigation, reading order, links, headings, alternative text, and other accessibility behavior work in the reviewer's PDF reader;
- whether any page has clipping, overlap, awkward spacing, misleading emphasis, or an unclear diagram.

## How to report feedback

Open a GitHub issue in this repository and include, when applicable:

- page number or section;
- what is unclear, incorrect, or difficult to use;
- why it matters in a real LibreCode context;
- suggested correction, if the reviewer has one;
- whether the feedback concerns factual accuracy, brand identity, usability, accessibility, visual quality, or legal/governance wording.

Prefer concrete observations over general taste. A suggested visual or editorial change is not automatically a new brand rule; changes to identity require explicit approval.

## Review boundaries

External homologation should not introduce unsupported rules merely to make the manual more extensive.

Do not infer new:

- logo geometry;
- colors or typography;
- slogans;
- sub-brands;
- illustration or photography systems;
- motion rules;
- partner relationships;
- certifications or endorsements.

If a reviewer identifies a real need without approved source material, record it as a follow-up decision rather than silently filling the gap.

## Acceptance and stable release

Accepted feedback is incorporated through normal pull requests and the full CI/accessibility pipeline.

The `latest` release remains mutable throughout homologation. No `v1.0.0` or other first stable version is created until:

1. external review is complete;
2. accepted feedback has been merged;
3. CI and accessibility checks are green on the approved `main`;
4. a fresh release candidate is prepared from that approved state;
5. the project owner explicitly authorizes the stable release.
