// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-FileCopyrightText: 2026 LibreSign contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#let motif(theme) = {
  if theme.motif == "nodes" {
    place(top + left, dx: -8mm, dy: -10mm, circle(radius: 18mm, fill: theme.accent))
    place(top + left, dx: 8mm, dy: -18mm, circle(radius: 11mm, fill: theme.neutral))
    place(bottom + right, dx: 9mm, dy: 9mm, circle(radius: 14mm, fill: theme.accent))
  } else {
    place(left + top, rect(width: 8mm, height: 100%, fill: theme.accent))
    place(right + bottom, dx: 18mm, dy: 18mm, circle(radius: 38mm, fill: theme.soft))
    place(right + bottom, dx: 2mm, dy: 2mm, circle(radius: 17mm, fill: theme.accent-alt))
  }
}

#let cover(theme, title, subtitle, logo, alt) = {
  if theme.motif == "nodes" {
    page(margin: 0pt, numbering: none, fill: theme.paper)[
      #motif(theme)
      #pad(left: 24mm, right: 24mm, top: 34mm, bottom: 24mm)[
        #v(1fr)
        #image(logo, width: 88mm, alt: alt)
        #v(14mm)
        #text(font: theme.heading-font, size: 28pt, weight: "bold", fill: theme.ink)[#title]
        #v(3mm)
        #text(font: theme.body-font, size: 12pt, fill: theme.neutral)[#subtitle]
      ]
    ]
  } else {
    page(margin: 0pt, numbering: none, fill: theme.accent)[
      #place(right + top, dx: 22mm, dy: -24mm, circle(radius: 54mm, fill: theme.accent-alt))
      #place(left + bottom, dx: -22mm, dy: 24mm, circle(radius: 48mm, fill: theme.soft))
      #pad(left: 24mm, right: 24mm, top: 34mm, bottom: 24mm)[
        #v(1fr)
        #align(center)[
          #image(logo, width: 94mm, height: 58mm, fit: "contain", alt: alt)
          #v(18mm)
          #text(font: theme.heading-font, size: 26pt, weight: "bold", fill: white)[#title]
          #v(4mm)
          #text(font: theme.body-font, size: 11.5pt, fill: white)[#subtitle]
        ]
        #v(1fr)
      ]
    ]
  }
}

#let toc-page(theme, title, entries) = page(
  margin: 0pt,
  numbering: none,
  fill: theme.paper,
)[
  #motif(theme)
  #pad(left: 26mm, right: 24mm, top: 26mm, bottom: 24mm)[
    #text(font: theme.heading-font, size: 11pt, weight: "medium", fill: theme.accent)[CONTENTS]
    #v(6mm)
    #text(font: theme.heading-font, size: 26pt, weight: "bold", fill: theme.ink)[#title]
    #v(16mm)
    #for entry in entries {
      grid(
        columns: (15mm, 1fr),
        gutter: 4mm,
        text(font: theme.heading-font, size: 16pt, weight: "bold", fill: theme.accent)[#entry.at(0)],
        [
          #text(font: theme.heading-font, size: 13pt, weight: "semibold", fill: theme.ink)[#entry.at(1)]
          #v(1.5mm)
          #text(font: theme.body-font, size: 9.5pt, fill: theme.neutral)[#entry.at(2)]
        ],
      )
      v(7mm)
    }
  ]
]

#let section-page(theme, number, title, subtitle) = page(
  margin: 0pt,
  numbering: none,
  fill: if theme.motif == "nodes" { theme.paper } else { theme.accent },
)[
  #motif(theme)
  #pad(left: 25mm, right: 24mm, top: 30mm, bottom: 24mm)[
    #v(1fr)
    #text(
      font: theme.heading-font,
      size: 76pt,
      weight: "bold",
      fill: if theme.motif == "nodes" { theme.accent } else { white },
    )[#number]
    #v(7mm)
    #text(
      font: theme.heading-font,
      size: 29pt,
      weight: "bold",
      fill: if theme.motif == "nodes" { theme.ink } else { white },
    )[#title]
    #v(4mm)
    #block(width: 115mm)[
      #text(
        font: theme.body-font,
        size: 11pt,
        fill: if theme.motif == "nodes" { theme.neutral } else { white },
      )[#subtitle]
    ]
    #v(1fr)
  ]
]

