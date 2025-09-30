#import "common/preamble.typ": *
#show: doc => init(doc, darkmode: false) // you can also overwrite dark mode with input parameter

#title-slide()
// #slide(align(center + horizon, fatsf(text(size: 64pt)[
//   Gude
// ])))
#outline-slide()
= Einführung
== Was ist Typst?
#align(center + horizon, {
  // text(size: 64pt)[Typst]
  text(fill: rgb("#239dad"), image("pictures/typst-logo-colored.svg", width: 10em))
  // v(-2em)
  // slimsf(
    text(font: "Gentium",ipa.text(delim: "/")[
      t a I p s t 
    ])
  // )
  v(2em)
  [Typst ist eine Programmiersprache zur Erstellung von PDF-Dokumenten und Websites. Erstveröffentlicht 2023 von der #link("https://typst.app")[Typst GmbH], Sitz in Berlin.@typstAbout]
})
== Idee hinter Typst
== Anwendungsmöglichkeiten
== Questions
#align(center + horizon, text(size: 34pt)[
  Thank you for your attention!\
  Do you have any questions?
])
= Vor- und Nachteile von Typst
== Allgemeine Vorteile
== Allgemeine Nachteile
== Typst vs. LaTeX
== Typst vs. Office
= Typst basics
== Syntax
== Dokumentenstruktur
== Kompilierung
== Arbeiten mit Text
== Titelei
== Installation und Nutzung
= Mathematische Formeln
= Abbildungen und Tabellen
== Appendix
<appendix>
#bibliography("common/refs.bib", title: "References")
