#import "src/lib.typ": *

#let display(body) = {
  block(stroke: aqua.transparentize(50%) + 0.03em, body)
}

// 我本地用 Sumatra PDF 查看编译结果的时候，发现可能显示为空白
// 但是的话用 tinymist 的 preview （web）是能看出来绘制成功了
// 不知道为什么
#display(
  canvas(
    length: 1em,
    // viewport: auto,
    {
      import draw: *
      point(
        (1, 1),
        paint: yellow,
        width: 1em,
        cap: "round",
      )
    },
  ),
)

#display(
  canvas(
    length: 1pt,
    viewport: auto,
    {
      import draw: *
      quad((0, 100), (100, 0), control: (20, 20))
    },
  ),
)

#display(
  canvas(
    length: 1pt,
    viewport: auto,
    // viewport: (x: (-100, 100), y: (-100, 100)),
    {
      import draw: *
      // number-plane()
      cubic((0, 80), control-start: (10, 20), control-end: (90, 60), (100, 0))
    },
  ),
)

#display(
  canvas(
    viewport: auto,
    length: 10pt,
    {
      draw.curve(
        vector-fn: t => (2 * calc.sin(3 * t), 2 * calc.sin(2 * t)),
        t-range: (0, 2 * calc.pi),
        clip-box: none,
        fill: rgb("e6f2ff").transparentize(50%),
        stroke: (thickness: 1pt, paint: red, cap: "square"),
        stroke-config: Stroke-config(
          stroke-mode: "merge",
        ),

        geom-granularity: geom-presets.pointwise,
        max-depth: 3,
        init-samples: 30,
        // init-samples: 5100,
      )
    },
  ),
)

#display(canvas(
  length: 10pt,
  viewport: (x: (-10, 10), y: (-10, 10)),
  {
    import draw: *
    // line((0, 0), (2, 2))
    // 心形线
    // Cardioid.
    draw.curve(
      vector-fn: {
        import calc: *
        t => (
          1.6 * pow(sin(t), 3),
          1.3 * cos(t) - 0.5 * cos(2 * t) - 0.2 * cos(3 * t) - 0.1 * cos(4 * t),
        )
      },
      t-range: (0, 2 * calc.pi),
      clip-box: none,
      stroke: red + 1.2pt,
      fill: rgb(255, 180, 180, 120),
    )
    // 利萨茹曲线
    // Lissajous curve.
    draw.curve(
      vector-fn: t => (2 * calc.sin(3 * t), 2 * calc.sin(2 * t)),
      t-range: (0, 2 * calc.pi),
      clip-box: none,
      fill: rgb("e6f2ff").transparentize(50%),
      stroke: blue,
    )
    polygon(
      (0, 0),
      (10, -10),
      (1, 2),
      (5, 3),
      fill: red,
      stroke-config: default-stroke-config,
    )
    line((-2, 1), (10, 0))
  },
))

#display(canvas(
  length: 1em,
  viewport: (x: (-1, 1), y: (-5, 5)),
  {
    import draw: *
    let points = ((0, 0), (3, 2), (4, 5), (7, -4))
    number-plane()
    polygon(..points, fill: red)
    polyline(..points)
    circle((0, 0), radius: 3)
    ellipse((1, 1), axes-length: (5, 2), angle: 30deg)
  },
))

// #circle(radius: 3em)
// #ellipse()
// #polygon((0pt, 0pt), (30pt, 20pt), (40pt, 50pt), (70pt, -40pt))
