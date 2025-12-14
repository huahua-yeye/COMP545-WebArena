-- ============================================
-- Mock Data for acidwave
-- ============================================
-- This file contains realistic mock data with free music
-- All music URLs are from legitimate free sources (Bensound, Pixabay, etc.)
-- Run this AFTER schema.sql

-- ============================================
-- INSERT ARTISTS
-- ============================================

INSERT INTO artists (name, bio, genres, country) VALUES
  ('Bensound', '免费音乐创作者,专注于背景音乐和电影配乐', ARRAY['Cinematic', 'Electronic', 'Acoustic'], 'France'),
  ('Pixabay Music', '高质量免费音乐库', ARRAY['Electronic', 'Ambient', 'Rock'], 'International'),
  ('Kevin MacLeod', '著名免费音乐创作者', ARRAY['Classical', 'Electronic', 'Jazz'], 'United States'),
  ('Incompetech', '免费版权音乐制作', ARRAY['Orchestral', 'Rock', 'Electronic'], 'United States'),
  ('Scott Buckley', '史诗级音乐创作者', ARRAY['Epic', 'Cinematic', 'Orchestral'], 'Australia')
ON CONFLICT (name) DO NOTHING;

-- ============================================
-- INSERT ALBUMS
-- ============================================

-- Bensound Albums
INSERT INTO albums (title, artist_id, genre, release_date, description, license, attribution, source_url, requires_attribution)
SELECT
  'Acoustic Essentials',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  'Acoustic',
  '2020-01-01',
  '轻松的原声吉他曲集',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO albums (title, artist_id, genre, release_date, description, license, attribution, source_url, requires_attribution)
SELECT
  'Electronic Dreams',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  'Electronic',
  '2020-06-01',
  '现代电子音乐合集',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO albums (title, artist_id, genre, release_date, description, license, attribution, source_url, requires_attribution)
SELECT
  'Cinematic Scores',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  'Cinematic',
  '2021-01-01',
  '电影级配乐作品',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

-- Kevin MacLeod Albums
INSERT INTO albums (title, artist_id, genre, release_date, description, license, attribution, source_url, requires_attribution)
SELECT
  'Royalty Free Classics',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod'),
  'Classical',
  '2019-01-01',
  '经典免费音乐合集',
  'CC BY 4.0',
  'Music by Kevin MacLeod (incompetech.com)',
  'https://incompetech.com/',
  true
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Kevin MacLeod')
ON CONFLICT DO NOTHING;

-- Scott Buckley Albums
INSERT INTO albums (title, artist_id, genre, release_date, description, license, attribution, source_url, requires_attribution)
SELECT
  'Epic Collection',
  (SELECT id FROM artists WHERE name = 'Scott Buckley'),
  'Epic',
  '2021-03-01',
  '史诗级管弦乐作品',
  'CC BY 4.0',
  'Music by Scott Buckley - www.scottbuckley.com.au',
  'https://www.scottbuckley.com.au/',
  true
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Scott Buckley')
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT SONGS
-- ============================================

-- Bensound - Acoustic Essentials Album
INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Sunny',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Acoustic Essentials'),
  1, 140,
  'https://www.bensound.com/bensound-music/bensound-sunny.mp3',
  'Acoustic',
  '2020-01-15',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  15420, 892
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Ukulele',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Acoustic Essentials'),
  2, 146,
  'https://www.bensound.com/bensound-music/bensound-ukulele.mp3',
  'Acoustic',
  '2020-01-15',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  12350, 721
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Summer',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Acoustic Essentials'),
  3, 142,
  'https://www.bensound.com/bensound-music/bensound-summer.mp3',
  'Acoustic',
  '2020-01-15',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  18230, 1042
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Little Idea',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Acoustic Essentials'),
  4, 121,
  'https://www.bensound.com/bensound-music/bensound-littleidea.mp3',
  'Acoustic',
  '2020-01-15',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  9876, 543
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

-- Bensound - Electronic Dreams Album
INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Creative Minds',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Electronic Dreams'),
  1, 225,
  'https://www.bensound.com/bensound-music/bensound-creativeminds.mp3',
  'Electronic',
  '2020-06-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  25430, 1521
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Tenderness',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Electronic Dreams'),
  2, 171,
  'https://www.bensound.com/bensound-music/bensound-tenderness.mp3',
  'Electronic',
  '2020-06-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  13240, 782
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Evolution',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Electronic Dreams'),
  3, 180,
  'https://www.bensound.com/bensound-music/bensound-evolution.mp3',
  'Electronic',
  '2020-06-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  16890, 945
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

-- Bensound - Cinematic Scores Album
INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Epic',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Cinematic Scores'),
  1, 176,
  'https://www.bensound.com/bensound-music/bensound-epic.mp3',
  'Cinematic',
  '2021-01-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  32450, 2134
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'November',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Cinematic Scores'),
  2, 180,
  'https://www.bensound.com/bensound-music/bensound-november.mp3',
  'Cinematic',
  '2021-01-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  21340, 1289
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Memories',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  (SELECT id FROM albums WHERE title = 'Cinematic Scores'),
  3, 210,
  'https://www.bensound.com/bensound-music/bensound-memories.mp3',
  'Cinematic',
  '2021-01-01',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  18760, 1045
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

