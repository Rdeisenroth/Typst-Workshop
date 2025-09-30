#set page(fill: black, margin: 5cm)
#set text(
  42pt,
  fill: gradient.linear(
    ..color.map.rainbow,
  ),
)
#let zahl = 3 * (4 + 1)
Es folgen #zahl Wörter Blindtext:

#lorem(zahl)
