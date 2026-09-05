#import "@preview/touying:0.7.4": *
#import themes.simple: *

#let ink = rgb("243246")
#let blue = rgb("2563eb")
#let pale = rgb("eef4ff")
#let amber = rgb("d97706")
#let muted = rgb("64748b")

#set text(
  font: ("IBM Plex Sans SC", "Noto Sans CJK SC"),
  lang: "zh",
  region: "cn",
  size: 20pt,
  fill: ink,
)
#set par(leading: 0.72em)

#show: simple-theme.with(
  aspect-ratio: "16-9",
  header: none,
  footer: [EZE-Lab · Paper Writing Tips],
  footer-right: none,
  primary: blue,
  config-page(
    margin: (left: 1.2em, right: 1.2em, top: 0.65em, bottom: 1.4em),
    footer-descent: 0em,
  ),
  config-info(
    title: [论文写作与投稿检查],
    author: [EZE-Lab],
  ),
)

#let example(path, height: 100%) = align(
  center + horizon,
  image(read(path, encoding: none), width: 100%, height: height, fit: "contain"),
)

#let pair(first, second) = grid(
  columns: 1fr,
  rows: (1fr, 1fr),
  gutter: 0.2em,
  align: horizon,
  first,
  second,
)

#let visual-frame(visual, height: 2.4in) = box(width: 100%, height: height)[
  #align(center + horizon)[
    #box(width: 96%, height: 100%)[#visual]
  ]
]

#let section-slide(title, subtitle) = focus-slide(background: blue)[
  #text(size: 44pt, weight: "bold")[#title]
  #v(0.6em)
  #text(size: 23pt)[#subtitle]
]

#let rule-slide(
  group,
  number,
  title,
  body,
  visual: none,
  visual-height: 2.4in,
  visual-offset: 3.2in,
  attention: false,
) = slide[
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    text(size: 13pt, fill: muted, weight: "medium")[#group],
    text(size: 13pt, fill: if attention { amber } else { muted })[
      #if attention [ATTENTION · ]#number
    ],
  )
  #v(0.08em)
  #box(width: 72%)[
    #text(size: 24pt, weight: "bold", fill: ink)[#title]
  ]
  #v(0.06em)
  #line(length: 72%, stroke: 1pt + blue.lighten(55%))
  #v(0.24em)
  #if visual == none {
    align(left + horizon)[
      #box(width: 92%)[#text(size: 23pt)[#body]]
    ]
  } else {
    box(width: 96%)[#text(size: 18pt)[#body]]
    place(
      top + center,
      dy: visual-offset,
      visual-frame(visual, height: visual-height),
    )
  }
]

#title-slide[
  #text(size: 52pt, weight: "bold", fill: blue)[论文写作与投稿检查]
  #v(0.7em)
  #text(size: 27pt)[一条规则，一张幻灯片]
  #v(1.2em)
  #text(size: 19pt, fill: muted)[EZE-Lab · 持续更新]
]

#section-slide([写前必看],[公式与符号 · 规则 1–17])

#rule-slide([写前必看 · 公式符号], [01 / 44], [标量使用小写拉丁字母], [
  + 标量通常用小写拉丁字母表示。
  + 为避免字母 $l$ 与数字 $1$ 混淆，可改用 $ell$。
], visual: example("../pics/1.png"))

#rule-slide([写前必看 · 公式符号], [02 / 44], [有结构的值使用粗体符号], [
  句子序列、树、图等有结构的值，可以使用 `\boldsymbol` 表示。
], visual: example("../pics/2.png"), attention: true)

#rule-slide([写前必看 · 公式符号], [03 / 44], [有结构值的集合使用书法体], [
  `\boldsymbol` 表示的对象，其集合可用 `\mathcal` 表示。
], visual: example("../pics/3.png"), attention: true)

#rule-slide([写前必看 · 公式符号], [04 / 44], [向量小写加粗，矩阵大写加粗], [
  + 拉丁字母常用 `\mathbf`。
  + 希腊字母常用 `\boldsymbol`。
], visual: example("../pics/4.png"))

#rule-slide([写前必看 · 公式符号], [05 / 44], [数域与期望使用黑板粗体], [
  数域、期望等约定对象使用 `\mathbb`，让符号角色一眼可辨。
], visual: example("../pics/5.png"))

