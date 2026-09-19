#!/usr/bin/env bash
# Re-sync this repo from a local checkout of gst-website.
# Usage: scripts/sync-from-website.sh [path-to-gst-website]   (default: ../gst-website)
# Prereq: the website's design-system bundle must exist at <website>/ds-bundle
# (it is git-ignored there; regenerate it with the website's design-sync tooling first).
set -euo pipefail
B="$(cd "$(dirname "$0")/.." && pwd)"
W="${1:-$B/../gst-website}"
DS="$W/ds-bundle"
[ -f "$DS/_ds_bundle.css" ] || { echo "No ds-bundle at $DS — build it in gst-website first." >&2; exit 1; }
GH=https://github.com/Global-Strategic-Technologies/gst-website/blob/main

# Design system
cp "$DS/_ds_bundle.css" "$B/design-system/gst.css"
cp "$DS/fonts/fonts.css" "$DS/fonts/"*.woff2 "$B/design-system/fonts/"
cp "$W/public/fonts/GEIST-MONO-OFL.txt" "$B/design-system/fonts/LICENSE-OFL.txt"
rm -rf "$B/design-system/components" "$B/design-system/screenshots"
mkdir -p "$B/design-system/screenshots"
for d in "$DS"/components/*/*; do
  grp=$(basename "$(dirname "$d")"); n=$(basename "$d")
  mkdir -p "$B/design-system/components/$grp/$n"
  cp "$d/$n.html" "$d/$n.prompt.md" "$B/design-system/components/$grp/$n/"
done
cp "$DS"/_screenshots/chrome__*.png "$DS"/_screenshots/specimens__*.png "$DS"/_screenshots/contact-sheet-1.png "$B/design-system/screenshots/"
cp "$DS/_screenshots/_probe-dark.png"  "$B/design-system/screenshots/theme__dark.png"
cp "$DS/_screenshots/_probe-light.png" "$B/design-system/screenshots/theme__light.png"
for i in 0 1 2 3 4 5; do cp "$DS/_screenshots/_probe-palette-$i.png" "$B/design-system/screenshots/palette__$i.png"; done

# Guidelines (rewrite relative links into the website repo to absolute URLs)
for f in BRAND_GUIDELINES STYLES_GUIDE VARIABLES_REFERENCE TYPOGRAPHY_REFERENCE; do
  sed -e "s#](\.\./\.\./\.\./#](${GH}/#g" \
      -e "s#](\.\./\.\./#](${GH}/src/#g" \
      -e "s#](\.\./#](${GH}/src/docs/#g" \
      "$W/src/docs/styles/$f.md" > "$B/guidelines/$f.md"
done

# Brand assets that live in the website
cp "$W/public/images/logo/gst-delta-icon-teal-stroke-thick.svg" "$B/assets/logo/"
cp "$W/public/images/icon.svg"        "$B/assets/logo/gst-icon.svg"
cp "$W/public/branding/logo-bimi.svg" "$B/assets/logo/gst-logo-bimi.svg"
cp "$W/public/favicon.svg" "$W/public/images/favicon.ico" "$W/public/images/apple-touch-icon.png" \
   "$W/public/images/web-app-manifest-192.png" "$W/public/images/web-app-manifest-512.png" "$B/assets/favicon/"
cp "$W/public/og-image.png" "$B/assets/social/og-image-1200x630.png"

# Provenance
cat > "$B/design-system/SOURCE.json" <<JSON
{
  "source": "https://github.com/Global-Strategic-Technologies/gst-website",
  "sourceCommit": "$(git -C "$W" rev-parse HEAD)",
  "sourceCommitDate": "$(git -C "$W" log -1 --format=%cs)",
  "bundleSha12": "$(sed -n 's/.*"bundleSha12": "\([^"]*\)".*/\1/p' "$DS/_ds_sync.json")",
  "styleSha": "$(sed -n 's/.*"styleSha": "\([^"]*\)".*/\1/p' "$DS/_ds_sync.json")",
  "syncedOn": "$(date +%F)"
}
JSON
echo "Synced from $(git -C "$W" rev-parse --short HEAD). Review 'git status' and commit."
