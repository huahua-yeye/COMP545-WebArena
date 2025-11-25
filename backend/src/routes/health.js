import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// Health check endpoint
router.get('/', async (req, res) => {
  try {
    // Test database connection by checking songs table
    const { error, count } = await supabase
      .from('songs')
      .select('*', { count: 'exact', head: true });

    const isDbHealthy = !error || error.code === 'PGRST204';
    const tablesExist = !error;

    res.json({
      status: 'ok',
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
      database: {
        connected: isDbHealthy,
        tables_exist: tablesExist,
        songs_count: count || 0
      }
    });
  } catch (error) {
    res.status(503).json({
      status: 'error',
      message: 'Service unavailable',
      database: {
        connected: false,
        error: error.message
      }
    });
  }
});

export default router;
