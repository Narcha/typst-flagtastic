#import "lib.typ": *

= Parameters and Examples

#let examples = (
  "#flag(\"UA\") Some text // ISO 3166-1 alpha-2 code",
  "#flag(\"UKR\") Some text // ISO 3166-1 alpha-3 code",
  "#flag(\"Ukraine\") Some text // English name",
  "#flag(\"UA\", shape: \"circle\") Some text",
  "#flag(\"UA\", shape: \"rounded\") Some text",
  "#flag(\"UA\", shape: \"rounded\", radius: 30%) Some text",
  "#flag(\"UA\", height: 2em) Some text",
  "#flag(\"UA\", height: 2em, baseline: 0.5em) Some text",
)

#table(
  columns: (1fr, auto),
  rows: 1.3cm,
  inset: 1.5mm,
  align: horizon,
  ..examples.map((example)=>{
    (
      raw(lang: "typ", example),
      align(center, eval(example, mode: "markup", scope: (flag: flag))),
    )
  }).flatten(),
)

#let languages = (
  ("DE", "Deutsch"),
  ("FR", "Français"),
  ("GB-UKM", "English"),
  ("US", "English (simplified)"),
  ("ES", "Español"),
  ("NL", "Nederlands"),
  ("SE", "Svenska"),
  ("NO", "Norsk"),
)

#grid(columns: (1fr, 1fr, 1fr))[
  == Rectangular
  #for (code, language) in languages [
    #flag(code) #language \
  ]
][
  == Rounded
  #for (code, language) in languages [
    #flag(code, shape: "rounded") #language \
  ]
][
  == Circular
  #for (code, language) in languages [
    #flag(code, shape: "circle") #language \
  ]
]
