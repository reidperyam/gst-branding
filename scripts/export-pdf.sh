#!/usr/bin/env bash
# Export the brand-asset page and the guidelines to PDF with headless Chrome.
# Usage: scripts/export-pdf.sh [out-dir]   (default: ./dist-pdf)
set -euo pipefail
B="$(cd "$(dirname "$0")/.." && pwd)"; OUT="${1:-$B/dist-pdf}"; mkdir -p "$OUT"
CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chrome || echo "/c/Program Files/Google/Chrome/Application/chrome.exe")}"
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf="$OUT/GST-Brand-Assets.pdf" "file://$B/index.html"
# Guidelines: render each markdown file through the same stylesheet via a tiny HTML shell
for f in BRAND_GUIDELINES LOGO_USAGE STYLES_GUIDE VARIABLES_REFERENCE TYPOGRAPHY_REFERENCE; do
  html="$OUT/.$f.html"
  { printf '<!doctype html><meta charset=utf-8><link rel=stylesheet href="file://%s/design-system/styles.css"><script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script><body class="container" style="max-width:52rem;margin:2rem auto;padding:0 1rem"><div id=m></div><script>fetch("file://%s/guidelines/%s.md").then(r=>r.text()).then(t=>{document.getElementById("m").innerHTML=marked.parse(t)})</script>' "$B" "$B" "$f"; } > "$html"
  "$CHROME" --headless=new --disable-gpu --allow-file-access-from-files --no-pdf-header-footer --virtual-time-budget=5000 --print-to-pdf="$OUT/GST-$f.pdf" "file://$html"
  rm -f "$html"
done
echo "PDFs in $OUT"
