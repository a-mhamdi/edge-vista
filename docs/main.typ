#import "@preview/touying:0.7.3": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/theorion:0.6.0": *

#import themes.metropolis: *
#show: show-theorion

#show link: underline
#set par(justify: true)

#show: codly-init.with()
#codly(languages: codly-languages)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => "Embedded AI | A. Mhamdi",
  config-info(
    title: [Embedded AI],
    subtitle: [A practical approach to embedded AI using ESP32],
    logo: "typst.svg",
    author: [Abdelbacet Mhamdi],
    date: datetime.today(),
    institution: [MT \@ ISET Bizerte],
  ),
)

// Define fonts
#set text(font: "Fira Sans", weight: "regular", size: 17pt)
#show raw: set text(font: "Fira Code", size: 17pt, stylistic-set: 1) // Enable ligatures for code
#show math.equation: set text(font: "Fira Math", size: 17pt)

#title-slide()

= Outline <touying:hidden>
#outline(title: none, depth: 1)

#include "parts/esp32.typ"
#include "parts/ai.typ"
#include "parts/ec.typ"
#include "parts/use-cases.typ"

#focus-slide[
  Thank you for your attention
]

// Bibliography
#set heading(numbering: none, outlined: false)
= Bibliography

---

#bibliography("Bibliography.bib", full: true, style: "apa", title: none)
