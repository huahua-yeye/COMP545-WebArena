-- ============================================
-- Add User Favorites Table
-- ============================================
-- This migration adds support for user favorite songs
-- Run this in Supabase SQL Editor

-- Table: user_favorites (stores which songs users have liked)
-- For now, we'll use a simple approach without auth
-- User identification can be added later when auth is implemented
CREATE TABLE IF NOT EXISTS user_favorites (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  song_id UUID NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  user_id VARCHAR(255) DEFAULT 'guest', -- Can be updated to real user IDs when auth is implemented
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  UNIQUE(song_id, user_id)
);

COMMENT ON TABLE user_favorites IS 'Stores user favorite songs';
COMMENT ON COLUMN user_favorites.user_id IS 'User identifier (currently guest, will be auth user ID later)';

-- Indexes
CREATE INDEX IF NOT EXISTS idx_user_favorites_song_id ON user_favorites(song_id);
CREATE INDEX IF NOT EXISTS idx_user_favorites_user_id ON user_favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_user_favorites_created_at ON user_favorites(created_at DESC);

-- ============================================
-- Verification Query
-- ============================================
-- Run this to verify the table was created
-- SELECT 'user_favorites' as table_name, COUNT(*) as count FROM user_favorites;