#rule-slide([写前必看 · 公式符号], [06 / 44], [元素与集合保持符号对应], [
  同一组元素与集合沿用相同字母体系，并检查全文是否一致。
], visual: example("../pics/6.png"))

#rule-slide([写前必看 · 公式符号], [07 / 44], [正式写作避免缩写], [
  + 用 `do not` 代替 `don't`。
  + 所有格尽量改写成 `of` 结构。
], visual: example("../pics/7.png"))

#rule-slide([写前必看 · 公式符号], [08 / 44], [拉丁文惯用语写对标点], [
  + `e.g.,` 表示 for example；`i.e.,` 表示 that is。
  + `et al.` 用于人；`etc.` 不用于列举人。
  + 句末已有句点时，不再追加句号。
], visual: example("../pics/8.png"), visual-height: 1.65in, visual-offset: 3.5in)

#rule-slide([写前必看 · 公式符号], [09 / 44], [英文引号使用正确键位], [
  在 LaTeX 中，英文左右引号分别使用两个反引号和两个单引号，不使用中文引号。
], visual: example("../pics/9.png"))

#rule-slide([写前必看 · 公式符号], [10 / 44], [引用编号前使用不间断空格], [
  用 `~` 避免图、表、章节或文献编号在行尾断开，例如 `Figure~\ref{fig:x}`。
], visual: example("../pics/10.png"))

#rule-slide([写前必看 · 公式符号], [11 / 44], [URL 使用专用命令], [
  加载 `hyperref`，并使用 `\url{}` 排版链接，获得正确的断行与可点击行为。
], visual: example("../pics/11.png"))

#rule-slide([写前必看 · 公式符号], [12 / 44], [引号不等于学术引用], [
  引号通常表达“所谓”；需要引用或强调时，应考虑斜体并给出正式文献来源。
], visual: example("../pics/12.png"), attention: true)

#rule-slide([写前必看 · 公式符号], [13 / 44], [多字母变量使用正文字体], [
  `softmax`、`proj`、`enc` 等多字母变量用 `\text` 或 `\mathrm`，避免被误读为字母连乘。
], visual: example("../pics/13.png"))

#rule-slide([写前必看 · 公式符号], [14 / 44], [标准函数使用标准命令], [
  `max`、`sin`、`tanh`、`inf`、`det`、`exp` 等使用现成命令，而不是手工斜体字母。
], visual: example("../pics/14.png"))

#rule-slide([写前必看 · 公式符号], [15 / 44], [括号随公式内容伸缩], [
  + 使用 `\left` 与 `\right` 控制成对括号。
  + 集合条件等中间分隔符使用 `\middle`。
], visual: example("../pics/15.jpeg"))

#rule-slide([写前必看 · 公式符号], [16 / 44], [多行公式按关系符对齐], [
  一组推导使用 `align`，在等号或其他关键关系符处对齐。
], visual: example("../pics/16.jpeg"))

#rule-slide([写前必看 · 公式符号], [17 / 44], [只给正文会引用的公式编号], [
  需要通过编号回指的公式才编号，其余公式去掉编号以减少视觉噪声。
], visual: example("../pics/17.jpeg"), attention: true)

#section-slide([写前必看],[表格与图片 · 规则 18–27])

#rule-slide([写前必看 · 表格图片], [18 / 44], [使用 Booktabs 绘制表格], [
  使用 `\toprule`、`\midrule`、`\bottomrule` 和 `\cmidrule`，让对齐关系而不是网格线组织信息。
], visual: example("../pics/18.jpeg"))

#rule-slide([写前必看 · 表格图片], [19 / 44], [图表与章节使用自动引用], [
  + 用 `\label{...}` 定义图、表和章节。
  + 用 `\ref{...}` 自动引用并支持跳转。
  + 子图可写作 `Figure~\ref{fig:x}(a)`。
])

#rule-slide([写前必看 · 表格图片], [20 / 44], [正文不要复述 Caption], [
  Caption 回答“这是什么”；正文应进一步解释“它说明了什么”。
], visual: example("../pics/20.jpeg"))

#rule-slide([写前必看 · 表格图片], [21 / 44], [三线表尽量避免竖线], [
  优先让留白和对齐表达列关系；若目标模板另有要求，以模板为准。
], visual: example("../pics/22.jpg"), attention: true)

