#!/bin/bash
# deploy-games.sh - Deploy static games to static hosting
# Usage: ./deploy-games.sh [platform]

set -euo pipefail

PLATFORM="${1:-netlify}"
GAMES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "=========================================="
echo "Static Games Deployment"
echo "Platform: $PLATFORM"
echo "=========================================="

deploy_netlify() {
    echo "Deploying to Netlify..."
    if ! command -v netlify &> /dev/null; then
        npm install -g netlify-cli
    fi
    cd "$GAMES_DIR"
    netlify deploy --dir=. --prod
}

deploy_vercel() {
    echo "Deploying to Vercel..."
    if ! command -v vercel &> /dev/null; then
        npm install -g vercel
    fi
    cd "$GAMES_DIR"
    vercel --prod
}

deploy_cloudflare() {
    echo "Deploying to Cloudflare Pages..."
    if ! command -v wrangler &> /dev/null; then
        npm install -g wrangler
    fi
    cd "$GAMES_DIR"
    export CLOUDFLARE_API_TOKEN="${CLOUDFLARE_API_TOKEN:-cfat_ZR99swnuo9CWjpteKTArw25msfshVG3fRWD0Y0iZ02ecfa8b}"
    export CLOUDFLARE_ACCOUNT_ID="${CLOUDFLARE_ACCOUNT_ID:-8eb2b9535949b021a8898e81575fba9a}"
    wrangler pages deploy . --project-name static-games
}

deploy_github() {
    echo "Deploying to GitHub Pages..."
    cd "$GAMES_DIR"
    
    # Initialize git if needed
    if [ ! -d .git ]; then
        git init
        git config user.email "deploy@static-games.example.com"
        git config user.name "Static Games Deploy"
    fi
    
    # Create gh-pages branch if not exists
    if ! git rev-parse --verify gh-pages &> /dev/null; then
        git checkout --orphan gh-pages
        git rm -rf . || true
        cp -r ../static-games/* . 2>/dev/null || true
        git add -A
        git commit -m "Deploy static games"
        git checkout main 2>/dev/null || git checkout master 2>/dev/null || true
    fi
    
    # Build and deploy
    git fetch origin gh-pages:gh-pages 2>/dev/null || true
    git worktree add /tmp/gh-pages-deploy gh-pages 2>/dev/null || {
        git worktree add --detach /tmp/gh-pages-deploy gh-pages
    }
    
    cp -r . /tmp/gh-pages-deploy/ 2>/dev/null || true
    cd /tmp/gh-pages-deploy
    git add -A
    git commit -m "Deploy static games - $(date -u +%Y-%m-%dT%H:%M:%SZ)" || true
    git push origin gh-pages --force || true
    
    cd "$GAMES_DIR"
    git worktree remove /tmp/gh-pages-deploy --force 2>/dev/null || true
}

main() {
    case $PLATFORM in
        netlify) deploy_netlify ;;
        vercel) deploy_vercel ;;
        cloudflare) deploy_cloudflare ;;
        github) deploy_github ;;
        all)
            deploy_cloudflare
            deploy_github
            ;;
        *)
            echo "Available platforms: netlify, vercel, cloudflare, github, all"
            exit 1
            ;;
    esac
    echo "Deployment complete!"
}

main "$@"