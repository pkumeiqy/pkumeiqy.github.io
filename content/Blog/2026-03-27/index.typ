#import "../index.typ": template, tufted
#show: template
#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *


= DualMapROS 图像点云处理管线
#html.hr()

#let scope = (
  image: (source, alt: none, format: auto) => figure(image(source, alt: alt, format: format)),
)
#let md-content = read("管线关键内容.md")
#cmarker.render(md-content, math: mitex, scope: scope)

#html.hr()