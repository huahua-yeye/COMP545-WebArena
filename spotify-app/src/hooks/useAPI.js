// Custom hooks for API calls and state management
import { useState, useEffect } from 'react';

/**
 * Generic API hook
 * @param {Function} apiFunction - API call function
 * @param {Array} dependencies - dependencies that trigger re-fetch
 * @param {boolean} immediate - whether to fetch immediately
 */
export function useAPI(apiFunction, dependencies = [], immediate = true) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const execute = async (...args) => {
    try {
      setLoading(true);
      setError(null);
      const result = await apiFunction(...args);
      setData(result);
      return result;
    } catch (err) {
      setError(err.message);
      console.error('API Error:', err);
      return null;
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (immediate) {
      execute();
    }
  }, dependencies);

  return { data, loading, error, execute, setData };
}

/**
 * Hook to fetch all songs
 */
export function useSongs() {
  return useAPI(
    async () => {
      const { getAllSongs, transformSongData } = await import('../services/api.js');
      const songs = await getAllSongs();
      return songs.map(transformSongData);
    },
    [],
    true
  );
}

/**
 * Hook to fetch all playlists
 */
export function usePlaylists() {
  return useAPI(
    async () => {
      const { getAllPlaylists, transformPlaylistData } = await import('../services/api.js');
      const playlists = await getAllPlaylists();
      return playlists.map(transformPlaylistData);
    },
    [],
    true
  );
}

/**
 * Hook to fetch all artists
 */
export function useArtists(params = {}) {
  return useAPI(
    async () => {
      const { getAllArtists } = await import('../services/api.js');
      return await getAllArtists(params);
    },
    [JSON.stringify(params)],
    true
  );
}

/**
 * Hook to fetch all albums
 */
export function useAlbums(params = {}) {
  return useAPI(
    async () => {
      const { getAllAlbums } = await import('../services/api.js');
      return await getAllAlbums(params);
    },
    [JSON.stringify(params)],
    true
  );
}

/**
 * Hook to fetch artist details
 */
export function useArtistDetails(artistId) {
  return useAPI(
    async () => {
      if (!artistId) return null;
      const { getArtistById } = await import('../services/api.js');
      return await getArtistById(artistId);
    },
    [artistId],
    !!artistId
  );
}

/**
 * Hook to fetch album details
 */
export function useAlbumDetails(albumId) {
  return useAPI(
    async () => {
      if (!albumId) return null;
      const { getAlbumById } = await import('../services/api.js');
      return await getAlbumById(albumId);
    },
    [albumId],
    !!albumId
  );
}
