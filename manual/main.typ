// SPDX-FileCopyrightText: 2026 LibreCode Coop contributors
// SPDX-License-Identifier: CC-BY-SA-4.0

#import "theme.typ": theme
#import "components.typ": (
  back-cover, cover, librecode-clear-space, logo-stage, manual-page, rule-pair, section-page, specimen, statement,
  swatch, toc-page,
)

#set document(
  title: "Manual da Marca LibreCode",
  author: "LibreCode Coop contributors",
)
#set text(font: theme.body-font, lang: "pt", size: 10.5pt, fill: theme.ink)
#set par(leading: 0.72em, spacing: 0.7em, justify: false)
#set list(indent: 0pt, body-indent: 1.2em)
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
    (
      number: "01",
      title: "Fundamentos",
      summary: "Nome, propósito, público e cooperativismo",
      anchor: "section-foundations",
    ),
    (number: "02", title: "Logo", summary: "Artwork canônico e composição", anchor: "section-logo"),
    (
      number: "03",
      title: "Sistema visual",
      summary: "Cores, tipografia, proteção e escala",
      anchor: "section-visual-system",
    ),
    (number: "04", title: "Uso", summary: "Aplicações, voz, comunidade e acessibilidade", anchor: "section-usage"),
    (
      number: "05",
      title: "Governança",
      summary: "Licenças, marcas, terceiros e fonte canônica",
      anchor: "section-governance",
    ),
  ),
)

#section-page(
  theme,
  [01],
  [Fundamentos],
  [A marca começa pelo nome e pela ideia de liberdade que ele representa.],
  "section-foundations",
)


#manual-page(theme, [Fundamentos], [Como usar este manual])[
  Este manual reúne as regras atuais de nome, mensagem, identidade visual, uso e governança da marca LibreCode.

  #v(5mm)
  Use-o junto com os arquivos do repositório:

  - consulte `guidelines/` para regras normativas detalhadas;
  - use somente artwork canônico ou derivados gerados por CI;
  - trate `source/artwork/librecode-master.svg` como fonte geométrica do logo;
  - use o PDF como guia de consulta, não como fonte para extrair ou redesenhar a marca.

  #v(6mm)
  #statement(theme, [
    Se uma regra não estiver documentada com evidência suficiente, não a invente para preencher uma lacuna. Registre a pendência e preserve a identidade já aprovada.
  ])

  #v(5mm)
  O escopo atual não define fotografia, ilustração, motion, campanhas, sub-marcas ou templates adicionais sem material aprovado.
]

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


#manual-page(theme, [Fundamentos], [Quem somos e para quem falamos])[
  A *LibreCode Coop* é uma cooperativa digital de especialistas em desenvolvimento de software livre.

  A comunicação institucional se dirige a organizações que precisam operar tecnologia com clareza sobre como ela funciona, onde seus dados estão e quem pode manter ou adaptar as soluções.

  #v(6mm)
  #statement(theme, [
    O público inclui organizações dos setores público, privado e do terceiro setor. A linguagem deve ser compreensível para quem decide e precisa operar tecnologia, sem abandonar a precisão técnica.
  ])
  #v(5mm)

  A LibreCode desenvolve e também trabalha com implantação, hospedagem, suporte, integração e customização de soluções livres. A marca deve explicar a utilidade concreta desse trabalho, não apenas a tecnologia empregada.
]

#manual-page(theme, [Fundamentos], [Posicionamento])[
  O eixo da mensagem é *tecnologia com transparência e liberdade*.

  Liberdade, neste contexto, significa capacidade real de compreender, inspecionar, adaptar, integrar, manter e escolher como a tecnologia evolui.

  #v(7mm)
  #rule-pair(
    theme,
    [PREFIRA],
    [
      - autonomia e capacidade de escolha;
      - interoperabilidade e continuidade;
      - tecnologia documentada e auditável;
      - benefícios concretos para a operação.
    ],
    [EVITE],
    [
      - tratar "libre" como sinônimo de gratuito;
      - prometer independência absoluta;
      - transformar software livre em slogan sem consequência prática;
      - atacar quem utiliza soluções proprietárias.
    ],
  )
]