#rule-slide([写前必看 · 表格图片], [22 / 44], [表格尺寸按顺序调整], [
  + 先居中，再调整列间距与列宽，最后才缩小字号。
  + 用 `\multirow` 和 `\multicolumn` 合并单元格。
], visual: example("../pics/23.jpg"))

#rule-slide([写前必看 · 表格图片], [23 / 44], [图片优先使用矢量格式], [
  绘图软件或 Matplotlib 应直接导出 PDF 等矢量文件，也可在 LaTeX 中用 pgfplots 绘制。
], visual: example("../pics/24.jpg"))

#rule-slide([写前必看 · 表格图片], [24 / 44], [图中文字需保持可读], [
  图中文字大小应在最终论文版面中清晰可读，并与正文和 caption 形成合理层级。
], visual: example("../pics/25.jpg"))

#rule-slide([写前必看 · 表格图片], [25 / 44], [图中文字接近正文字号], [
  不要在绘图软件里孤立判断字号；把图片放回最终双栏版面后再检查。
], visual: example("../pics/update1_pic_25.png"))

#rule-slide([写前必看 · 表格图片], [26 / 44], [图表应适用于黑白打印], [
  不要只靠颜色区分曲线；同时使用线型、明暗或点形标记。
], visual: example("../pics/26.jpg"))

#rule-slide([写前必看 · 表格图片], [27 / 44], [图片风格保持简洁一致], [
  控制颜色数量与饱和度，同类模块使用统一格式，箭头方向尽量一致。
], visual: example("../pics/27.jpg"))

#section-slide([写前必看],[选词与用词 · 规则 28–36])

#rule-slide([写前必看 · 选词用词], [28 / 44], [注意连字符组合的词性], [
  连字符组合中，末词为名词时常整体作形容词；末词为动词时常整体作动词。
], visual: pair(
  example("../pics/pic_29_1.jpeg"),
  example("../pics/pic_29_2.jpeg"),
))

#rule-slide([写前必看 · 选词用词], [29 / 44], [并列项保持同一词性], [
  + `First` 与 `Secondly` 都是副词。
  + training、test、validation 都应作为名词并列。
], visual: example("../pics/pic_30.jpeg"))

#rule-slide([写前必看 · 选词用词], [30 / 44], [缩写遵循领域惯例], [
  首次出现时给出全称和缩写，后文保持大小写一致；领域名、任务名和指标通常不随意大写。
], visual: example("../pics/pic_31.jpeg"))

#rule-slide([写前必看 · 选词用词], [31 / 44], [检查名词单复数], [
  特别检查不规则复数与不可数名词，不要只依赖拼写检查器。
], visual: example("../pics/pic_32.jpeg"))

#rule-slide([写前必看 · 选词用词], [32 / 44], [a 与 an 跟随发音], [
  冠词取决于开头音素而不是首字母，例如 `an LSTM cell`、`a U-shaped model`。
], visual: example("../pics/pic_33.jpeg"))

#rule-slide([写前必看 · 选词用词], [33 / 44], [可数名词单数需要限定], [
  可数名词单数通常需要冠词或其他限定词；`the` 表示特指，复数可表示泛指。
], visual: example("../pics/pic_34.jpeg"))

#rule-slide([写前必看 · 选词用词], [34 / 44], [叙述通常以一般现在时为主], [
  论文叙述通常以一般现在时为主，但最终选择仍应服从语境和目标会议风格。
], visual: example("../pics/pic_35.jpeg"), attention: true)

#rule-slide([写前必看 · 选词用词], [35 / 44], [避免无证据的绝对表述], [
  用 `generally`、`usually`、`often` 等限定词替代武断的 `always` 或 `never`。
], visual: example("../pics/36.jpg"))

#rule-slide([写前必看 · 选词用词], [36 / 44], [模糊判断必须给出依据], [
  不只说 `better`、`semantic` 或 `meaningful`；写清改善的指标、对象与成立条件。
], visual: example("../pics/37.jpg"))

#section-slide([写前必看],[句子、段落与引用 · 规则 37–44])

#rule-slide([写前必看 · 句子表述], [37 / 44], [代词指向必须清楚], [
  `it`、`they` 指向不清时，重复模型简称往往比代词更清楚。
], visual: example("../pics/38.jpg"))

#rule-slide([写前必看 · 句子表述], [38 / 44], [不要用标签代替解释], [
  不只写“有效”“先进”；说明究竟改善了哪里，以及什么因素导致结果。
], visual: example("../pics/39.jpg"))

