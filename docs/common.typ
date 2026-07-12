#import "@preview/touying:0.7.3": *
#import emoji: checkmark, quest, star

// colour tokens
#let accent = rgb("#028090")
#let alert = rgb("#F96167")
#let amber = rgb("#F4A261")
#let bg-light = rgb("#EAF4F6")
#let black = rgb("#111111")
#let boxbg = rgb("#f3f3f3")
#let dark = rgb("#1a1a2e")
#let dark-gray = rgb("#2C2C2C")
#let eg-green = rgb("#02C39A")
#let graytag = rgb("#e2e2e2")
#let important-color = rgb("#ef4444")
#let info-color = rgb("#3b82f6")
#let ink = rgb("#1e293b")
#let inkgray = rgb("#2b2b2b")
#let light = rgb("#f4f4f4")
#let light-blue = rgb("#4A4A75")
#let light-gray = rgb("#EBEBEB")
#let light-green = rgb("#44AA44")
#let light-red = rgb("#EF4444")
#let maroon = rgb("#7a1f1f")
#let mid-gray = rgb("#555555")
#let muted = rgb("#5C6E7A")
#let note-color = rgb("#8b5cf6")
#let off-white = rgb("#F5F5F5")
#let red = rgb("#990F0F")
#let teal-color = rgb("#0f766e")
#let teal-light = rgb("#ccfbf1")
#let warning-color = rgb("#f59e0b")
#let white = rgb("#FFFFFF")

#let titlebar(txt) = {
  text(fill: maroon, size: 18pt, weight: "bold", tracking: 1pt)[#txt]
  v(4pt)
  line(length: 100%, stroke: 0.4pt + rgb("#dddddd"))
}

#let notebox(title, body) = box(
  fill: teal.lighten(88%),
  stroke: 1pt + teal,
  radius: 6pt,
  inset: 10pt,
  width: 100%,
)[
  #text(fill: teal, weight: "bold", size: 15pt)[#title]
  #v(0.2em)
  #text(size: 14pt)[#body]
]

#let quotebox(title: none, body) = {
  block(
    fill: boxbg,
    stroke: (left: 2.5pt + teal-color),
    width: 100%,
    inset: 10pt,
    radius: 2pt,
  )[
    #if title != none [
      #text(fill: maroon, weight: "bold", size: 13pt)[#title]
      #v(2pt)
    ]
    #text(style: "italic")[#body]
  ]
}

// bibliography line under a quotebox
#let bibline(body) = {
  text(size: 11pt, fill: rgb("#666666"))[#body]
}

#let sepline() = {
  v(4pt)
  line(length: 100%, stroke: 0.3pt + rgb("#dddddd"))
  v(4pt)
}

#let def(body) = block(
  fill: eg-green,
  inset: 8pt,
  radius: 4pt,
  stroke: 1pt + rgb("#000"),
)[
  #body
]

#let hl(body) = block(
  fill: rgb("#d7d733"),
  inset: 8pt,
  radius: 4pt,
)[
  #body
]

#let title-slide(title, subtitle) = {
  set page(fill: dark)
  set text(fill: white)
  align(horizon + center)[
    #v(0.4em)
    #text(size: 40pt, weight: "bold")[#title]
    #v(0.6em)
    #line(length: 40%, stroke: 1.5pt + accent)
    #v(0.6em)
    #text(size: 16pt, fill: luma(200))[#subtitle]
  ]
}

#let tag(body) = {
  box(
    fill: graytag,
    inset: (x: 6pt, y: 3pt),
    radius: 3pt,
    text(style: "italic", size: 12pt, fill: rgb("#555555"))[#body],
  )
}

#let bullet(body) = {
  grid(
    columns: (14pt, 1fr),
    column-gutter: 4pt,
    text(fill: maroon, size: 11pt)[▸], body,
  )
  v(10pt)
}

#let example(body) = block(
  fill: rgb("#fcf04e"),
  inset: (x: 10pt, y: 7pt),
  radius: 4pt,
  text(body),
)

#let topic(body) = text(fill: teal-color, weight: "bold")[#body]

#let step(tech, question, next) = {
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 0.35em,
    align: (left + horizon, left + horizon, left + horizon),
    text(fill: black)[#tech], text(fill: red, style: "italic")["#question"], text(fill: light-green)[→ #next],
  )
}

#let arrow-down = align(center)[
  #text(fill: inkgray.lighten(20%), size: 15pt)[↓]
]

// icon map
#let _icons = (
  info: "ℹ",
  warning: "⚠",
  note: "✎",
  important: "✦",
)

#let fancy-block(kind, accent, body) = block(
  width: 100%,
  radius: 6pt,
  clip: true,
  stroke: accent + 1pt,
  fill: accent.lighten(90%),
)[
  #grid(
    columns: (auto, 1fr),
    // left colored sidebar
    block(
      fill: accent,
      inset: (x: 10pt, y: 12pt),
    )[
      #set text(fill: white, size: 12pt)
      #_icons.at(kind)
    ],
    // right content
    block(
      inset: (x: 16pt, y: 12pt),
    )[
      #set text(fill: accent.darken(30%), weight: "bold")
      #upper(kind)
      #v(4pt)
      #set text(fill: luma(40), weight: "regular")
      #body
    ],
  )
]

// public callouts
#let info(body) = fancy-block("info", info-color, body)
#let warning(body) = fancy-block("warning", warning-color, body)
#let note(body) = fancy-block("note", note-color, body)
#let important(body) = fancy-block("important", important-color, body)

#let bit-label(bits) = {
  set text(size: 13pt, fill: dark.lighten(30%))
  bits
}

#let footer(llm) = {
  place(bottom + right, dx: -1em, dy: -0.5em, text(
    size: 12pt,
    fill: teal-color.darken(10%),
  )[#llm])
}

// top breadcrumb bar
#let breadcrumb(title, subtitle) = block(
  fill: rgb("#eeeeee"),
  width: 100%,
  inset: (x: 12pt, y: 6pt),
)[
  #set text(size: 10pt)
  #align(right)[
    #text(fill: maroon)[#title] #h(8pt) #text(fill: rgb("#888888"))[|] #h(8pt) #text(fill: teal-color)[#subitle]
  ]
]

#let url-block(url) = block(
  width: 100%,
  inset: 12pt,
  radius: 8pt,
  stroke: (left: 3pt + rgb("#24292f")),
  fill: rgb("#f6f8fa"),
)[
  #align(
    left + horizon,
  )[Source code is available at #box(image("assets/GitHub.svg", height: 5%)) #text(fill: rgb("#0969da"))[#link("https://github.com/a-mhamdi/edge-vista/blob/main/" + url)[#url]]]]
