<!--
SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# LibreCode brand completion plan

This document records the engineering, editorial, accessibility, licensing, and release practices validated while completing the LibreSign brand repository. It exists so the LibreCode work can resume without depending on chat history.

The goal is **parity in quality and architecture**, not visual or editorial duplication. LibreCode keeps its own identity, artwork, colors, typography, language, voice, cooperative context, trademark record, and clear-space geometry.

## Guiding rule

Reuse the proven repository architecture and quality gates from `LibreSign/brand`, but re-evaluate every brand-specific rule against LibreCode's own source material.

Do not copy LibreSign claims, positioning, logo geometry, minimum sizes, trademark data, or messaging into LibreCode unless they are independently correct for LibreCode.

## Target repository architecture

Keep the repository small and explicit:

- `source/` — canonical editable inputs;
- `guidelines/` — normative brand rules;
- `manual/` — Typst source;
- `scripts/` — deterministic generation and quality checks;
- `assets/` — generated-asset policy/build contract;
- `docs/` — architecture, ADRs, references, registration records, and this completion plan;
- `LICENSES/` and `REUSE.toml` — precise licensing metadata.

The repository must not reintroduce a proprietary design file as a second source of truth.

If `examples/` remains only a placeholder while examples already live in the manual, remove it instead of preserving an empty architectural layer.

## Canonical artwork and generated assets

Keep exactly one canonical editable logo source under `source/artwork/`.

Generated SVG/PDF/PNG variants must continue to come from `scripts/build_assets.py` and `brand-assets.json`.

Do not commit manually recreated derivatives as new sources of truth.

For clear-space geometry, apply the same separation that proved reliable in LibreSign:

1. canonical master SVG is the geometric source;
2. deterministic Python code derives the technical clear-space diagram from that source;
3. the generated technical SVG is the normative diagram;
4. Typst only scales and places the finished vector.

LibreCode currently computes part of the clear-space construction inside Typst from a numeric ratio. That should be refactored so normative geometry does not depend on manual layout code.

## Manual editorial scope

The completed manual should cover, at minimum:

- how to use the manual;
- official naming and pronunciation;
- what LibreCode stands for;
- primary and secondary audiences;
- free-software values in practical language;
- cooperative identity and community participation;
- voice and tone;
- a concise messaging system or brand promise;
- official logo source;
- approved logo variants and file formats;
- construction/composition;
- correct and incorrect use;
- logo colors versus any wider digital/interface palette;
- typography and intended weights;
- clear space;
- minimum size;
- partner/third-party use;
- accessibility;
- licensing, trademark, ownership, and official sources.

Do not invent systems for photography, illustration, motion, social templates, campaign systems, sub-brands, or other areas until LibreCode has approved source material and rules for them.

## Language

LibreCode can remain authored in Portuguese. The writing should follow plain-language principles:

- short sentences where possible;
- common words before specialist terminology;
- explain unavoidable specialist terms;
- avoid marketing clichés and vague abstractions;
- prefer claims that can be checked;
- distinguish product/project facts from legal guarantees.

The goal is clarity, not simplification of meaning.

## Typst architecture and maintainability

Keep the existing separation:

- `manual/main.typ` — document content;
- `manual/components.typ` — reusable layout functions;
- `manual/theme.typ` — brand tokens.

Adopt the Typst maintenance practices already validated in LibreSign:

- two-space indentation;
- kebab-case for Typst variables and functions;
- named data fields instead of positional tuple indexes such as `entry.at(0)`;
- remove dead cross-brand components/imports;
- use `set` rules for defaults;
- use `show` rules only when an element needs structural transformation;
- keep authoritative geometric calculations outside Typst when they come from source artwork;
- avoid adding a Typst package when a small local function is sufficient.

Use Typstyle as the formatter gate through the maintained `typstyle-rs/typstyle-action` GitHub Action.

Pin the Action to a full immutable commit SHA with a human-readable version comment. This allows the existing GitHub Actions Dependabot ecosystem to propose updates.

Keep the **Typst compiler version exact** in `setup-typst`. Do not replace it with `latest` or a floating version range. The compiler is part of the reproducible PDF toolchain, and compiler upgrades must be reviewed deliberately because they may change pagination, rendering, tagging, or PDF output.

Dependabot does not update arbitrary `with:` inputs such as `typst-version`; this exact pin is intentional.

Recommend Tinymist for editor diagnostics/linting, but do not make it a mandatory CI dependency unless it catches concrete issues not already covered by the compiler and formatter.

## PDF accessibility and navigation

Bring LibreCode to the same PDF quality baseline as LibreSign:

