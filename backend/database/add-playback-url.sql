-- ============================================
-- Add playback_url field to songs table
-- ============================================
-- Run this in Supabase SQL Editor

-- Add playback_url column to songs table
ALTER TABLE songs ADD COLUMN IF NOT EXISTS playback_url TEXT;

-- Add comment to explain the field
COMMENT ON COLUMN songs.playback_url IS 'URL for streaming/playback (alternative to download URL)';

-- Optional: Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_songs_playback_url ON songs(playback_url) WHERE playback_url IS NOT NULL;

-- Verify the column was added
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'songs' AND column_name = 'playback_url';
