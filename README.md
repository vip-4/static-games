# Static Games Collection

Free HTML5 browser games collection with Cloudflare R2 integration.

## Games

- **Puzzle**: 2048
- **Action**: Breakout
- **Casual**: Snake
- **Shooter**: Space Invaders
- **Racing**: Retro Racer
- **Rhythm**: Beat Tap

## Tech Stack

- Pure HTML5/CSS/JS (no frameworks)
- Canvas 2D for game rendering
- Web Audio API for rhythm games
- localStorage for high scores
- Cloudflare R2 for asset storage
- Cloudflare Workers for edge delivery

## Deployment

```bash
# Cloudflare Pages
./scripts/deploy-games.sh cloudflare

# GitHub Pages
./scripts/deploy-games.sh github

# All platforms
./scripts/deploy-games.sh all
```

## Configuration

Account ID: `8eb2b9535949b021a8898e81575fba9a`
R2 Endpoint: `https://8eb2b9535949b021a8898e81575fba9a.r2.cloudflarestorage.com`