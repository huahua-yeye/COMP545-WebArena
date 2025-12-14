import { useEffect, useState } from 'react';
import { ExternalLink, Info, ArrowLeft } from 'lucide-react';
import { getAllSongs } from '../services/api';

/**
 * Licenses Page - Shows all music attributions and license information
 * Required for CC BY 4.0 compliance
 */
export function LicensesPage({ onClose }) {
  const [songs, setSongs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchAttributions();
  }, []);

  async function fetchAttributions() {
    try {
      const allSongs = await getAllSongs();
      // Filter songs that require attribution
      const attributedSongs = allSongs.filter(song => song.requires_attribution);
      setSongs(attributedSongs);
    } catch (error) {
      console.error('Error fetching attributions:', error);
      setSongs([]);
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <div className="container mx-auto px-4 py-8 text-center">
        <div className="text-[#CCFF00]">LOADING_LICENSES...</div>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-4 py-8 bg-[#050505] min-h-screen text-white font-mono">
      {/* Header */}
      <div className="mb-8">
        <button
          onClick={onClose}
          className="flex items-center gap-2 text-gray-400 hover:text-[#CCFF00] transition-colors mb-4 text-sm"
        >
          <ArrowLeft size={16} />
          BACK_TO_APP
        </button>
        <h1 className="text-4xl font-black text-white italic tracking-tighter mb-2">
          MUSIC_LICENSES_&_ATTRIBUTION
        </h1>
        <div className="h-1 w-32 bg-gradient-to-r from-[#CCFF00] to-[#FF00FF]"></div>
      </div>

      {/* About Section */}
      <div className="mb-8 p-6 bg-[#0a0a0a] border border-[#333] rounded-lg">
        <div className="flex items-start gap-3">
          <Info size={24} className="text-[#CCFF00] flex-shrink-0 mt-1" />
          <div>
            <h2 className="text-xl font-bold mb-3 text-[#CCFF00]">ABOUT_OUR_MUSIC</h2>
            <p className="text-gray-300 text-sm leading-relaxed mb-3">
              All music on this platform is sourced from{' '}
              <a
                href="https://freemusicarchive.org"
                className="text-[#FF00FF] hover:text-[#CCFF00] transition-colors inline-flex items-center gap-1"
                target="_blank"
                rel="noopener noreferrer"
              >
                Free Music Archive
                <ExternalLink size={12} />
              </a>{' '}
              and is licensed under Creative Commons licenses that allow free use
              with proper attribution.
            </p>
            <p className="text-gray-400 text-xs">
              We respect artists' rights and provide full attribution for all tracks used on this platform.
            </p>
          </div>
        </div>
      </div>

      {/* Songs List */}
      <div className="space-y-4 mb-12">
        <h2 className="text-2xl font-bold text-white mb-4 uppercase tracking-wider">
          ATTRIBUTED_TRACKS ({songs.length})
        </h2>
        {songs.length === 0 ? (
          <div className="text-center py-12 text-gray-500">
            NO_TRACKS_REQUIRING_ATTRIBUTION_FOUND
          </div>
        ) : (
          songs.map((song) => (
            <div
              key={song.id}
              className="bg-[#0a0a0a] border-l-4 border-[#CCFF00] p-4 hover:bg-[#111] transition-colors"
            >
              <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3">
                <div className="flex-1">
                  <h3 className="text-lg font-bold text-white mb-1">
                    "{song.title}"
                  </h3>
                  <p className="text-sm text-gray-400 mb-2">
                    by {song.artist || 'Unknown Artist'}
                  </p>

                  <div className="flex flex-wrap gap-2 mb-3">
                    {song.license && (
                      <span className="text-xs px-2 py-1 bg-[#CCFF00]/20 text-[#CCFF00] border border-[#CCFF00]/30 rounded font-mono">
                        {song.license}
                      </span>
                    )}
                    {song.genre && (
                      <span className="text-xs px-2 py-1 bg-[#FF00FF]/20 text-[#FF00FF] border border-[#FF00FF]/30 rounded font-mono">
                        {song.genre}
                      </span>
                    )}
                  </div>

                  <div className="text-xs text-gray-500 mb-2">
                    <strong className="text-gray-400">ATTRIBUTION:</strong>
                    <div className="text-gray-300 mt-1">{song.attribution}</div>
                  </div>

                  {song.source_url && (
                    <a
                      href={song.source_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-xs text-[#FF00FF] hover:text-[#CCFF00] transition-colors inline-flex items-center gap-1"
                    >
                      VIEW_ON_FREE_MUSIC_ARCHIVE
                      <ExternalLink size={12} />
                    </a>
                  )}
                </div>
              </div>
            </div>
          ))
        )}
      </div>

      {/* License Information */}
      <div className="p-6 bg-[#0a0a0a] border border-[#333] rounded-lg">
        <h2 className="text-2xl font-bold text-white mb-4 uppercase tracking-wider">
          LICENSE_INFORMATION
        </h2>

        <div className="space-y-6">
          {/* CC BY 4.0 */}
          <div className="pb-6 border-b border-[#222]">
            <h3 className="text-lg font-semibold text-[#CCFF00] mb-2">
              Creative Commons Attribution 4.0 International (CC BY 4.0)
            </h3>
            <p className="text-sm text-gray-300 mb-3">
              This license allows you to:
            </p>
            <ul className="list-none space-y-2 text-sm text-gray-400 mb-4">
              <li className="flex items-start gap-2">
                <span className="text-[#CCFF00]">✓</span>
                <span><strong className="text-white">SHARE</strong> — copy and redistribute the material in any medium or format</span>
              </li>
              <li className="flex items-start gap-2">
                <span className="text-[#CCFF00]">✓</span>
                <span><strong className="text-white">ADAPT</strong> — remix, transform, and build upon the material for any purpose, even commercially</span>
              </li>
            </ul>
            <p className="text-sm text-gray-300 mb-3">
              Under the following terms:
            </p>
            <ul className="list-none space-y-2 text-sm text-gray-400 mb-4">
              <li className="flex items-start gap-2">
                <span className="text-[#FF00FF]">⚠</span>
                <span><strong className="text-white">ATTRIBUTION</strong> — You must give appropriate credit, provide a link to the license, and indicate if changes were made.</span>
              </li>
            </ul>
            <a
              href="https://creativecommons.org/licenses/by/4.0/"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 text-sm text-[#FF00FF] hover:text-[#CCFF00] transition-colors"
            >
              READ_FULL_LICENSE
              <ExternalLink size={14} />
            </a>
          </div>

          {/* CC0 */}
          <div>
            <h3 className="text-lg font-semibold text-[#CCFF00] mb-2">
              Creative Commons Zero (CC0 / Public Domain)
            </h3>
            <p className="text-sm text-gray-300 mb-3">
              The person who associated a work with this deed has dedicated the work to the public domain
              by waiving all of his or her rights to the work worldwide under copyright law.
            </p>
            <ul className="list-none space-y-2 text-sm text-gray-400 mb-4">
              <li className="flex items-start gap-2">
                <span className="text-[#CCFF00]">✓</span>
                <span>You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.</span>
              </li>
            </ul>
            <a
              href="https://creativecommons.org/publicdomain/zero/1.0/"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 text-sm text-[#FF00FF] hover:text-[#CCFF00] transition-colors"
            >
              READ_MORE
              <ExternalLink size={14} />
            </a>
          </div>
        </div>
      </div>

      {/* Footer */}
      <div className="mt-12 text-center text-xs text-gray-600">
        <p>This page is maintained to comply with Creative Commons license requirements.</p>
        <p className="mt-2">For questions about licensing, please contact the original artists via their source URLs.</p>
      </div>
    </div>
  );
}

export default LicensesPage;
