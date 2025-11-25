-- 常用查询示例
-- 这些查询展示了如何使用新的数据库架构

-- ========================================
-- 艺术家相关查询
-- ========================================

-- 1. 获取所有艺术家及其专辑数量
SELECT
  a.id,
  a.name,
  a.country,
  a.genres,
  COUNT(DISTINCT alb.id) as album_count,
  COUNT(DISTINCT s.id) as song_count
FROM artists a
LEFT JOIN albums alb ON a.id = alb.artist_id
LEFT JOIN songs s ON a.id = s.artist_id
GROUP BY a.id, a.name, a.country, a.genres
ORDER BY song_count DESC;

-- 2. 查找特定艺术家的所有信息
SELECT
  a.*,
  json_agg(
    DISTINCT jsonb_build_object(
      'id', alb.id,
      'title', alb.title,
      'release_date', alb.release_date,
      'total_tracks', alb.total_tracks
    )
  ) as albums
FROM artists a
LEFT JOIN albums alb ON a.id = alb.artist_id
WHERE a.name = 'Ed Sheeran'
GROUP BY a.id;

-- ========================================
-- 专辑相关查询
-- ========================================

-- 3. 获取专辑详情及其所有歌曲
SELECT
  alb.id as album_id,
  alb.title as album_title,
  alb.release_date,
  alb.cover_url,
  a.name as artist_name,
  json_agg(
    json_build_object(
      'id', s.id,
      'title', s.title,
      'track_number', s.track_number,
      'duration', s.duration,
      'url', s.url
    ) ORDER BY s.track_number
  ) as tracks
FROM albums alb
JOIN artists a ON alb.artist_id = a.id
LEFT JOIN songs s ON alb.id = s.album_id
WHERE alb.title = 'Divide'
GROUP BY alb.id, alb.title, alb.release_date, alb.cover_url, a.name;

-- 4. 获取最新发行的专辑
SELECT
  alb.id,
  alb.title,
  alb.release_date,
  alb.cover_url,
  a.name as artist_name,
  alb.total_tracks,
  alb.genre
FROM albums alb
JOIN artists a ON alb.artist_id = a.id
ORDER BY alb.release_date DESC
LIMIT 10;

-- 5. 按流派统计专辑
SELECT
  genre,
  COUNT(*) as album_count,
  COUNT(DISTINCT artist_id) as artist_count
FROM albums
WHERE genre IS NOT NULL
GROUP BY genre
ORDER BY album_count DESC;

-- ========================================
-- 歌曲相关查询
-- ========================================

-- 6. 获取歌曲完整信息(包括艺术家和专辑)
SELECT
  s.id,
  s.title,
  s.duration,
  s.url,
  s.plays,
  s.likes,
  a.name as artist_name,
  a.id as artist_id,
  alb.title as album_title,
  alb.id as album_id,
  COALESCE(s.cover_url, alb.cover_url) as cover_url,
  s.genre,
  s.release_date
FROM songs s
JOIN artists a ON s.artist_id = a.id
LEFT JOIN albums alb ON s.album_id = alb.id
ORDER BY s.created_at DESC;

-- 7. 搜索歌曲(按标题、艺术家或专辑)
SELECT
  s.id,
  s.title,
  a.name as artist_name,
  alb.title as album_title,
  s.duration
FROM songs s
JOIN artists a ON s.artist_id = a.id
LEFT JOIN albums alb ON s.album_id = alb.id
WHERE
  s.title ILIKE '%love%'
  OR a.name ILIKE '%love%'
  OR alb.title ILIKE '%love%'
LIMIT 20;

-- 8. 获取最受欢迎的歌曲(按播放次数)
SELECT
  s.id,
  s.title,
  a.name as artist_name,
  alb.title as album_title,
  s.plays,
  s.likes,
  COALESCE(s.cover_url, alb.cover_url) as cover_url
FROM songs s
JOIN artists a ON s.artist_id = a.id
LEFT JOIN albums alb ON s.album_id = alb.id
ORDER BY s.plays DESC
LIMIT 50;

-- 9. 获取单曲(不属于任何专辑的歌曲)
SELECT
  s.id,
  s.title,
  a.name as artist_name,
  s.duration,
  s.url,
  s.release_date
FROM songs s
JOIN artists a ON s.artist_id = a.id
WHERE s.album_id IS NULL
ORDER BY s.release_date DESC;

-- 10. 按流派获取歌曲
SELECT
  s.genre,
  COUNT(*) as song_count,
  SUM(s.plays) as total_plays
FROM songs s
WHERE s.genre IS NOT NULL
GROUP BY s.genre
ORDER BY song_count DESC;

-- ========================================
-- 播放列表相关查询
-- ========================================

-- 11. 获取播放列表及其所有歌曲
SELECT
  p.id as playlist_id,
  p.name as playlist_name,
  p.description,
  p.total_tracks,
  p.total_duration,
  json_agg(
    json_build_object(
      'id', s.id,
      'title', s.title,
      'artist', a.name,
      'album', alb.title,
      'duration', s.duration,
      'position', ps.position
    ) ORDER BY ps.position
  ) as tracks