-- Singles (no album)
INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Buddy',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  NULL,
  NULL, 122,
  'https://www.bensound.com/bensound-music/bensound-buddy.mp3',
  'Folk',
  '2022-03-15',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  8234, 456
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Inspire',
  (SELECT id FROM artists WHERE name = 'Bensound'),
  NULL,
  NULL, 147,
  'https://www.bensound.com/bensound-music/bensound-inspire.mp3',
  'Motivational',
  '2022-05-20',
  'CC BY-ND 4.0',
  'Music by Bensound',
  'https://www.bensound.com/',
  true,
  11230, 678
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Bensound')
ON CONFLICT DO NOTHING;

-- Kevin MacLeod Songs
INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Wallpaper',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod'),
  (SELECT id FROM albums WHERE title = 'Royalty Free Classics'),
  1, 230,
  'https://incompetech.com/music/royalty-free/mp3-royaltyfree/Wallpaper.mp3',
  'Electronic',
  '2019-01-15',
  'CC BY 4.0',
  'Music by Kevin MacLeod (incompetech.com)',
  'https://incompetech.com/',
  true,
  14560, 823
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Kevin MacLeod')
ON CONFLICT DO NOTHING;

INSERT INTO songs (title, artist_id, album_id, track_number, duration, url, genre, release_date, license, attribution, source_url, requires_attribution, plays, likes)
SELECT
  'Sneaky Snitch',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod'),
  (SELECT id FROM albums WHERE title = 'Royalty Free Classics'),
  2, 120,
  'https://incompetech.com/music/royalty-free/mp3-royaltyfree/Sneaky_Snitch.mp3',
  'Jazz',
  '2019-01-15',
  'CC BY 4.0',
  'Music by Kevin MacLeod (incompetech.com)',
  'https://incompetech.com/',
  true,
  28934, 1756
WHERE EXISTS (SELECT 1 FROM artists WHERE name = 'Kevin MacLeod')
ON CONFLICT DO NOTHING;

-- ============================================
-- INSERT PLAYLISTS
-- ============================================

INSERT INTO playlists (name, description, is_public) VALUES
  ('PLAYLIST1', 'Test playlist for agent benchmark tasks', true),
  ('轻松工作背景音乐', '适合工作和学习的轻松音乐', true),
  ('电影级配乐精选', '史诗级和电影风格音乐合集', true),
  ('夏日阳光', '充满活力的夏日音乐', true),
  ('专注力提升', '帮助集中注意力的音乐', true),
  ('早晨激励', '充满能量的早晨音乐', true)
ON CONFLICT DO NOTHING;

-- ============================================
-- ADD SONGS TO PLAYLISTS
-- ============================================

-- Playlist: PLAYLIST1 (Test playlist)
INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = 'PLAYLIST1'),
  (SELECT id FROM songs WHERE title = 'Vibrant Horizon'),
  0
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = 'PLAYLIST1')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Vibrant Horizon')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = 'PLAYLIST1'),
  (SELECT id FROM songs WHERE title = 'Watch and Learn'),
  1
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = 'PLAYLIST1')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Watch and Learn')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = 'PLAYLIST1'),
  (SELECT id FROM songs WHERE title = 'Creative Minds'),
  2
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = 'PLAYLIST1')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Creative Minds')
ON CONFLICT DO NOTHING;

-- Playlist: 轻松工作背景音乐
INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '轻松工作背景音乐'),
  (SELECT id FROM songs WHERE title = 'Creative Minds'),
  0
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '轻松工作背景音乐')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Creative Minds')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '轻松工作背景音乐'),
  (SELECT id FROM songs WHERE title = 'Sunny'),
  1
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '轻松工作背景音乐')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Sunny')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '轻松工作背景音乐'),
  (SELECT id FROM songs WHERE title = 'Little Idea'),
  2
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '轻松工作背景音乐')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Little Idea')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '轻松工作背景音乐'),
  (SELECT id FROM songs WHERE title = 'Tenderness'),
  3
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '轻松工作背景音乐')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Tenderness')
ON CONFLICT DO NOTHING;

-- Playlist: 电影级配乐精选
INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '电影级配乐精选'),
  (SELECT id FROM songs WHERE title = 'Epic'),
  0
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '电影级配乐精选')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Epic')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '电影级配乐精选'),
  (SELECT id FROM songs WHERE title = 'November'),
  1
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '电影级配乐精选')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'November')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '电影级配乐精选'),
  (SELECT id FROM songs WHERE title = 'Memories'),
  2
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '电影级配乐精选')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Memories')
ON CONFLICT DO NOTHING;

-- Playlist: 夏日阳光
INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '夏日阳光'),
  (SELECT id FROM songs WHERE title = 'Summer'),
  0
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '夏日阳光')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Summer')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '夏日阳光'),
  (SELECT id FROM songs WHERE title = 'Sunny'),
  1
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '夏日阳光')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Sunny')
ON CONFLICT DO NOTHING;

INSERT INTO playlist_songs (playlist_id, song_id, position)
SELECT
  (SELECT id FROM playlists WHERE name = '夏日阳光'),
  (SELECT id FROM songs WHERE title = 'Ukulele'),
  2
WHERE EXISTS (SELECT 1 FROM playlists WHERE name = '夏日阳光')
  AND EXISTS (SELECT 1 FROM songs WHERE title = 'Ukulele')
ON CONFLICT DO NOTHING;

-- ============================================
-- VERIFICATION
-- ============================================

-- Check counts
SELECT 'Artists' as table_name, COUNT(*) as count FROM artists
UNION ALL
SELECT 'Albums', COUNT(*) FROM albums
UNION ALL
SELECT 'Songs', COUNT(*) FROM songs
UNION ALL
SELECT 'Playlists', COUNT(*) FROM playlists
UNION ALL
SELECT 'Playlist Songs', COUNT(*) FROM playlist_songs;
