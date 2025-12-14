import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// GET all favorites for a user
router.get('/', async (req, res) => {
  try {
    const { user_id = 'guest' } = req.query;

    const { data, error } = await supabase
      .from('user_favorites')
      .select(`
        id,
        song_id,
        created_at,
        songs (
          *,
          artist:artists(id, name, avatar_url),
          album:albums(id, title, cover_url)
        )
      `)
      .eq('user_id', user_id)
      .order('created_at', { ascending: false });

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching favorites:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST add song to favorites
router.post('/', async (req, res) => {
  try {
    const { song_id, user_id = 'guest' } = req.body;

    if (!song_id) {
      return res.status(400).json({
        success: false,
        error: 'song_id is required'
      });
    }

    const { data, error } = await supabase
      .from('user_favorites')
      .insert([
        {
          song_id,
          user_id
        }
      ])
      .select();

    if (error) {
      // Check if it's a duplicate entry
      if (error.code === '23505') {
        return res.status(200).json({
          success: true,
          message: 'Song already in favorites',
          data: null
        });
      }
      throw error;
    }

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error adding to favorites:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE remove song from favorites
router.delete('/:song_id', async (req, res) => {
  try {
    const { song_id } = req.params;
    const { user_id = 'guest' } = req.query;

    const { error } = await supabase
      .from('user_favorites')
      .delete()
      .eq('song_id', song_id)
      .eq('user_id', user_id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Song removed from favorites successfully'
    });
  } catch (error) {
    console.error('Error removing from favorites:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST check if song is favorited
router.post('/check', async (req, res) => {
  try {
    const { song_id, user_id = 'guest' } = req.body;

    if (!song_id) {
      return res.status(400).json({
        success: false,
        error: 'song_id is required'
      });
    }

    const { data, error } = await supabase
      .from('user_favorites')
      .select('id')
      .eq('song_id', song_id)
      .eq('user_id', user_id)
      .single();

    if (error && error.code !== 'PGRST116') { // PGRST116 = no rows returned
      throw error;
    }

    res.json({
      success: true,
      is_favorited: !!data
    });
  } catch (error) {
    console.error('Error checking favorite:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;






