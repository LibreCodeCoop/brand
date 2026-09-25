#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
# SPDX-License-Identifier: AGPL-3.0-or-later

from __future__ import annotations

import argparse
import copy
import json
import re
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HEX = re.compile(r"#[0-9a-fA-F]{6}")


def run(*args: str) -> None:
    subprocess.run(args, check=True)


def recolor(text: str, mapping: dict[str, str]) -> str:
    lookup = {k.lower(): v for k, v in mapping.items()}
    return HEX.sub(lambda m: lookup.get(m.group(0).lower(), m.group(0)), text)


def normalize_svg(source: Path, target: Path, padding: float) -> None:
    with tempfile.TemporaryDirectory() as tmp:
        cropped = Path(tmp) / "cropped.svg"
        run(
            "inkscape",
            str(source),
            "--export-type=svg",
            "--export-area-drawing",
            "--export-plain-svg",
            f"--export-filename={cropped}",
        )
        tree = ET.parse(cropped)
        root = tree.getroot()
        x, y, w, h = [float(v) for v in root.attrib["viewBox"].split()]
        pad = min(w, h) * padding
        root.set("viewBox", f"{x-pad:.6f} {y-pad:.6f} {w+2*pad:.6f} {h+2*pad:.6f}")
        root.attrib.pop("width", None)
        root.attrib.pop("height", None)
        target.parent.mkdir(parents=True, exist_ok=True)
        tree.write(target, encoding="unicode", xml_declaration=True)


def crop_reference(source: Path, target: Path, fraction: list[float], padding: float = 0.025) -> None:
    tree = ET.parse(source)
    root = tree.getroot()
    x, y, w, h = [float(v) for v in root.attrib["viewBox"].split()]
    fx, fy, fw, fh = fraction
    cx, cy, cw, ch = x + w * fx, y + h * fy, w * fw, h * fh
    pad = min(cw, ch) * padding
    root.set("viewBox", f"{cx-pad:.6f} {cy-pad:.6f} {cw+2*pad:.6f} {ch+2*pad:.6f}")
    root.attrib.pop("width", None)
    root.attrib.pop("height", None)
    target.parent.mkdir(parents=True, exist_ok=True)
    tree.write(target, encoding="unicode", xml_declaration=True)



def build_clear_space_diagram(source: Path, target: Path, clear_space: dict) -> None:
    tree = ET.parse(source)
    source_root = tree.getroot()
    namespace = "http://www.w3.org/2000/svg"
    ET.register_namespace("", namespace)

    def tag(name: str) -> str:
        return f"{{{namespace}}}{name}"

    x, y, width, height = [float(v) for v in source_root.attrib["viewBox"].split()]
    unit = width * float(clear_space["unit_ratio_to_logo_width"])
    diagram = clear_space["diagram"]

    outer_x = x - unit
    outer_y = y - unit
    outer_width = width + 2 * unit
    outer_height = height + 2 * unit

    root = ET.Element(
        tag("svg"),
        {
            "viewBox": f"{outer_x:.6f} {outer_y:.6f} {outer_width:.6f} {outer_height:.6f}",
            "role": "img",
            "aria-label": "Construção da área de proteção da LibreCode",
        },
    )
    title = ET.SubElement(root, tag("title"))
    title.text = "Construção da área de proteção da LibreCode"

    ET.SubElement(
        root,
        tag("rect"),
        {
            "x": f"{outer_x:.6f}",
            "y": f"{outer_y:.6f}",
            "width": f"{outer_width:.6f}",
            "height": f"{outer_height:.6f}",
            "fill": diagram.get("outer_fill", "#e0e0e0"),
            "stroke": diagram.get("stroke", "#7c7b7b"),
            "stroke-width": "1.5",
        },
    )
    ET.SubElement(
        root,
        tag("rect"),
        {
            "x": f"{x:.6f}",
            "y": f"{y:.6f}",
            "width": f"{width:.6f}",
            "height": f"{height:.6f}",
            "fill": "#ffffff",
            "stroke": diagram.get("stroke", "#7c7b7b"),
            "stroke-width": "1.5",
        },
    )

    for child in source_root:
        root.append(copy.deepcopy(child))

    label_color = diagram.get("label_color", "#7c7b7b")
    font_size = unit * 0.42
    labels = (
        (x + width / 2, y - unit / 2, "X"),
        (x + width / 2, y + height + unit / 2, "X"),
        (x - unit / 2, y + height / 2, "X"),
        (x + width + unit / 2, y + height / 2, "X"),
    )
    for lx, ly, label in labels:
        node = ET.SubElement(
            root,
            tag("text"),
            {
                "x": f"{lx:.6f}",
                "y": f"{ly:.6f}",
                "fill": label_color,
                "font-family": "sans-serif",
                "font-size": f"{font_size:.6f}",
                "font-weight": "600",
                "text-anchor": "middle",
                "dominant-baseline": "middle",
            },
        )
        node.text = label

    target.parent.mkdir(parents=True, exist_ok=True)
    ET.ElementTree(root).write(target, encoding="unicode", xml_declaration=True)


