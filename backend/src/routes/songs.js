import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// GET all songs with artist and album info
router.get('/', async (req, res) => {
  try {
    const {
      search,
      genre,
      artist_id,
      album_id,
      limit = 50,
      offset = 0,
      sort = 'created_at'
    } = req.query;

    let query = supabase
      .from('songs')
      .select(`
        *,
        artist:artists(id, name, avatar_url),
        album:albums(id, title, cover_url)
      `)
      .order(sort, { ascending: sort === 'title' ? true : false });

    // Search filter
    if (search) {
      query = query.ilike('title', `%${search}%`);
    }

    // Genre filter
    if (genre) {
      query = query.eq('genre', genre);
    }

    // Artist filter
    if (artist_id) {
      query = query.eq('artist_id', artist_id);
    }

    // Album filter
    if (album_id) {
      query = query.eq('album_id', album_id);
    }

    // Pagination
    query = query.range(parseInt(offset), parseInt(offset) + parseInt(limit) - 1);

    const { data, error, count } = await query;

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      total: count,
      data
    });
  } catch (error) {
    console.error('Error fetching songs:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET single song by ID with full details
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('songs')
      .select(`
        *,
        artist:artists(id, name, avatar_url, country),
        album:albums(id, title, cover_url, release_date)
      `)
      .eq('id', id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({
        success: false,
        error: 'Song not found'
      });
    }

    res.json({
      success: true,
      data
    });
  } catch (error) {
    console.error('Error fetching song:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST create new song
router.post('/', async (req, res) => {
  try {
    const {
      title,
      artist_id,
      album_id,
      track_number,
      duration,
      url,
      cover_url,
      genre,
      release_date,
      lyrics,
      license,
      attribution,
      source_url,
      requires_attribution,
      is_explicit
    } = req.body;

    if (!title || !artist_id || !duration || !url) {
      return res.status(400).json({
        success: false,
        error: 'Title, artist_id, duration, and url are required'
      });
    }

    const { data, error } = await supabase
      .from('songs')
      .insert([
        {
          title,
          artist_id,
          album_id,
          track_number,
          duration,
          url,
          cover_url,
          genre,
          release_date,
          lyrics,
          license,
          attribution,
          source_url,
          requires_attribution,
          is_explicit
        }
      ])
      .select(`
        *,
        artist:artists(id, name, avatar_url),
        album:albums(id, title, cover_url)
      `);

    if (error) throw error;

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error creating song:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// PUT update song
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const {
      title,
      album_id,
      track_number,
      duration,
      url,
      cover_url,
      genre,
      release_date,
      lyrics,
      plays,
      likes,
      license,
      attribution,
      source_url,
      requires_attribution,
      is_explicit
    } = req.body;

    const updateData = {};
    if (title !== undefined) updateData.title = title;
    if (album_id !== undefined) updateData.album_id = album_id;
    if (track_number !== undefined) updateData.track_number = track_number;
    if (duration !== undefined) updateData.duration = duration;
    if (url !== undefined) updateData.url = url;
    if (cover_url !== undefined) updateData.cover_url = cover_url;
    if (genre !== undefined) updateData.genre = genre;
    if (release_date !== undefined) updateData.release_date = release_date;
    if (lyrics !== undefined) updateData.lyrics = lyrics;
    if (plays !== undefined) updateData.plays = plays;
    if (likes !== undefined) updateData.likes = likes;
    if (license !== undefined) updateData.license = license;
    if (attribution !== undefined) updateData.attribution = attribution;
    if (source_url !== undefined) updateData.source_url = source_url;
    if (requires_attribution !== undefined) updateData.requires_attribution = requires_attribution;
    if (is_explicit !== undefined) updateData.is_explicit = is_explicit;

    const { data, error } = await supabase
      .from('songs')
      .update(updateData)
      .eq('id', id)
      .select(`
        *,
        artist:artists(id, name, avatar_url),
        album:albums(id, title, cover_url)
      `);

    if (error) throw error;

    if (!data || data.length === 0) {
      return res.status(404).json({
        success: false,
        error: 'Song not found'
      });
    }

    res.json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error updating song:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE song
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('songs')
      .delete()
      .eq('id', id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Song deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting song:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;
