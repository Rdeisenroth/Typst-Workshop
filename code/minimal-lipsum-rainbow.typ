#set page(fill: black, margin: 5cm)
#set text(
  40pt,
  font: "Arial",
  fill: gradient.conic(
    ..color.map.rainbow,
  ),
)
#let zahl = 3 * (4 + 1)
Es folgen #zahl Wörter _Blindtext_:

#lorem(zahl)
