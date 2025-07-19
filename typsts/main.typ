#import "@preview/touying:0.5.3": *
#import "@preview/mitex:0.2.4": *
#import themes.simple: *

#set text(font: ("IBM Plex Sans SC", "WenQuanYi Zen Hei"), lang: "zh", region: "cn")
#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [Simple slides],
)



= 公式符号

== 1. 标量符号用小写拉丁字母表示

- 要点: 为避免混淆字母 l 和数字 1 ，字母 l 可用 \\ell #mi("\ell") 替代。

#figure(
  image("../pics/1.png"),
)


== 2. 有结构的值使用 \\boldsymbol（Attention）

#figure(
  image("../pics/2.png"),
)

== 3. \\boldsymbol 的集合可用 \\mathcal （Attention）

#figure(
  image("../pics/3.png", width: 80%)
)

== 
