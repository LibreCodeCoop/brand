// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#import "theme.typ": theme
#import "components.typ": cover, toc-page, section-page, manual-page, logo-stage, swatch, specimen, rule-pair, statement, back-cover

#set document(
  title: "Manual da Marca LibreCode",
  author: "LibreCode Coop contributors",
)
#set text(font: theme.body-font, lang: "pt", size: 10.5pt, fill: theme.ink)
#set par(leading: 0.72em, spacing: 0.7em, justify: false)
#set list(indent: 0pt, body-indent: 1.2em)
#show heading.where(level: 1): it => text(
  font: theme.heading-font,
  size: 24pt,
  weight: "bold",
  fill: theme.ink,
  it.body,
)

#cover(
  theme,
  [Manual da Marca LibreCode],
  [Tecnologia com liberdade],
  "../source/artwork/librecode-logo.svg",
  "Logo oficial LibreCode",
)

#toc-page(
  theme,
  [Sistema da marca],
  (
    ("01", "Fundamentos", "Nome, significado e pronúncia"),
    ("02", "Logo", "Artwork canônico e composição"),
    ("03", "Sistema visual", "Cores, tipografia, proteção e escala"),
    ("04", "Uso", "Aplicações, consistência e acessibilidade"),
    ("05", "Governança", "Licenças, trademark e fonte canônica"),
  ),
)

#section-page(
  theme,
  [01],
  [Fundamentos],
  [A marca começa pelo nome e pela ideia de liberdade que ele representa.],
)

#manual-page(theme, [Fundamentos], [Nome oficial e significado])[
  Use sempre *LibreCode* e *LibreCode Coop*.

  Evite grafias como Librecode, Libre Code, libreCode e LibreCode Co-op.

  #v(6mm)
  #statement(theme, [
    *Libre* representa liberdade tecnológica: compreender, operar, auditar, adaptar, integrar, manter e escolher como a tecnologia evolui.
  ])
  #v(5mm)

  Para organizações, essa liberdade se traduz em autonomia, interoperabilidade, continuidade, capacidade de escolha e menor dependência artificial de um único fornecedor.

  "Libre" não significa simplesmente "gratuito". Preço é uma condição comercial; liberdade é a proposta estratégica.
]

#manual-page(theme, [Fundamentos], [Pronúncia])[
  #grid(
    columns: (1fr, 1fr),
    gutter: 9mm,
    [
      #text(font: theme.heading-font, size: 17pt, weight: "bold", fill: theme.accent)[Libre]
      #v(2mm)
      /ˈli.bɾe/
      #v(4mm)

      Começa com som de /i/. Não é "laibre".
    ],
    [
      #text(font: theme.heading-font, size: 17pt, weight: "bold", fill: theme.accent)[LibreCode]
      #v(2mm)
      /ˈli.bɾe koʊd/
      #v(4mm)

      *Code* mantém a pronúncia inglesa.
    ],
  )
  #v(10mm)

  #text(font: theme.heading-font, size: 17pt, weight: "bold", fill: theme.accent)[LibreCode Coop]
  #v(2mm)
  *Coop* é escrito sem hífen e pronunciado em duas sílabas: "co" + "op".
]

#section-page(
  theme,
  [02],
  [Logo],
  [O artwork oficial é um ativo técnico. Sua geometria não deve ser redesenhada ou reinterpretada.],
)

#manual-page(theme, [Logo], [Marca principal])[
  #logo-stage(theme, "../source/artwork/librecode-logo.svg", "Logo oficial LibreCode")
  #v(8mm)

  O master canônico é `source/artwork/librecode-logo.svg`.

  A composição une o símbolo de nós conectados à assinatura LibreCode. O arquivo vetorial versionado é a fonte de verdade para qualquer derivação pública.
]

#manual-page(theme, [Logo], [Integridade da marca])[
  #rule-pair(
    theme,
    [FAÇA],
    [
      - preserve proporções e geometria;
      - use o artwork canônico;
      - mantenha contraste suficiente;
      - gere derivados a partir do SVG oficial.
    ],
    [NÃO FAÇA],
    [
      - distorcer, rotacionar ou inclinar;
      - rearranjar os elementos;
      - aplicar sombras, contornos ou gradientes;
      - criar uma versão "oficial" paralela.
    ],
  )
]

#section-page(
  theme,
  [03],
  [Sistema visual],
  [Cor, tipografia e espaço trabalham juntos para tornar a marca reconhecível antes mesmo da leitura.],
)

