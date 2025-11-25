import { useState } from 'react';
import { Info, X, ExternalLink } from 'lucide-react';

/**
 * SongAttributionButton component
 * Shows copyright/attribution info for the current song in the player
 */
export function SongAttributionButton({ song }) {
  const [showModal, setShowModal] = useState(false);

  // If the song does not require attribution, don't render the button
  if (!song || (!song.license && !song.attribution)) {
    return null;
  }

  return (
    <>
      {/* Info Button */}
      <button
        onClick={() => setShowModal(true)}
        className="text-gray-400 hover:text-white transition-colors group relative"
        title="View song attribution"
      >
        <Info size={18} />
        {song.requires_attribution && (
          <div className="absolute -top-1 -right-1 w-2 h-2 bg-[#CCFF00] rounded-full" />
        )}
      </button>

      {/* Modal */}
      {showModal && (
        <div
          className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4"
          onClick={() => setShowModal(false)}
        >
          <div
            className="bg-[#0a0a0a] border border-[#333] rounded-lg max-w-md w-full overflow-hidden"
            onClick={(e) => e.stopPropagation()}
          >
            {/* Header */}
            <div className="flex items-center justify-between p-4 border-b border-[#333]">
              <div className="flex items-center gap-2">
                <Info size={20} className="text-[#CCFF00]" />
                <h2 className="text-lg font-semibold text-white">Song Information</h2>
              </div>
              <button
                onClick={() => setShowModal(false)}
                className="text-gray-400 hover:text-white transition-colors"
              >
                <X size={20} />
              </button>
            </div>

            {/* Content */}
            <div className="p-4">
              {/* Song Details */}
              <div className="mb-4">
                <div className="flex gap-3">
                  {song.cover && (
                    <img
                      src={song.cover}
                      alt={song.title}
                      className="w-16 h-16 rounded object-cover"
                    />
                  )}
                  <div className="flex-1">
                    <h3 className="text-white font-semibold">{song.title}</h3>
                    <p className="text-gray-400 text-sm">{song.artist}</p>
                    {song.album && (
                      <p className="text-gray-500 text-xs">{song.album}</p>
                    )}
                  </div>
                </div>
              </div>

              {/* License Information */}
              {song.license && (
                <div className="mb-4 bg-[#111] rounded p-3 border border-[#222]">
                  <div className="flex items-start justify-between mb-2">
                    <div>
                      <div className="text-xs text-gray-500 mb-1">LICENSE</div>
                      <div className="text-[#CCFF00] font-medium">{song.license}</div>
                    </div>
                    {song.requires_attribution && (
                      <div className="bg-[#CCFF00]/20 text-[#CCFF00] text-xs px-2 py-1 rounded">
                        Attribution Required
                      </div>
                    )}
                  </div>

                  {song.attribution && (
                    <div className="mt-2">
                      <div className="text-xs text-gray-500 mb-1">ATTRIBUTION</div>
                      <div className="text-gray-300 text-sm">{song.attribution}</div>
                    </div>
                  )}

                  {song.source_url && (
                    <div className="mt-3 pt-2 border-t border-[#222]">
                      <a
                        href={song.source_url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-[#FF00FF] hover:text-[#CCFF00] text-sm inline-flex items-center gap-1 transition-colors"
                      >
                        <span>View Source</span>
                        <ExternalLink size={14} />
                      </a>
                    </div>
                  )}
                </div>
              )}

              {/* Additional Info */}
              <div className="grid grid-cols-2 gap-3 text-sm">
                {song.genre && (
                  <div>
                    <div className="text-xs text-gray-500 mb-1">GENRE</div>
                    <div className="text-gray-300">{song.genre}</div>
                  </div>
                )}
                {song.year && (
                  <div>
                    <div className="text-xs text-gray-500 mb-1">YEAR</div>
                    <div className="text-gray-300">{song.year}</div>
                  </div>
                )}
                {song.duration && (
                  <div>
                    <div className="text-xs text-gray-500 mb-1">DURATION</div>
                    <div className="text-gray-300">
                      {Math.floor(song.duration / 60)}:{(song.duration % 60).toString().padStart(2, '0')}
                    </div>
                  </div>
                )}
                {song.quality && (
                  <div>
                    <div className="text-xs text-gray-500 mb-1">QUALITY</div>
                    <div className="text-gray-300">{song.quality}</div>
                  </div>
                )}
              </div>

              {/* License Explanation */}
              {song.requires_attribution && (
                <div className="mt-4 p-3 bg-[#CCFF00]/10 border border-[#CCFF00]/30 rounded text-xs text-gray-400">
                  <strong className="text-[#CCFF00]">Attribution Notice:</strong> This track is licensed under{' '}
                  {song.license} and requires attribution. The attribution is displayed in the footer of this website.
                </div>
              )}
            </div>

            {/* Footer */}
            <div className="p-4 border-t border-[#333]">
              <button
                onClick={() => setShowModal(false)}
                className="w-full py-2 px-4 bg-[#CCFF00] text-black font-semibold rounded hover:bg-[#FF00FF] hover:text-white transition-colors"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export default SongAttributionButton;
