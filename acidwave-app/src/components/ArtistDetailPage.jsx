import { useState, useEffect, useRef } from 'react';
import {
  Play,
  Shuffle,
  Heart,
  MoreVertical,
  ChevronLeft,
  Share2,
  Globe,
  ExternalLink,
  Music,
  Disc3,
  Users,
  Star
} from 'lucide-react';
import { getArtistById } from '../services/api.js';

/**
 * ArtistDetailPage - artist detail overlay
 * Shows artist info, albums, and top songs
 */
export function ArtistDetailPage({ artistId, initialArtist, onClose, onPlaySong, onAlbumClick }) {
  const [artist, setArtist] = useState(initialArtist || null);
  const [loading, setLoading] = useState(!initialArtist);
  const [error, setError] = useState(null);
  const [isLiked, setIsLiked] = useState(false);
  const [isRefreshing, setIsRefreshing] = useState(false);
  const [activeTab, setActiveTab] = useState('albums'); // 'albums' or 'songs'
  const requestRef = useRef(0);

  // Normalize artist data from different sources
  const normalizeArtist = (data, fallback = null) => {
    if (!data) return fallback;
    return {
      id: data.id,
      name: data.name,
      bio: data.bio || data.description,
      avatar_url: data.avatar_url || data.image,
      image: data.image || data.avatar_url,
      genres: data.genres || [],
      country: data.country,
      website: data.website_url || data.website,
      social_links: data.social_links || {},
      follower_count: data.follower_count || data.followers || 0,
      // 保留统计数字（从列表获取的 count）
      song_count: data.song_count || data.songCount || data.top_songs?.length || 0,
      songCount: data.songCount || data.song_count || data.top_songs?.length || 0,
      albumCount: data.albumCount || data.albums?.length || 0,
      albums: data.albums || [],
      top_songs: data.top_songs || []
    };
  };

  // Reset state when switching to a different artist
  useEffect(() => {
    setError(null);
    setIsRefreshing(false);
    setLoading(!initialArtist);
    setArtist(initialArtist ? normalizeArtist(initialArtist) : null);
  }, [artistId, initialArtist]);

  useEffect(() => {
    if (artistId) {
      // 如果 initialArtist 已经有 albums 数据，可以选择跳过 API 调用
      // 或者在后台静默刷新获取最新数据（top_songs 等）
      const hasAlbumsData = initialArtist?.albums && initialArtist.albums.length > 0;
      
      if (hasAlbumsData) {
        // 已有专辑数据，静默刷新获取 top_songs 等其他数据
        fetchArtistDetails(true); // silent refresh
      } else {
        // 没有专辑数据，正常加载
        fetchArtistDetails(false);
      }
    }
  }, [artistId]);

  const fetchArtistDetails = async (silentRefresh = false) => {
    try {
      // 静默刷新模式：不显示任何加载状态，只在后台更新数据
      if (!silentRefresh) {
        const shouldShowSpinner = !artist;
        if (shouldShowSpinner) setLoading(true);
        else setIsRefreshing(true);
      }
      setError(null);
      
      requestRef.current += 1;
      const token = requestRef.current;
      
      const data = await getArtistById(artistId);
      
      // Ignore stale responses
      if (token !== requestRef.current) return;
      
      const normalized = normalizeArtist(data, initialArtist);
      
      setArtist(prev => {
        // 静默刷新模式：只补充 top_songs，保留已有的 albums（避免数据闪烁）
        if (silentRefresh && prev?.albums?.length > 0) {
          return {
            ...prev,
            // 只更新 top_songs 和其他元信息
            top_songs: normalized.top_songs || prev.top_songs || [],
            song_count: normalized.top_songs?.length || prev.song_count || prev.songCount || 0,
            songCount: normalized.top_songs?.length || prev.songCount || prev.song_count || 0,
            bio: normalized.bio || prev.bio,
            follower_count: normalized.follower_count || prev.follower_count,
            // albums 保持不变，避免闪烁
          };
        }
        
        // 正常模式：使用 API 返回的完整数据
        return {
          ...normalized,
          albums: normalized.albums?.length > 0 ? normalized.albums : (prev?.albums || []),
          top_songs: normalized.top_songs?.length > 0 ? normalized.top_songs : (prev?.top_songs || [])
        };
      });
    } catch (err) {
      console.error('Error fetching artist:', err);
      // 静默刷新模式下不显示错误（已有数据可以正常显示）
      if (!silentRefresh) {
        setError(err.message);
      }
    } finally {
      setLoading(false);
      setIsRefreshing(false);
    }
  };

  // Play the artist's top songs (start with first)
  const handlePlayArtist = () => {
    if (artist?.top_songs && artist.top_songs.length > 0) {
      onPlaySong?.(artist.top_songs[0]);
    }
  };

  // Shuffle play
  const handleShuffle = () => {
    if (artist?.top_songs && artist.top_songs.length > 0) {
      const shuffled = [...artist.top_songs].sort(() => Math.random() - 0.5);
      onPlaySong?.(shuffled[0]);
    }
  };

  // Format numbers (1000 -> 1K)
  const formatNumber = (num) => {
    if (!num) return '0';
    if (num >= 1000000) return `${(num / 1000000).toFixed(1)}M`;
    if (num >= 1000) return `${(num / 1000).toFixed(1)}K`;
    return num.toString();
  };

  // Format time (seconds -> MM:SS)
  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  if (loading) {
    return (
      <div className="fixed inset-0 bg-[#050505] z-50 flex items-center justify-center">
        <div className="text-[#CCFF00] font-mono text-sm animate-pulse">LOADING_ARTIST_DATA...</div>
      </div>
    );
  }

  if (error || !artist) {
    return (
      <div className="fixed inset-0 bg-[#050505] z-50 flex items-center justify-center">
        <div className="text-center">
          <p className="text-red-500 font-mono text-sm mb-4">ERROR: {error || 'Artist not found'}</p>
          <button
            onClick={onClose}
            className="px-4 py-2 bg-[#333] text-white rounded hover:bg-[#444] transition-colors"
          >
            Back
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="fixed inset-0 bg-[#050505] z-50 overflow-hidden flex flex-col pb-24">
      {/* Header with back button */}
      <div className="flex items-center gap-4 p-4 border-b border-[#222]">
        <button
          onClick={onClose}
          className="p-2 hover:bg-[#111] rounded-full transition-colors"
        >
          <ChevronLeft size={24} className="text-white" />
        </button>
        <h1 className="text-xl font-bold text-white">Artists</h1>
      </div>

      <div className="flex-1 overflow-y-auto custom-scrollbar pb-8">
        {/* Artist Header */}
        <div className="bg-gradient-to-b from-[#1a1a1a] to-[#050505] p-8">
          <div className="flex gap-6 items-start">
            {/* Artist Avatar */}
            <div className="flex-shrink-0">
              <div className="w-56 h-56 rounded-full overflow-hidden shadow-2xl border-4 border-[#333]">
                <img
                  src={artist.avatar_url || artist.image || 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=300&h=300&fit=crop'}
                  alt={artist.name}
                  className="w-full h-full object-cover"
                />
              </div>
            </div>

            {/* Artist Info */}
            <div className="flex-1 flex flex-col justify-end">
              <div className="text-sm text-gray-400 font-mono mb-2">ARTIST_PROFILE</div>

              <h1 className="text-5xl font-bold text-white mb-4">
                {artist.name}
                {isLiked && (
                  <Heart size={40} className="inline-block ml-3 text-[#FF00FF] fill-current" />
                )}
              </h1>

              {/* Artist Bio */}
              {artist.bio && (
                <p className="text-gray-300 text-sm mb-4 max-w-2xl line-clamp-3">
                  {artist.bio}
                </p>
              )}

              {/* Stats */}
              <div className="flex items-center gap-6 text-sm mb-4">
              <div className="flex items-center gap-2">
                <Disc3 size={16} className="text-[#CCFF00]" />
                <span className="text-white font-bold">{artist.albums?.length || artist.albumCount || 0}</span>
                <span className="text-gray-400">Albums</span>
              </div>
              <div className="flex items-center gap-2">
                <Music size={16} className="text-[#FF00FF]" />
                <span className="text-white font-bold">{artist.song_count || artist.songCount || artist.top_songs?.length || 0}</span>
                <span className="text-gray-400">Songs</span>
              </div>
              <div className="flex items-center gap-2">
                <Users size={16} className="text-[#CCFF00]" />
                <span className="text-white font-bold">{formatNumber(artist.follower_count || 0)}</span>
                <span className="text-gray-400">Fans</span>
              </div>
            </div>

            {/* Genres */}
              {artist.genres && artist.genres.length > 0 && (
                <div className="flex flex-wrap gap-2 mb-4">
                  {artist.genres.map((genre, index) => (
                    <span
                      key={index}
                      className="px-3 py-1 bg-[#111] border border-[#333] rounded-full text-xs text-[#CCFF00] font-mono"
                    >
                      {genre}
                    </span>
                  ))}
                </div>
              )}

              {/* Country */}
              {artist.country && (
                <div className="text-gray-400 text-sm mb-4">
                  <span className="text-gray-500">Region:</span> {artist.country}
                </div>
              )}

              {/* Links */}
              <div className="flex items-center gap-3">
                {artist.website && (
                  <a
                    href={artist.website}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center gap-2 px-3 py-1 bg-[#111] border border-[#333] rounded hover:border-[#CCFF00] hover:text-[#CCFF00] text-gray-400 text-sm transition-colors"
                  >
                    <Globe size={14} />
                    Website
                  </a>
                )}
                {artist.social_links && Object.keys(artist.social_links).length > 0 && (
                  <>
                    {artist.social_links.acidwave && (
                      <a
                        href={artist.social_links.acidwave}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center gap-2 px-3 py-1 bg-[#111] border border-[#333] rounded hover:border-[#1DB954] hover:text-[#1DB954] text-gray-400 text-sm transition-colors"
                      >
                        <ExternalLink size={14} />
                        acidwave
                      </a>
                    )}
                  </>
                )}
              </div>
            </div>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="border-b border-[#222] px-8 py-4 flex items-center gap-4 bg-[#0a0a0a]">
          <button
            onClick={handlePlayArtist}
            className="flex items-center gap-2 px-6 py-2 bg-[#CCFF00] text-black font-semibold rounded hover:bg-[#FF00FF] hover:text-white transition-colors"
          >
            <Play size={16} fill="currentColor" />
            Play
          </button>

          <button
            onClick={handleShuffle}
            className="flex items-center gap-2 px-4 py-2 border border-[#333] text-gray-300 rounded hover:border-[#CCFF00] hover:text-[#CCFF00] transition-colors"
          >
            <Shuffle size={16} />
            Shuffle
          </button>

          <button className="flex items-center gap-2 px-4 py-2 border border-[#333] text-gray-300 rounded hover:border-[#CCFF00] hover:text-[#CCFF00] transition-colors">
            <Share2 size={16} />
            Share
          </button>

          <button
            onClick={() => setIsLiked(!isLiked)}
            className="ml-auto p-2 border border-[#333] rounded hover:border-[#FF00FF] transition-colors"
          >
            <Heart
              size={20}
              className={isLiked ? 'text-[#FF00FF] fill-current' : 'text-gray-400'}
            />
          </button>

          <button className="p-2 border border-[#333] rounded hover:border-[#CCFF00] transition-colors">
            <MoreVertical size={20} className="text-gray-400" />
          </button>
        </div>

        {/* Tabs */}
        <div className="border-b border-[#222] px-8 flex gap-6 bg-[#0a0a0a]">
          <button
            onClick={() => setActiveTab('albums')}
            className={`py-3 px-1 font-semibold text-sm border-b-2 transition-colors ${
              activeTab === 'albums'
                ? 'border-[#CCFF00] text-[#CCFF00]'
                : 'border-transparent text-gray-400 hover:text-white'
            }`}
          >
            Albums ({artist.albums?.length || artist.albumCount || 0})
          </button>
          <button
            onClick={() => setActiveTab('songs')}
            className={`py-3 px-1 font-semibold text-sm border-b-2 transition-colors ${
              activeTab === 'songs'
                ? 'border-[#CCFF00] text-[#CCFF00]'
                : 'border-transparent text-gray-400 hover:text-white'
            }`}
          >
            Top Songs ({artist.top_songs?.length || artist.song_count || artist.songCount || 0})
          </button>
        </div>

        {/* Content */}
        <div className="px-8 py-6">
          {/* Albums Grid */}
          {activeTab === 'albums' && (() => {
            const albums = artist.albums || [];
            // Debug: 打印专辑数据
            console.log('Artist albums data:', albums);
            // 只在首次加载时显示骨架屏，刷新时不显示（避免闪烁）
            const showSkeleton = albums.length === 0 && loading;

            if (showSkeleton) {
              return (
                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-4">
                  {Array.from({ length: 6 }).map((_, idx) => (
                    <div key={idx} className="animate-pulse">
                      <div className="mb-3 rounded-lg bg-[#0f0f0f] border border-[#222] aspect-square" />
                      <div className="h-3 bg-[#111] rounded mb-2 w-3/4" />
                      <div className="h-2 bg-[#111] rounded w-1/2" />
                    </div>
                  ))}
                </div>
              );
            }

            if (albums.length === 0) {
              return (
                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-4">
                  <div className="col-span-full py-12 text-center border border-dashed border-[#333] rounded">
                    <Disc3 size={48} className="mx-auto text-gray-600 mb-3" />
                    <p className="text-gray-500 font-mono text-sm">No albums yet</p>
                  </div>
                </div>
              );
            }

            return (
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-4">
                {albums.map((album) => (
                  <div
                    key={album.id}
                    onClick={() => onAlbumClick?.(album)}
                    className="group cursor-pointer"
                  >
                    <div className="relative mb-3 overflow-hidden rounded-lg border border-[#333] group-hover:border-[#CCFF00] transition-all">
                      <img
                        src={album.cover_url || 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop'}
                        alt={album.title}
                        className="w-full aspect-square object-cover group-hover:scale-105 transition-transform duration-300"
                        onError={(e) => {
                          console.log('Image failed to load:', album.cover_url);
                          e.target.src = 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop';
                        }}
                      />
                      {/* Play overlay on hover */}
                      <div className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 flex items-center justify-center transition-opacity">
                        <div className="w-12 h-12 rounded-full bg-[#CCFF00] flex items-center justify-center">
                          <Play size={20} className="text-black ml-1" fill="currentColor" />
                        </div>
                      </div>
                    </div>
                    <h3 className="text-white font-semibold text-sm mb-1 truncate group-hover:text-[#CCFF00] transition-colors">
                      {album.title}
                    </h3>
                    <p className="text-gray-400 text-xs truncate">
                      {album.release_date ? new Date(album.release_date).getFullYear() : ''}
                    </p>
                  </div>
                ))}
              </div>
            );
          })()}

          {/* Top Songs List */}
          {activeTab === 'songs' && (
            <div className="space-y-1">
              {artist.top_songs && artist.top_songs.length > 0 ? (
                artist.top_songs.map((song, index) => (
                  <div
                    key={song.id}
                    onClick={() => onPlaySong?.(song)}
                    className="grid grid-cols-[40px_1fr_200px_100px_80px] gap-4 px-4 py-3 hover:bg-[#111] rounded group cursor-pointer transition-colors items-center"
                  >
                    {/* Number */}
                    <div className="text-gray-400 text-sm font-mono">
                      {index + 1}
                    </div>

                    {/* Title & Album */}
                    <div className="min-w-0">
                      <div className="text-white font-medium truncate group-hover:text-[#CCFF00] transition-colors">
                        {song.title}
                      </div>
                      {song.album_title && (
                        <div className="text-gray-400 text-xs truncate">
                          {song.album_title}
                        </div>
                      )}
                    </div>

                    {/* Play Count */}
                    <div className="text-gray-400 text-sm">
                      {formatNumber(song.play_count || song.plays || 0)} plays
                    </div>

                    {/* Duration */}
                    <div className="text-gray-400 text-sm">
                      {formatTime(song.duration || 0)}
                    </div>

                    {/* Rating */}
                    <div className="flex items-center gap-0.5">
                      {[1, 2, 3, 4, 5].map((star) => (
                        <Star
                          key={star}
                          size={12}
                          className={star <= (song.rating || 4) ? 'text-[#CCFF00] fill-current' : 'text-gray-600'}
                        />
                      ))}
                    </div>
                  </div>
                ))
              ) : (
                <div className="py-12 text-center border border-dashed border-[#333] rounded">
                  <Music size={48} className="mx-auto text-gray-600 mb-3" />
                  <p className="text-gray-500 font-mono text-sm">No songs yet</p>
                </div>
              )}
            </div>
          )}
        </div>
      </div>

      <style>{`
        .custom-scrollbar::-webkit-scrollbar { width: 8px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: #000; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #333; border-radius: 4px; }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover { background: #CCFF00; }
      `}</style>
    </div>
  );
}

export default ArtistDetailPage;
