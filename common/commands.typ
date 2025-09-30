#import "requirements.typ": *
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
