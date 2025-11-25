import { useState } from 'react';
import { Info, X, ExternalLink, ChevronUp, ChevronDown } from 'lucide-react';

/**
 * Footer component - shows music credits and attribution info
 * Used to satisfy CC BY and other license requirements
 */
export function Footer({ songs = [], playlists = [] }) {
  const [isExpanded, setIsExpanded] = useState(false);
  const [showDetails, setShowDetails] = useState(false);

  // Filter songs/playlists that require attribution
  const songsRequiringAttribution = songs.filter(song => song.requires_attribution);
  const playlistsRequiringAttribution = playlists.filter(playlist => playlist.requires_attribution);

  // Merge everything that needs attribution
  const allRequiringAttribution = [
    ...songsRequiringAttribution,
    ...playlistsRequiringAttribution
  ];

  // Group by license
  const groupByLicense = allRequiringAttribution.reduce((acc, item) => {
    const license = item.license || 'Unknown';
    const itemType = item.name ? 'playlist' : 'song'; // playlists use name, songs use title

    if (!acc[license]) {
      acc[license] = {
        items: [],
        attribution: item.attribution,
        sourceUrl: item.source_url
      };
    }
    acc[license].items.push({ ...item, itemType });
    return acc;
  }, {});

  // Hide footer when nothing needs attribution
  if (allRequiringAttribution.length === 0) {
    return null;
  }

  // Build short attribution string
  const getShortAttribution = () => {
    const attributions = [...new Set(allRequiringAttribution.map(s => s.attribution).filter(Boolean))];
    if (attributions.length === 0) return 'Various Artists';
    if (attributions.length === 1) return attributions[0];
    if (attributions.length === 2) return attributions.join(' • ');
    return `${attributions.slice(0, 2).join(' • ')} and ${attributions.length - 2} more`;
  };

  return (
    <div className="border-t border-[#333] bg-[#0a0a0a]">
      {/* Compact mode */}
      {!isExpanded && (
        <div className="flex items-center justify-between px-6 py-2.5 text-xs">
          <div className="flex items-center gap-2 text-gray-400">
            <Info size={14} className="text-[#CCFF00]" />
            <span>Music Credits: {getShortAttribution()}</span>
          </div>
          <div className="flex items-center gap-3">
            <button
              onClick={() => setShowDetails(true)}
              className="text-[#CCFF00] hover:text-[#FF00FF] transition-colors flex items-center gap-1"
            >
              View Full Credits
              <ExternalLink size={12} />
            </button>
            <button
              onClick={() => setIsExpanded(true)}
              className="text-gray-400 hover:text-white transition-colors"
              aria-label="Expand credits"
            >
              <ChevronUp size={16} />
            </button>
          </div>
        </div>
      )}

      {/* Expanded mode */}
      {isExpanded && (
        <div className="px-6 py-4">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-2">
              <Info size={16} className="text-[#CCFF00]" />
              <h3 className="text-sm font-semibold text-white">Music Credits & Attributions</h3>
            </div>
            <button
              onClick={() => setIsExpanded(false)}
              className="text-gray-400 hover:text-white transition-colors"
              aria-label="Collapse credits"
            >
              <ChevronDown size={16} />
            </button>
          </div>

          <div className="space-y-3 text-xs">
            {Object.entries(groupByLicense).map(([license, data]) => (
              <div key={license} className="bg-[#111] rounded p-3 border border-[#222]">
                <div className="flex items-start justify-between mb-2">
                  <div>
                    <div className="text-[#CCFF00] font-medium">{license}</div>
                    <div className="text-gray-400 mt-0.5">{data.attribution}</div>
                  </div>
                  {data.sourceUrl && (
                    <a
                      href={data.sourceUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[#FF00FF] hover:text-[#CCFF00] transition-colors flex items-center gap-1"
                    >
                      <span>Source</span>
                      <ExternalLink size={12} />
                    </a>
                  )}
                </div>
                <div className="text-gray-500 text-xs">
                  {data.items.length} {data.items.length === 1 ? 'item' : 'items'} using this license
                </div>
              </div>
            ))}
          </div>

          <div className="mt-3 pt-3 border-t border-[#222] text-gray-500 text-xs">
            All music used in accordance with their respective licenses.
            {' '}
            <button
              onClick={() => setShowDetails(true)}
              className="text-[#CCFF00] hover:underline"
            >
              View detailed credits
            </button>
          </div>
        </div>
      )}

      {/* Detailed modal */}
      {showDetails && (
        <div className="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-[#0a0a0a] border border-[#333] rounded-lg max-w-2xl w-full max-h-[80vh] overflow-hidden flex flex-col">
            {/* Header */}
            <div className="flex items-center justify-between p-4 border-b border-[#333]">
              <div className="flex items-center gap-2">
                <Info size={20} className="text-[#CCFF00]" />
                <h2 className="text-lg font-bold text-white">Music Credits & Attributions</h2>
              </div>
              <button
                onClick={() => setShowDetails(false)}
                className="text-gray-400 hover:text-white transition-colors"
              >
                <X size={20} />
              </button>
            </div>

            {/* Content */}
            <div className="flex-1 overflow-y-auto p-4">
              <p className="text-sm text-gray-400 mb-4">
                This website uses music under various Creative Commons and free licenses.
                Below is the complete list of attributions as required by the respective licenses.
              </p>

              {Object.entries(groupByLicense).map(([license, data]) => (
                <div key={license} className="mb-6">
                  <div className="bg-[#111] rounded-lg p-4 border border-[#222]">
                    <div className="flex items-start justify-between mb-3">
                      <div>
                        <h3 className="text-[#CCFF00] font-semibold mb-1">{license}</h3>
                        <p className="text-gray-400 text-sm">{data.attribution}</p>
                        {data.sourceUrl && (
                          <a
                            href={data.sourceUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-[#FF00FF] hover:text-[#CCFF00] text-sm mt-1 inline-flex items-center gap-1 transition-colors"
                          >
                            {data.sourceUrl}
                            <ExternalLink size={12} />
                          </a>
                        )}
                      </div>
                    </div>

                    <div className="mt-3 pt-3 border-t border-[#222]">
                      <p className="text-xs text-gray-500 mb-2">
                        Items using this license ({data.items.length}):
                      </p>
                      <div className="grid gap-2">
                        {data.items.map((item, idx) => (
                          <div
                            key={item.id || idx}
                            className="bg-[#0a0a0a] rounded p-2 text-sm"
                          >
                            <div className="flex items-center gap-2">
                              <div className="text-white font-medium">
                                {item.itemType === 'song' ? item.title : item.name}
                              </div>
                              {item.itemType === 'playlist' && (
                                <span className="text-[#CCFF00] text-xs px-1.5 py-0.5 bg-[#CCFF00]/10 rounded">
                                  Playlist
                                </span>
                              )}
                            </div>
                            <div className="text-gray-400 text-xs">
                              {item.itemType === 'song' ? (
                                <>
                                  {item.artist}
                                  {item.album && ` • ${item.album}`}
                                  {item.year && ` • ${item.year}`}
                                </>
                              ) : (
                                <>
                                  {item.description || 'Playlist'}
                                  {item.year && ` • ${item.year}`}
                                </>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  </div>
                </div>
              ))}

              <div className="mt-6 p-4 bg-[#111] rounded-lg border border-[#222]">
                <h3 className="text-white font-semibold mb-2">License Information</h3>
                <div className="space-y-2 text-sm text-gray-400">
                  <div>
                    <strong className="text-[#CCFF00]">CC BY 4.0:</strong> Creative Commons Attribution 4.0 International
                    <br />
                    <a
                      href="https://creativecommons.org/licenses/by/4.0/"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[#FF00FF] hover:underline text-xs"
                    >
                      https://creativecommons.org/licenses/by/4.0/
                    </a>
                  </div>
                  <div>
                    <strong className="text-[#CCFF00]">CC0:</strong> Public Domain Dedication
                    <br />
                    <a
                      href="https://creativecommons.org/publicdomain/zero/1.0/"
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[#FF00FF] hover:underline text-xs"
                    >
                      https://creativecommons.org/publicdomain/zero/1.0/
                    </a>
                  </div>
                </div>
              </div>
            </div>

            {/* Footer */}
            <div className="p-4 border-t border-[#333]">
              <button
                onClick={() => setShowDetails(false)}
                className="w-full py-2 px-4 bg-[#CCFF00] text-black font-semibold rounded hover:bg-[#FF00FF] hover:text-white transition-colors"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default Footer;
