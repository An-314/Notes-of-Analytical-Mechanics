#import "@preview/scripst:1.1.1": *

#show: scripst.with(
  template: "book",
  title: [分析力学],
  author: ("Anzreww",),
  time: "乙巳秋冬于清华园",
  contents: true,
  content-depth: 3,
  matheq-depth: 3,
  lang: "zh",
)

#include "chap1.typ"

#pagebreak()

#include "chap2.typ"

#pagebreak()

#include "chap3.typ"

#pagebreak()

#include "chap4.typ"

#pagebreak()

#include "chap5.typ"

#pagebreak()

#include "chap6.typ"
