// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#import "components.typ": cover, color-swatch, rule-card

#set document(title: "Manual da Marca LibreCode", author: "LibreCode Coop contributors")
#set text(lang: "pt", size: 10.5pt)
#set page(
  paper: "a4",
  margin: (x: 22mm, y: 20mm),
  numbering: "1",
  footer: context [
    #align(right)[#counter(page).display()]
  ],
)
#set par(justify: true, leading: 0.72em)
#set heading(numbering: "1.")

#show heading.where(level: 1): it => block(
  above: 16pt,
  below: 9pt,
)[
  #text(size: 21pt, weight: "bold", fill: rgb("#e5332a"))[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: (paint: rgb("#e5332a"), thickness: 1pt))
]

#cover(
  [Manual da Marca LibreCode],
  [Tecnologia com liberdade],
  "../source/artwork/librecode-logo.svg",
  rgb("#e5332a"),
)

= Nome oficial

Use sempre:

- *LibreCode*
- *LibreCode Coop*

Evite:

- Librecode
- Libre Code
- libreCode
- LibreCode Co-op

*Coop* é escrito sem hífen.

= O que significa "Libre"

"Libre" representa liberdade tecnológica: poder compreender, operar, auditar, adaptar, integrar, manter e escolher como a tecnologia evolui.

Para organizações, isso significa mais autonomia, interoperabilidade, continuidade, capacidade de escolha e menor dependência artificial de um único fornecedor.

#rule-card(
  [Posicionamento],
  [*"Libre" não significa simplesmente "gratuito".* Preço é uma condição comercial; liberdade é a proposta estratégica.]
)

= Pronúncia

- Libre: /ˈli.bɾe/
- LibreCode: /ˈli.bɾe koʊd/
- Coop: duas sílabas, "co" + "op"

Libre começa com som de /i/. Code mantém a pronúncia inglesa.

= Logo

O master canônico é `source/artwork/librecode-logo.svg`.

#align(center)[
  #image("../source/artwork/librecode-logo.svg", width: 72%)
]

#rule-card(
  [Uso correto],
  [Preserve proporções, geometria, composição e cores do artwork oficial.]
)

#rule-card(
  [Não faça],
  [Não distorça, rotacione, reordene elementos, aplique efeitos decorativos ou crie arquivos alternativos apresentados como oficiais.]
)

= Cores

#color-swatch("LibreCode Red", "#e5332a")
#v(6pt)
#color-swatch("LibreCode Gray", "#7c7b7b")
#v(6pt)
#color-swatch("LibreCode Light Gray", "#dbdbdb")

= Tipografia

- *Space Grotesk*: display e títulos.
- *Instrument Sans*: corpo.

Fontes de terceiros mantêm suas próprias licenças e não herdam a CC BY-SA do manual.

= Área de proteção

Mantenha espaço livre suficiente ao redor da marca para preservar sua independência visual em relação a texto, bordas e outras marcas.

O diagrama normativo será mantido no próprio manual como construção vetorial reproduzível.

= Tamanho mínimo

Não use o logo completo abaixo de *20 mm* em impressão.

Em digital, preserve legibilidade e reconhecimento no dispositivo-alvo.

= Acessibilidade

- garanta contraste adequado ao uso;
- não dependa apenas de cor para transmitir significado;
- preserve legibilidade do logo sobre o fundo;
- mantenha conteúdo textual selecionável e estruturado;
- preserve idioma, metadados, links e ordem de leitura no PDF gerado.

= Licenciamento

- documentação e artwork oficial: CC BY-SA 4.0;
- automação: AGPL-3.0-or-later;
- fontes de terceiros: licença upstream;
- trademark: regras em `TRADEMARKS.md`.

= Fonte canônica

https://github.com/LibreCodeCoop/brand

Guia público:

https://librecode.coop/brand