FROM playlists p
LEFT JOIN playlist_songs ps ON p.id = ps.playlist_id
LEFT JOIN songs s ON ps.song_id = s.id
LEFT JOIN artists a ON s.artist_id = a.id
LEFT JOIN albums alb ON s.album_id = alb.id
WHERE p.name = 'My Favorites'
GROUP BY p.id, p.name, p.description, p.total_tracks, p.total_duration;

-- 12. 获取所有公开播放列表
SELECT
  p.id,
  p.name,
  p.description,
  p.cover_url,
  p.total_tracks,
  p.total_duration,
  p.plays,
  p.likes
FROM playlists p
WHERE p.is_public = true
ORDER BY p.created_at DESC;

-- ========================================
-- 复杂查询
-- ========================================

-- 13. 获取艺术家的完整信息(包括所有专辑和歌曲)
WITH artist_albums AS (
  SELECT
    alb.artist_id,
    json_agg(
      json_build_object(
        'id', alb.id,
        'title', alb.title,
        'release_date', alb.release_date,
        'cover_url', alb.cover_url,
        'total_tracks', alb.total_tracks
      ) ORDER BY alb.release_date DESC
    ) as albums
  FROM albums alb
  GROUP BY alb.artist_id
),
artist_songs AS (
  SELECT
    s.artist_id,
    json_agg(
      json_build_object(
        'id', s.id,
        'title', s.title,
        'duration', s.duration,
        'plays', s.plays
      ) ORDER BY s.plays DESC
    ) as top_songs
  FROM songs s
  GROUP BY s.artist_id
)
SELECT
  a.*,
  COALESCE(aa.albums, '[]'::json) as albums,
  COALESCE(as2.top_songs, '[]'::json) as top_songs
FROM artists a
LEFT JOIN artist_albums aa ON a.id = aa.artist_id
LEFT JOIN artist_songs as2 ON a.id = as2.artist_id
WHERE a.name = 'Ed Sheeran';

-- 14. 推荐歌曲(基于流派)
SELECT DISTINCT
  s.id,
  s.title,
  a.name as artist_name,
  alb.title as album_title,
  s.genre,
  s.plays
FROM songs s
JOIN artists a ON s.artist_id = a.id
LEFT JOIN albums alb ON s.album_id = alb.id
WHERE s.genre IN (
  -- 获取用户最常听的流派
  SELECT s2.genre
  FROM songs s2
  JOIN playlist_songs ps ON s2.id = ps.song_id
  JOIN playlists p ON ps.playlist_id = p.id
  WHERE p.name = 'My Favorites' AND s2.genre IS NOT NULL
  GROUP BY s2.genre
  ORDER BY COUNT(*) DESC
  LIMIT 3
)
AND s.id NOT IN (
  -- 排除已在播放列表中的歌曲
  SELECT ps.song_id
  FROM playlist_songs ps
  JOIN playlists p ON ps.playlist_id = p.id
  WHERE p.name = 'My Favorites'
)
ORDER BY s.plays DESC
LIMIT 20;

-- 15. 统计仪表板数据
SELECT
  (SELECT COUNT(*) FROM artists) as total_artists,
  (SELECT COUNT(*) FROM albums) as total_albums,
  (SELECT COUNT(*) FROM songs) as total_songs,
  (SELECT COUNT(*) FROM playlists WHERE is_public = true) as total_public_playlists,
  (SELECT SUM(plays) FROM songs) as total_plays,
  (SELECT SUM(total_duration) FROM playlists) as total_playlist_duration;

-- ========================================
-- 许可证相关查询
-- ========================================

-- 16. 查找需要署名的内容
SELECT
  'song' as type,
  s.title as name,
  a.name as artist,
  s.license,
  s.attribution,
  s.source_url
FROM songs s
JOIN artists a ON s.artist_id = a.id
WHERE s.requires_attribution = true

UNION ALL

SELECT
  'album' as type,
  alb.title as name,
  a.name as artist,
  alb.license,
  alb.attribution,
  alb.source_url
FROM albums alb
JOIN artists a ON alb.artist_id = a.id
WHERE alb.requires_attribution = true

UNION ALL

SELECT
  'playlist' as type,
  p.name,
  NULL as artist,
  p.license,
  p.attribution,
  p.source_url
FROM playlists p
WHERE p.requires_attribution = true;

-- ========================================
-- 性能优化查询
-- ========================================

-- 17. 分析表大小
SELECT
  schemaname,
  tablename,
  pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- 18. 查看索引使用情况
SELECT
  schemaname,
  tablename,
  indexname,
  idx_scan as index_scans,
  idx_tup_read as tuples_read,
  idx_tup_fetch as tuples_fetched
FROM pg_stat_user_indexes
WHERE schemaname = 'public'
ORDER BY idx_scan DESC;
