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
  text(font: "Gentium", ipa.text(delim: "/")[
    t a I p s t
  ])
  // )
  v(2em)
  [Typst ist eine Programmiersprache zur Erstellung von PDF-Dokumenten und Websites. Erstveröffentlicht 2023 von der #link("https://typst.app")[Typst GmbH], Sitz in Berlin.@typstAbout]
})
== Idee hinter Typst
== Anwendungsmöglichkeiten
- Abschlussarbeiten (z.B. Thesis)#footnote[Wobei #LaTeX immernoch der De-facto-Standard ist]
- Hausübungsabgaben
- Zusammenfassungen
- Präsentationen (wie diese)
- Handouts
- Wissenschaftliches Zeichnen (z.B. Schaltplan, Diagramme, Moleküle, $dots$)
- Vektorgrafiken
- Musik komponieren
- $dots$
== Questions
#align(center + horizon, text(size: 34pt)[
  Thank you for your attention!\
  Do you have any questions?
])
= Vor- und Nachteile von Typst
== Allgemeine Vorteile
- Einfache (nachträgliche) Änderung des Design
- Automatisierung
- Kompillierungsgeschwindigkeit
- Fußnoten, Referenzen, Formatierung, $dots$ sind einfach zu managen
- Formeln zu tippen ist intuitiv und einfach
- Stabil auch bei sehr großen Dokumenten
- Plattformunabhängig
  - Linux: TeXLive
  - Windows: TexLive oder MikTex
  - MacOS: TeXLive
- Viele nützliche Pakete, die einem das Leben einfach machen
== Allgemeine Nachteile
== Typst vs. LaTeX
== Typst vs. Office
= Typst basics
== Syntax
=== Allgemein
- Zeichen mit besonderer Bedeutung: `#`, `{`, `}`, `[`, `]`, `(`, `)`, `\`, `/`, `$`, `_`, `^`, `&`, `~`, #raw("`"), #raw("´"), `"`, `'`
- Befehle: `befehl(argument1, argument2, ...)`, im Textmodus mit vorangestelltem `#`
- Kommentare: `//` bis Zeilenende, `/* ... */` für Blockkommentare
- Argumente werden in runden Klammern `()` angegeben
- Content-Blöcke werden mit Eckigen Klammern `[]` angegeben
- Scope-Blöcke werden mit geschweiften Klammern `{}` angegeben
- Strings werden in Anführungszeichen `""` angegeben
- Code-Blöcke werden mit drei Backticks #raw("```") vor und nach dem Code angegeben (wie in Markdown)
#pagebreak()
=== Textmodus
#pagebreak()
=== Befehlsmodus
== Dokumentenstruktur
=== Minimales Typst-Dokument
#codeWithCompiledOutput("code/minimal.typ")
=== Minimales Typst-Dokument mit größerem Text
#codeWithCompiledOutput("code/minimal-large.typ")
=== Minimales Typst-Dokument mit Blindtext
#codeWithCompiledOutput("code/minimal-lipsum.typ")
=== Minimales Typst-Dokument mit farbigem Blindtext I
#codeWithCompiledOutput("code/minimal-lipsum-red.typ")
=== Minimales Typst-Dokument mit farbigem Blindtext II
#codeWithCompiledOutput("code/minimal-lipsum-rainbow.typ")
== Kompilierung
== Arbeiten mit Text

#{
  set par(first-line-indent: 1em)
  codeAndOutput(
    title: "Zeilenumbrüche",
    ```typst
    Das ist ein Zeilen-\ umbruch. Er beginnt eine neue Zeile.

    Das ist ein Zeilen-#linebreak(justify:true)umbruch. Er beginnt eine neue Zeile.

    Und hier beginnt ein neuer Absatz.
    ```,
  )
}
== Titelei
== Installation und Nutzung
= Mathematische Formeln
= Abbildungen und Tabellen
== Appendix
<appendix>
#bibliography("common/refs.bib", title: "References")