#rule-slide([写前必看 · 句子表述], [39 / 44], [一句话只说一件事], [
  优先使用简单句，避免多层从句堆叠，让每句话承担一个明确任务。
], visual: example("../pics/40.jpg"))

#rule-slide([写前必看 · 句子表述], [40 / 44], [不同逻辑角色分开陈述], [
  观察、发现、假设、方法和效果不要混在同一句中，避免读者误判因果关系。
], visual: example("../pics/41.jpg"))

#rule-slide([写前必看 · 段落布局], [41 / 44], [处理段尾过短的孤行], [
  段尾不足四分之一行时，可精简或补充文字；也可尝试 `\looseness=-1` 收紧一行。
], visual: example("../pics/pic_42.png"), attention: true)

#rule-slide([写前必看 · 参考文献], [42 / 44], [引用命令要匹配句法角色], [
  括号式引用可作插入语；叙述式引用让作者名进入句子并承担主语或宾语角色。
], visual: example("../pics/pic_43.png"))

#rule-slide([写前必看 · 参考文献], [43 / 44], [优先引用正式发表版本], [
  正式会议或期刊版本通常比 arXiv 版本更规范，也应避免重复收录两个版本。
], visual: example("../pics/pic_44.png"))

#rule-slide([写前必看 · 参考文献], [44 / 44], [参考文献格式保持一致], [
  会议名缩写、年份、地点、卷页等字段，应在整份书目中采用一致策略。
], visual: example("../pics/pic_45.png"))

#section-slide([终稿必查],[科技英语 · 规则 1–10])

#rule-slide([终稿必查 · 科技英语], [01 / 36], [先用工具完成拼写与语法初筛], [
  可使用 Grammarly、Writefull 等工具发现问题，但每一处修改都要人工确认是否改变原意。
])

#rule-slide([终稿必查 · 科技英语], [02 / 36], [正式文体避免撇号缩写], [
  避免 `didn't`、`can't`、`don't` 等缩写；所有格优先改写为 `of` 结构，并谨慎使用引号。
])

#rule-slide([终稿必查 · 科技英语], [03 / 36], [缩写首次出现时定义], [
  模型名、术语或自定义概念第一次出现时，应同时给出全称和缩写。
])

#rule-slide([终稿必查 · 科技英语], [04 / 36], [模型名称大小写保持一致], [
  例如始终写作 BERT、ELECTRA，不要混用 Bert、Electra 或全小写形式。
])

#rule-slide([终稿必查 · 科技英语], [05 / 36], [例句与示例可使用斜体], [
  用斜体把语言材料或示例与正文论证区分开，但不要滥用强调。
])

#rule-slide([终稿必查 · 科技英语], [06 / 36], [列表过松时改用紧凑段落], [
  当 `itemize` 占用过多空间时，可改写成正常段落并手工使用项目符号，但不能牺牲可读性。
])

#rule-slide([终稿必查 · 科技英语], [07 / 36], [脚注紧跟相关标点], [
  脚注通常放在相关内容后的第一个合适标点之后，`\footnote` 与前面的标点之间不留空格。
])

#rule-slide([终稿必查 · 科技英语], [08 / 36], [a 与 an 根据发音选择], [
  例如 `an LSTM cell`、`an F/H/L/M/N/S/X`，但写作 `a U`。
])

#rule-slide([终稿必查 · 科技英语], [09 / 36], [标题大小写风格全文统一], [
  各级标题应统一采用句首字母大写或实词首字母大写等同一种风格。
])

#rule-slide([终稿必查 · 科技英语], [10 / 36], [英文断词使用语言规则], [
  可用 `\usepackage[english]{babel}` 提供按音节断词的规则，并检查最终 PDF 的断行。
])

#section-slide([终稿必查],[图片 · 规则 11–20])

#rule-slide([终稿必查 · 图片], [11 / 36], [图中文字字体与字号统一], [
  同一张图内保持字体一致，并让字号与正文版面协调。
])

#rule-slide([终稿必查 · 图片], [12 / 36], [裁掉图片两侧无意义空白], [
  图片边界应紧凑，让有效内容获得足够展示面积。
])

#rule-slide([终稿必查 · 图片], [13 / 36], [图片优先放在页顶或中部], [
  避免重要图片孤立地落在页面最下方，并检查浮动体最终位置。
])

