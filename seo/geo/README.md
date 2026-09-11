# Geo-Targeting Configuration for Static Games

## Cloudflare R2 Integration

Account ID: `8eb2b9535949b021a8898e81575fba9a`
R2 Endpoint: `https://8eb2b9535949b021a8898e81575fba9a.r2.cloudflarestorage.com`

## R2 Bucket Structure

```
static-games-assets/
├── images/
│   ├── og-cover.jpg
│   ├── logo.png
│   └── game-thumbs/
├── fonts/
│   └── pixel-font.woff2
├── audio/
│   └── sfx/
└── icons/
    └── favicon.ico
```

## CDN Edge Caching

| Asset Type | Cache TTL | Compression |
|------------|-----------|-------------|
| .html | 1 hour | Brotli + Gzip |
| .css | 1 year | Brotli + Gzip |
| .js | 1 year | Brotli + Gzip |
| .png/.jpg | 1 year | WebP conversion |
| .svg | 1 year | - |
| .woff2 | 1 year | - |

## Regional CDN Nodes

- North America: us-east-1, us-west-2
- Europe: eu-central-1, eu-west-2
- Asia Pacific: ap-southeast-1, ap-northeast-1
- South America: sa-east-1
- Oceania: ap-southeast-2

## SEO Metadata Template

```html
<meta name="description" content="Play free HTML5 games online. No downloads, no registration. Puzzle, action, casual, shooter games.">
<meta property="og:title" content="Static Games - Free HTML5 Browser Games">
<meta property="og:description" content="Play free HTML5 games instantly in your browser.">
<meta property="og:image" content="https://games.example.com/assets/og-cover.jpg">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
```