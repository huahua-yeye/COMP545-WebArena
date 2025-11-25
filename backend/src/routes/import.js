import express from 'express';
import { supabase } from '../config/supabase.js';
import { fetchJamendoTracks } from '../services/jamendo.js';

const router = express.Router();

// 从 Jamendo 导入歌曲到数据库
router.post('/jamendo', async (req, res) => {
  try {
    const { limit = 20 } = req.body;

    console.log(`Fetching ${limit} tracks from Jamendo...`);
    const tracks = await fetchJamendoTracks(limit);

    if (tracks.length === 0) {
      return res.json({
        success: true,
        message: 'No tracks found',
        count: 0
      });
    }

    // 批量插入到数据库
    const { data, error } = await supabase
      .from('songs')
      .upsert(tracks, {
        onConflict: 'external_id',
        ignoreDuplicates: true
      })
      .select();

    if (error) {
      console.error('Database error:', error);
      throw error;
    }

    res.json({
      success: true,
      message: `Successfully imported ${data?.length || 0} tracks`,
      count: data?.length || 0,
      tracks: data
    });
  } catch (error) {
    console.error('Error importing from Jamendo:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;
