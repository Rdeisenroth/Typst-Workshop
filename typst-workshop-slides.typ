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
//  \begin{figure}
//             \centering
//             % three nodes: source -> compile -> output
//             \tikzset{
//                 graphnode/.style={draw, rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text width=2cm, align=center, fill=#1,font=\color{white}},
//             }
//             \begin{tikzpicture}[start chain=1 going right, every on chain/.style={join=by -Latex}, thick]
//                 \node<1->[graphnode=TUDa-1b, on chain=1] (source) {Quelldatei};
//                 \node<3->[graphnode=TUDa-8b, on chain=1] (compile) {Kompilieren};
//                 \node<5->[graphnode=TUDa-3b, on chain=1] (output) {Ausgabe};

//                 \node<2->[above=0cm of source]{*.tex};
//                 \node<4->[above=0cm of compile]{latexmk <datei.tex>};
//                 \node<6->[above=0cm of output]{*.pdf/*.dvi/*.ps};
//             \end{tikzpicture}
//             \caption{Kompilieren mit \LaTeX{}}
//         \end{figure}
//
#v(1fr)
#context {
  let palette = (
    rgb(tuda_colors.at("1b")),
    rgb(tuda_colors.at("8b")),
    rgb(tuda_colors.at("3b")),
  )
  let graphnode(pos, label, tint: yellow, ..args) = node(
    pos,
    align(center, text(white, label)),
    width: 4.5cm,
    height: 2cm,
    fill: tint,
    stroke: 2pt + tint.darken(50% * (if isDarkMode() { -1 } else { 1 })),
    corner-radius: 10pt,
    ..args,
  )
  figure(
    diagram(
      edge-stroke: fgcolor() + 2pt,
      graphnode((0, 0), tint: palette.at(0), [Quelldatei]),
      // pause,
      node((0, -.55), align(center, [`*.typ`])),
      edge((0, 0), (1, 0), "-latex"),
      graphnode((1, 0), tint: palette.at(1), [Kompillieren]),
      node((1, -.55), align(center, [#raw(lang: "bash", "typst compile <datei.typ>")])),
      edge((1, 0), (2, 0), "-latex"),
      graphnode((2, 0), tint: palette.at(2), [Ausgabe]),
      node((2, -.55), align(center, [`*.pdf`])),
    ),
    caption: [Kompilierung mit Typst],
  )
}
#pause
- in der Praxis gibt es verschiedene Wege, Typst zu kompillieren:
  - Online Editor auf #link("https://typst.app")[typst.app]
  - Preview-Modus in #link("https://code.visualstudio.com/")[VS Code] mit der #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist")[TinyMist Extension]
  // - Kommandozeile mit #raw(lang: "bash", "typst compile <datei.typ>")
  - ...
#v(1fr)
== Arbeiten mit Text

#{
  set par(first-line-indent: 1em)
  codeAndOutput(
    title: "Zeilenumbrüche I",
    ```typst
    Das ist ein Zeilen-\ umbruch. Er beginnt eine neue Zeile.

    Das ist ein Zeilen-#linebreak(justify:true)umbruch. Er beginnt eine neue Zeile.

    Und hier beginnt ein neuer Absatz.
    ```,
  )
}
#pagebreak()
#{
  set par(first-line-indent: 1em)
  codeAndOutput(
    title: "Zeilenumbrüche II",
    ```typst
    #set par(first-line-indent: 0em)
    Das ist ein Zeilen-\ umbruch. Er beginnt eine neue Zeile.

    Das ist ein Zeilen-#linebreak(justify:true)umbruch. Er beginnt eine neue Zeile.

    Und hier beginnt ein neuer Absatz.
    ```,
  )
}
#pagebreak()
#{
  set text(lang: "en")
  codeAndOutput(
    title: "Trennhilfen I",
    ```typst
    // keine Silbentrennung
    Das längste Deutsche Wort lautet nunmal Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz.

    // automatische Silbentrennung? Nicht ganz...
    #set text(hyphenate: false)
    Das längste Deutsche Wort lautet nunmal Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz.
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Trennhilfen II",
    ```typst
    // automatische Silbentrennung, so aber
    #set text(lang: "de", hyphenate: true)
    Das längste Deutsche Wort lautet nunmal Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz.

    // manuelle Silbentrennung
    #set text(lang: "de", hyphenate: false)
    Das längste Deutsche Wort lautet nunmal Rind-?fleischetikettierungs-?überwachungsaufgaben-?übertragungsgesetz.
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Trennhilfen III",
    ```typst
    #set par(justify: true) // bis ans Ende
    // automatische Silbentrennung
    #set text(lang: "de", hyphenate: true)
    Das längste Deutsche Wort lautet nunmal Rindfleischetikettierungsüberwachungsaufgabenübertragungsgesetz.

    // manuelle Silbentrennung
    #set text(lang: "de", hyphenate: false)
    Das längste Deutsche Wort lautet nunmal Rind-?fleischetikettierungs-?überwachungsaufgaben-?übertragungsgesetz.
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Geschützte Leerzeichen",
    ```typst
    Ich möchte dass diese tollen
    "zwei Wörter"
    nicht getrennt werden.

    Ich möchte dass diese tollen
    "zwei~Wörter"
    nicht getrennt werden.
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Textarten I",
    ```typst
    Normaler Text\
    *Fetter Text*\
    _Kursiver Text_\
    `Monospace Text`\
    ~Durchgestrichener Text~\
    #text(font: "Gentium",[Andere Schriftart])\
    #underline([Unterstrichener Text])
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Textarten II",
    ```typst
    Normaler Text\
    *Fetter Text*\
    _Kursiver Text_\
    `Monospace Text`\
    ~Durchgestrichener Text~\
    #text(font: "Gentium")[Andere Schriftart]\
    #underline[Unterstrichener Text]
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Textarten III",
    ```typst
    Normaler Text\
    *Fetter Text*\
    _Kursiver Text_\
    `Monospace Text`\
    ~Durchgestrichener Text~\
    #text(font: "Gentium", "Andere Schriftart")\
    #underline("Unterstrichener Text")
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Schriftgröße",
    ```typst
    #let size = 3pt
    #let sizestr = ()
    #while size <= 64pt {
      sizestr.push(text(size: size)[Größe: #size])
      size = size * 1.5
    }
    #sizestr.join([\ ])
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Platz machen",
    ```typst
    Zeile 1

    Zeile 2

    #v(1cm)
    Zeile 3#h(2cm)Hat Platz

    #v(-10mm)
    Zeile 4 ist zu nah an Zeile 3
    ```,
  )
}
#pagebreak()
#{
  codeAndOutput(
    title: "Farben",
    ```typst
    #text(fill: red)[Rot]\
    #text(fill: teal)[Türkis]\
    #text(fill: red.mix(blue))[Mischung]\
    #text(fill: red.mix(blue).lighten(50%))[Mischung]\
    #text(fill: red.mix(blue).darken(50%))[Mischung]
    ```,
  )
}
== Code-Modus
#definition[Im Code-Modus können Befehle ohne vorangestelltes `#` verwendet werden. Außerdem markieren Anführungszeichen `"` den Anfang und das Ende eines Strings.]
#v(1fr)
#align(center + horizon, box(fill: luma(32), inset: 30pt, radius: 15pt, text(
  fill: rgb(tuda_colors.at("9a")),
  size: 52pt,
  fatsf[
    Live-Coding#v(-3.5cm)
    #text(size: 87pt, fa-laptop-code(solid: true))
  ],
)))
#v(1fr)
// == Titelei
== Installation und Nutzung
// #context {
//   urlslide2(
//     caption1: "Typst Online verwenden",
//     "https://typst.app",
//     caption2: "Typst lokal installieren",
//     "https://github.com/typst/typst?tab=readme-ov-file#installation",
//   )
// }
#context {
  urlslide3(
    caption1: "Typst Online verwenden",
    "https://typst.app",
    caption2: "Typst lokal installieren",
    "https://github.com/typst/typst?tab=readme-ov-file#installation",
    caption3: "Workshop-Materialien",
    "https://github.com/Rdeisenroth/Typst-Workshop#typst-workshop",
  )
}
= Mathematische Formeln
== der Mathe-Modus
#definition[Matahematische Formeln werden zwischen Dollarzeichen `$...$` geschrieben. Im Mathe-Modus werden Leerzeichen ignoriert, und die Schriftart ändert sich.]
#v(1fr)
#align(center + horizon, box(fill: luma(32), inset: 30pt, radius: 15pt, text(
  fill: rgb(tuda_colors.at("9a")),
  size: 52pt,
  fatsf[
    Live-Coding#v(-3.5cm)
    #text(size: 87pt, fa-laptop-code(solid: true))
  ],
)))
#v(1fr)
= Abbildungen und Tabellen
== Abbildungen
#definition[Matahematische Formeln werden zwischen Dollarzeichen `$...$` für Inline-Formeln und `$$...$$` für abgesetzte Formeln geschrieben. Für mehrzeilige Formeln gibt es die `align`-Umgebung.]
#v(1fr)
#align(center + horizon, box(fill: luma(32), inset: 30pt, radius: 15pt, text(
  fill: rgb(tuda_colors.at("9a")),
  size: 52pt,
  fatsf[
    Live-Coding#v(-3.5cm)
    #text(size: 87pt, fa-laptop-code(solid: true))
  ],
)))
#v(1fr)
== Questions
#align(center + horizon, text(size: 34pt)[
  Thank you for your attention!\
  Do you have any questions

  #v(1fr)
  #text(size: 87pt, fa-question(solid: true))
  #v(1fr)
])
== Kursmaterialien
#context {
  urlslide3(
    caption1: "Typst Online verwenden",
    "https://typst.app",
    caption2: "Typst lokal installieren",
    "https://github.com/typst/typst?tab=readme-ov-file#installation",
    caption3: "Workshop-Materialien",
    "https://github.com/Rdeisenroth/Typst-Workshop#typst-workshop",
  )
}
#pagebreak()
#bibliography("common/refs.bib", title: "References")
