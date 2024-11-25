# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Paper-Writing-Tips-For-EZE'
copyright = '2024, eze-root'
author = 'eze-root'
release = '0.0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
  "myst_parser",
  "sphinx.ext.autodoc",
  "sphinx.ext.intersphinx",
  "sphinx.ext.extlinks",
  "sphinx.ext.todo",
  "sphinx.ext.viewcode",
  "sphinxcontrib.mermaid",
  "sphinxemoji.sphinxemoji",
  "sphinx_copybutton",
  "sphinx_design",
  "sphinx_comments"
]

myst_enable_extensions = [
    "amsmath",
    "attrs_inline",
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "html_admonition",
    "html_image",
    "linkify",
    "replacements",
    "smartquotes",
    "strikethrough",
    "substitution",
    "tasklist",
]

templates_path = ['_templates']
exclude_patterns = []

language = 'zh'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'shibuya'
html_static_path = ['_static']


# https://shibuya.lepture.com/customisation/sidebar/
html_context = {
    "source_type": "github",
    "source_user": "eze-root",
    "source_repo": "Paper-Writing-Tips",
    "source_version": "main",  # Optional
    "source_docs_path": "/docs/",  # Optional
}




latex_engine = 'xelatex'
latex_elements_exe = {
    'passoptionstopackages': r'''
\PassOptionsToPackage{svgnames}{xcolor}
''',
    'pointsize': '12pt',
    'fontpkg': r'''
''',
    'maketitle': r'''
    \maketitle
''',
    'tableofcontents': "",
    'preamble': r'''

\usepackage{hyperref}
\usepackage{url}
\raggedbottom  % 避免章节之间产生多余的空白页
\usepackage[noindent, scheme=plain]{ctex}

\setlength{\parskip}{5pt}    % 段落之间空格

\newcommand{\Solution}[1]{%
    {%
        \medskip
        \color{red}
        \bf $\bigstar$~\sf\textbf{Solution}~$\bigstar$ \sf
        #1
    }
    \bigskip
}


''',
    'sphinxsetup': r'''
    TitleColor=DarkGoldenrod
''',
    # 'fncychap': r'\usepackage[Bjornstrup]{fncychap}',
    'printindex': r'\footnotesize\raggedright\printindex',
}

latex_elements_project = {
    'passoptionstopackages': r'''
\PassOptionsToPackage{svgnames}{xcolor}
''',
    'pointsize': '12pt',
    'fontpkg': r'''
''',
    'maketitle': r'''
    \maketitle
''',
    'tableofcontents': "",
    'preamble': r'''
\usepackage{xeCJK}
\usepackage{hyperref}
\usepackage{url}
\raggedbottom  % 避免章节之间产生多余的空白页

\setlength{\parskip}{5pt}    % 段落之间空格
''',
    'sphinxsetup': r'''
    TitleColor=DarkGoldenrod
''',
    'printindex': r'\footnotesize\raggedright\printindex',
}
latex_show_urls = 'footnote'

latex_documents = [
('mds/checklist', 'checklist-1.tex', '投稿前检查清单', 'EZE-2024-投稿前检查清单', 'howto'),
# ('exercise/ch9', 'exe-ch9.tex', 'Chapter 9 Exercise', 'OS9094-SWU-计科中外34班', 'howto'),
# ('exercise/ch10', 'exe-ch10.tex', 'Chapter 10 Exercise', 'OS100104-SWU-计科中外34班', 'howto')
]
latex_elements = latex_elements_exe

# latex_additional_files = ["neurips_2023.sty"]

highlight_options = {
    'default': {
        'linenothreshold': 1,  # 行号从第 1 行开始
    }
}

numfig=True
