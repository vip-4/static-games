# Geo-Targeting Edge Rules for Cloudflare

## Cache Rules
- Cache static assets (js, css, png, jpg, svg) for 1 year
- Cache HTML pages for 1 hour
- Enable Brotli and Gzip compression
- Serve WebP images with Accept header negotiation

## Redirect Rules
- Redirect old game paths to new URLs
- Redirect /games/ to / (root)
- Regional redirects for localized content

## Header Rules
- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY
- Referrer-Policy: strict-origin-when-cross-origin
- Strict-Transport-Security: max-age=63072000

## Rate Limiting
- 100 requests per second per IP
- Burst: 200 requests

## Image Optimization
- Polish: lossy compression
- Mirage: format optimization
- Quality: 85%
- Max width: 1920px