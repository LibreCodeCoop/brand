// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#let color-swatch(name, hex) = grid(
  columns: (22mm, 1fr),
  gutter: 10pt,
  align: horizon,
  rect(width: 22mm, height: 13mm, fill: rgb(hex), radius: 2pt),
  [
    *#name* \
    #raw(hex)
  ],
)

#let rule-card(title, body, tone: rgb("#f5f5f5")) = block(
  width: 100%,
  inset: 12pt,
  fill: tone,
  radius: 4pt,
  stroke: (paint: luma(82%), thickness: 0.5pt),
)[
  *#title*

  #body
]

#let cover(title, subtitle, logo, accent) = {
  block(
    width: 100%,
    height: 210mm,
    fill: accent,
    inset: 20mm,
    radius: 4pt,
  )[
    #align(center + horizon)[
      #block(fill: white, inset: 10mm, radius: 5pt)[
        #image(logo, width: 95mm)
      ]
      #v(16mm)
      #text(size: 28pt, weight: "bold", fill: white)[#title]
      #v(4mm)
      #text(size: 12pt, fill: white)[#subtitle]
    ]
  ]
  pagebreak()
}
