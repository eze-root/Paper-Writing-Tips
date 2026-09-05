# 演示版

这份演示把文档中的 44 条写作细则、终稿复核要点和投稿检查清单整理成了一条适合组会或新生培训的学习路径。

:::{admonition} 使用方式
:class: tip

- 直接在下方播放：方向键翻页，按 `P` 打开演讲者视图。
- 也可以通过下方入口在线打开或下载完整文件。
:::

<div class="slide-actions" aria-label="演示文件">
  <a class="slide-action slide-action-primary"
     href="../slides/index.html"
     target="_blank"
     rel="noopener">
    <span class="slide-action-number">1</span>
    <span>
      <strong>HTML 在线演示</strong>
      <small>在浏览器中打开交互式幻灯片</small>
    </span>
  </a>
  <a class="slide-action"
     href="../slides/paper-writing-tips.pdf"
     download="paper-writing-tips.pdf">
    <span class="slide-action-number">2</span>
    <span>
      <strong>下载 PDF</strong>
      <small>适合阅读、打印和分享</small>
    </span>
  </a>
  <a class="slide-action"
     href="../slides/paper-writing-tips.pptx"
     download="paper-writing-tips.pptx">
    <span class="slide-action-number">3</span>
    <span>
      <strong>下载 PPTX</strong>
      <small>使用 PowerPoint 或 Keynote 打开</small>
    </span>
  </a>
</div>

<div class="slides-embed">
  <iframe
    src="../slides/index.html"
    title="论文写作与投稿检查演示"
    loading="lazy"
    allowfullscreen>
  </iframe>
</div>

<style>
.slide-actions {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 0.8rem;
  margin: 1rem 0 1.4rem;
}
.slide-action {
  display: flex;
  align-items: center;
  gap: 0.7rem;
  min-height: 4.5rem;
  padding: 0.8rem 0.9rem;
  color: var(--sy-c-text, #172033) !important;
  text-decoration: none !important;
  border: 1px solid var(--sy-c-border, #d8dee9);
  border-radius: 0.7rem;
  background: var(--sy-c-surface, #fff);
  box-shadow: 0 5px 16px rgb(15 23 42 / 7%);
  transition: transform 120ms ease, border-color 120ms ease,
    box-shadow 120ms ease;
}
.slide-action:hover {
  transform: translateY(-2px);
  border-color: #2563eb;
  box-shadow: 0 8px 22px rgb(37 99 235 / 14%);
}
.slide-action-number {
  display: inline-grid;
  flex: 0 0 2rem;
  width: 2rem;
  height: 2rem;
  place-items: center;
  color: #fff;
  font-weight: 700;
  border-radius: 50%;
  background: #2563eb;
}
.slide-action strong,
.slide-action small {
  display: block;
}
.slide-action small {
  margin-top: 0.2rem;
  color: var(--sy-c-text-weak, #64748b);
  font-size: 0.78rem;
  line-height: 1.3;
}
.slides-embed {
  position: relative;
  width: 100%;
  padding-top: 56.25%;
  overflow: hidden;
  border: 1px solid var(--sy-c-border, #d8dee9);
  border-radius: 0.75rem;
  background: #0f172a;
  box-shadow: 0 12px 32px rgb(15 23 42 / 12%);
}
.slides-embed iframe {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  border: 0;
}
@media (max-width: 800px) {
  .slide-actions {
    grid-template-columns: 1fr;
  }
}
</style>
