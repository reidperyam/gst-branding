# GST Logo & Mark Usage

Owned by this repo (not synced from the website). Complements
[BRAND_GUIDELINES.md § Brand Asset: Delta Icon](BRAND_GUIDELINES.md#brand-asset-delta-icon),
which is authoritative on colour and context; this file adds the geometry and the rules
for non-web use. Rendered examples: [index.html](../index.html) ·
<https://reidperyam.github.io/gst-branding/>.

## The mark

The GST mark is the **delta (Δ)** — an equilateral-ish triangle drawn as a **stroke, never
a fill**, on a 64-unit grid: path `M32 12 L52 52 L12 52 Z`, stroke width 6, mitred joins.
It reads as change, difference and direction, which is the point.

| File | Stroke | Use on |
| --- | --- | --- |
| `assets/logo/gst-delta-icon-teal-stroke-thick.svg` | `#05cd99` | Any background with ≥ 3:1 contrast to teal (white, off-white, near-black) |
| `assets/logo/gst-delta-icon-dark-stroke-thick.svg` | `#1a1a1a` | Light surfaces where teal is unavailable (mono print, fax-grade reproduction) |
| `assets/logo/gst-delta-icon-white-stroke-thick.svg` | `#ffffff` | Photography, dark or teal surfaces |
| `assets/logo/gst-icon.svg` | black | App/OS icon source (system recolours it) |
| `assets/logo/gst-logo-bimi.svg` | `#0a0a0a` | BIMI email-avatar record only (SVG Tiny PS) |

On the web the icon is inline SVG with `stroke="currentColor"` so it inherits the text
colour — see `DeltaIcon.astro` in the website. In documents and decks, use the SVG/PNG
files above and pick the variant for the background; do not recolour the file.

## The wordmark

The wordmark is the header lockup from the site, `assets/wordmark/`:

```
[Δ]  G S T  ▪
```

- Delta at **1 em**, then a **0.125 em** gap.
- **"GST"** in GST Mono, weight **900**, uppercase, letter-spacing **−0.05 em**. The **S is
  teal**, G and T are ink (`#1a1a1a` on light, `#f5f5f5` on dark).
- Then a **0.25 em** gap and an **8 px (0.25 em) teal square** — on the site it pulses; in
  static media it is simply present.
- Files: `gst-wordmark-on-light.svg` / `gst-wordmark-on-dark.svg` (transparent, font
  embedded), `*-boxed.svg` (with background), `*@2x.png` (236×80 px) for tools that
  cannot embed fonts.

The long-form name "Global Strategic Technologies" is set in the same face at weight 700
and is never part of the lockup; it goes beneath or beside it as ordinary text.

## Minimum size

| Asset | Minimum | Why |
| --- | --- | --- |
| Delta alone | **16 px** / 4 mm | The 6-unit stroke stays ≥ 1.5 px |
| Wordmark | **24 px** tall / 6 mm | The dot stays ≥ 5 px and the −0.05 em tracking doesn't close the counters |
| Favicon | 16 px | Use `favicon.ico`, which carries 16/32/48 renders |

## Clear space

Keep a margin of **at least the stroke width × 2 (12 units, ≈ 19 % of the mark's width)**
around the delta, and **half the wordmark's cap height** around the wordmark. Nothing —
text, rules, other logos — enters that zone.

## Backgrounds

- **Preferred**: `#ffffff` / `#f5f5f5` (light) and `#0a0a0a` / `#141414` (dark). The teal
  delta works on all four.
- **Teal surfaces** (`#05cd99` blocks): use the **white** stroke variant.
- **Photography**: use the white variant over a dark region, or place the mark on a solid
  colour block. Never over busy or mid-tone areas.
- **Alternative palettes** (`palette-0` … `palette-5`): the mark takes that palette's
  `--color-primary`; on the web this is automatic.

## Don'ts

- Don't fill the triangle (the `filled` variant exists only as a UI *marker*, e.g. the
  current-locale indicator — not as a logo).
- Don't change the stroke weight, round the joins, rotate, skew, or add a shadow, gradient
  or outline.
- Don't recolour outside teal `#05cd99`, ink, white — or amber `#cc8800`/`#ffaa33`, which is
  reserved for *attention/CTA* use on the web, not for the logo.
- Don't set "GST" in another typeface, another weight, or with normal tracking.
- Don't write "Global Strategic Technology" (singular) or "Global Strategic Tech". See
  [BRAND_GUIDELINES.md § Company Name](BRAND_GUIDELINES.md#company-name).
- Don't use the old `#00D9B5` teal; assets exported before 2026-09 carry it and should be
  replaced.

## Regenerating

The wordmark SVGs and social templates are generated, not drawn: the spec above is the
`HeaderLogo.astro` CSS, and the script that emits them lives in this repo's history
(`git log -S"wordmark(" -- assets/wordmark`). Change the spec in the website first, then
regenerate here.