#manual-page(theme, [Fundamentos], [Cooperativismo e software livre])[
  A LibreCode relaciona duas formas de distribuir poder: decisões organizacionais compartilhadas e tecnologia que pode ser estudada, auditada e modificada.

  Cooperativismo não é um sufixo decorativo da marca. Ele descreve a forma de organização da LibreCode e deve aparecer de maneira coerente com princípios de gestão democrática, participação, autonomia, educação, intercooperação e interesse pela comunidade.

  #v(6mm)
  #statement(theme, [
    A comunicação deve conectar software livre e cooperativismo pela transparência, pela colaboração e pela capacidade de participar das decisões que afetam pessoas e organizações.
  ])
]

#manual-page(theme, [Fundamentos], [Missão, visão e valores])[
  A comunicação institucional deve permanecer coerente com as formulações oficiais da LibreCode.

  #v(4mm)
  *Missão* \
  Contribuir para uma economia solidária por meio do cooperativismo, ampliando o acesso e o controle sobre tecnologia, segurança e privacidade de dados com software livre.

  #v(4mm)
  *Visão* \
  Crescer e fomentar novas cooperativas de tecnologias livres, buscando fortalecimento mútuo, maior visibilidade social e participação em decisões públicas.

  #v(4mm)
  *Valores* \
  Economia solidária, segurança e privacidade, comunidade, transparência e copyleft/software livre.

  #v(6mm)
  Essas formulações podem ser resumidas conforme o contexto, mas não devem ser ampliadas para promessas que a organização não tenha assumido.
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
  "section-logo",
)

#manual-page(theme, [Logo], [Marca principal])[
  #logo-stage(theme, "../build/assets/librecode-logo-primary.svg", "Logo oficial LibreCode")
  #v(8mm)

  O master canônico é `source/artwork/librecode-master.svg`.

  A composição une o símbolo de nós conectados à assinatura LibreCode. O arquivo vetorial versionado é a fonte de verdade para qualquer derivação pública.
]


#manual-page(theme, [Logo], [Variantes e formatos])[
  O sistema gera três variantes oficiais a partir do mesmo master vetorial:

  - *principal*: vermelho e cinza; é a versão padrão para fundos claros;
  - *reversa*: branca; use em fundos escuros ou saturados com contraste suficiente;
  - *monocromática*: preta; use o arquivo oficial quando o processo exigir reprodução em uma única cor.

  #v(6mm)
  Não crie recolorações intermediárias nem redesenhe uma variante manualmente.

  #v(6mm)
  *Formatos*

  - *SVG*: preferido para uso digital e escalável;
  - *PNG*: adequado para apresentações, redes sociais e fluxos raster;
  - *PDF*: indicado para impressão e intercâmbio vetorial quando necessário.

  Os derivados públicos devem ser gerados pelo pipeline do repositório a partir do SVG canônico.
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
  "section-visual-system",
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
  #librecode-clear-space(
    theme,
    "../build/assets/librecode-clear-space-diagram.svg",
    "Logo LibreCode dentro da área de proteção com uma unidade X em cada lado",
    "../build/assets/librecode-reference-d.svg",
    "Letra D da assinatura LibreCode usada para derivar a unidade X",
    [*X* corresponde à largura da letra *D* em CODE. A moldura interna coincide com os limites da marca; a moldura externa acrescenta uma unidade X em cada lado.],
  )
]

#manual-page(theme, [Sistema visual], [Escala mínima])[
  Em impressão, não use o logo completo abaixo de *20 mm de largura*.

  #v(8mm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 7mm,
    align(center, image(
      "../build/assets/librecode-logo-primary.svg",
      width: 42mm,
      alt: "Logo LibreCode em escala grande",
    )),
    align(center, image(
      "../build/assets/librecode-logo-primary.svg",
      width: 30mm,
      alt: "Logo LibreCode em escala média",
    )),
    align(center, image(
      "../build/assets/librecode-logo-primary.svg",
      width: 20mm,
      alt: "Logo LibreCode na escala mínima de impressão",
    )),
  )
  #v(7mm)

  Em digital, a medida absoluta em pixels depende da densidade do dispositivo; o critério é preservar reconhecimento e legibilidade.
]

