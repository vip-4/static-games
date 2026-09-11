# GEO & SEO Optimization Guide for Static Games

## Cloudflare Configuration

Account ID: `8eb2b9535949b021a8898e81575fba9a`
R2 Endpoint: `https://8eb2b9535949b021a8898e81575fba9a.r2.cloudflarestorage.com`

## R2 Storage for Game Assets

```bash
# Upload game assets to Cloudflare R2
aws --endpoint-url https://8eb2b9535949b021a8898e81575fba9a.r2.cloudflarestorage.com \
  s3 cp assets/ s3://static-games-assets/ --recursive
```

## SEO Optimization Checklist

### 1. Meta Tags
- [ ] Unique title per game page
- [ ] Descriptive meta description (150-160 chars)
- [ ] Open Graph tags (og:title, og:description, og:image)
- [ ] Twitter Card tags
- [ ] Canonical URLs

### 2. Structured Data
- [ ] Game schema.org markup
- [ ] FAQ schema for game instructions
- [ ] Breadcrumb navigation schema

### 3. Sitemap
- [ ] XML sitemap.xml
- [ ] Robots.txt
- [ ] Game-specific sitemaps

### 4. GEO Targeting
- [ ] Multi-language hreflang tags
- [ ] Regional game recommendations
- [ ] CDN edge caching rules

### 5. Performance
- [ ] Lighthouse scores > 90
- [ ] Core Web Vitals optimized
- [ ] Mobile-first design
- [ ] PWA manifest