#manual-page(theme, [Sistema visual], [Cores])[
  #swatch("LibreCode Red", "#e5332a", note: "Cor de assinatura")
  #v(6mm)
  #swatch("LibreCode Gray", "#7c7b7b", note: "Neutro principal")
  #v(6mm)
  #swatch("LibreCode Light Gray", "#dbdbdb", note: "Campo de apoio")
  #v(10mm)

  O vermelho é o principal sinal cromático da LibreCode. O cinza sustenta a assinatura e cria contraste sem competir com ele.
]

#manual-page(theme, [Sistema visual], [Tipografia])[
  #specimen(
    theme,
    "Space Grotesk",
    [Display e títulos],
    [LIBRE / tecnologia com liberdade],
  )
  #v(7mm)
  #specimen(
    theme,
    "Instrument Sans",
    [Texto e informação],
    [Uma identidade clara precisa continuar legível em uso real.],
  )
  #v(9mm)

  As fontes são distribuídas no repositório sob SIL Open Font License 1.1 e usadas diretamente no build do manual.
]

#manual-page(theme, [Sistema visual], [Área de proteção])[
  A área de proteção deve manter a marca visualmente independente de texto, bordas e outras marcas.

  #v(7mm)
  #block(
    width: 100%,
    inset: 12mm,
    fill: white,
    stroke: (paint: theme.neutral, thickness: 0.7pt, dash: "dashed"),
  )[
    #align(center)[
      #image("../source/artwork/librecode-logo.svg", width: 68%, alt: "Logo LibreCode dentro da área de proteção")
    ]
  ]
  #v(4mm)
  #align(center)[
    #text(size: 9pt, fill: theme.neutral)[Mantenha no mínimo uma unidade *x* de respiro em todo o perímetro.]
  ]
]

#manual-page(theme, [Sistema visual], [Escala mínima])[
  Em impressão, não use o logo completo abaixo de *20 mm de largura*.

  #v(8mm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 7mm,
    align(center,
      image("../source/artwork/librecode-logo.svg", width: 42mm, alt: "Logo LibreCode em escala grande"),
    ),
    align(center,
      image("../source/artwork/librecode-logo.svg", width: 30mm, alt: "Logo LibreCode em escala média"),
    ),
    align(center,
      image("../source/artwork/librecode-logo.svg", width: 20mm, alt: "Logo LibreCode na escala mínima de impressão"),
    ),
  )
  #v(7mm)

  Em digital, a medida absoluta em pixels depende da densidade do dispositivo; o critério é preservar reconhecimento e legibilidade.
]

#section-page(
  theme,
  [04],
  [Uso],
  [Consistência não significa rigidez: significa que a marca continua sendo reconhecível em diferentes contextos.],
)

#manual-page(theme, [Uso], [Aplicação])[
  #grid(
    columns: (1fr, 1fr),
    gutter: 7mm,
    block(fill: white, inset: 10mm, height: 64mm)[
      #align(center + horizon)[
        #image("../source/artwork/librecode-logo.svg", width: 78%, alt: "Logo LibreCode sobre fundo claro")
      ]
    ],
    block(fill: theme.soft, inset: 10mm, height: 64mm)[
      #align(center + horizon)[
        #image("../source/artwork/librecode-logo.svg", width: 78%, alt: "Logo LibreCode sobre fundo cinza claro")
      ]
    ],
  )
  #v(7mm)

  Antes de publicar uma nova aplicação, verifique contraste, respiro e fidelidade ao master.
]

#manual-page(theme, [Uso], [Acessibilidade])[
  - garanta contraste adequado ao papel de cada cor;
  - não dependa apenas de cor para transmitir significado;
  - preserve a legibilidade da marca sobre o fundo;
  - mantenha conteúdo textual selecionável e estruturado;
  - preserve idioma, metadados, links e ordem de leitura no PDF.

  #v(8mm)
  #statement(theme, [
    A identidade da marca não pode ser usada como justificativa para reduzir acessibilidade.
  ])
]

#section-page(
  theme,
  [05],
  [Governança],
  [A marca é um sistema público e versionado: regras, artwork e manual evoluem juntos.],
)

#manual-page(theme, [Governança], [Licenciamento e fonte canônica])[
  - documentação e artwork oficial: *CC BY-SA 4.0*;
  - automação: *AGPL-3.0-or-later*;
  - fontes: *SIL Open Font License 1.1*;
  - trademark: regras separadas em `TRADEMARKS.md`.

  #v(8mm)
  Fonte canônica:

  https://github.com/LibreCodeCoop/brand

  Guia público:

  https://librecode.coop/brand
]

#back-cover(
  theme,
  "../source/artwork/librecode-logo.svg",
  "Logo oficial LibreCode",
  [librecode.coop/brand],
)
