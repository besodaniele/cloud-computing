#import "@preview/scholia:0.1.0": *
// options: theme: "light" | "dark" · prose: "notes" | "book" · fonts: (…)
#show: scholia.with()
#cover("Cloud computing ", subtitle: "Course notes", author: "Daniele Besozzi", date: "A.A. 26/27")
#outline()
#pagebreak()

#set heading(numbering: "1.1")
= Introduction and definition
#include "sections/chapter1.typ"
= Service models (SPI)
#include "sections/chapter2.typ"
= Deployment models
#include "sections/chapter3.typ"