#rule-slide([终稿必查 · 图片], [14 / 36], [同类模块使用同一色系], [
  每类单元使用统一的填充或边框规则，让颜色稳定表达类别。
])

#rule-slide([终稿必查 · 图片], [15 / 36], [颜色深浅必须承载明确语义], [
  更深、更亮通常意味着更重要；若没有重要性差异，应保持各模块视觉权重均衡。
])

#rule-slide([终稿必查 · 图片], [16 / 36], [颜色种类最好不超过六种], [
  精简配色可以降低理解负担，并提高整篇论文图表的一致性。
])

#rule-slide([终稿必查 · 图片], [17 / 36], [图片使用矢量格式], [
  优先输出 PDF、SVG 或绘图系统原生矢量结果，避免缩放后模糊。
])

#rule-slide([终稿必查 · 图片], [18 / 36], [Figure 应以图形表达关系], [
  Figure 的价值是比文字更直观；应使用最小而统一的绘画元素，避免塞入大段说明文字。
])

#rule-slide([终稿必查 · 图片], [19 / 36], [线型和配色与类别一一对应], [
  同一含义使用近似或相同的视觉元素，降低描述复杂度并提高认知直观性。
])

#rule-slide([终稿必查 · 图片], [20 / 36], [流程箭头保持同向且完整], [
  避免来回折转，也不要保留没有来源或去向箭头的孤立组件。
])

#section-slide([终稿必查],[引用与公式 · 规则 21–28])

#rule-slide([终稿必查 · 引用], [21 / 36], [引用标记取决于句法位置], [
  + 括号式引用使用模板规定的普通引用命令。
  + 叙述式引用让作者名进入正文；ACL、COLING、AAAI、IEEE 模板命令各不相同。
])

#rule-slide([终稿必查 · 引用], [22 / 36], [篇幅紧张时统一缩写会议名], [
  会议和期刊名称可以统一采用规范缩写，但同一书目中不要混用全称与缩写。
])

#rule-slide([终稿必查 · 引用], [23 / 36], [人工核对 BibTeX 元数据], [
  检查会议名、年份、卷号和页码，不要完全依赖 Scholar 自动提供的条目。
])

#rule-slide([终稿必查 · 引用], [24 / 36], [使用 label 与 ref 自动跳转], [
  章节、表格和图片先用 `\label` 定义，再通过 `\ref` 引用，避免手写编号失效。
])

#rule-slide([终稿必查 · 引用], [25 / 36], [引用与正文之间保留空格], [
  引用命令不要紧邻前一个正文字母；在 LaTeX 中通常用不间断空格连接。
])

#rule-slide([终稿必查 · 引用], [26 / 36], [同一论文只保留一个版本], [
  不要同时引用同一论文的 arXiv 版本与正式会议或期刊版本。
])

#rule-slide([终稿必查 · 公式], [27 / 36], [公式作为句子需要标点], [
  公式是句子的一部分，多行公式也应根据上下文加入逗号或句号。
])

#rule-slide([终稿必查 · 公式], [28 / 36], [公式后的文字服从句子语法], [
  若文字延续同一句，就按同一句衔接；若另起新句或新段，则正常大写开头并分段。
])

#section-slide([终稿必查],[投稿前注意事项 · 规则 29–36])

#rule-slide([终稿必查 · 投稿前], [29 / 36], [彻底检查匿名性], [
  正文、补充材料、文件元数据、链接、代码和路径中都不能包含个人或机构信息。
])

#rule-slide([终稿必查 · 投稿前], [30 / 36], [确认最终文件没有超页], [
  分别确认正文、附录和参考文献限制；最后时刻不要随意缩放图表破坏可读性。
])

#rule-slide([终稿必查 · 投稿前], [31 / 36], [标题与摘要保持一致], [
  PDF 中的标题和摘要必须与投稿系统填写框完全对应。
])

#rule-slide([终稿必查 · 投稿前], [32 / 36], [数据与代码也要匿名], [
  清理源码头部、硬编码路径、日志和隐藏目录，例如可能泄露作者信息的 `.git`。
])

#rule-slide([终稿必查 · 投稿前], [33 / 36], [截稿前保存可编译备份], [
  Overleaf 在高峰期可能访问缓慢，应提前备份 LaTeX/Typst、图片和参考文献源文件。
])

