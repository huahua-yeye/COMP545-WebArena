import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// GET all albums
router.get('/', async (req, res) => {
  try {
    const { search, genre, artist_id, limit = 50, offset = 0, sort = 'release_date' } = req.query;

    let query = supabase
      .from('albums')
      .select(`
        *,
        artist:artists(id, name, avatar_url)
      `)
      .order(sort, { ascending: sort === 'title' });

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
    console.error('Error fetching albums:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET single album with tracks
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Get album info
    const { data: album, error: albumError } = await supabase
      .from('albums')
      .select(`
        *,
        artist:artists(id, name, avatar_url, country)
      `)
      .eq('id', id)
      .single();

    if (albumError) throw albumError;

    if (!album) {
      return res.status(404).json({
        success: false,
        error: 'Album not found'
      });
    }

    // Get tracks
    const { data: tracks, error: tracksError } = await supabase
      .from('songs')
      .select('*')
      .eq('album_id', id)
      .order('track_number', { ascending: true });

    if (tracksError) throw tracksError;

    res.json({
      success: true,
      data: {
        ...album,
        tracks: tracks || []
      }
    });
  } catch (error) {
    console.error('Error fetching album:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET album tracks
router.get('/:id/tracks', async (req, res) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('songs')
      .select('*')
      .eq('album_id', id)
      .order('track_number', { ascending: true });

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching album tracks:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET new releases (recent albums)
router.get('/browse/new-releases', async (req, res) => {
  try {
    const { limit = 20 } = req.query;

    const { data, error } = await supabase
      .from('albums')
      .select(`
        *,
        artist:artists(id, name, avatar_url)
      `)
      .order('release_date', { ascending: false })
      .limit(parseInt(limit));

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching new releases:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST create new album
router.post('/', async (req, res) => {
  try {
    const {
      title,
      artist_id,
      cover_url,
      release_date,
      genre,
      description,
      label,
      license,
      attribution,
      source_url,
      requires_attribution
    } = req.body;

    if (!title || !artist_id) {
      return res.status(400).json({
        success: false,
        error: 'Title and artist_id are required'
      });
    }

    const { data, error } = await supabase
      .from('albums')
      .insert([
        {
          title,
          artist_id,
          cover_url,
          release_date,
          genre,
          description,
          label,
          license,
          attribution,
          source_url,
          requires_attribution
        }
      ])
      .select(`
        *,
        artist:artists(id, name, avatar_url)
      `);

    if (error) throw error;

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error creating album:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// PUT update album
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const {
      title,
      cover_url,
      release_date,
      genre,
      description,
      label,
      license,
      attribution,
      source_url,
      requires_attribution
    } = req.body;

    const updateData = {};
    if (title !== undefined) updateData.title = title;
    if (cover_url !== undefined) updateData.cover_url = cover_url;
    if (release_date !== undefined) updateData.release_date = release_date;
    if (genre !== undefined) updateData.genre = genre;
    if (description !== undefined) updateData.description = description;
    if (label !== undefined) updateData.label = label;
    if (license !== undefined) updateData.license = license;
    if (attribution !== undefined) updateData.attribution = attribution;
    if (source_url !== undefined) updateData.source_url = source_url;
    if (requires_attribution !== undefined) updateData.requires_attribution = requires_attribution;

    const { data, error } = await supabase
      .from('albums')
      .update(updateData)
      .eq('id', id)
      .select(`
        *,
        artist:artists(id, name, avatar_url)
      `);

    if (error) throw error;

    if (!data || data.length === 0) {
      return res.status(404).json({
        success: false,
        error: 'Album not found'
      });
    }

    res.json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error updating album:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE album
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('albums')
      .delete()
      .eq('id', id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Album deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting album:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;
