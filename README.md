# GST Branding

Brand guidelines, design system and logo/social assets for **Global Strategic
Technologies** (GST). Everything here mirrors what is live on
[globalstrategic.tech](https://globalstrategic.tech) — the
[gst-website](https://github.com/Global-Strategic-Technologies/gst-website) repo is the
source of truth and this repo is a published, consumable snapshot of it.

The rendered brand reference (colour swatches, type specimens, every UI component in
light/dark and all six palettes) is at **<https://globalstrategic.tech/brand>**.

## Layout

```
guidelines/          Written brand & style guidance (start here for non-web work)
  BRAND_GUIDELINES.md    colours, palettes, company name, voice, delta icon, a11y
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
  favicon/               favicon.svg, favicon.ico, apple-touch-icon, PWA manifest icons
  social/                OG image 1200×630, LinkedIn company logo (svg/png), LinkedIn cover

scripts/sync-from-website.sh   regenerate all of the above from a local gst-website checkout
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
| Mark | The delta (Δ) — a stroked triangle; teal for brand, amber to signal action |
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
was taken from.

## Licence

Brand assets, guidelines and the design system are © Global Strategic Technologies.
The bundled font is a subset of [Geist Mono](https://vercel.com/font) under the SIL Open
Font License — see `design-system/fonts/LICENSE-OFL.txt`.
