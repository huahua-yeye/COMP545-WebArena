-- Migration: Add Artists and Albums Tables
-- 从旧的 songs 表迁移到新的 artists + albums + songs 架构

-- 备份旧数据(可选)
-- CREATE TABLE songs_backup AS SELECT * FROM songs;

-- 1. 创建新表
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

CREATE TABLE IF NOT EXISTS albums (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist_id UUID REFERENCES artists(id) ON DELETE CASCADE,
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

-- 2. 从旧 songs 表提取所有唯一的艺术家
INSERT INTO artists (name, created_at)
SELECT DISTINCT artist, MIN(created_at)
FROM songs
WHERE artist IS NOT NULL AND artist != ''
GROUP BY artist
ON CONFLICT (name) DO NOTHING;

-- 3. 从旧 songs 表提取所有唯一的专辑
INSERT INTO albums (title, artist_id, genre, cover_url, created_at)
SELECT DISTINCT
  s.album,
  a.id,
  s.genre,
  s.cover_url,
  MIN(s.created_at)
FROM songs s
JOIN artists a ON s.artist = a.name
WHERE s.album IS NOT NULL AND s.album != ''
GROUP BY s.album, a.id, s.genre, s.cover_url
ON CONFLICT (title, artist_id) DO NOTHING;

-- 4. 添加新列到 songs 表
ALTER TABLE songs ADD COLUMN IF NOT EXISTS artist_id UUID REFERENCES artists(id) ON DELETE CASCADE;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS album_id UUID REFERENCES albums(id) ON DELETE SET NULL;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS track_number INTEGER;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS release_date DATE;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS lyrics TEXT;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS likes INTEGER DEFAULT 0;
ALTER TABLE songs ADD COLUMN IF NOT EXISTS is_explicit BOOLEAN DEFAULT false;

-- 5. 更新 songs 表的 artist_id
UPDATE songs s
SET artist_id = a.id
FROM artists a
WHERE s.artist = a.name;

-- 6. 更新 songs 表的 album_id
UPDATE songs s
SET album_id = alb.id
FROM albums alb
JOIN artists a ON alb.artist_id = a.id
WHERE s.album = alb.title AND s.artist = a.name;

-- 7. 删除旧的 artist 和 album 列 (可选,建议先确认数据正确后再删除)
-- ALTER TABLE songs DROP COLUMN IF EXISTS artist;
-- ALTER TABLE songs DROP COLUMN IF EXISTS album;

-- 8. 添加新的约束
ALTER TABLE songs ADD CONSTRAINT unique_song_per_album UNIQUE (title, artist_id, album_id);
ALTER TABLE songs ALTER COLUMN artist_id SET NOT NULL;
ALTER TABLE songs ALTER COLUMN duration SET NOT NULL;

-- 9. 创建索引
CREATE INDEX IF NOT EXISTS idx_artists_name ON artists(name);
CREATE INDEX IF NOT EXISTS idx_artists_genres ON artists USING GIN(genres);

CREATE INDEX IF NOT EXISTS idx_albums_artist_id ON albums(artist_id);
CREATE INDEX IF NOT EXISTS idx_albums_title ON albums(title);
CREATE INDEX IF NOT EXISTS idx_albums_release_date ON albums(release_date DESC);
CREATE INDEX IF NOT EXISTS idx_albums_genre ON albums(genre);

CREATE INDEX IF NOT EXISTS idx_songs_artist_id ON songs(artist_id);
CREATE INDEX IF NOT EXISTS idx_songs_album_id ON songs(album_id);
CREATE INDEX IF NOT EXISTS idx_songs_likes ON songs(likes DESC);
CREATE INDEX IF NOT EXISTS idx_songs_release_date ON songs(release_date DESC);

-- 10. 创建触发器函数
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

-- 11. 添加触发器
DROP TRIGGER IF EXISTS update_artists_updated_at ON artists;
CREATE TRIGGER update_artists_updated_at
  BEFORE UPDATE ON artists
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

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

-- 12. 更新专辑统计信息
UPDATE albums
SET
  total_tracks = (SELECT COUNT(*) FROM songs WHERE album_id = albums.id),
  duration = (SELECT COALESCE(SUM(duration), 0) FROM songs WHERE album_id = albums.id);

-- 13. 添加播放列表的新列(如果需要)
ALTER TABLE playlists ADD COLUMN IF NOT EXISTS total_tracks INTEGER DEFAULT 0;
ALTER TABLE playlists ADD COLUMN IF NOT EXISTS total_duration INTEGER DEFAULT 0;
ALTER TABLE playlists ADD COLUMN IF NOT EXISTS plays INTEGER DEFAULT 0;
ALTER TABLE playlists ADD COLUMN IF NOT EXISTS likes INTEGER DEFAULT 0;

-- 14. 更新播放列表统计
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

DROP TRIGGER IF EXISTS update_playlist_stats_on_song_change ON playlist_songs;
CREATE TRIGGER update_playlist_stats_on_song_change
  AFTER INSERT OR UPDATE OR DELETE ON playlist_songs
  FOR EACH ROW
  EXECUTE FUNCTION update_playlist_stats();

-- 更新现有播放列表的统计信息
UPDATE playlists
SET
  total_tracks = (SELECT COUNT(*) FROM playlist_songs WHERE playlist_id = playlists.id),
  total_duration = (
    SELECT COALESCE(SUM(s.duration), 0)
    FROM playlist_songs ps
    JOIN songs s ON ps.song_id = s.id
    WHERE ps.playlist_id = playlists.id
  );

-- 迁移完成!
-- 验证数据:
-- SELECT COUNT(*) FROM artists;
-- SELECT COUNT(*) FROM albums;
-- SELECT COUNT(*) FROM songs WHERE artist_id IS NOT NULL;
-- SELECT a.name, COUNT(alb.id) as album_count FROM artists a LEFT JOIN albums alb ON a.id = alb.artist_id GROUP BY a.name;
