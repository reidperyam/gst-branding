# Global Strategic Technologies - Logo Implementation Guide

## 📦 Asset Package Overview

You now have a complete logo system with transparent backgrounds ready for implementation on your website (globalstrategic.tech).

### What's Included

**SVG Files (Vector - Use These Primarily):**
- ✅ `gst-logo-full-horizontal-color-transparent.svg` - Full name with Delta
- ✅ `gst-logo-gstech-horizontal-color-transparent.svg` - GS Tech with Delta
- ✅ `gst-logo-gst-horizontal-color-transparent.svg` - GST with Delta
- ✅ `gst-logo-full-stacked-color-transparent.svg` - Full name stacked
- ✅ `gst-logo-gstech-stacked-color-transparent.svg` - GS Tech stacked
- ✅ `gst-logo-icon-color-transparent.svg` - Icon for square formats
- ✅ `gst-logo-full-horizontal-black-transparent.svg` - Monochrome black
- ✅ `gst-logo-gstech-horizontal-white-transparent.svg` - Monochrome white
- ✅ `favicon.svg` - Favicon (Delta only)

---

## 🚀 Implementation Steps

### Step 1: Organize Assets in Your Project

Create this directory structure in your website repository:

```
/public/images/logo/
├── svg/
│   ├── gst-logo-full-horizontal-color-transparent.svg
│   ├── gst-logo-gstech-horizontal-color-transparent.svg
│   ├── gst-logo-gst-horizontal-color-transparent.svg
│   ├── gst-logo-full-stacked-color-transparent.svg
│   ├── gst-logo-gstech-stacked-color-transparent.svg
│   ├── gst-logo-icon-color-transparent.svg
│   ├── gst-logo-full-horizontal-black-transparent.svg
│   └── gst-logo-gstech-horizontal-white-transparent.svg
├── png/
│   ├── logo-512.png (to be generated)
│   ├── logo-1024.png (to be generated)
│   └── logo-2048.png (to be generated)
└── favicon/
    ├── favicon.svg
    ├── favicon.ico (to be generated)
    ├── favicon-16x16.png (to be generated)
    ├── favicon-32x32.png (to be generated)
    ├── apple-touch-icon.png (to be generated - 180x180)
    └── android-chrome-512x512.png (to be generated)
```

---

## 💻 Website Header Implementation

### For Astro Website (Your Current Setup)

Create a responsive logo component:

```astro
---
// src/components/Logo.astro
interface Props {
  variant?: 'full' | 'gstech' | 'gst';
  theme?: 'light' | 'dark';
  class?: string;
}

const { variant = 'full', theme = 'light', class: className = '' } = Astro.props;

const logoMap = {
  full: {
    light: '/images/logo/svg/gst-logo-full-horizontal-color-transparent.svg',
    dark: '/images/logo/svg/gst-logo-full-horizontal-color-transparent.svg'
  },
  gstech: {
    light: '/images/logo/svg/gst-logo-gstech-horizontal-color-transparent.svg',
    dark: '/images/logo/svg/gst-logo-gstech-horizontal-color-transparent.svg'
  },
  gst: {
    light: '/images/logo/svg/gst-logo-gst-horizontal-color-transparent.svg',
    dark: '/images/logo/svg/gst-logo-gst-horizontal-color-transparent.svg'
  }
};

const logoSrc = logoMap[variant][theme];
const altText = 'Global Strategic Technologies';
---

<img 
  src={logoSrc} 
  alt={altText}
  class={`logo logo-${variant} ${className}`}
  loading="eager"
  decoding="async"
/>

<style>
  .logo {
    height: auto;
    max-width: 100%;
  }
  
  /* Desktop: Full name */
  @media (min-width: 1200px) {
    .logo-full {
      height: 60px;
      width: auto;
    }
  }
  
  /* Tablet: GS Tech */
  @media (min-width: 768px) and (max-width: 1199px) {
    .logo-gstech {
      height: 50px;
      width: auto;
    }
  }
  
  /* Mobile: GST */
  @media (max-width: 767px) {
    .logo-gst {
      height: 40px;
      width: auto;
    }
  }
</style>
```

### Usage in Your Header