- build as PDF/UA-1;
- semantic document title;
- semantic heading hierarchy;
- linked table of contents;
- PDF bookmarks;
- TOC destinations that land at the top of the target section page;
- alt text for meaningful images;
- decorative section numbers marked as PDF artifacts;
- correct document language;
- selectable text and sensible reading order;
- independent PDF/UA-1 validation with veraPDF in CI.

Automated validation does not replace human visual/accessibility review.

## CI and repository quality

Apply the same supply-chain and maintenance conventions:

- pin every third-party GitHub Action to a full 40-character commit SHA;
- keep the release/version tag as a comment, for example `# v7.0.1`;
- enforce that rule in `scripts/check_brand.py`;
- add grouped weekly Dependabot updates for the `github-actions` ecosystem;
- use the installed DCO GitHub App as the sign-off check instead of maintaining a competing custom DCO workflow;
- keep all human commits signed off under the repository's DCO policy;
- keep REUSE compliance in CI;
- keep brand contract/asset validation in CI;
- keep manual build and PDF validation in CI.

When adding a formatter or validator, prefer maintained Actions that Dependabot can update rather than hardcoded download URLs/versions inside shell scripts, unless reproducibility requires an exact standalone binary.

## Release model

Use the same two-level distribution model:

- `latest` — mutable prerelease/development build from `main`;
- `vX.Y.Z` — immutable approved versioned releases.

The development release is appropriate for review and homologation.

Do **not** create `v1.0.0` merely because the manual is usable. Create the first stable version only after the LibreCode manual has completed its own review/homologation round and accepted feedback has been incorporated.

A versioned release should publish:

- manual PDF;
- official SVG;
- appropriate PNG/PDF logo derivatives;
- checksum file.

## Licensing

The repository is intentionally multi-license.

Target model:

- documentation and official artwork: `CC-BY-SA-4.0`;
- scripts and automation: `AGPL-3.0-or-later`;
- fonts: their upstream licenses, currently OFL where applicable;
- trademark rights: separate from copyright licenses.

Keep per-file SPDX metadata plus `LICENSES/` as the precise source for licensing.

Also add a conventional top-level `LICENSE` containing the exact CC BY-SA 4.0 text, because GitHub's repository interface expects a root license file for normal license detection. The README must make clear that scripts/automation and third-party fonts have different licenses.

## Trademark and registration records

Keep trademark policy and registration facts separate:

- `TRADEMARKS.md` — what uses are and are not permitted;
- `docs/registrations.md` — factual registration identifiers and dates.

Before publishing registration metadata, verify it from the official INPI certificate/extract for LibreCode. Do not infer LibreCode data from LibreSign records or vice versa.

Publish only details useful for public verification. Avoid payment references, filing-system identifiers, personal addresses, CPF numbers, phone numbers, or other administrative/private data that are not required for public identification.

If the official certificate confirms registered status, the manual may mention the fact briefly, but the full legal/administrative record belongs in `docs/registrations.md`.

## README and repository presentation

The README should:

- show the canonical LibreCode logo near the top, using the canonical SVG directly where practical;
- describe the repository as the canonical version-controlled brand system;
- link to the public guide;
- link clearly to the mutable development manual until a stable release exists;
- explain the multi-license model;
- state the canonical-source/migration boundary.

Do not add external status badges to the brand manual repository unless they describe this repository itself.

## Repository metadata

Complete issue #6 and verify:

- canonical description;
- homepage;
- wiki disabled;
- merged branches deleted automatically;
- relevant repository topics.

Do not close the issue until the values returned by GitHub match the intended state.

## Final acceptance checklist

Before declaring the LibreCode manual complete:

- [ ] editorial scope reviewed against LibreCode-specific source material;
- [ ] clear-space construction generated deterministically from canonical artwork;
- [ ] approved logo variants and usage examples complete;
- [ ] no cross-brand dead code remains in Typst;
- [ ] Typstyle formatting gate enabled;
- [ ] GitHub Actions pinned to immutable SHAs;
- [ ] Dependabot configured for Actions;
- [ ] PDF semantic navigation/bookmarks complete;
- [ ] veraPDF PDF/UA-1 validation passes;
- [ ] manual visually reviewed page by page;
- [ ] accessibility reviewed beyond automated validation;
- [ ] top-level `LICENSE` added and multi-license scope documented;
- [ ] trademark registration facts verified and documented;
- [ ] repository metadata applied and verified;
- [ ] mutable `latest` development release works;
- [ ] external homologation/review completed;
- [ ] first stable release prepared only after approval.

## Source of comparison

The current `LibreSign/brand` repository is the practical reference implementation for repository structure, Typst maintenance, CI quality gates, accessibility, release semantics, licensing organization, and migration boundaries.

Use it as an implementation reference, not as a source of LibreCode-specific brand decisions.
