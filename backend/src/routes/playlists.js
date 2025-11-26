import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// GET all playlists
router.get('/', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('playlists')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching playlists:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET single playlist with songs
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('playlists')
      .select(`
        *,
        playlist_songs (
          song_id,
          position,
          added_at,
          songs (
            *,
            artist:artists(id, name, avatar_url),
            album:albums(id, title, cover_url)
          )
        )
      `)
      .eq('id', id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({
        success: false,
        error: 'Playlist not found'
      });
    }

    res.json({
      success: true,
      data
    });
  } catch (error) {
    console.error('Error fetching playlist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST create new playlist
router.post('/', async (req, res) => {
  try {
    const { name, description, cover_url } = req.body;

    const { data, error } = await supabase
      .from('playlists')
      .insert([
        {
          name,
          description,
          cover_url
        }
      ])
      .select();

    if (error) throw error;

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error creating playlist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST add song to playlist
router.post('/:id/songs', async (req, res) => {
  try {
    const { id } = req.params;
    const { song_id, position } = req.body;

    const { data, error } = await supabase
      .from('playlist_songs')
      .insert([
        {
          playlist_id: id,
          song_id,
          position: position || 0
        }
      ])
      .select();

    if (error) throw error;

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error adding song to playlist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE song from playlist
router.delete('/:id/songs/:song_id', async (req, res) => {
  try {
    const { id, song_id } = req.params;

    const { error } = await supabase
      .from('playlist_songs')
      .delete()
      .eq('playlist_id', id)
      .eq('song_id', song_id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Song removed from playlist successfully'
    });
  } catch (error) {
    console.error('Error removing song from playlist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE playlist
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('playlists')
      .delete()
      .eq('id', id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Playlist deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting playlist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;
