#import "@preview/tidy:0.4.3"
#import "src/header.typ"
#import "utils.typ"

#import "my-tidy-style.typ" as style

#show link: text.with(fill: blue)

#show heading.where(level: 3): set text(size: 2em)

// #set page(columns: 2)

#let prefix = "src/"
#let modules = (
  "lib.typ",
  "draw.typ",
)

#{
  modules = modules.map(it => prefix + it)
}

// #utils.extract-doc("stroke-config")

#{
  for module in modules {
    tidy.show-module(
      tidy.parse-module(
        read(module)
          .split("\n")
          .map(
            s => {
              let m = (s.match(regex("//\s*#use-doc\s+([A-Za-z0-9_-]+)")))
              let id = if m != none {
                m.captures.first()
              } else { none }
              if id == none {
                s
              } else {
                utils.extract-doc(id)
              }
            },
          )
          .join("\n"),
        scope: (extract-def: utils.extract-def, extract-doc: utils.extract-doc),
      ),
      style: style,
    )
  }
}


