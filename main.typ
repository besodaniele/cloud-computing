#import "@preview/scholia:0.1.0": *
#import "@preview/hydra:0.6.3": hydra
#set page(paper: "a7", margin: (y: 4em), numbering: "1", header: context {
  if calc.odd(here().page()) {
    align(right, emph(hydra(1)))
  } else {
    align(left, emph(hydra(2)))
  }
  line(length: 100%)
})
// options: theme: "light" | "dark" · prose: "notes" | "book" · fonts: (…)
#show: scholia.with()
#cover("Cloud computing ", subtitle: "Course notes", author: "Daniele Besozzi", date: "A.A. 26/27")
#outline()
#pagebreak()

#set heading(numbering: "1.1")
= Introduction and definition
#include "sections/chapter1.typ"
#pagebreak()

= Service models (SPI)
#include "sections/chapter2.typ"
#pagebreak()

= Deployment models
#include "sections/chapter3.typ"
#pagebreak()

= Characteristics
#include "sections/chapter4.typ"
#pagebreak()
= Virtualization
#include "sections/chapter5.typ"