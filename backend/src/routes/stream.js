import express from 'express';
import http from 'http';
import https from 'https';

const router = express.Router();
const MAX_REDIRECTS = 3;

function proxyStream(targetUrl, req, res, redirectsLeft = MAX_REDIRECTS) {
  const client = targetUrl.startsWith('https://') ? https : http;
  const headers = {
    accept: req.headers.accept || '*/*'
  };

  if (req.headers.range) {
    headers.range = req.headers.range;
  }
  if (req.headers['user-agent']) {
    headers['user-agent'] = req.headers['user-agent'];
  }

  const upstream = client.get(targetUrl, { headers }, (upstreamRes) => {
    const status = upstreamRes.statusCode || 0;
    const location = upstreamRes.headers.location;

    if ([301, 302, 303, 307, 308].includes(status) && location && redirectsLeft > 0) {
      const nextUrl = new URL(location, targetUrl).toString();
      upstreamRes.resume();
      return proxyStream(nextUrl, req, res, redirectsLeft - 1);
    }

    if (status >= 400) {
      upstreamRes.resume();
      return res.status(status).json({
        error: 'Upstream error',
        status
      });
    }

    res.status(status || 200);
    const passthroughHeaders = [
      'content-type',
      'content-length',
      'accept-ranges',
      'content-range',
      'cache-control',
      'etag',
      'last-modified'
    ];

    passthroughHeaders.forEach((key) => {
      const value = upstreamRes.headers[key];
      if (value) res.setHeader(key, value);
    });

    upstreamRes.pipe(res);
  });

  upstream.on('error', (error) => {
    res.status(502).json({
      error: 'Upstream request failed',
      message: error.message
    });
  });
}

router.get('/', (req, res) => {
  const { url } = req.query;
  if (!url || typeof url !== 'string') {
    return res.status(400).json({ error: 'Missing url query parameter' });
  }

  let parsed;
  try {
    parsed = new URL(url);
  } catch {
    return res.status(400).json({ error: 'Invalid url' });
  }

  if (parsed.protocol !== 'http:' && parsed.protocol !== 'https:') {
    return res.status(400).json({ error: 'Only http/https URLs are allowed' });
  }

  return proxyStream(parsed.toString(), req, res);
});

export default router;
