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
- Typst-Quellcode wird zu PDF, SVG oder HTML Datei *kompiliert*
- Häufig verwendeten Code in Funktionen/Paketen zusammenfassen
- Man erhält *exakt* das, was man beschreibt
- Automatisierung ist einfach und mächtig
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
= Vor- und Nachteile von Typst
== Allgemeine Vorteile
- Einfache (nachträgliche) Änderung des Design
- Automatisierung
- Schnelles kompillieren (vor Allen gegenüber #LaTeX)
- Fußnoten, Referenzen, Formatierung, $dots$ sind einfach zu managen
- Formeln zu tippen ist intuitiv und einfach
- Stabil auch bei sehr großen Dokumenten
- Plattformunabhängig
- Kleine installationsgröße
- Open Source, Aktive Entwicklung, Gute Dokumentation und Beispiele
== Allgemeine Nachteile
- Kein WYSIWYG-Editor (What You See Is What You Get)
  - Bis man Änderungen sieht, kann es dauern
  - Steile Lernkurve
- Noch nicht so weit verbreitet wie #LaTeX
- Einige vertraute Pakete fehlen noch
- Noch nicht überall für Paper akzeptiert (z.B. Arxiv)
- Mehr Text, um Dinge zu beschreiben
== Komplexität

#context {
  figure(
    cetz.canvas({
      cetz.draw.set-style(axes: (
        stroke: if isDarkMode() { white } else { black },
        x: (label: (anchor: "south-east", offset: -0.4)),
        y: (label: (anchor: "north-west", offset: -0.4)),
      ))
      plot.plot(
        size: (20, 10),
        name: "Dokumentenkomplexität vs Aufwand",
        x-tick-step: none,
        y-tick-step: none,
        x-label: "Komplexität des Dokuments",
        y-label: "Aufwand",
        axis-style: "left",
        x-min: 0,
        x-max: 10,
        y-min: 0,
        y-max: 4,
        legend: (20, 10),
        legend-anchor: "north-east",
        legend-style: (
          fill: if isDarkMode() { white.darken(80%) } else { black.lighten(80%) },
          stroke: none,
          radius: 3pt,
          padding: .3em,
        ),
        {
          plot.add(
            line: (type: "spline", samples: 100, tension: 0.52),
            style: (stroke: rgb(tuda_colors.at("3a")) + 2pt),
            (
              (0, 0.4),
              (.5, 2),
              (2, 2.3),
              (5, 2.5),
              (10, 2.9),
            ),
            label: LaTeX,
          )
          plot.add(
            line: (type: "spline", samples: 100, tension: 0.52),
            style: (stroke: rgb("#239DAD") + 2pt),
            (
              (0, 0.3),
              (1.5, 1.5),
              (4, 2.1),
              (6, 2.65),
              (8, 2.75),
              (10, 2.8),
              (12, 2.9),
            ),
            label: [Typst],
          )
          plot.add(
            line: (type: "spline", samples: 100, tension: 0.5, epsilon: 0.5),
            style: (stroke: rgb(tuda_colors.at("8a")) + 2pt),
            domain: (0, 1),
            (
              (0, 0.2),
              (2, .5),
              (4, 2.5),
              (8, 8.6),
            ),
            label: "Word",
          )
        },
      )
    }),
    caption: [Dokumentenkomplexität #LaTeX vs Typst vs Word],
  )
}

== Typst vs. LaTeX
- Angenehmer zu schreiben
- Schneller zu kompilieren
- Schlechteres Ökosystem
== Typst vs. Office
#figure(
  box(stroke: accent-color + 12pt, radius: 3pt, fill: white, image(
    "pictures/LaTeX vs Word vs Indesign.svg",
    height: 74%,
  )),
  caption: fatsf[Vergleich der Zeilentrennung von #LaTeX (ähnlicher Algo), Word und InDesign],
)
= Typst basics
== Syntax
// === Allgemein
- Zeichen mit besonderer Bedeutung: `#`, `{`, `}`, `[`, `]`, `(`, `)`, `\`, `/`, `$`, `_`, `^`, `&`, `~`, #raw("`"), #raw("´"), `"`, `'`
- Befehle: `befehl(argument1, argument2, ...)`, im Textmodus mit vorangestelltem `#`
- Kommentare: `//` bis Zeilenende, `/* ... */` für Blockkommentare
- Arrays werden in runden Klammern `()` angegeben `(Wert1, Wert2, ...)`
- Dictionarys werden ebenfall in runden Klammern `()` angegeben `(key1: value1, key2: value2, ...)`
- Content-Blöcke werden mit Eckigen Klammern `[]` angegeben
- Scope-Blöcke werden mit geschweiften Klammern `{}` angegeben
- Strings werden in Anführungszeichen `""` angegeben
- Code-Blöcke werden mit drei Backticks #raw("```") vor und nach dem Code angegeben (wie in Markdown)
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
== Questions
#align(center + horizon, text(size: 34pt)[
  Thank you for your attention!\
  Do you have any questions?
])
#pagebreak()
#bibliography("common/refs.bib", title: "References")