#let manual-page(theme, kicker, title, body) = page(
  margin: (left: 24mm, right: 22mm, top: 22mm, bottom: 20mm),
  fill: theme.paper,
  footer: context {
    align(right, text(
      font: theme.body-font,
      size: 8pt,
      fill: theme.neutral,
      counter(page).display(),
    ))
  },
)[
  #place(left + top, dx: -24mm, dy: -22mm, rect(width: 4mm, height: 100% + 42mm, fill: theme.accent))
  #text(font: theme.heading-font, size: 8.5pt, weight: "medium", fill: theme.accent)[#upper(kicker)]
  #v(4mm)
  #heading(level: 1, outlined: false, numbering: none)[#title]
  #v(6mm)
  #body
]

#let logo-stage(theme, logo, alt, dark: false) = block(
  width: 100%,
  height: 78mm,
  fill: if dark { theme.ink } else { white },
  radius: 4pt,
  inset: 14mm,
)[
  #align(center + horizon)[
    #image(logo, width: 72%, height: 55mm, fit: "contain", alt: alt)
  ]
]

#let swatch(name, hex, note: none) = grid(
  columns: (30mm, 1fr),
  gutter: 8mm,
  align: horizon,
  rect(width: 30mm, height: 18mm, fill: rgb(hex), radius: 2pt),
  [
    *#name* \
    #raw(hex)
    #if note != none {
      linebreak()
      text(size: 8.5pt, fill: luma(42%))[#note]
    }
  ],
)

#let specimen(theme, family, role, sample, size: 24pt) = block(
  width: 100%,
  inset: 12pt,
  fill: white,
  radius: 4pt,
  stroke: (paint: theme.soft, thickness: 0.6pt),
)[
  #text(font: theme.heading-font, size: 8pt, weight: "medium", fill: theme.accent)[#upper(role)]
  #v(3mm)
  #text(font: family, size: size, weight: "medium", fill: theme.ink)[#sample]
  #v(3mm)
  #text(font: theme.body-font, size: 9pt, fill: theme.neutral)[#family]
]

#let libresign-clear-space(
  theme,
  logo,
  alt,
  marker,
  marker-alt,
  logo-width,
  unit-ratio,
  note,
) = {
  let unit = logo-width * unit-ratio
  let outer-width = logo-width + unit + unit
  let marker-height = unit * 0.94

  align(center)[
    #stack(
      dir: ttb,
      spacing: 5mm,
      [
        #grid(
          columns: (24mm, 1fr),
          gutter: 6mm,
          align: center + horizon,
          block(
            width: 22mm,
            height: 22mm,
            fill: white,
            stroke: (paint: luma(82%), thickness: 0.6pt),
          )[
            #align(center + horizon)[
              #image(marker, height: 15mm, fit: "contain", alt: marker-alt)
            ]
          ],
          [
            #text(font: theme.heading-font, size: 10pt, weight: "bold", fill: theme.accent)[E = módulo de proteção]
            #v(1.5mm)
            #text(font: theme.body-font, size: 8.7pt, fill: theme.neutral)[A própria letra E da assinatura LibreSign define a distância mínima de não interferência.]
          ],
        )
      ],
      [
        #block(
          width: outer-width,
          fill: white,
          stroke: (paint: luma(70%), thickness: 0.7pt, dash: "dashed"),
          inset: 0pt,
        )[
          #place(top + center, dy: marker-height * 0.50)[
            #image(marker, height: marker-height, fit: "contain", alt: marker-alt)
          ]
          #place(bottom + center, dy: -marker-height * 0.50)[
            #rotate(180deg, image(marker, height: marker-height, fit: "contain", alt: marker-alt))
          ]
          #place(left + horizon, dx: marker-height * 0.50)[
            #rotate(-90deg, image(marker, height: marker-height, fit: "contain", alt: marker-alt))
          ]
          #place(right + horizon, dx: -marker-height * 0.50)[
            #rotate(90deg, image(marker, height: marker-height, fit: "contain", alt: marker-alt))
          ]
          #pad(
            left: unit,
            right: unit,
            top: unit,
            bottom: unit,
          )[
            #image(logo, width: logo-width, fit: "contain", alt: alt)
          ]
        ]
      ],
    )
  ]

  v(6mm)
  align(center)[
    #block(width: 132mm)[
      #text(font: theme.body-font, size: 9pt, fill: theme.neutral)[#note]
    ]
  ]
}

