# Static Games Collection - Deployment Guide

## Cloudflare R2 Setup

Account ID: `8eb2b9535949b021a8898e81575fba9a`

### Configure R2 Bucket

```bash
# Install wrangler
npm install -g wrangler

# Configure R2
wrangler r2 bucket create static-games-assets

# Upload assets
wrangler r2 object put static-games-assets/images/og-cover.jpg --file ./assets/og-cover.jpg
```

### wrangler.toml Configuration

```toml
name = "static-games"
account_id = "8eb2b9535949b021a8898e81575fba9a"

[r2]
bindings = [
  { name = "ASSETS", bucket_name = "static-games-assets" }
]

[vars]
SITE_URL = "https://games.example.com"
```

## Deployment Commands

```bash
# Build and deploy to Cloudflare
./scripts/deploy-games.sh cloudflare

# Or deploy to R2 + CDN
wrangler pages deploy . --project-name static-games
```

## Environment Variables

```bash
# Cloudflare
CLOUDFLARE_API_TOKEN=your_token
CLOUDFLARE_ACCOUNT_ID=8eb2b9535949b021a8898e81575fba9a

# GitHub
GITHUB_TOKEN=ghp_your_token
```