```astro
---
// src/components/Header.astro
import Logo from './Logo.astro';
---

<header>
  <nav>
    <a href="/" class="logo-link">
      <!-- Desktop: Show full name -->
      <Logo variant="full" class="hidden lg:block" />
      
      <!-- Tablet: Show GS Tech -->
      <Logo variant="gstech" class="hidden md:block lg:hidden" />
      
      <!-- Mobile: Show GST -->
      <Logo variant="gst" class="block md:hidden" />
    </a>
    
    <!-- Rest of navigation -->
  </nav>
</header>

<style>
  header {
    background: white;
    border-bottom: 1px solid #e0e0e0;
    padding: 1rem 2rem;
  }
  
  nav {
    display: flex;
    align-items: center;
    justify-content: space-between;
    max-width: 1400px;
    margin: 0 auto;
  }
  
  .logo-link {
    display: flex;
    align-items: center;
  }
</style>
```

---

## 🎨 Dark Mode Implementation

### If You Have Dark Mode

```astro
---
// src/components/AdaptiveLogo.astro
---

<a href="/" class="logo-link">
  <!-- Light theme logo -->
  <img 
    src="/images/logo/svg/gst-logo-full-horizontal-color-transparent.svg"
    alt="Global Strategic Technologies"
    class="logo logo-light"
  />
  
  <!-- Dark theme logo (white version) -->
  <img 
    src="/images/logo/svg/gst-logo-gstech-horizontal-white-transparent.svg"
    alt="Global Strategic Technologies"
    class="logo logo-dark"
  />
</a>

<style>
  .logo {
    height: 60px;
    width: auto;
  }
  
  /* Show appropriate logo based on theme */
  :global(.light-theme) .logo-dark,
  :global(.dark-theme) .logo-light {
    display: none;
  }
  
  :global(.light-theme) .logo-light,
  :global(.dark-theme) .logo-dark {
    display: block;
  }
</style>
```

---

## 📱 Favicon Implementation

### Update Your HTML Head

```astro
---
// src/layouts/BaseLayout.astro or your main layout file
---

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Global Strategic Technologies</title>
  
  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="/images/logo/favicon/favicon.svg" />
  <link rel="icon" type="image/png" sizes="32x32" href="/images/logo/favicon/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="/images/logo/favicon/favicon-16x16.png" />
  <link rel="shortcut icon" href="/images/logo/favicon/favicon.ico" />
  
  <!-- Apple Touch Icon -->
  <link rel="apple-touch-icon" sizes="180x180" href="/images/logo/favicon/apple-touch-icon.png" />
  
  <!-- Android Chrome -->
  <link rel="icon" type="image/png" sizes="192x192" href="/images/logo/favicon/android-chrome-192x192.png" />
  <link rel="icon" type="image/png" sizes="512x512" href="/images/logo/favicon/android-chrome-512x512.png" />
  
  <!-- Web App Manifest (if you have one) -->
  <link rel="manifest" href="/site.webmanifest" />
  
  <!-- Theme Color -->
  <meta name="theme-color" content="#00D9B5" />
</head>
```

### Create site.webmanifest

```json
{
  "name": "Global Strategic Technologies",
  "short_name": "GST",
  "description": "Strategic technology advisory for private equity",
  "icons": [
    {
      "src": "/images/logo/favicon/android-chrome-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/images/logo/favicon/android-chrome-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#00D9B5",
  "background_color": "#ffffff",
  "display": "standalone",
  "start_url": "/"
}
```

---

## 📧 Email Signature Implementation

### For Email Signatures

Use PNG versions (better email client compatibility):

```html
<!-- Email Signature HTML -->
<table cellpadding="0" cellspacing="0" border="0" style="font-family: Arial, sans-serif; font-size: 14px; color: #2C3E50;">
  <tr>
    <td style="padding-bottom: 15px;">
      <img src="https://globalstrategic.tech/images/logo/png/gst-logo-gstech-400x80.png" 
           alt="Global Strategic Technologies" 
           width="280" 
           height="56" 
           style="display: block; border: none;" />
    </td>
  </tr>
  <tr>
    <td>
      <strong>Your Name</strong><br/>
      Title<br/>
      Global Strategic Technologies LLC<br/>
      <br/>
      <a href="mailto:you@globalstrategic.tech" style="color: #00D9B5; text-decoration: none;">you@globalstrategic.tech</a><br/>
      <a href="https://globalstrategic.tech" style="color: #00D9B5; text-decoration: none;">globalstrategic.tech</a>
    </td>
  </tr>
</table>
```

---

## 🖼️ Social Media Implementation

### Open Graph Meta Tags

