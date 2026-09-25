#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
# SPDX-License-Identifier: AGPL-3.0-or-later

from __future__ import annotations

import argparse
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
