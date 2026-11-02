#!/bin/bash
# Build the CV PDF from Tangvita2611.ctx (run from anywhere).
# Needs: xelatex plus the fontspec/xeCJK packages (texlive-xetex, texlive-latex-extra,
# texlive-lang-chinese, texlive-fonts-recommended), the "EB Garamond" font
# (fonts-ebgaramond) and a Chinese font ("WenQuanYi Micro Hei", fonts-wqy-microhei).
# The original file uses the MinionPro package, which needs Adobe's licensed fonts;
# this script swaps in the free EB Garamond font (lining numerals) so the CV builds without them.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="${1:-$here/Tangvita2611.ctx}"
name="$(basename "$src" .ctx)"
tmp="$(mktemp -d)"
cp "$here/res.cls" "$tmp/"
python3 - "$src" "$tmp/cv.tex" <<'PY'
import sys
s = open(sys.argv[1], encoding="utf-8").read()
s = s.replace("\\usepackage{MinionPro}",
              "\\usepackage{fontspec}\n\\setmainfont{EB Garamond}[Numbers=Lining]\n"
              "\\usepackage{xeCJK}\n\\setCJKmainfont{WenQuanYi Micro Hei}")
s = s.replace("\\usepackage[T1]{fontenc}\n", "")
i = s.index("\\end{document}")          # drop stray text after the real end
open(sys.argv[2], "w", encoding="utf-8").write(s[: i + len("\\end{document}")] + "\n")
PY
(cd "$tmp" && xelatex -interaction=nonstopmode cv.tex >/dev/null && xelatex -interaction=nonstopmode cv.tex >/dev/null)
cp "$tmp/cv.pdf" "$here/$name.pdf"
echo "Wrote $here/$name.pdf"