#rule-slide([终稿必查 · 投稿前], [34 / 36], [历史版本使用时间或版本号], [
  用明确标记区分历史文件，避免最后提交的不是最终版本。
])

#rule-slide([终稿必查 · 投稿前], [35 / 36], [至少提前一天上传可用版本], [
  先提交一个完整可用的论文和附录版本，降低截稿时服务器异常带来的风险。
])

#rule-slide([终稿必查 · 投稿前], [36 / 36], [提交后继续关注官方通知], [
  持续查看会议官网和注册邮箱，及时处理截止日期延长或补充材料要求。
])

#section-slide([可打印清单],[投稿前 · 论文部分])

#rule-slide([投稿清单 · 论文], [01 / 09], [已经查看 CFP], [
  阅读 Call for Papers，确认主题范围、轨道、投稿政策和官方链接。
])

#rule-slide([投稿清单 · 论文], [02 / 09], [核实投稿会议], [
  记录准确会议名称并验证官网，避免误入同名或仿冒会议。
])

#rule-slide([投稿清单 · 论文], [03 / 09], [记录截止时间和时区], [
  明确日期、时区和夏令时；AOE 通常对应北京时间次日 20:00。
])

#rule-slide([投稿清单 · 论文], [04 / 09], [确认投稿页数限制], [
  分别记录正文、附录和参考文献是否计入页数。
])

#rule-slide([投稿清单 · 论文], [05 / 09], [检查是否超页], [
  使用最终生成的提交文件确认页数，而不是只看源文件或编辑器预览。
])

#rule-slide([投稿清单 · 论文], [06 / 09], [检查论文匿名性], [
  除标题位置外，也检查正文、致谢、链接、文件信息和代码中的身份线索。
])

#rule-slide([投稿清单 · 论文], [07 / 09], [核对标题与摘要], [
  投稿系统填写内容必须与最终 PDF 完全对应。
])

#rule-slide([投稿清单 · 论文], [08 / 09], [核对作者信息和顺序], [
  若投稿阶段允许填写作者，确认姓名、机构、邮箱、顺序和通讯作者标记。
])

#rule-slide([投稿清单 · 论文], [09 / 09], [完成语法检查并人工复核], [
  运行 Grammarly 等工具后，逐条判断建议是否准确并保留原意。
])

#section-slide([可打印清单],[投稿前 · 代码部分])

#rule-slide([投稿清单 · 代码], [01 / 03], [发布包不包含 .git], [
  `.git` 会暴露作者与历史记录；匿名包中应移除这类隐藏目录。
])

#rule-slide([投稿清单 · 代码], [02 / 03], [源码中不包含个人信息], [
  检查 Python 文件头、配置、日志、用户名以及模型和数据的绝对路径。
])

#rule-slide([投稿清单 · 代码], [03 / 03], [提供 requirements.txt], [
  明确依赖及版本，让审稿人或合作者能够重建运行环境。
])

#section-slide([可打印清单],[接收后 · 论文部分])

#rule-slide([接收后清单 · 论文], [01 / 03], [作者信息准确], [
  核对每位作者的姓名拼写、机构和邮箱。
])

#rule-slide([接收后清单 · 论文], [02 / 03], [作者顺序与标注正确], [
  确认作者顺序、共同一作与通讯作者标注符合团队最终决定。
])

#rule-slide([接收后清单 · 论文], [03 / 03], [致谢与基金号完整], [
  根据项目和机构要求补齐致谢、基金名称与编号。
])

#section-slide([可打印清单],[接收后 · 代码部分])

#rule-slide([接收后清单 · 代码], [01 / 03], [基本 Demo 可以复现], [
  在干净环境中按公开说明运行最小示例，并确认能得到预期结果。
])

#rule-slide([接收后清单 · 代码], [02 / 03], [README 对新读者足够清楚], [
  说明安装、数据准备、训练、评估和常见问题，不依赖作者口头补充。
])

#rule-slide([接收后清单 · 代码], [03 / 03], [补齐 .gitignore], [
  忽略数据、模型、密钥、日志、缓存和临时构建产物。
])

#focus-slide(background: blue)[
  #text(size: 45pt, weight: "bold")[规则不是目的，清晰才是]

  #v(0.7em)
  #text(size: 25pt)[让格式退后，让贡献站到前面。]
]
