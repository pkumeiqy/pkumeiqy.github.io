#import "../index.typ": template, tufted
#show: template
#import "@preview/cmarker:0.1.8"
#import "@preview/mitex:0.2.6": *


= DualMap BBox计算细节

#html.hr()

#let scope = (
  image: (source, alt: none, format: auto) => figure(image(source, alt: alt, format: format)),
)
#let md-content = read("DualMap BBox计算细节.md")
#cmarker.render(md-content, math: mitex, scope: scope)

#html.hr()