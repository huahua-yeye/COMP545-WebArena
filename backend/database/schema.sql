-- ============================================
-- acidwave Clone Database Schema v2.0
-- ============================================
-- Run this file in Supabase SQL Editor
-- This will create all tables, indexes, triggers, and functions

-- Clean up (uncomment if you want to reset the database)
-- DROP TABLE IF EXISTS playlist_songs CASCADE;
-- DROP TABLE IF EXISTS playlists CASCADE;
-- DROP TABLE IF EXISTS songs CASCADE;
-- DROP TABLE IF EXISTS albums CASCADE;
-- DROP TABLE IF EXISTS artists CASCADE;

-- ============================================
-- TABLE: artists
-- ============================================
CREATE TABLE IF NOT EXISTS artists (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  bio TEXT,
  avatar_url TEXT,
  genres VARCHAR(255)[],
  country VARCHAR(100),
  website_url TEXT,
  social_links JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

COMMENT ON TABLE artists IS 'Stores artist/musician information';
COMMENT ON COLUMN artists.genres IS 'Array of music genres';
COMMENT ON COLUMN artists.social_links IS 'JSON object with social media links';

-- ============================================
-- TABLE: albums
-- ============================================
CREATE TABLE IF NOT EXISTS albums (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist_id UUID NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
  cover_url TEXT,
  release_date DATE,
  genre VARCHAR(100),
  description TEXT,
  total_tracks INTEGER DEFAULT 0,
  duration INTEGER DEFAULT 0,
  label VARCHAR(255),
  license VARCHAR(100),
  attribution TEXT,
  source_url TEXT,
  requires_attribution BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(title, artist_id)
);

COMMENT ON TABLE albums IS 'Stores album information';
COMMENT ON COLUMN albums.duration IS 'Total duration in seconds (auto-calculated)';
COMMENT ON COLUMN albums.total_tracks IS 'Total number of tracks (auto-calculated)';

-- ============================================
-- TABLE: songs
-- ============================================
CREATE TABLE IF NOT EXISTS songs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist_id UUID NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
  album_id UUID REFERENCES albums(id) ON DELETE SET NULL,
  track_number INTEGER,
  duration INTEGER NOT NULL,
  url TEXT NOT NULL,
  cover_url TEXT,
  genre VARCHAR(100),
  release_date DATE,
  lyrics TEXT,
  plays INTEGER DEFAULT 0,
  likes INTEGER DEFAULT 0,
  external_id VARCHAR(255),
  license VARCHAR(100),
  attribution TEXT,
  source_url TEXT,
  requires_attribution BOOLEAN DEFAULT false,
  is_explicit BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(title, artist_id, album_id)
);

COMMENT ON TABLE songs IS 'Stores individual song/track information';
COMMENT ON COLUMN songs.duration IS 'Duration in seconds';
COMMENT ON COLUMN songs.url IS 'URL to the audio file';
COMMENT ON COLUMN songs.album_id IS 'Can be NULL for singles not part of an album';

-- ============================================
-- TABLE: playlists
-- ============================================
CREATE TABLE IF NOT EXISTS playlists (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  cover_url TEXT,
  is_public BOOLEAN DEFAULT true,
  total_tracks INTEGER DEFAULT 0,
  total_duration INTEGER DEFAULT 0,
  plays INTEGER DEFAULT 0,
  likes INTEGER DEFAULT 0,
  license VARCHAR(100),
  attribution TEXT,
  source_url TEXT,
  requires_attribution BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

COMMENT ON TABLE playlists IS 'User-created or curated playlists';
COMMENT ON COLUMN playlists.total_duration IS 'Total duration in seconds (auto-calculated)';

-- ============================================
-- TABLE: playlist_songs
-- ============================================
CREATE TABLE IF NOT EXISTS playlist_songs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  playlist_id UUID NOT NULL REFERENCES playlists(id) ON DELETE CASCADE,
  song_id UUID NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  position INTEGER DEFAULT 0,
  added_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(playlist_id, song_id)
);

COMMENT ON TABLE playlist_songs IS 'Junction table for playlist-song many-to-many relationship';
COMMENT ON COLUMN playlist_songs.position IS 'Order of the song in the playlist';

-- ============================================
-- INDEXES
-- ============================================

-- Artists indexes
CREATE INDEX IF NOT EXISTS idx_artists_name ON artists(name);
CREATE INDEX IF NOT EXISTS idx_artists_genres ON artists USING GIN(genres);
CREATE INDEX IF NOT EXISTS idx_artists_country ON artists(country);

-- Albums indexes
CREATE INDEX IF NOT EXISTS idx_albums_artist_id ON albums(artist_id);
CREATE INDEX IF NOT EXISTS idx_albums_title ON albums(title);
CREATE INDEX IF NOT EXISTS idx_albums_release_date ON albums(release_date DESC);
CREATE INDEX IF NOT EXISTS idx_albums_genre ON albums(genre);
CREATE INDEX IF NOT EXISTS idx_albums_requires_attribution ON albums(requires_attribution);

