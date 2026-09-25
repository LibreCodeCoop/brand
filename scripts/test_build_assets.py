#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
# SPDX-License-Identifier: AGPL-3.0-or-later

from __future__ import annotations

import tempfile
import unittest
import xml.etree.ElementTree as ET
from pathlib import Path

from build_assets import build_clear_space_diagram


class ClearSpaceDiagramTest(unittest.TestCase):
    def setUp(self) -> None:
        self.diagram = {
            "highlight": {
                "attribute": "id",
                "value": "reference-d",
                "color": "#e5332a",
            },
            "marker_bbox": [10, 10, 20, 30],
            "marker_color": "#b5b5b5",
            "boundary_color": "#b5b5b5",
            "contacts": {
                "top": [50, 10],
                "bottom": [50, 90],
                "left": [10, 50],
                "right": [90, 50],
            },
        }

    def write_source(self, directory: Path, include_reference: bool = True) -> Path:
        reference_id = ' id="reference-d"' if include_reference else ""
        source = directory / "source.svg"
        source.write_text(
            (
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">'
                f'<path{reference_id} d="M10 10 H30 V40 H10 Z" fill="#777777"/>'
                '<path d="M40 40 H60 V60 H40 Z" fill="#999999"/>'
                "</svg>"
            ),
            encoding="utf-8",
        )
        return source

    def test_builds_four_reference_glyphs_and_highlights_source(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            directory = Path(tmp)
            source = self.write_source(directory)
            target = directory / "diagram.svg"

            build_clear_space_diagram(source, target, self.diagram)

            root = ET.parse(target).getroot()
            namespace = {"svg": "http://www.w3.org/2000/svg"}
            transformed_groups = [
                group
                for group in root.findall("svg:g", namespace)
                if group.attrib.get("transform", "").startswith("matrix(")
            ]
            self.assertEqual(4, len(transformed_groups))

            highlighted = [
                path
                for path in root.findall(".//svg:path", namespace)
                if path.attrib.get("id") == "reference-d"
                and path.attrib.get("fill") == "#e5332a"
            ]
            self.assertEqual(1, len(highlighted))

            marker_paths = [
                group.find("svg:path", namespace)
                for group in transformed_groups
            ]
            self.assertTrue(all(path is not None for path in marker_paths))
            self.assertTrue(
                all(path.attrib.get("fill") == "#b5b5b5" for path in marker_paths if path is not None)
            )

    def test_rejects_missing_reference_glyph(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            directory = Path(tmp)
            source = self.write_source(directory, include_reference=False)
            target = directory / "diagram.svg"

            with self.assertRaises(ValueError):
                build_clear_space_diagram(source, target, self.diagram)


if __name__ == "__main__":
    unittest.main()