```astro
---
// In your <head> section
---

<head>
  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://globalstrategic.tech/" />
  <meta property="og:title" content="Global Strategic Technologies" />
  <meta property="og:description" content="Strategic technology advisory for private equity investors and portfolio companies" />
  <meta property="og:image" content="https://globalstrategic.tech/images/social/og-image-1200x630.png" />
  
  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image" />
  <meta property="twitter:url" content="https://globalstrategic.tech/" />
  <meta property="twitter:title" content="Global Strategic Technologies" />
  <meta property="twitter:description" content="Strategic technology advisory for private equity investors and portfolio companies" />
  <meta property="twitter:image" content="https://globalstrategic.tech/images/social/twitter-card-1200x675.png" />
</head>
```

### LinkedIn Company Profile
- **Logo:** Use stacked version (400×400px minimum)
- **Cover Image:** Custom design with logo (1584×396px)
- File: `gst-logo-gstech-stacked-color-transparent.svg` → convert to PNG 400×400

---

## 🎯 PNG Generation Instructions

Since SVG files are provided, you need to convert them to PNG for certain uses:

### Using CloudConvert (Recommended - Easy)

1. Go to https://cloudconvert.com/svg-to-png
2. Upload each SVG file
3. Set output dimensions:
   - **Icon:** 512×512, 1024×1024
   - **Horizontal logos:** Keep aspect ratio, height = 80px, 120px, 240px
   - **Favicon:** 16×16, 32×32, 64×64
   - **Apple Touch Icon:** 180×180
   - **Android Chrome:** 192×192, 512×512
4. Download and place in `/public/images/logo/png/`

### Using Inkscape (Free Desktop Tool)

```bash
# Install Inkscape
# Ubuntu/Debian: sudo apt install inkscape
# Mac: brew install inkscape
# Windows: Download from inkscape.org

# Convert SVG to PNG (example)
inkscape --export-type=png --export-width=512 --export-height=512 input.svg -o output-512.png

# Favicon conversions
inkscape --export-type=png --export-width=16 --export-height=16 favicon.svg -o favicon-16x16.png
inkscape --export-type=png --export-width=32 --export-height=32 favicon.svg -o favicon-32x32.png
inkscape --export-type=png --export-width=180 --export-height=180 gst-logo-icon-color-transparent.svg -o apple-touch-icon.png
```

### Using Online Tool (Fastest for One-Offs)

1. Go to https://svgtopng.com/
2. Upload SVG
3. Set width/height
4. Download PNG

---

## 📋 Implementation Checklist

### Phase 1: Core Implementation (Today)
- [ ] Copy all SVG files to `/public/images/logo/svg/`
- [ ] Update header component to use new logos
- [ ] Test responsive breakpoints (desktop/tablet/mobile)
- [ ] Verify transparent backgrounds work

### Phase 2: Favicon Setup (This Week)
- [ ] Convert favicon.svg to PNG sizes (16, 32, 64, 180)
- [ ] Generate .ico file (using online converter)
- [ ] Update HTML head with favicon links
- [ ] Create site.webmanifest
- [ ] Test in multiple browsers

### Phase 3: Social Media (This Week)
- [ ] Generate PNG for LinkedIn profile (400×400)
- [ ] Generate Open Graph image (1200×630)
- [ ] Generate Twitter card (1200×675)
- [ ] Add Open Graph meta tags
- [ ] Test with social media preview tools

### Phase 4: Email & Print (Within 2 Weeks)
- [ ] Generate PNG for email signature (400×80 at 2x = 800×160)
- [ ] Create email signature template
- [ ] Export print versions (PDF/AI at 300 DPI)
- [ ] Create business card mockup

### Phase 5: Documentation (Within Month)
- [ ] Document logo usage guidelines
- [ ] Create internal brand guide
- [ ] Share with team members
- [ ] Train on proper usage

---

## 🔧 Troubleshooting

### Logo appears blurry on high-DPI screens
**Solution:** Use SVG files for web (they scale perfectly) or 2x PNG sizes

### Logo doesn't show up in browser tab
**Solution:** Check favicon paths, ensure files are in `/public/` directory, hard refresh (Ctrl+Shift+R)

### Logo looks different on dark backgrounds
**Solution:** Use the white monochrome version (`-white-transparent.svg`)

### Logo is too large/small
**Solution:** Adjust height in CSS, maintain aspect ratio with `width: auto`

### Fonts don't load in email signature
**Solution:** Email signatures should use PNG images, not SVG with web fonts