def export(svg: Path, out_dir: Path, png_widths: list[int]) -> None:
    stem = svg.stem
    run("inkscape", str(svg), "--export-area-page", "--export-type=pdf", f"--export-filename={out_dir / (stem + '.pdf')}")
    for width in png_widths:
        run(
            "inkscape",
            str(svg),
            "--export-area-page",
            "--export-type=png",
            f"--export-width={width}",
            f"--export-filename={out_dir / (stem + '-' + str(width) + '.png')}",
        )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--spec", default="source/artwork/brand-assets.json")
    parser.add_argument("--output", default="build/assets")
    args = parser.parse_args()

    spec = json.loads((ROOT / args.spec).read_text(encoding="utf-8"))
    out_dir = ROOT / args.output
    shutil.rmtree(out_dir, ignore_errors=True)
    out_dir.mkdir(parents=True, exist_ok=True)

    master = ROOT / spec["master"]
    master_text = master.read_text(encoding="utf-8")
    variants: dict[str, Path] = {}

    with tempfile.TemporaryDirectory() as tmp:
        tmp = Path(tmp)
        for name, variant in spec["variants"].items():
            staged = tmp / f"{name}.svg"
            staged.write_text(recolor(master_text, variant.get("colors", {})), encoding="utf-8")
            target = out_dir / f"{spec['slug']}-logo-{name}.svg"
            normalize_svg(staged, target, spec["normalization"]["padding_ratio"])
            variants[name] = target
            export(target, out_dir, spec["exports"]["png_widths"])

        marker = spec.get("clear_space", {}).get("marker")
        if marker:
            marker_target = out_dir / marker["filename"]
            crop_reference(variants[marker["variant"]], marker_target, marker["fraction"])
            marker_colors = marker.get("colors", {})
            if marker_colors:
                marker_target.write_text(
                    recolor(marker_target.read_text(encoding="utf-8"), marker_colors),
                    encoding="utf-8",
                )
            export(marker_target, out_dir, [512])

        clear_space = spec.get("clear_space", {})
        diagram = clear_space.get("diagram")
        if diagram:
            diagram_target = out_dir / diagram["filename"]
            build_clear_space_diagram(variants["primary"], diagram_target, clear_space)
            export(diagram_target, out_dir, [512, 1024])

    primary = variants["primary"]
    for suffix in ("svg", "pdf"):
        source = primary.with_suffix("." + suffix)
        shutil.copyfile(source, out_dir / f"{spec['slug']}-logo.{suffix}")
    shutil.copyfile(
        out_dir / f"{spec['slug']}-logo-primary-1024.png",
        out_dir / f"{spec['slug']}-logo.png",
    )

    print(f"Generated {len(list(out_dir.iterdir()))} assets in {out_dir.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
