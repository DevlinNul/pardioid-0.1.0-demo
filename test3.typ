#import "src/imports.typ": *

#let display(body) = {
  block(stroke: aqua.transparentize(50%) + 0.03em, body)
}

// tinymist 的 web 预览和 Sumatra PDF呈现的编译效果
// 前者预期显示，后者无显示
#display(canvas(
  viewport: auto,
  length: 10pt,
  {
    // panic(
    //   repr((
    curve(
      vector-fn: t => (2 * calc.sin(3 * t), 2 * calc.sin(2 * t)),
      t-range: (0, 2 * calc.pi),
      clip-box: none,
      fill: rgb("e6f2ff").transparentize(50%),
      stroke: (thickness: 0.5pt, paint: purple, cap: "square"),

      geom-granularity: geom-presets.pointwise,
      max-depth: 3,
      init-samples: 30,
      // init-samples: 5100,
      //     )
      //       .first()
      //       .render
      //   )((viewport: Axes(x: (-5, 5), y: (-3, 3)), length: 10pt))),
    )
  },
))
