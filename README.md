# GST Branding

Brand guidelines, design system and logo/social assets for **Global Strategic
Technologies** (GST). Everything here mirrors what is live on
[globalstrategic.tech](https://globalstrategic.tech) — the
[gst-website](https://github.com/Global-Strategic-Technologies/gst-website) repo is the
source of truth and this repo is a published, consumable snapshot of it.

**Brand asset page** (every logo, favicon, social image and template, on light and dark,
with when-to-use guidance): **<https://reidperyam.github.io/gst-branding/>** — or open
`index.html` from disk.

The rendered design-system reference (colour swatches, type specimens, every UI component
in light/dark and all six palettes) is at **<https://globalstrategic.tech/brand>**.

## Layout

```
index.html           Brand asset page (GitHub Pages) — every asset, light + dark, usage notes
guidelines/          Written brand & style guidance (start here for non-web work)
  BRAND_GUIDELINES.md    colours, palettes, company name, voice, delta icon, a11y
  LOGO_USAGE.md          mark & wordmark geometry, minimum size, clear space (owned here)
  STYLES_GUIDE.md        CSS conventions & component patterns
  VARIABLES_REFERENCE.md full design-token catalogue (328 custom properties)
  TYPOGRAPHY_REFERENCE.md

design-system/       The shipped CSS system (start here for anything on the web)
  styles.css             single entry point — link this one file
  gst.css                compiled stylesheet: tokens, typography, palettes, .brutal-* classes
  fonts/                 GST Mono (Geist Mono subset, OFL) + @font-face
  components/chrome/     rendered production markup for site sections (header, hero, footer…)
  components/specimens/  galleries of every variant of buttons, cards, forms, colour, type…
  screenshots/           PNG renders of every card, plus light/dark and palette 0–5 probes
  README.md              how to consume the system (tokens, theming, do/don't)
  SOURCE.json            which gst-website commit this snapshot came from

assets/              Ready-to-use brand files
  logo/                  delta icon (teal / dark / white stroke), app icon, BIMI logo
  wordmark/              GST header lockup as SVG (font embedded) + @2x PNG, light & dark
  favicon/               favicon.svg, favicon.ico, apple-touch-icon, PWA manifest icons
  social/                OG image 1200×630, LinkedIn company logo (svg/png), LinkedIn cover
  social/templates/      editable post templates: 1080×1080, 1200×675, 1200×630

scripts/sync-from-website.sh   regenerate design-system/ + guidelines/ + website assets
scripts/export-pdf.sh          print the asset page and guidelines to PDF (headless Chrome)
.github/workflows/             weekly drift check against gst-website@master
CHANGELOG.md · LICENSE
```

## Quick start

**Web:** copy `design-system/` and link one stylesheet.

```html
<link rel="stylesheet" href="design-system/styles.css">
```

Theme and palette are classes on `<html>` (never `<body>`): `html.dark-theme` for
dark mode, `html.palette-0` … `html.palette-5` for the alternative palettes. Tokens
switch automatically via `light-dark()`. See `design-system/README.md` for the rules.

**Anything else (decks, docs, social):** read `guidelines/BRAND_GUIDELINES.md` and use
the files in `assets/`.

## Brand at a glance

| | |
| --- | --- |
| Primary teal | `#05cd99` (`--color-primary`, same in both themes) |
| Primary teal dark | `#04a87a` (hover / pressed) |
| Secondary amber | `#cc8800` light / `#ffaa33` dark (`--color-secondary`) — attention / CTA |
| Backgrounds | `#ffffff` / `#f5f5f5` light · `#0a0a0a` / `#141414` dark |
| Typeface | **GST Mono** (Geist Mono variable, weights 100–900), mono everywhere |
| Mark | The delta (Δ) — a stroked triangle; teal for brand, amber to signal action. **Not** the retired `#00D9B5` |
| Name | "Global Strategic Technologies" (legal: …LLC), short form "GST" — never "Global Strategic Technology" or "Global Strategic Tech" |

Full rules, contrast requirements and the six alternative palettes are in
`guidelines/BRAND_GUIDELINES.md`.

## Keeping this in sync

The website is authoritative. When it changes:

```bash
scripts/sync-from-website.sh ../gst-website   # needs the website's ds-bundle built
git add -A && git commit -m "Sync from gst-website <sha>"
```

`design-system/SOURCE.json` records the website commit and bundle hash each snapshot
was taken from. Releases are tagged `vYYYY.MM` — see `CHANGELOG.md`. The drift-check
workflow fails when `guidelines/` or the website-owned assets fall behind `master`.

`guidelines/LOGO_USAGE.md`, `assets/wordmark/`, `assets/social/templates/` and
`index.html` are owned by this repo and are not touched by the sync.

## Licence

Brand assets, guidelines and the design system are © Global Strategic Technologies.
The bundled font is a subset of [Geist Mono](https://vercel.com/font) under the SIL Open
Font License — see `design-system/fonts/LICENSE-OFL.txt`.