#section-page(
  theme,
  [04],
  [Uso],
  [Consistência não significa rigidez: significa que a marca continua sendo reconhecível em diferentes contextos.],
  "section-usage",
)

#manual-page(theme, [Uso], [Aplicação])[
  #grid(
    columns: (1fr, 1fr),
    gutter: 7mm,
    block(fill: white, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image(
          "../build/assets/librecode-logo-primary.svg",
          width: 78%,
          alt: "Logo LibreCode primário sobre fundo branco",
        )
      ]
    ],
    block(fill: theme.soft, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image(
          "../build/assets/librecode-logo-primary.svg",
          width: 78%,
          alt: "Logo LibreCode primário sobre fundo cinza claro",
        )
      ]
    ],

    block(fill: theme.ink, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image(
          "../build/assets/librecode-logo-reversed.svg",
          width: 78%,
          alt: "Logo LibreCode reverso sobre fundo escuro",
        )
      ]
    ],
    block(fill: theme.accent, inset: 8mm, height: 58mm)[
      #align(center + horizon)[
        #image(
          "../build/assets/librecode-logo-reversed.svg",
          width: 78%,
          alt: "Logo LibreCode reverso sobre fundo vermelho",
        )
      ]
    ],
  )
  #v(7mm)

  Use a versão primária em fundos claros e a versão reversa em campos escuros ou saturados. Verifique sempre contraste e área de proteção.
]


#manual-page(theme, [Uso], [Voz e tom])[
  A LibreCode deve soar *tecnicamente competente, transparente, cooperativa e precisa*.

  #v(6mm)
  #rule-pair(
    theme,
    [PREFIRA],
    [
      - linguagem direta e verificável;
      - benefícios concretos antes de slogans;
      - "liberdade de escolha" e "menor dependência de fornecedor";
      - termos de negócio compreensíveis com precisão técnica.
    ],
    [EVITE],
    [
      - superlativos sem evidência;
      - promessas absolutas de segurança ou soberania;
      - sugerir que software livre elimina risco operacional;
      - jargão quando existe uma expressão mais clara.
    ],
  )
]

#manual-page(theme, [Uso], [Comunidade e contribuição])[
  Software livre é construído e mantido por pessoas e organizações que usam, testam, documentam, reportam problemas, desenvolvem e financiam o trabalho.

  A comunicação da LibreCode pode convidar essa participação e deve explicar o efeito concreto da contribuição: correções, novas funcionalidades, documentação, manutenção e continuidade de código auditável.

  #v(7mm)
  #statement(theme, [
    Comunidade é parte do ecossistema da LibreCode, mas usuário, cliente, contribuidor, parceiro e cooperado são relações diferentes. Não use esses termos como se fossem equivalentes.
  ])
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
  "section-governance",
)


#manual-page(theme, [Governança], [Parcerias, compatibilidade e terceiros])[
  Referências a projetos, fornecedores, clientes, integrações e outras organizações devem descrever a relação real.

  É permitido afirmar compatibilidade ou integração quando isso for verdadeiro. Não use marca, texto ou composição visual que implique parceria, certificação, patrocínio ou endosso inexistente.

  #v(7mm)
  #statement(theme, [
    Antes de chamar uma organização de "parceira", confirme que existe evidência atual e autorizada dessa relação. Na ausência dessa evidência, descreva apenas o fato verificável: integração, compatibilidade, uso, contribuição ou prestação de serviço.
  ])
]

#manual-page(theme, [Governança], [Propriedade e decisões])[
  Este repositório é a fonte canônica do sistema de marca. Regras, artwork, fontes, manual, licenças e automação evoluem por histórico versionado.

  Direitos autorais e direitos de marca são assuntos diferentes. A licença de um arquivo não concede automaticamente permissão para sugerir afiliação, endosso ou caráter oficial.

  #v(6mm)
  O registro de marca só deve aparecer no manual com número de processo, classes, titularidade e situação quando houver evidência oficial verificada. Enquanto isso não existir no repositório, esses dados permanecem deliberadamente ausentes.

  #v(6mm)
  Alterações que mudem nome, logo, cores centrais, tipografia oficial, posicionamento ou outras regras normativas exigem uma decisão explícita de marca; não devem surgir como efeito colateral de manutenção técnica.
]

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
