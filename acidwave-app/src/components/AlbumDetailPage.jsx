import { useState, useEffect, useRef } from 'react';
import {
  Play,
  ListPlus,
  Download,
  Heart,
  ChevronLeft,
  X,
  Plus,
  FolderPlus
} from 'lucide-react';

/**
 * AlbumDetailPage - album detail overlay
 * Music player style view showing album info and track list
 * Right-click context menu for Add to Playlist and Download
 */
export function AlbumDetailPage({ album, onClose, onPlaySong, onPlayAlbum, currentSong, playlists = [], onAddToPlaylist, favorites = [], onToggleFavorite }) {
  const [contextMenu, setContextMenu] = useState(null); // { x, y, track, type: 'track' | 'album' }
  const [showPlaylistModal, setShowPlaylistModal] = useState(false);
  const [targetForPlaylist, setTargetForPlaylist] = useState(null); // track or 'album'
  const [newPlaylistName, setNewPlaylistName] = useState('');
  const contextMenuRef = useRef(null);

  // Close context menu when clicking outside
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (contextMenuRef.current && !contextMenuRef.current.contains(e.target)) {
        setContextMenu(null);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  // Close context menu on scroll
  useEffect(() => {
    const handleScroll = () => setContextMenu(null);
    window.addEventListener('scroll', handleScroll, true);
    return () => window.removeEventListener('scroll', handleScroll, true);
  }, []);

  if (!album) return null;

  // Calculate total album duration
  const totalDuration = album.tracks?.reduce((sum, track) => sum + (track.duration || 0), 0) || 0;
  const totalSize = album.tracks?.length ? (album.tracks.length * 7.3).toFixed(2) : '0';

  // Format duration (seconds -> MM:SS)
  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  // Format total duration
  const formatTotalDuration = (seconds) => {
    const mins = Math.floor(seconds / 60);
    return `${mins}:${(seconds % 60).toString().padStart(2, '0')}`;
  };

  // Play album
  const handlePlayAlbum = () => {
    if (album.tracks && album.tracks.length > 0) {
      onPlayAlbum?.(album.tracks);
    }
  };

  // Handle right-click on track
  const handleTrackContextMenu = (e, track) => {
    e.preventDefault();
    setContextMenu({
      x: e.clientX,
      y: e.clientY,
      track,
      type: 'track'
    });
  };

  // Handle right-click on album header
  const handleAlbumContextMenu = (e) => {
    e.preventDefault();
    setContextMenu({
      x: e.clientX,
      y: e.clientY,
      track: null,
      type: 'album'
    });
  };

  // Open playlist modal
  const handleAddToPlaylist = (target) => {
    setTargetForPlaylist(target);
    setShowPlaylistModal(true);
    setContextMenu(null);
  };

  // Add to existing playlist
  const handleSelectPlaylist = async (playlist) => {
    if (targetForPlaylist === 'album') {
      // Add all tracks
      for (const track of album.tracks || []) {
        await onAddToPlaylist?.(playlist.id, track.id);
      }
    } else if (targetForPlaylist) {
      // Add single track
      await onAddToPlaylist?.(playlist.id, targetForPlaylist.id);
    }
    setShowPlaylistModal(false);
    setTargetForPlaylist(null);
  };

  // Create new playlist and add
  const handleCreatePlaylistAndAdd = async () => {
    if (!newPlaylistName.trim()) return;
    // This would create a new playlist - for now just close
    // TODO: Implement createPlaylist API call
    setNewPlaylistName('');
    setShowPlaylistModal(false);
    setTargetForPlaylist(null);
  };

  // Download track - 使用直接链接方式，避免 CORS 问题
  const handleDownload = (track) => {
    setContextMenu(null);
    
    if (!track.url) {
      alert('Download not available for this track');
      return;
    }

    try {
      // 方法1: 尝试使用 <a> 标签直接下载
      const a = document.createElement('a');
      a.href = track.url;
      a.target = '_blank';
      a.download = `${track.artist?.name || track.artist || album.artist?.name || 'Unknown'} - ${track.title}.mp3`;
      
      // 对于跨域资源，download 属性可能不生效，但至少会在新标签页打开
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      
    } catch (error) {
      console.error('Download failed:', error);
      // 如果直接下载失败，在新窗口打开
      window.open(track.url, '_blank');
    }
  };

  // Download all tracks
  const handleDownloadAll = () => {
    setContextMenu(null);
    
    const tracksWithUrl = (album.tracks || []).filter(t => t.url);
    
    if (tracksWithUrl.length === 0) {
      alert('No downloadable tracks available');
      return;
    }
    
    // 提示用户将要下载多个文件
    if (tracksWithUrl.length > 1) {
      const confirmed = confirm(`Will open ${tracksWithUrl.length} download links. Continue?`);
      if (!confirmed) return;
    }
    
    // 依次打开下载链接（间隔500ms避免被浏览器阻止）
    tracksWithUrl.forEach((track, index) => {
      setTimeout(() => {
        handleDownload(track);
      }, index * 500);
    });
  };

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
        <h1 className="text-xl font-bold text-white">Albums</h1>
      </div>

      <div className="flex-1 overflow-y-auto custom-scrollbar pb-8">
        {/* Album Header - Right click for context menu */}
        <div 
          className="bg-gradient-to-b from-[#1a1a1a] to-[#050505] p-8"
          onContextMenu={handleAlbumContextMenu}
        >
          <div className="flex gap-6 items-start">
            {/* Album Cover */}
            <div className="flex-shrink-0">
              <img
                src={album.cover_url || 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop'}
                alt={album.title}
                className="w-56 h-56 rounded-lg shadow-2xl object-cover border border-[#333]"
              />
            </div>

            {/* Album Info */}
            <div className="flex-1 flex flex-col justify-end">
              <h1 className="text-4xl font-bold text-white mb-2">
                {album.title}
              </h1>

              <div className="text-[#CCFF00] text-lg mb-3">
                {album.artist?.name || album.artist}
              </div>

              <div className="text-gray-400 text-sm space-y-1">
                {album.release_date && (
                  <div>{new Date(album.release_date).getFullYear()}</div>
                )}
                <div>
                  {album.tracks?.length || 0} Songs · {formatTotalDuration(totalDuration)} · {totalSize} MB
                </div>
              </div>

              {/* License info */}
              {album.license && (
                <div className="mt-3 inline-flex items-center gap-2 text-xs text-gray-500 bg-[#111] px-3 py-1 rounded border border-[#333]">
                  <span className="text-[#CCFF00]">{album.license}</span>
                </div>
              )}

              {/* Source Link */}
              {album.source_url && (
                <div className="mt-2">
                  <a
                    href={album.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-[#FF00FF] hover:text-[#CCFF00] text-sm transition-colors inline-flex items-center gap-1"
                  >
                    Visit {album.source_url.includes('bandcamp') ? 'Bandcamp' : 'Source'}
                  </a>
                </div>
              )}

              {/* Hint for right-click */}
              <div className="mt-4 text-gray-600 text-xs font-mono">
                Right-click for more options
              </div>
            </div>
          </div>
        </div>

        {/* Simplified Action Buttons - Only Play and Like */}
        <div className="border-b border-[#222] px-8 py-4 flex items-center gap-4 bg-[#0a0a0a]">
          <button
            onClick={handlePlayAlbum}
            className="flex items-center gap-2 px-6 py-2 bg-[#CCFF00] text-black font-semibold rounded hover:bg-[#FF00FF] hover:text-white transition-colors"
          >
            <Play size={16} fill="currentColor" />
            PLAY
          </button>

          {/* Like button for first track as album representative */}
          {album.tracks && album.tracks.length > 0 && (
            <button
              onClick={(e) => onToggleFavorite?.(e, album.tracks[0].id)}
              className="p-2 border border-[#333] rounded hover:border-[#FF00FF] transition-colors"
            >
              <Heart
                size={20}
                className={favorites.includes(album.tracks[0].id) ? 'text-[#FF00FF] fill-current' : 'text-gray-400'}
              />
            </button>
          )}

          <span className="ml-auto text-gray-500 text-xs font-mono">
            Right-click album or track for options
          </span>
        </div>

        {/* Track List */}
        <div className="px-8 py-4">
          {/* Table Header */}
          <div className="grid grid-cols-[40px_1fr_200px_100px_50px] gap-4 px-4 py-2 border-b border-[#222] text-gray-500 text-sm font-semibold">
            <div>#</div>
            <div>Title</div>
            <div>Artist</div>
            <div>Time</div>
            <div></div>
          </div>

          {/* Track Rows */}
          <div className="space-y-1">
            {album.tracks?.map((track, index) => {
              const isPlaying = currentSong?.id === track.id;
              return (
                <div
                  key={track.id}
                  className={`grid grid-cols-[40px_1fr_200px_100px_50px] gap-4 px-4 py-3 rounded group cursor-pointer transition-colors items-center ${
                    isPlaying 
                      ? 'bg-[#CCFF00]/10 border border-[#CCFF00]/30' 
                      : 'hover:bg-[#111] border border-transparent'
                  }`}
                  onClick={() => onPlaySong?.(track)}
                  onContextMenu={(e) => handleTrackContextMenu(e, track)}
                >
                  {/* Track Number / Playing Indicator */}
                  <div className={`text-sm ${isPlaying ? 'text-[#CCFF00]' : 'text-gray-400'}`}>
                    {isPlaying ? (
                      <Play size={14} fill="#CCFF00" className="text-[#CCFF00]" />
                    ) : (
                      track.track_number || index + 1
                    )}
                  </div>

                  {/* Title */}
                  <div className={`font-medium truncate ${isPlaying ? 'text-[#CCFF00]' : 'text-white'}`}>
                    {track.title}
                  </div>

                  {/* Artist */}
                  <div className={`text-sm truncate ${isPlaying ? 'text-[#CCFF00]' : 'text-[#CCFF00]'}`}>
                    {track.artist?.name || track.artist || album.artist?.name || album.artist}
                  </div>

                  {/* Time */}
                  <div className={`text-sm ${isPlaying ? 'text-[#CCFF00]' : 'text-gray-400'}`}>
                    {formatTime(track.duration || 0)}
                  </div>

                  {/* Favorite */}
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onToggleFavorite?.(e, track.id);
                    }}
                    className={`transition-opacity ${isPlaying ? 'opacity-100' : 'opacity-0 group-hover:opacity-100'}`}
                  >
                    <Heart 
                      size={16} 
                      className={`transition-all hover:scale-125 ${
                        favorites.includes(track.id) 
                          ? 'text-[#FF00FF] fill-[#FF00FF]' 
                          : 'text-gray-400 hover:text-[#FF00FF]'
                      }`}
                    />
                  </button>
                </div>
              );
            })}
          </div>

          {/* Empty State */}
          {(!album.tracks || album.tracks.length === 0) && (
            <div className="text-center py-12 text-gray-500">
              <p>No tracks available</p>
            </div>
          )}
        </div>
      </div>

      {/* Context Menu */}
      {contextMenu && (
        <div
          ref={contextMenuRef}
          className="fixed bg-[#111] border border-[#333] rounded-lg shadow-2xl py-2 min-w-[200px] z-[100]"
          style={{
            left: Math.min(contextMenu.x, window.innerWidth - 220),
            top: Math.min(contextMenu.y, window.innerHeight - 150)
          }}
        >
          <div className="px-3 py-1 text-[10px] text-gray-500 font-mono uppercase tracking-wider border-b border-[#222] mb-1">
            {contextMenu.type === 'album' ? album.title : contextMenu.track?.title}
          </div>

          {/* Add to Playlist */}
          <button
            onClick={() => handleAddToPlaylist(contextMenu.type === 'album' ? 'album' : contextMenu.track)}
            className="w-full flex items-center gap-3 px-4 py-2 text-sm text-gray-300 hover:bg-[#CCFF00] hover:text-black transition-colors"
          >
            <ListPlus size={16} />
            <span>Add to Playlist</span>
          </button>

          {/* Download */}
          {contextMenu.type === 'track' ? (
            <button
              onClick={() => handleDownload(contextMenu.track)}
              className="w-full flex items-center gap-3 px-4 py-2 text-sm text-gray-300 hover:bg-[#CCFF00] hover:text-black transition-colors"
            >
              <Download size={16} />
              <span>Download Track</span>
            </button>
          ) : (
            <button
              onClick={handleDownloadAll}
              className="w-full flex items-center gap-3 px-4 py-2 text-sm text-gray-300 hover:bg-[#CCFF00] hover:text-black transition-colors"
            >
              <Download size={16} />
              <span>Download All ({totalSize} MB)</span>
            </button>
          )}
        </div>
      )}

      {/* Playlist Selection Modal */}
      {showPlaylistModal && (
        <div className="fixed inset-0 bg-black/80 flex items-center justify-center z-[110]">
          <div className="bg-[#111] border border-[#333] rounded-lg w-full max-w-md mx-4 overflow-hidden">
            {/* Modal Header */}
            <div className="flex items-center justify-between px-4 py-3 border-b border-[#222]">
              <h3 className="text-white font-bold">Add to Playlist</h3>
              <button
                onClick={() => {
                  setShowPlaylistModal(false);
                  setTargetForPlaylist(null);
                }}
                className="p-1 hover:bg-[#222] rounded transition-colors"
              >
                <X size={20} className="text-gray-400" />
              </button>
            </div>

            {/* Create New Playlist */}
            <div className="p-4 border-b border-[#222]">
              <div className="flex items-center gap-2">
                <input
                  type="text"
                  placeholder="Create new playlist..."
                  value={newPlaylistName}
                  onChange={(e) => setNewPlaylistName(e.target.value)}
                  className="flex-1 bg-[#050505] border border-[#333] rounded px-3 py-2 text-white text-sm focus:outline-none focus:border-[#CCFF00]"
                />
                <button
                  onClick={handleCreatePlaylistAndAdd}
                  disabled={!newPlaylistName.trim()}
                  className="p-2 bg-[#CCFF00] text-black rounded hover:bg-[#FF00FF] hover:text-white transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  <Plus size={20} />
                </button>
              </div>
            </div>

            {/* Playlist List */}
            <div className="max-h-64 overflow-y-auto">
              {playlists.length > 0 ? (
                playlists.map((playlist) => (
                  <button
                    key={playlist.id}
                    onClick={() => handleSelectPlaylist(playlist)}
                    className="w-full flex items-center gap-3 px-4 py-3 hover:bg-[#1a1a1a] transition-colors text-left"
                  >
                    <FolderPlus size={20} className="text-[#CCFF00]" />
                    <div>
                      <div className="text-white text-sm">{playlist.name}</div>
                      <div className="text-gray-500 text-xs">{playlist.total_tracks || 0} tracks</div>
                    </div>
                  </button>
                ))
              ) : (
                <div className="px-4 py-8 text-center text-gray-500 text-sm">
                  No playlists yet. Create one above!
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      <style>{`
        .custom-scrollbar::-webkit-scrollbar { width: 8px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: #000; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #333; border-radius: 4px; }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover { background: #CCFF00; }
      `}</style>
    </div>
  );
}

export default AlbumDetailPage;
