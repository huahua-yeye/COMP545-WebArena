-- ============================================
-- Clear Mock Data
-- ============================================
-- This script removes all mock data from the database
-- Run this in Supabase SQL Editor
-- WARNING: This will delete all data! Make sure you want to do this.

-- ============================================
-- METHOD 1: Delete specific mock data (RECOMMENDED)
-- ============================================
-- This only deletes the data from mock-data.sql

-- Delete playlist songs first (due to foreign key constraints)
DELETE FROM playlist_songs
WHERE playlist_id IN (
  SELECT id FROM playlists
  WHERE name IN (
    '轻松工作背景音乐',
    '电影级配乐精选',
    '夏日阳光',
    '专注力提升',
    '早晨激励'
  )
);

-- Delete playlists
DELETE FROM playlists
WHERE name IN (
  '轻松工作背景音乐',
  '电影级配乐精选',
  '夏日阳光',
  '专注力提升',
  '早晨激励'
);

-- Delete user favorites
DELETE FROM user_favorites
WHERE song_id IN (
  SELECT id FROM songs
  WHERE artist_id IN (
    SELECT id FROM artists
    WHERE name IN ('Bensound', 'Pixabay Music', 'Kevin MacLeod', 'Incompetech', 'Scott Buckley')
  )
);

-- Delete songs from mock artists
DELETE FROM songs
WHERE artist_id IN (
  SELECT id FROM artists
  WHERE name IN ('Bensound', 'Pixabay Music', 'Kevin MacLeod', 'Incompetech', 'Scott Buckley')
);

-- Delete albums from mock artists
DELETE FROM albums
WHERE artist_id IN (
  SELECT id FROM artists
  WHERE name IN ('Bensound', 'Pixabay Music', 'Kevin MacLeod', 'Incompetech', 'Scott Buckley')
);

-- Delete mock artists
DELETE FROM artists
WHERE name IN ('Bensound', 'Pixabay Music', 'Kevin MacLeod', 'Incompetech', 'Scott Buckley');

-- ============================================
-- Verification
-- ============================================

SELECT 'Mock data cleared!' as status;

-- Check remaining counts
SELECT 'Artists' as table_name, COUNT(*) as remaining_count FROM artists
UNION ALL
SELECT 'Albums', COUNT(*) FROM albums
UNION ALL
SELECT 'Songs', COUNT(*) FROM songs
UNION ALL
SELECT 'Playlists', COUNT(*) FROM playlists
UNION ALL
SELECT 'Playlist Songs', COUNT(*) FROM playlist_songs
UNION ALL
SELECT 'User Favorites', COUNT(*) FROM user_favorites;

-- ============================================
-- METHOD 2: Clear ALL data (NUCLEAR OPTION)
-- ============================================
-- Uncomment ONLY if you want to delete EVERYTHING

TRUNCATE TABLE playlist_songs CASCADE;
TRUNCATE TABLE playlists CASCADE;
TRUNCATE TABLE user_favorites CASCADE;
TRUNCATE TABLE songs CASCADE;
TRUNCATE TABLE albums CASCADE;
TRUNCATE TABLE artists CASCADE;

-- IMPORTANT: TRUNCATE will reset auto-increment counters
-- and remove ALL data, not just mock data

-- SELECT 'All data cleared!' as status;
