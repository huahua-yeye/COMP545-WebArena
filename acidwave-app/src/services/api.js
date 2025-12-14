// API service layer for backend integration

// API base URL - switches by environment
// In development, use '/api' to go through Vite proxy
// In production, use environment variable or default
const isDevelopment = import.meta.env.DEV;
const API_BASE_URL = isDevelopment
  ? '/api'  // Use Vite proxy in development
  : (import.meta.env.VITE_API_URL || 'http://localhost:3000/api');

console.log('🔗 API URL:', API_BASE_URL, '(dev mode:', isDevelopment, ')'); // 调试用

// 导出配置
export const API_CONFIG = {
  baseURL: API_BASE_URL
};

// 你的 API 方法...
/**
 * Generic fetch wrapper
 */
async function fetchAPI(endpoint, options = {}) {
  try {
    const response = await fetch(`${API_BASE_URL}${endpoint}`, {
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      ...options,
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    return data;
  } catch (error) {
    console.error(`API Error (${endpoint}):`, error);
    throw error;
  }
}

// ==================== Song APIs ====================

/**
 * Get all songs
 */
export async function getAllSongs() {
  const response = await fetchAPI('/songs');
  return response.data || [];
}

/**
 * Get single song
 */
export async function getSongById(id) {
  const response = await fetchAPI(`/songs/${id}`);
  return response.data;
}

/**
 * Create new song
 */
export async function createSong(songData) {
  const response = await fetchAPI('/songs', {
    method: 'POST',
    body: JSON.stringify(songData),
  });
  return response.data;
}

/**
 * Update song
 */
export async function updateSong(id, songData) {
  const response = await fetchAPI(`/songs/${id}`, {
    method: 'PUT',
    body: JSON.stringify(songData),
  });
  return response.data;
}

/**
 * Delete song
 */
export async function deleteSong(id) {
  await fetchAPI(`/songs/${id}`, {
    method: 'DELETE',
  });
}

// ==================== Artist APIs ====================

/**
 * Get all artists
 */
export async function getAllArtists(params = {}) {
  const queryString = new URLSearchParams(params).toString();
  const response = await fetchAPI(`/artists${queryString ? `?${queryString}` : ''}`);
  return response.data || [];
}

/**
 * Get single artist
 */
export async function getArtistById(id) {
  const response = await fetchAPI(`/artists/${id}`);
  return response.data;
}

/**
 * Get artist albums
 */
export async function getArtistAlbums(id) {
  const response = await fetchAPI(`/artists/${id}/albums`);
  return response.data || [];
}

/**
 * Get artist songs
 */
export async function getArtistSongs(id) {
  const response = await fetchAPI(`/artists/${id}/songs`);
  return response.data || [];
}

// ==================== Album APIs ====================

/**
 * Get all albums
 */
export async function getAllAlbums(params = {}) {
  const queryString = new URLSearchParams(params).toString();
  const response = await fetchAPI(`/albums${queryString ? `?${queryString}` : ''}`);
  return response.data || [];
}

/**
 * Get single album
 */
export async function getAlbumById(id) {
  const response = await fetchAPI(`/albums/${id}`);
  return response.data;
}

/**
 * Get album tracks
 */
export async function getAlbumTracks(id) {
  const response = await fetchAPI(`/albums/${id}/tracks`);
  return response.data || [];
}

/**
 * Get new releases
 */
export async function getNewReleases(limit = 20) {
  const response = await fetchAPI(`/albums/browse/new-releases?limit=${limit}`);
  return response.data || [];
}

// ==================== Playlist APIs ====================

/**
 * Get all playlists
 */
export async function getAllPlaylists() {
  const response = await fetchAPI('/playlists');
  return response.data || [];
}

/**
 * Get playlist detail (with songs)
 */
export async function getPlaylistById(id) {
  const response = await fetchAPI(`/playlists/${id}`);
  return response.data;
}

/**
 * Create playlist
 */
export async function createPlaylist(playlistData) {
  const response = await fetchAPI('/playlists', {
    method: 'POST',
    body: JSON.stringify(playlistData),
  });
  return response.data;
}

/**
 * Add song to playlist
 */
export async function addSongToPlaylist(playlistId, songId, position = 0) {
  const response = await fetchAPI(`/playlists/${playlistId}/songs`, {
    method: 'POST',
    body: JSON.stringify({ song_id: songId, position }),
  });
  return response.data;
}

/**
 * Delete playlist
 */
export async function deletePlaylist(id) {
  await fetchAPI(`/playlists/${id}`, {
    method: 'DELETE',
  });
}

/**
 * Remove song from playlist
 */
export async function removeSongFromPlaylist(playlistId, songId) {
  await fetchAPI(`/playlists/${playlistId}/songs/${songId}`, {
    method: 'DELETE',
  });
}

// ==================== Favorites APIs ====================

/**
 * Get all favorite songs for a user
 */
export async function getUserFavorites(userId = 'guest') {
  const response = await fetchAPI(`/favorites?user_id=${userId}`);
  return response.data || [];
}

/**
 * Add song to favorites
 */
export async function addToFavorites(songId, userId = 'guest') {
  const response = await fetchAPI('/favorites', {
    method: 'POST',
    body: JSON.stringify({ song_id: songId, user_id: userId }),
  });
  return response.data;
}

/**
 * Remove song from favorites
 */
export async function removeFromFavorites(songId, userId = 'guest') {
  await fetchAPI(`/favorites/${songId}?user_id=${userId}`, {
    method: 'DELETE',
  });
}

/**
 * Check if song is favorited
 */
export async function checkFavorite(songId, userId = 'guest') {
  const response = await fetchAPI('/favorites/check', {
    method: 'POST',
    body: JSON.stringify({ song_id: songId, user_id: userId }),
  });
  return response.is_favorited;
}

// ==================== Health check API ====================

/**
 * Check API health
 */
export async function checkHealth() {
  const response = await fetchAPI('/health');
  return response;
}

// ==================== Data transformers ====================

/**
 * Transform backend song data into frontend shape
 * Supports the new albums schema where artist/album are objects
 */
export function transformSongData(backendSong) {
  // Handle artist info (object or string)
  const artistName = backendSong.artist?.name || backendSong.artist || 'UNKNOWN';
  const artistAvatar = backendSong.artist?.avatar_url;

  // Handle album info (object, string, or null)
  const albumTitle = backendSong.album?.title || backendSong.album || 'SINGLE';
  const albumCover = backendSong.album?.cover_url;

  // Cover priority: song cover > album cover > default
  const coverUrl = backendSong.cover_url || albumCover || artistAvatar || 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop';

  // Extract year from release_date
  const year = backendSong.release_date
    ? new Date(backendSong.release_date).getFullYear()
    : backendSong.year || new Date().getFullYear();

  return {
    id: backendSong.id,
    title: backendSong.title.toUpperCase(),
    artist: artistName.toUpperCase(),
    artistData: backendSong.artist, // keep full artist object
    album: albumTitle.toUpperCase(),
    albumData: backendSong.album, // keep full album object
    cover: coverUrl,
    duration: backendSong.duration || 0,
    url: backendSong.url,
    genre: backendSong.genre?.toUpperCase() || 'UNKNOWN',
    year: year,
    plays: backendSong.plays || 0,
    likes: backendSong.likes || 0,
    quality: 'MP3 320', // default quality
    rating: Math.min(5, Math.floor((backendSong.plays || 0) / 5000) + 3), // rating based on plays
    accent: 'border-[#CCFF00]', // default accent
    // Additional fields
    track_number: backendSong.track_number,
    lyrics: backendSong.lyrics,
    requires_attribution: backendSong.requires_attribution,
    attribution: backendSong.attribution,
    license: backendSong.license,
  };
}

/**
 * Transform backend playlist data into frontend shape
 */
export function transformPlaylistData(backendPlaylist) {
  return {
    id: backendPlaylist.id,
    name: backendPlaylist.name.toUpperCase().replace(/ /g, '_'),
    description: backendPlaylist.description,
    cover_url: backendPlaylist.cover_url,
    is_public: backendPlaylist.is_public,
    total_tracks: backendPlaylist.total_tracks || 0,
    total_duration: backendPlaylist.total_duration || 0,
    songs: backendPlaylist.playlist_songs?.map(ps => transformSongData(ps.songs)) || [],
  };
}

// ==================== Export all APIs ====================

export default {
  // Songs
  getAllSongs,
  getSongById,
  createSong,
  updateSong,
  deleteSong,

  // Artists
  getAllArtists,
  getArtistById,
  getArtistAlbums,
  getArtistSongs,

  // Albums
  getAllAlbums,
  getAlbumById,
  getAlbumTracks,
  getNewReleases,

  // Playlists
  getAllPlaylists,
  getPlaylistById,
  createPlaylist,
  addSongToPlaylist,
  removeSongFromPlaylist,
  deletePlaylist,

  // Favorites
  getUserFavorites,
  addToFavorites,
  removeFromFavorites,
  checkFavorite,

  // Health
  checkHealth,

  // Transformers
  transformSongData,
  transformPlaylistData,
};