---

## 📐 Logo Specifications Summary

### Color Specifications
- **Primary Color:** #00D9B5 (Teal)
- **Text Color (Light BG):** #2C3E50 (Dark Slate)
- **Text Color (Dark BG):** #FFFFFF (White)

### Typography
- **Font Family:** Montserrat
- **Font Weight:** 500 (Medium)
- **Letter Spacing:** 2px

### Sizing Guidelines
| Context | Logo Variant | Height |
|---------|-------------|--------|
| Desktop Header | Full Name | 60-80px |
| Tablet Header | GS Tech | 50-60px |
| Mobile Header | GST | 40-50px |
| Email Signature | GS Tech | 56-80px |
| Favicon | Icon Only | 16-32px |
| Social Profile | Stacked | 400×400px |

---

## 🎨 Usage Examples

### Footer Logo
```astro
<!-- src/components/Footer.astro -->
<footer>
  <div class="footer-logo">
    <img 
      src="/images/logo/svg/gst-logo-gstech-horizontal-color-transparent.svg"
      alt="Global Strategic Technologies"
      style="height: 40px; width: auto; opacity: 0.8;"
    />
    <p style="margin-top: 1rem; font-size: 0.875rem; color: #7f8c8d;">
      © 2026 Global Strategic Technologies LLC. All rights reserved.
    </p>
  </div>
</footer>
```

### Loading State
```astro
<!-- While logo loads, show placeholder -->
<img 
  src="/images/logo/svg/gst-logo-full-horizontal-color-transparent.svg"
  alt="Global Strategic Technologies"
  loading="eager"
  decoding="async"
  style="height: 60px; width: auto;"
/>
```

---

## 📊 Performance Optimization

### SVG Optimization
Your SVG files are already optimized with:
- ✅ Inline web fonts (Montserrat from Google Fonts)
- ✅ Clean paths (no unnecessary nodes)
- ✅ Proper viewBox settings
- ✅ Semantic naming

### Further Optimization (Optional)
```bash
# Install SVGO
npm install -g svgo

# Optimize SVG files (optional - already clean)
svgo -f /public/images/logo/svg/
```

### Image Loading Best Practices
```astro
<!-- Critical above-the-fold logo -->
<img 
  src="/images/logo/svg/gst-logo-full-horizontal-color-transparent.svg"
  alt="Global Strategic Technologies"
  loading="eager"
  fetchpriority="high"
  decoding="async"
/>

<!-- Below-the-fold logo -->
<img 
  src="/images/logo/svg/gst-logo-gstech-horizontal-color-transparent.svg"
  alt="Global Strategic Technologies"
  loading="lazy"
  decoding="async"
/>
```

---

## 🔄 Future Enhancements

### Consider Adding Later
1. **Animated Logo** - Subtle Delta animation on page load
2. **Interactive Logo** - Hover effects showing "Δ = Change"
3. **Dark Mode Variants** - Automatic theme switching
4. **Print Stylesheets** - Optimized for print media
5. **PWA Icons** - Progressive Web App manifest icons

---

## 📞 Need Help?

### Quick Fixes
- **Logo not showing:** Check file paths start with `/` not `./`
- **Wrong size:** Adjust CSS height, keep width as `auto`
- **Blurry:** Use SVG files, not low-res PNG
- **Email issues:** Use PNG for email signatures

### Resources
- **SVG to PNG:** https://cloudconvert.com/svg-to-png
- **Favicon Generator:** https://realfavicongenerator.net/
- **Test Open Graph:** https://www.opengraph.xyz/
- **Test Twitter Cards:** https://cards-dev.twitter.com/validator

---

## ✅ Final Verification

After implementation, verify:

1. **Desktop (1200px+):** Full "Global Strategic Technologies" logo shows
2. **Tablet (768-1199px):** "GS Tech" logo shows
3. **Mobile (<768px):** "GST" logo shows
4. **Browser Tab:** Favicon (Delta) appears
5. **Social Share:** Open Graph image displays correctly
6. **Dark Mode:** White logo version appears (if applicable)
7. **Print:** Logo prints clearly in black/white

---

**Implementation Guide Version:** 1.0  
**Created:** 2026-02-01  
**Status:** Ready for deployment  
**Estimated Time:** 2-4 hours for full implementation

---

**🎉 You now have a complete, professional logo system aligned with your PE-focused brand strategy!**
