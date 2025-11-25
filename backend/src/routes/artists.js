import express from 'express';
import { supabase } from '../config/supabase.js';

const router = express.Router();

// GET all artists with stats
router.get('/', async (req, res) => {
  try {
    const { search, genre, limit = 50, offset = 0, include_albums = 'false' } = req.query;

    // 根据 include_albums 参数决定是否包含专辑详情
    const selectQuery = include_albums === 'true' 
      ? `
        *,
        albums:albums(id, title, cover_url, release_date),
        songs:songs(count)
      `
      : `
        *,
        albums:albums(count),
        songs:songs(count)
      `;

    let query = supabase
      .from('artists')
      .select(selectQuery)
      .order('name', { ascending: true });

    // Search filter
    if (search) {
      query = query.ilike('name', `%${search}%`);
    }

    // Genre filter (using array contains)
    if (genre) {
      query = query.contains('genres', [genre]);
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
    console.error('Error fetching artists:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET single artist with full details
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    // Get artist info
    const { data: artist, error: artistError } = await supabase
      .from('artists')
      .select('*')
      .eq('id', id)
      .single();

    if (artistError) throw artistError;

    if (!artist) {
      return res.status(404).json({
        success: false,
        error: 'Artist not found'
      });
    }

    // Get albums
    const { data: albums, error: albumsError } = await supabase
      .from('albums')
      .select('*')
      .eq('artist_id', id)
      .order('release_date', { ascending: false });

    if (albumsError) throw albumsError;

    // Get top songs
    const { data: topSongs, error: songsError } = await supabase
      .from('songs')
      .select('*')
      .eq('artist_id', id)
      .order('plays', { ascending: false })
      .limit(10);

    if (songsError) throw songsError;

    res.json({
      success: true,
      data: {
        ...artist,
        albums: albums || [],
        top_songs: topSongs || []
      }
    });
  } catch (error) {
    console.error('Error fetching artist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET artist's albums
router.get('/:id/albums', async (req, res) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('albums')
      .select('*')
      .eq('artist_id', id)
      .order('release_date', { ascending: false });

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching artist albums:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// GET artist's songs
router.get('/:id/songs', async (req, res) => {
  try {
    const { id } = req.params;
    const { limit = 50 } = req.query;

    const { data, error } = await supabase
      .from('songs')
      .select(`
        *,
        album:albums(id, title, cover_url)
      `)
      .eq('artist_id', id)
      .order('plays', { ascending: false })
      .limit(parseInt(limit));

    if (error) throw error;

    res.json({
      success: true,
      count: data.length,
      data
    });
  } catch (error) {
    console.error('Error fetching artist songs:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// POST create new artist
router.post('/', async (req, res) => {
  try {
    const { name, bio, avatar_url, genres, country, website_url, social_links } = req.body;

    if (!name) {
      return res.status(400).json({
        success: false,
        error: 'Artist name is required'
      });
    }

    const { data, error } = await supabase
      .from('artists')
      .insert([
        {
          name,
          bio,
          avatar_url,
          genres,
          country,
          website_url,
          social_links
        }
      ])
      .select();

    if (error) throw error;

    res.status(201).json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error creating artist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// PUT update artist
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { name, bio, avatar_url, genres, country, website_url, social_links } = req.body;

    const updateData = {};
    if (name !== undefined) updateData.name = name;
    if (bio !== undefined) updateData.bio = bio;
    if (avatar_url !== undefined) updateData.avatar_url = avatar_url;
    if (genres !== undefined) updateData.genres = genres;
    if (country !== undefined) updateData.country = country;
    if (website_url !== undefined) updateData.website_url = website_url;
    if (social_links !== undefined) updateData.social_links = social_links;

    const { data, error } = await supabase
      .from('artists')
      .update(updateData)
      .eq('id', id)
      .select();

    if (error) throw error;

    if (!data || data.length === 0) {
      return res.status(404).json({
        success: false,
        error: 'Artist not found'
      });
    }

    res.json({
      success: true,
      data: data[0]
    });
  } catch (error) {
    console.error('Error updating artist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// DELETE artist
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('artists')
      .delete()
      .eq('id', id);

    if (error) throw error;

    res.json({
      success: true,
      message: 'Artist deleted successfully'
    });
  } catch (error) {
    console.error('Error deleting artist:', error);
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

export default router;
