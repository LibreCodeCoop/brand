// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#import "theme.typ": theme
#import "components.typ": cover, toc-page, section-page, manual-page, logo-stage, swatch, specimen, clear-space-glyph, clear-space-x, rule-pair, statement, back-cover

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
  "../build/assets/librecode-logo-primary.svg",
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
  #logo-stage(theme, "../build/assets/librecode-logo-primary.svg", "Logo oficial LibreCode")
  #v(8mm)

  O master canônico é `source/artwork/librecode-logo.svg`.

  A composição une o símbolo de nós conectados à assinatura LibreCode. O arquivo vetorial versionado é a fonte de verdade para qualquer derivação pública.
]

#manual-page(theme, [Logo], [Construção e composição])[
  #grid(
    columns: (1.15fr, 0.85fr),
    gutter: 10mm,
    block(fill: white, inset: 10mm, height: 78mm)[
      #align(center + horizon)[
        #image("../build/assets/librecode-logo-primary.svg", width: 84%, alt: "Composição oficial do logo LibreCode")
      ]
    ],
    [
      #text(font: theme.heading-font, size: 12pt, weight: "bold", fill: theme.accent)[Símbolo]
      #v(2mm)
      A rede de nós é o elemento distintivo da marca.

      #v(7mm)
      #text(font: theme.heading-font, size: 12pt, weight: "bold", fill: theme.accent)[Assinatura]
      #v(2mm)
      O wordmark LibreCode completa a composição e não deve ser redesenhado separadamente.
    ],
  )
  #v(8mm)

  A relação entre símbolo e assinatura é fixa no master vetorial. Use o arquivo canônico em vez de reconstruir a composição por medidas manuais.
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
    [LibreCode],
    size: 32pt,
  )
  #v(7mm)
  #specimen(
    theme,
    "Instrument Sans",
    [Texto e informação],
    [Tecnologia com liberdade],
    size: 22pt,
  )
  #v(9mm)

  As fontes são distribuídas no repositório sob SIL Open Font License 1.1 e usadas diretamente no build do manual.
]

#manual-page(theme, [Sistema visual], [Área de proteção])[
  A área de proteção impede que texto, bordas e outras marcas disputem espaço visual com a assinatura.

  #v(7mm)
  #clear-space-x(
    theme,
    "../build/assets/librecode-logo-primary.svg",
    "Logo LibreCode dentro da área de proteção",
    "../build/assets/librecode-reference-d.svg",
    "Letra D de referência da assinatura LibreCode",
    92mm,
    0.14966083,
    [*X* corresponde à largura da letra *D* da assinatura. Preserve uma unidade X em todo o perímetro do artwork oficial.],
  )
]

#manual-page(theme, [Sistema visual], [Escala mínima])[
  Em impressão, não use o logo completo abaixo de *20 mm de largura*.

  #v(8mm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 7mm,
    align(center,
      image("../build/assets/librecode-logo-primary.svg", width: 42mm, alt: "Logo LibreCode em escala grande"),
    ),
    align(center,
      image("../build/assets/librecode-logo-primary.svg", width: 30mm, alt: "Logo LibreCode em escala média"),
    ),
    align(center,
      image("../build/assets/librecode-logo-primary.svg", width: 20mm, alt: "Logo LibreCode na escala mínima de impressão"),
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
    block(fill: white, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image("../build/assets/librecode-logo-primary.svg", width: 78%, alt: "Logo LibreCode primário sobre fundo branco")
      ]
    ],
    block(fill: theme.soft, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image("../build/assets/librecode-logo-primary.svg", width: 78%, alt: "Logo LibreCode primário sobre fundo cinza claro")
      ]
    ],
    block(fill: theme.ink, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image("../build/assets/librecode-logo-reversed.svg", width: 78%, alt: "Logo LibreCode reverso sobre fundo escuro")
      ]
    ],
    block(fill: theme.accent, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image("../build/assets/librecode-logo-reversed.svg", width: 78%, alt: "Logo LibreCode reverso sobre fundo vermelho")
      ]
    ],
  )
  #v(7mm)

  Use a versão primária em fundos claros e a versão reversa em campos escuros ou saturados. Verifique sempre contraste e área de proteção.
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
  "../build/assets/librecode-logo-reversed.svg",
  "Logo oficial LibreCode",
  "https://librecode.coop/brand",
  [librecode.coop/brand],
)
