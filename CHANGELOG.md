# Changelog

Versions are date-based (`vYYYY.MM[.N]`) and tagged in git. Each entry records the
gst-website commit the design system was snapshotted from (see `design-system/SOURCE.json`).

## v2026.09 — 2026-09-19

Rebuilt from the gst-website design system (website commit `ce8d58f5`).

- **Brand teal corrected to `#05cd99`** in every delta-icon SVG, favicon/ICO, app icons,
  OG image, LinkedIn assets and the CSS mask data-URIs. The previous assets used the
  stale `#00D9B5`. (Website fix: Global-Strategic-Technologies/gst-website#502.)
- New `index.html` brand-asset page (GitHub Pages) showing every asset in light and dark
  with when/how-to-use guidance.
- New `guidelines/LOGO_USAGE.md`: wordmark spec, minimum size, clear space, backgrounds.
- New vector wordmark (`assets/wordmark/`) generated from the site's `HeaderLogo.astro`
  spec, plus @2x PNGs.
- New social templates (`assets/social/templates/`): 1080×1080, 1200×675, 1200×630.
- `guidelines/` now mirrors `src/docs/styles/` from the website; `design-system/` is the
  website's exported bundle (styles, fonts, rendered component cards, screenshots).
- `scripts/sync-from-website.sh` and a CI drift check against `gst-website@master`.
- Removed the 2026-02 logo package (full/stacked/"GS Tech" lockups, legacy brand board).
