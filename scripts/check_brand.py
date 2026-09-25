#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
# SPDX-License-Identifier: AGPL-3.0-or-later

from __future__ import annotations

import hashlib
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]
CHECK_DIRS = [ROOT / "source" / "artwork", ROOT / "assets"]
AMBIGUOUS = re.compile(r"(^|[-_.])(final|new|old|copy|copia|v\d+|logo-?\d+)([-_.]|$)", re.I)
MD_LINK = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)


def check_names(failures: list[str]) -> None:
    for directory in CHECK_DIRS:
        if not directory.exists():
            continue
        for path in directory.rglob("*"):
            if path.is_file() and AMBIGUOUS.search(path.stem):
                fail(f"Ambiguous asset filename: {path.relative_to(ROOT)}", failures)


def check_duplicates(failures: list[str]) -> None:
    hashes: dict[str, Path] = {}
    for directory in CHECK_DIRS:
        if not directory.exists():
            continue
        for path in directory.rglob("*"):
            if not path.is_file() or path.suffix.lower() in {".md", ".txt"}:
                continue
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            previous = hashes.get(digest)
            if previous:
                fail(
                    f"Duplicate asset content: {previous.relative_to(ROOT)} and {path.relative_to(ROOT)}",
                    failures,
                )
            else:
                hashes[digest] = path


def check_svg(failures: list[str]) -> None:
    for path in (ROOT / "source" / "artwork").glob("*.svg"):
        try:
            root = ET.parse(path).getroot()
        except ET.ParseError as exc:
            fail(f"Invalid SVG {path.relative_to(ROOT)}: {exc}", failures)
            continue
        if "viewBox" not in root.attrib:
            fail(f"SVG lacks viewBox: {path.relative_to(ROOT)}", failures)


def check_artwork_contract(failures: list[str]) -> None:
    artwork = ROOT / "source" / "artwork"
    specs = list(artwork.glob("brand-assets.json"))
    masters = list(artwork.glob("*-master.svg"))
    unexpected = [
        path for path in artwork.glob("*.svg")
        if not path.name.endswith("-master.svg")
    ]

    if len(specs) != 1:
        fail("Expected exactly one source/artwork/brand-assets.json", failures)
        return
    if len(masters) != 1:
        fail("Expected exactly one canonical *-master.svg artwork source", failures)
    if unexpected:
        for path in unexpected:
            fail(
                f"Derived SVG must not live in source/artwork: {path.relative_to(ROOT)}",
                failures,
            )

    import json
    try:
        spec = json.loads(specs[0].read_text(encoding="utf-8"))
    except Exception as exc:
        fail(f"Invalid brand-assets.json: {exc}", failures)
        return

    master = ROOT / spec.get("master", "")
    if not master.is_file():
        fail(f"Configured master does not exist: {spec.get('master')}", failures)
    if spec.get("normalization", {}).get("crop") != "drawing":
        fail("Asset normalization must use the drawing bounds", failures)
    padding = spec.get("normalization", {}).get("padding_ratio")
    if not isinstance(padding, (int, float)) or not 0 < padding < 0.05:
        fail("padding_ratio must be a small positive value below 0.05", failures)


def check_markdown_links(failures: list[str]) -> None:
    for path in ROOT.rglob("*.md"):
        text = path.read_text(encoding="utf-8")
        for raw in MD_LINK.findall(text):
            target = raw.strip().split()[0].strip("<>")
            if (
                not target
                or target.startswith(("#", "http://", "https://", "mailto:"))
            ):
                continue
            target = unquote(target.split("#", 1)[0])
            resolved = (path.parent / target).resolve()
            if not resolved.exists():
                fail(
                    f"Broken local link in {path.relative_to(ROOT)}: {target}",
                    failures,
                )


def main() -> int:
    failures: list[str] = []
    check_names(failures)
    check_duplicates(failures)
    check_svg(failures)
    check_artwork_contract(failures)
    check_markdown_links(failures)
    if failures:
        for item in failures:
            print(f"ERROR: {item}")
        return 1
    print("Brand quality checks passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