-- Songs indexes
CREATE INDEX IF NOT EXISTS idx_songs_artist_id ON songs(artist_id);
CREATE INDEX IF NOT EXISTS idx_songs_album_id ON songs(album_id);
CREATE INDEX IF NOT EXISTS idx_songs_title ON songs(title);
CREATE INDEX IF NOT EXISTS idx_songs_genre ON songs(genre);
CREATE INDEX IF NOT EXISTS idx_songs_release_date ON songs(release_date DESC);
CREATE INDEX IF NOT EXISTS idx_songs_plays ON songs(plays DESC);
CREATE INDEX IF NOT EXISTS idx_songs_likes ON songs(likes DESC);
CREATE INDEX IF NOT EXISTS idx_songs_created_at ON songs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_songs_requires_attribution ON songs(requires_attribution);

-- Playlists indexes
CREATE INDEX IF NOT EXISTS idx_playlists_name ON playlists(name);
CREATE INDEX IF NOT EXISTS idx_playlists_created_at ON playlists(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_playlists_is_public ON playlists(is_public);
CREATE INDEX IF NOT EXISTS idx_playlists_plays ON playlists(plays DESC);
CREATE INDEX IF NOT EXISTS idx_playlists_likes ON playlists(likes DESC);

-- Playlist Songs indexes
CREATE INDEX IF NOT EXISTS idx_playlist_songs_playlist_id ON playlist_songs(playlist_id);
CREATE INDEX IF NOT EXISTS idx_playlist_songs_song_id ON playlist_songs(song_id);
CREATE INDEX IF NOT EXISTS idx_playlist_songs_position ON playlist_songs(position);

-- ============================================
-- FUNCTIONS
-- ============================================

-- Function: Update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Function: Update album statistics
CREATE OR REPLACE FUNCTION update_album_stats()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE albums
  SET
    total_tracks = (SELECT COUNT(*) FROM songs WHERE album_id = albums.id),
    duration = (SELECT COALESCE(SUM(duration), 0) FROM songs WHERE album_id = albums.id)
  WHERE id = COALESCE(NEW.album_id, OLD.album_id);

  RETURN NEW;
END;
$$ language 'plpgsql';

-- Function: Update playlist statistics
CREATE OR REPLACE FUNCTION update_playlist_stats()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE playlists
  SET
    total_tracks = (SELECT COUNT(*) FROM playlist_songs WHERE playlist_id = playlists.id),
    total_duration = (
      SELECT COALESCE(SUM(s.duration), 0)
      FROM playlist_songs ps
      JOIN songs s ON ps.song_id = s.id
      WHERE ps.playlist_id = playlists.id
    )
  WHERE id = COALESCE(NEW.playlist_id, OLD.playlist_id);

  RETURN NEW;
END;
$$ language 'plpgsql';

-- ============================================
-- TRIGGERS
-- ============================================

-- Artists triggers
DROP TRIGGER IF EXISTS update_artists_updated_at ON artists;
CREATE TRIGGER update_artists_updated_at
  BEFORE UPDATE ON artists
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Albums triggers
DROP TRIGGER IF EXISTS update_albums_updated_at ON albums;
CREATE TRIGGER update_albums_updated_at
  BEFORE UPDATE ON albums
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_album_stats_on_song_change ON songs;
CREATE TRIGGER update_album_stats_on_song_change
  AFTER INSERT OR UPDATE OR DELETE ON songs
  FOR EACH ROW
  EXECUTE FUNCTION update_album_stats();

-- Songs triggers
DROP TRIGGER IF EXISTS update_songs_updated_at ON songs;
CREATE TRIGGER update_songs_updated_at
  BEFORE UPDATE ON songs
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Playlists triggers
DROP TRIGGER IF EXISTS update_playlists_updated_at ON playlists;
CREATE TRIGGER update_playlists_updated_at
  BEFORE UPDATE ON playlists
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_playlist_stats_on_song_change ON playlist_songs;
CREATE TRIGGER update_playlist_stats_on_song_change
  AFTER INSERT OR UPDATE OR DELETE ON playlist_songs
  FOR EACH ROW
  EXECUTE FUNCTION update_playlist_stats();

-- ============================================
-- ROW LEVEL SECURITY (Optional - Uncomment to enable)
-- ============================================
-- ALTER TABLE artists ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE albums ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE songs ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE playlists ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE playlist_songs ENABLE ROW LEVEL SECURITY;

-- Public read access policies
-- CREATE POLICY "Artists are viewable by everyone" ON artists FOR SELECT USING (true);
-- CREATE POLICY "Albums are viewable by everyone" ON albums FOR SELECT USING (true);
-- CREATE POLICY "Songs are viewable by everyone" ON songs FOR SELECT USING (true);
-- CREATE POLICY "Public playlists are viewable by everyone" ON playlists FOR SELECT USING (is_public = true);

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these to verify the schema was created correctly

-- SELECT 'Artists' as table_name, COUNT(*) as count FROM artists
-- UNION ALL
-- SELECT 'Albums', COUNT(*) FROM albums
-- UNION ALL
-- SELECT 'Songs', COUNT(*) FROM songs
-- UNION ALL
-- SELECT 'Playlists', COUNT(*) FROM playlists;
