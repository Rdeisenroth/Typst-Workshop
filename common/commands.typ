#import "requirements.typ": *
#import "styling.typ": *
#let slimsf(body) = text(
  font: "Roboto",
  fallback: false,
  weight: "light",
  body,
)
#let textsf(body) = text(
  font: "Roboto",
  fallback: false,
  weight: "regular",
  body,
)

#let fatsf(body) = text(
  font: "Roboto",
  fallback: false,
  weight: "bold",
  body,
)

#let emojifont(body) = text(
  font: "Noto Color Emoji",
  fallback: false,
  weight: "regular",
  body,
)

#let accent-color = rgb(tuda_colors.at("3b")) // TU Darmstadt Teal

// counter for definitions
#let definition_counter = counter("definition")

#let definition(..args) = context clue(
  title: {
    definition_counter.step()
    fatsf[Definition #context definition_counter.display()]
  },
  accent-color: accent-color,
  header-color: accent-color.transparentize(if dState.get() { 60% } else { 80% }),
  border-color: accent-color.transparentize(80%),
  icon: emojifont(emoji.pencil),
  ..args,
)

#let codeWithCompiledOutput(path) = {
  path = "../" + path
  let filename = path.split("/").last()
  let svgpath = path.replace(".typ", ".svg")
  grid(
    columns: (1fr, 1fr),
    gutter: .5em,
    align: center + horizon,
    [
      #codly(header: [#filename])
      #raw(read(path), lang: "typst", block: true)
    ],
    [
      #box(stroke: accent-color + 12pt, radius: 3pt, image(svgpath, width: auto, height: 90%, fit: "contain"))
    ],
  )
}

#let codeAndOutput(code, title: none, split: 70%) = context showybox(
  fill: gray,
  title: if title == none { none } else {
    text(size: 14pt, fa-code(solid: true))
    h(1fr)
    textsf(title)
    h(1fr)
    text(size: 14pt, fa-code(solid: true))
  },
  frame: (
    body-color: none,
    title-color: accent-color,
    body-inset: 0pt,
    thickness: 0pt,
  ),
  title-style: (
    color: white,
    sep-thickness: 0pt,
  ),
  radius: 5pt,
  body-style: (
    color: if dState.get() { white } else { black },
  ),
  box(
    clip: true,
    inset: 0pt,
    outset: 0pt,
    radius: (top-left: 0pt, top-right: 0pt, bottom-left: 5pt, bottom-right: 5pt),
    grid(
      columns: (1fr * split * 2, 1fr),
      gutter: 0em,
      align: center + horizon,
      {
        codly(header: none, radius: 0pt, lang-outset: (x: 0pt, y: 12pt))
        code
      },
      grid.cell(
        fill: if dState.get() { rgb("#2D404E") } else { rgb("#D0D5D8") },
        eval("[" + code.text + "]"),
      ),
    ),
  ),
)