#let librecode-clear-space(
  theme,
  logo,
  alt,
  marker,
  marker-alt,
  logo-width,
  unit-ratio,
  d-x-ratio,
  d-width-ratio,
  note,
) = {
  let unit = logo-width * unit-ratio
  let before-d = logo-width * d-x-ratio
  let d-width = logo-width * d-width-ratio
  let after-d = logo-width - before-d - d-width

  align(center)[
    #stack(
      dir: ttb,
      spacing: 5mm,
      [
        #grid(
          columns: (24mm, 1fr),
          gutter: 6mm,
          align: center + horizon,
          block(
            width: 22mm,
            height: 22mm,
            fill: white,
            stroke: (paint: luma(82%), thickness: 0.6pt),
          )[
            #align(center + horizon)[
              #image(marker, width: 15mm, fit: "contain", alt: marker-alt)
            ]
          ],
          [
            #text(font: theme.heading-font, size: 10pt, weight: "bold", fill: theme.accent)[D → X]
            #v(1.5mm)
            #text(font: theme.body-font, size: 8.7pt, fill: theme.neutral)[A largura da letra D da assinatura define a unidade X usada em todo o perímetro.]
          ],
        )
      ],
      [
        #block(
          fill: luma(88%),
          stroke: (paint: theme.neutral, thickness: 0.7pt),
          inset: 0pt,
        )[
          #grid(
            columns: (unit, logo-width, unit),
            rows: (unit, auto, unit),
            align: center + horizon,
            [
              #align(center + horizon)[
                #text(font: theme.heading-font, size: 15pt, weight: "regular", fill: luma(58%))[X]
              ]
            ],
            [
              #align(center + horizon)[
                #text(font: theme.heading-font, size: 15pt, weight: "regular", fill: luma(58%))[X]
              ]
            ],
            [],
            [
              #align(center + horizon)[
                #rotate(-90deg, text(font: theme.heading-font, size: 15pt, weight: "regular", fill: luma(58%))[X])
              ]
            ],
            block(
              width: logo-width,
              fill: white,
              stroke: (paint: theme.neutral, thickness: 0.7pt),
              inset: 0pt,
            )[
              #image(logo, width: logo-width, fit: "contain", alt: alt)
            ],
            [
              #align(center + horizon)[
                #rotate(90deg, text(font: theme.heading-font, size: 15pt, weight: "regular", fill: luma(58%))[X])
              ]
            ],
            [],
            grid(
              columns: (before-d, d-width, after-d),
              rows: (unit,),
              align: center + top,
              [],
              block(width: d-width, height: unit)[
                #place(left + top)[
                  #line(length: unit * 0.60, angle: 90deg, stroke: (paint: theme.neutral, thickness: 0.7pt, dash: "dashed"))
                ]
                #place(right + top)[
                  #line(length: unit * 0.60, angle: 90deg, stroke: (paint: theme.neutral, thickness: 0.7pt, dash: "dashed"))
                ]
                #place(top, dy: unit * 0.58)[
                  #line(length: d-width, stroke: (paint: theme.neutral, thickness: 0.7pt, dash: "dashed"))
                ]
                #place(top + center, dy: unit * 0.66)[
                  #text(font: theme.heading-font, size: 12pt, weight: "regular", fill: luma(58%))[X]
                ]
              ],
              [],
            ),
            [],
          )
        ]
      ],
    )
  ]

  v(7mm)
  align(center)[
    #block(width: 132mm)[
      #text(font: theme.body-font, size: 9pt, fill: theme.neutral)[#note]
    ]
  ]
}

#let rule-pair(theme, good-title, good-body, bad-title, bad-body) = grid(
  columns: (1fr, 1fr),
  gutter: 7mm,
  block(
    inset: 12pt,
    fill: white,
    radius: 4pt,
    stroke: (paint: theme.accent-alt, thickness: 1pt),
  )[
    #text(font: theme.heading-font, size: 10pt, weight: "bold", fill: theme.accent-alt)[#good-title]
    #v(3mm)
    #good-body
  ],
  block(
    inset: 12pt,
    fill: white,
    radius: 4pt,
    stroke: (paint: theme.neutral, thickness: 1pt),
  )[
    #text(font: theme.heading-font, size: 10pt, weight: "bold", fill: theme.neutral)[#bad-title]
    #v(3mm)
    #bad-body
  ],
)

#let statement(theme, text-content) = block(
  width: 100%,
  inset: 14pt,
  fill: theme.soft,
  radius: 4pt,
)[
  #text(font: theme.heading-font, size: 16pt, weight: "medium", fill: theme.ink)[#text-content]
]

#let back-cover(theme, logo, alt, url, label) = page(
  margin: 0pt,
  numbering: none,
  fill: theme.ink,
)[
  #place(right + top, dx: 20mm, dy: -18mm, circle(radius: 46mm, fill: theme.accent))
  #pad(left: 24mm, right: 24mm, top: 24mm, bottom: 24mm)[
    #v(1fr)
    #align(center)[
      #image(logo, width: 60mm, alt: alt)
      #v(10mm)
      #link(url)[
        #text(font: theme.body-font, size: 9pt, fill: white)[#label]
      ]
    ]
    #v(1fr)
  ]
]
