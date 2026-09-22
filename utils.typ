#import "@preview/tidy:0.4.3"

#let extract-region(src, start-marker, end-marker) = {
  let lines = src.split("\n")
  let i = lines.position(l => l.trim("//").trim() == start-marker)
  let j = lines.position(l => l.trim("//").trim() == end-marker)
  lines.slice(i + 1, j).join("\n")
}

#let extract-def(path, id: str) = {
  let prefix = "src/"
  let src = read(prefix + path)
  let start-prefix = "#start "
  let end-prefix = "#end "
  let start-marker = start-prefix + id
  let end-marker = end-prefix + id
  raw(extract-region(src, start-marker, end-marker), lang: "typ", block: true)
}

#let extract-doc(id) = {
  let path = "shared-docs.typ"
  let src = read(path)
  let start-prefix = "#start "
  let end-prefix = "#end "
  let start-marker = start-prefix + id
  let end-marker = end-prefix + id
  // raw(extract-region(src, start-marker, end-marker), lang: "example", block: true)
  let body = extract-region(src, start-marker, end-marker)
  let doc-lines = body
    .split("\n")
    .map(
      line => if line == "" { "///" } else { "/// " + line },
    )
    .join("\n")
  doc-lines
}
