// Cloudflare Workers script for Static Games
// Geo-routing + R2 asset proxying

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const country = request.cf?.country || 'US';
    
    // Geo-based game recommendations
    const regionalGames = {
      'US': ['puzzle/2048.html', 'shooter/space-invaders.html'],
      'EU': ['action/breakout.html', 'racing/index.html'],
      'CN': ['rhythm/index.html', 'casual/snake.html'],
      'JP': ['rhythm/index.html', 'puzzle/2048.html'],
      'KR': ['rhythm/index.html', 'shooter/space-invaders.html'],
    };
    
    const recommended = regionalGames[country] || regionalGames['US'];
    
    // Handle API requests for game metadata
    if (url.pathname === '/api/games') {
      return new Response(JSON.stringify({
        games: recommended,
        country: country,
        timestamp: Date.now()
      }), {
        headers: { 'Content-Type': 'application/json' }
      });
    }
    
    // Handle R2 asset proxy
    if (url.pathname.startsWith('/assets/')) {
      const assetPath = url.pathname.replace('/assets/', '');
      const object = await env.ASSETS.get(assetPath);
      
      if (object === null) {
        return new Response('Asset not found', { status: 404 });
      }
      
      return new Response(object.body, {
        headers: {
          'Content-Type': object.httpMetadata?.contentType || 'application/octet-stream',
          'Cache-Control': 'public, max-age=31536000, immutable'
        }
      });
    }
    
    // Default: serve static content
    return new Response('Static Games - Cloudflare Worker', {
      headers: { 'Content-Type': 'text/html' }
    });
  }
};