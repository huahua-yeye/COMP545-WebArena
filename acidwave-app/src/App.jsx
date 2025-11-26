import React, { useState, useRef, useEffect } from 'react';
import {
  Home,
  Search,
  Library,
  PlusSquare,
  Heart,
  Play,
  Pause,
  SkipBack,
  SkipForward,
  Repeat,
  Shuffle,
  Volume2,
  Maximize2,
  Mic2,
  ListMusic,
  ChevronLeft,
  ChevronRight,
  ChevronDown,
  Bell,
  Settings,
  Disc,
  Zap,
  Radio,
  Globe,
  Upload,
  X,
  Check,
  Plus,
  Minimize2,
  Share2,
  DownloadCloud,
  Download,
  FileOutput,
  ListPlus,
  ListEnd,
  Square,
  Trash2,
  Users,
  Album,
  Music,
  Star,
  Filter,
  LogOut,
  User,
  Menu
} from 'lucide-react';
import AuthPage from './AuthPage';
import { useSongs, usePlaylists } from './hooks/useAPI';
import { createPlaylist as apiCreatePlaylist, deletePlaylist as apiDeletePlaylist, transformPlaylistData, getAllArtists, addSongToPlaylist } from './services/api';
import LoadingSpinner, { ErrorDisplay } from './components/LoadingSpinner';
import { SongAttributionButton } from './components/SongAttributionButton';
import { AlbumDetailPage } from './components/AlbumDetailPage';
import { ArtistDetailPage } from './components/ArtistDetailPage';

// --- ACID COLOR PALETTE ---
const ACID_GREEN = "#CCFF00";
const ACID_PINK = "#FF00FF";
const DARK_BG = "#050505";
const DEFAULT_ARTIST_IMAGE = "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=300&h=300&fit=crop";

// --- FALLBACK/MOCK DATA (used when API calls fail) ---
const MOCK_SONGS_FALLBACK = [
  {
    id: 1,
    title: "HYPERREALITY",
    artist: "GRIMES",
    album: "ART ANGELS",
    cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop",
    duration: 243,
    quality: "FLAC",
    genre: "GLITCH",
    year: 2015,
    plays: "1.2M",
    rating: 5,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    accent: "border-[#CCFF00]"
  },
  {
    id: 2,
    title: "DIGITAL LOVE",
    artist: "DAFT PUNK",
    album: "DISCOVERY",
    cover: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop",
    duration: 337,
    quality: "MP3 320",
    genre: "TECHNO",
    year: 2001,
    plays: "845K",
    rating: 5,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    accent: "border-[#FF00FF]"
  },
  {
    id: 3,
    title: "NEON GUTS",
    artist: "LIL UZI VERT",
    album: "LUV IS RAGE 2",
    cover: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop",
    duration: 216,
    quality: "MP3 192",
    genre: "VAPOR",
    year: 2017,
    plays: "2.1M",
    rating: 4,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    accent: "border-cyan-400"
  },
  {
    id: 4,
    title: "CHROMATICA",
    artist: "LADY GAGA",
    album: "CHROMATICA",
    cover: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop",
    duration: 200,
    quality: "FLAC 24bit",
    genre: "CYBER",
    year: 2020,
    plays: "560K",
    rating: 4,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
    accent: "border-white"
  },
  {
    id: 5,
    title: "FUTURE NOSTALGIA",
    artist: "DUA LIPA",
    album: "FUTURE NOSTALGIA",
    cover: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop",
    duration: 203,
    quality: "MP3 320",
    genre: "GLITCH",
    year: 2020,
    plays: "3.4M",
    rating: 5,
    url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
    accent: "border-[#CCFF00]"
  },
  { id: 6, title: "STORIES FROM EMONA I", artist: "MAYA FILIPIČ", album: "BETWEEN TWO WORLDS", duration: 209, quality: "MP3 185", genre: "AMBIENT", year: 2010, plays: "12K", rating: 3, cover: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop", url: "" },
  { id: 7, title: "DANIEL", artist: "NATASHA BELLER", album: "FAIRYTALE", duration: 244, quality: "MP3 192", genre: "ACID", year: 2018, plays: "45K", rating: 4, cover: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop", url: "" },
  { id: 8, title: "GHOST IN THE SHELL", artist: "KENJI KAWAI", album: "OST", duration: 310, quality: "FLAC", genre: "CYBER", year: 1995, plays: "900K", rating: 5, cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop", url: "" },
  { id: 9, title: "ACID RAIN", artist: "LORN", album: "THE MAZE TO NOWHERE", duration: 180, quality: "WAV", genre: "GLITCH", year: 2015, plays: "150K", rating: 5, cover: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop", url: "" },
  { id: 10, title: "XENOMORPH", artist: "GESTAFFELSTEIN", album: "ALEPH", duration: 250, quality: "FLAC", genre: "TECHNO", year: 2013, plays: "300K", rating: 4, cover: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop", url: "" },
  { id: 11, title: "CYBERPUNK DREAMS", artist: "SYNTHWAVE COLLECTIVE", album: "NEON NIGHTS", duration: 267, quality: "MP3 320", genre: "TECHNO", year: 2019, plays: "678K", rating: 4, cover: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop", url: "" },
  { id: 12, title: "ELECTRIC SHEEP", artist: "BLADE RUNNER", album: "ANDROID DREAMS", duration: 189, quality: "FLAC", genre: "AMBIENT", year: 2017, plays: "234K", rating: 5, cover: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop", url: "" },
  { id: 13, title: "MATRIX RELOADED", artist: "DIGITAL BEINGS", album: "VIRTUAL REALITY", duration: 298, quality: "MP3 192", genre: "GLITCH", year: 2021, plays: "1.5M", rating: 5, cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop", url: "" },
  { id: 14, title: "NEON TOKYO", artist: "CYBER PUNK", album: "NIGHT CITY", duration: 223, quality: "WAV", genre: "VAPOR", year: 2018, plays: "890K", rating: 4, cover: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop", url: "" },
  { id: 15, title: "QUANTUM LEAP", artist: "TIME TRAVELER", album: "PARADOX", duration: 312, quality: "FLAC 24bit", genre: "TECHNO", year: 2020, plays: "445K", rating: 5, cover: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop", url: "" },
  { id: 16, title: "HOLOGRAPHIC LOVE", artist: "VIRTUAL ROMANCE", album: "DIGITAL HEARTS", duration: 256, quality: "MP3 320", genre: "CYBER", year: 2019, plays: "723K", rating: 4, cover: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop", url: "" },
  { id: 17, title: "SYNTH WAVE SUNSET", artist: "RETRO FUTURE", album: "80S REVIVAL", duration: 234, quality: "MP3 192", genre: "ACID", year: 2016, plays: "567K", rating: 4, cover: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop", url: "" },
  { id: 18, title: "BINARY SUNSET", artist: "STAR WARS", album: "FORCE AWAKENS", duration: 278, quality: "FLAC", genre: "AMBIENT", year: 2015, plays: "1.8M", rating: 5, cover: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop", url: "" },
  { id: 19, title: "PIXEL PERFECT", artist: "8BIT WARRIORS", album: "CHIPTUNE MADNESS", duration: 198, quality: "WAV", genre: "GLITCH", year: 2014, plays: "234K", rating: 3, cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop", url: "" },
  { id: 20, title: "LASER GRID", artist: "TRON LEGACY", album: "GRID WARS", duration: 289, quality: "MP3 320", genre: "TECHNO", year: 2010, plays: "956K", rating: 5, cover: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop", url: "" },
  { id: 21, title: "CHROME HEARTS", artist: "METALLIC DREAMS", album: "STEEL EMOTIONS", duration: 245, quality: "FLAC", genre: "VAPOR", year: 2022, plays: "412K", rating: 4, cover: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop", url: "" },
  { id: 22, title: "DATA STREAM", artist: "NETWORK GHOST", album: "PROTOCOL 7", duration: 267, quality: "MP3 192", genre: "CYBER", year: 2021, plays: "678K", rating: 4, cover: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop", url: "" },
  { id: 23, title: "NEON PULSE", artist: "CITY LIGHTS", album: "URBAN GLOW", duration: 221, quality: "FLAC 24bit", genre: "ACID", year: 2019, plays: "534K", rating: 5, cover: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop", url: "" },
  { id: 24, title: "VIRTUAL VORTEX", artist: "DIMENSION X", album: "PARALLEL UNIVERSE", duration: 301, quality: "WAV", genre: "GLITCH", year: 2020, plays: "789K", rating: 5, cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop", url: "" },
  { id: 25, title: "COSMIC RAY", artist: "SPACE ODYSSEY", album: "STELLAR WINDS", duration: 278, quality: "MP3 320", genre: "AMBIENT", year: 2018, plays: "1.2M", rating: 4, cover: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop", url: "" },
  { id: 26, title: "TERMINAL VELOCITY", artist: "SPEED DEMONS", album: "MAXIMUM OVERDRIVE", duration: 234, quality: "FLAC", genre: "TECHNO", year: 2017, plays: "645K", rating: 4, cover: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop", url: "" },
  { id: 27, title: "DIGITAL RAIN", artist: "MATRIX CODE", album: "GREEN CASCADE", duration: 256, quality: "MP3 192", genre: "GLITCH", year: 2016, plays: "892K", rating: 5, cover: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop", url: "" },
  { id: 28, title: "MIDNIGHT RUNNER", artist: "BLADE RUNNER 2049", album: "NEO NOIR", duration: 289, quality: "FLAC 24bit", genre: "VAPOR", year: 2022, plays: "1.1M", rating: 5, cover: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop", url: "" },
  { id: 29, title: "FRACTAL DREAMS", artist: "MATHEMATICAL MINDS", album: "INFINITE PATTERNS", duration: 312, quality: "WAV", genre: "AMBIENT", year: 2021, plays: "456K", rating: 4, cover: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop", url: "" },
  { id: 30, title: "NEON SAMURAI", artist: "TOKYO NIGHTS", album: "CYBER WARRIOR", duration: 243, quality: "MP3 320", genre: "CYBER", year: 2020, plays: "723K", rating: 5, cover: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop", url: "" },
];

const MOCK_ARTISTS = [
  { id: 1, name: "GRIMES", image: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop" },
  { id: 2, name: "DAFT PUNK", image: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop" },
  { id: 3, name: "LIL UZI VERT", image: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop" },
  { id: 4, name: "LADY GAGA", image: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop" },
  { id: 5, name: "DUA LIPA", image: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop" },
  { id: 6, name: "THE WEEKND", image: "https://images.unsplash.com/photo-1614680376593-902f74cf0d41?w=300&h=300&fit=crop" },
  { id: 7, name: "TAME IMPALA", image: "https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?w=300&h=300&fit=crop" },
  { id: 8, name: "KANYE WEST", image: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop" },
  { id: 9, name: "APHEX TWIN", image: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=300&h=300&fit=crop" },
  { id: 10, name: "SOPHIE", image: "https://images.unsplash.com/photo-1483412033650-1015ddeb83d1?w=300&h=300&fit=crop" },
  { id: 11, name: "SYNTHWAVE COLLECTIVE", image: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop" },
  { id: 12, name: "BLADE RUNNER", image: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop" },
  { id: 13, name: "DIGITAL BEINGS", image: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop" },
  { id: 14, name: "CYBER PUNK", image: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop" },
  { id: 15, name: "TIME TRAVELER", image: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop" },
  { id: 16, name: "VIRTUAL ROMANCE", image: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop" },
  { id: 17, name: "RETRO FUTURE", image: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop" },
  { id: 18, name: "STAR WARS", image: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop" },
  { id: 19, name: "8BIT WARRIORS", image: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop" },
  { id: 20, name: "TRON LEGACY", image: "https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop" },
  { id: 21, name: "METALLIC DREAMS", image: "https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop" },
  { id: 22, name: "NETWORK GHOST", image: "https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop" },
  { id: 23, name: "CITY LIGHTS", image: "https://images.unsplash.com/photo-1514525253440-b39345208668?w=300&h=300&fit=crop" },
  { id: 24, name: "DIMENSION X", image: "https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop" },
  { id: 25, name: "SPACE ODYSSEY", image: "https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop" },
];

const MOCK_LYRICS = [
  { time: 0, text: "[INITIALIZING_AUDIO_STREAM]" },
  { time: 5, text: "SYSTEM_CHECK... OK" },
  { time: 10, text: "LOADING_VIRTUAL_REALITY..." },
  { time: 14, text: "WAITING_IN_THE_CAR" },
  { time: 18, text: "WAITING_FOR_A_RIDE_IN_THE_DARK" },
  { time: 25, text: "THE_NIGHT_CITY_GROWS" },
  { time: 30, text: "LOOK_AND_SEE_HER_EYES_THEY_GLOW" },
  { time: 38, text: "[DATA_CORRUPTION_DETECTED]" },
  { time: 45, text: "DRIVING_DOWN_THE_STREET" },
  { time: 52, text: "LOOKING_FOR_A_SOUND_THAT_IS_SWEET" },
  { time: 60, text: "[SYNTH_SOLO_SEQUENCE_START]" },
  { time: 70, text: "01001000 01001001" },
  { time: 85, text: "THE_CITY_IS_MY_CHURCH" },
  { time: 92, text: "IT_WRAPS_ME_IN_THE_BLINDING_TWILIGHT" },
  { time: 100, text: "WAITING_FOR_THE_SIGNAL" },
  { time: 110, text: "TO_UPLOAD_MY_CONSCIOUSNESS" },
];

const CATEGORIES = [
  { id: 1, name: "GLITCH", bg: "bg-[#CCFF00] text-black" },
  { id: 2, name: "VAPOR", bg: "bg-gradient-to-r from-pink-500 to-purple-500 text-white" },
  { id: 3, name: "CYBER", bg: "bg-black border border-[#CCFF00] text-[#CCFF00]" },
  { id: 4, name: "TECHNO", bg: "bg-gray-800 text-white" },
  { id: 5, name: "ACID", bg: "bg-white text-black" },
  { id: 6, name: "AMBIENT", bg: "bg-gradient-to-b from-gray-900 to-black text-white border border-gray-700" },
];

const INITIAL_PLAYLISTS = [
  "LIQUID_METAL_MIX", "NEURO_FUNK", "Y2K_REVIVAL", "DATA_MOSHR"
];

// --- COMPONENTS ---

// ADDED: ToolButton Component (was missing in error logs)
const ToolButton = ({ icon: Icon, label }) => (
  <button className="flex items-center gap-2 text-gray-400 hover:text-[#CCFF00] transition-colors group text-xs font-bold tracking-wider">
    <Icon size={16} className="group-hover:scale-110 transition-transform" />
    <span className="uppercase">{label}</span>
  </button>
);

// Pagination Component
const Pagination = ({ currentPage, totalPages, onPageChange }) => {
  const getPageNumbers = () => {
    const pages = [];
    const showEllipsis = totalPages > 7;

    if (!showEllipsis) {
      for (let i = 1; i <= totalPages; i++) {
        pages.push(i);
      }
    } else {
      if (currentPage <= 3) {
        pages.push(1, 2, 3, 4, '...', totalPages);
      } else if (currentPage >= totalPages - 2) {
        pages.push(1, '...', totalPages - 3, totalPages - 2, totalPages - 1, totalPages);
      } else {
        pages.push(1, '...', currentPage - 1, currentPage, currentPage + 1, '...', totalPages);
      }
    }
    return pages;
  };

  if (totalPages <= 1) return null;

  return (
    <div className="flex items-center justify-center gap-2 mt-8 pb-4">
      <button
        onClick={() => onPageChange(currentPage - 1)}
        disabled={currentPage === 1}
        className={`px-3 py-2 border border-[#333] font-mono text-xs font-bold transition-all ${
          currentPage === 1
            ? 'text-gray-700 cursor-not-allowed'
            : 'text-gray-400 hover:border-[#CCFF00] hover:text-[#CCFF00]'
        }`}
      >
        <ChevronLeft size={14} />
      </button>

      {getPageNumbers().map((page, idx) => (
        page === '...' ? (
          <span key={`ellipsis-${idx}`} className="px-2 text-gray-700">...</span>
        ) : (
          <button
            key={page}
            onClick={() => onPageChange(page)}
            className={`px-4 py-2 border font-mono text-xs font-bold transition-all ${
              currentPage === page
                ? 'bg-[#CCFF00] text-black border-[#CCFF00] shadow-[0_0_10px_#CCFF00]'
                : 'border-[#333] text-gray-400 hover:border-[#CCFF00] hover:text-[#CCFF00]'
            }`}
          >
            {page}
          </button>
        )
      ))}

      <button
        onClick={() => onPageChange(currentPage + 1)}
        disabled={currentPage === totalPages}
        className={`px-3 py-2 border border-[#333] font-mono text-xs font-bold transition-all ${
          currentPage === totalPages
            ? 'text-gray-700 cursor-not-allowed'
            : 'text-gray-400 hover:border-[#CCFF00] hover:text-[#CCFF00]'
        }`}
      >
        <ChevronRight size={14} />
      </button>
    </div>
  );
};

const ChromeButton = ({ children, onClick, className = "", active = false }) => (
  <button 
    onClick={onClick}
    className={`
      relative px-4 py-2 font-bold text-sm uppercase tracking-widest transition-all
      border border-transparent hover:scale-105 active:scale-95
      ${active 
        ? `bg-[#CCFF00] text-black shadow-[0_0_15px_#CCFF00]` 
        : `bg-gradient-to-b from-gray-100 via-gray-300 to-gray-400 text-black hover:brightness-110`
      }
      clip-path-slant
      ${className}
    `}
    style={{ clipPath: 'polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%)' }}
  >
    {children}
  </button>
);

// Horizontal Card (Used in Home)
const HorizontalCard = ({ song, onClick, isCurrent }) => (
  <div 
    onClick={() => onClick(song)}
    className={`
      flex items-center border border-[#333] bg-black cursor-pointer transition-all group h-24 w-full
      hover:border-[#CCFF00] hover:bg-[#0a0a0a] overflow-hidden
      ${isCurrent ? 'border-[#CCFF00] bg-[#0a0a0a]' : ''}
    `}
  >
    <div className="h-full aspect-square relative border-r border-[#333] group-hover:border-[#CCFF00] transition-colors flex-shrink-0">
      <img src={song.cover} alt={song.title} className="w-full h-full object-cover saturate-50 group-hover:saturate-100 transition-all" />
      {isCurrent && (
        <div className="absolute inset-0 bg-[#CCFF00]/20 flex items-center justify-center">
           <Zap size={24} className="text-[#CCFF00] animate-pulse" fill="#CCFF00" />
        </div>
      )}
    </div>
    <div className="flex-1 px-6 flex items-center justify-start h-full">
      <h3 className={`text-lg font-bold font-mono tracking-wider truncate uppercase ${isCurrent ? 'text-[#CCFF00]' : 'text-gray-300'} group-hover:text-white`}>
        {song.title}
      </h3>
    </div>
  </div>
);

// Vertical Song Card (Used in Albums)
const SongCard = ({ song, onClick, onAlbumClick, isCurrent }) => (
  <div
    onClick={() => onAlbumClick?.(song)}
    className={`
      group relative cursor-pointer transition-all duration-300
      ${isCurrent ? 'scale-105' : 'hover:scale-105'}
    `}
  >
    <div className={`absolute -inset-0.5 bg-gradient-to-r from-[#CCFF00] to-[#FF00FF] opacity-0 group-hover:opacity-100 blur transition duration-200 ${isCurrent ? 'opacity-100' : ''}`}></div>
    <div className="relative bg-black border border-gray-800 p-2 h-full flex flex-col">
      <div className="relative aspect-square overflow-hidden mb-2 transition-all duration-500">
        <img src={song.cover} alt={song.title} className="w-full h-full object-cover saturate-50 group-hover:saturate-100" />
        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/black-scales.png')] opacity-30 mix-blend-overlay"></div>
        {isCurrent && (
           <div className="absolute inset-0 flex items-center justify-center bg-black/50 backdrop-blur-sm border-2 border-[#CCFF00]">
             <Zap size={32} className="text-[#CCFF00] animate-pulse" fill="#CCFF00" />
           </div>
        )}
        {/* Play button overlay */}
        <button
          onClick={(e) => {
            e.stopPropagation();
            onClick(song);
          }}
          className="absolute inset-0 flex items-center justify-center bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity"
        >
          <div className="w-12 h-12 rounded-full bg-[#CCFF00] flex items-center justify-center hover:scale-110 transition-transform">
            <Play size={20} fill="black" className="text-black ml-0.5" />
          </div>
        </button>
      </div>
      <div className="mt-auto">
        <h3 className={`font-mono font-bold text-sm truncate ${isCurrent ? 'text-[#CCFF00]' : 'text-gray-200'} group-hover:text-white`}>{song.title}</h3>
        <p className="font-mono text-[10px] text-gray-500 truncate uppercase">{song.artist}</p>
      </div>
    </div>
  </div>
);

const CategoryCard = ({ category }) => (
  <div className={`
    ${category.bg} p-4 h-32 relative overflow-hidden cursor-pointer group border border-transparent hover:border-white transition-all
  `}>
    <h3 className="text-3xl font-black italic tracking-tighter absolute bottom-2 left-2 transform group-hover:-translate-y-1 transition-transform mix-blend-difference">{category.name}</h3>
    <div className="absolute top-2 right-2 opacity-50">
      <Globe size={32} className="animate-spin-slow" strokeWidth={1} />
    </div>
    <div className="absolute inset-0 border-2 border-transparent group-hover:border-white/50 pointer-events-none"></div>
  </div>
);

const formatTime = (seconds) => {
  if (!seconds) return "0:00";
  const mins = Math.floor(seconds / 60);
  const secs = Math.floor(seconds % 60);
  return `${mins}:${secs < 10 ? '0' : ''}${secs}`;
};

// --- MAIN APP COMPONENT ---

export default function App() {
  // Auth State
  const [currentUser, setCurrentUser] = useState(null);
  const [showAuthPage, setShowAuthPage] = useState(false);
  
  // Mobile Sidebar State
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  // API Data Hooks
  const { data: apiSongs, loading: songsLoading, error: songsError, execute: reloadSongs } = useSongs();
  const { data: apiPlaylists, setData: setApiPlaylists } = usePlaylists();

  // Use API data when available, otherwise fall back to mock data
  const MOCK_SONGS = React.useMemo(() => {
    return apiSongs && apiSongs.length > 0 ? apiSongs : MOCK_SONGS_FALLBACK;
  }, [apiSongs]);

  // Define MOCK_PLAYLIST_TRACKS after MOCK_SONGS is available
  const MOCK_PLAYLIST_TRACKS = MOCK_SONGS;

  // State to store playlist tracks (can be modified by removing songs)
  const [playlistTracks, setPlaylistTracks] = useState({});

  const [currentView, setCurrentView] = useState('albums');
  const [selectedPlaylist, setSelectedPlaylist] = useState(null);
  const [selectedAlbum, setSelectedAlbum] = useState(null);
  const [showAlbumDetail, setShowAlbumDetail] = useState(false);
  
  // Artist Detail State
  const [artists, setArtists] = useState(MOCK_ARTISTS);
  const [artistsLoading, setArtistsLoading] = useState(false);
  const [artistsError, setArtistsError] = useState(null);
  const [selectedArtistId, setSelectedArtistId] = useState(null);
  const [selectedArtistInfo, setSelectedArtistInfo] = useState(null);
  const [showArtistDetail, setShowArtistDetail] = useState(false);
  const [isPlaylistOpen, setIsPlaylistOpen] = useState(true);
  const [currentSong, setCurrentSong] = useState(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [volume, setVolume] = useState(0.5);
  const [progress, setProgress] = useState(0);
  const [duration, setDuration] = useState(0);
  const [activeLyricIndex, setActiveLyricIndex] = useState(0);

  // Playlist State
  const [playlists, setPlaylists] = useState(apiPlaylists && apiPlaylists.length > 0 ? apiPlaylists.map(p => p.name) : INITIAL_PLAYLISTS);
  const [newPlaylistName, setNewPlaylistName] = useState("");
  const [contextMenu, setContextMenu] = useState(null);
  const [playlistTrackMenu, setPlaylistTrackMenu] = useState(null); // { x, y, track, playlistName }

  // Sync API playlists to local state
  useEffect(() => {
    if (apiPlaylists && apiPlaylists.length > 0) {
      setPlaylists(apiPlaylists.map(p => p.name));
    }
  }, [apiPlaylists]);

  // Favorites
  const [favorites, setFavorites] = useState([]);

  // Filters
  const [albumFilter, setAlbumFilter] = useState('ALL');
  const [songsGenreFilter, setSongsGenreFilter] = useState('ALL');
  const [songsSearchQuery, setSongsSearchQuery] = useState('');
  const [artistsSearchQuery, setArtistsSearchQuery] = useState('');

  // Pagination State
  const [albumsPage, setAlbumsPage] = useState(1);
  const [songsPage, setSongsPage] = useState(1);
  const [artistsPage, setArtistsPage] = useState(1);
  const [playlistPage, setPlaylistPage] = useState(1);

  const ALBUMS_PER_PAGE = 10;
  const SONGS_PER_PAGE = 20;
  const ARTISTS_PER_PAGE = 10;
  const PLAYLIST_ITEMS_PER_PAGE = 20;

  const audioRef = useRef(null);
  const lyricsContainerRef = useRef(null);

  // Check for logged in user on mount
  useEffect(() => {
    const savedUser = localStorage.getItem('acidwave_current_user');
    if (savedUser) {
      setCurrentUser(JSON.parse(savedUser));
    }
  }, []);

  // Set default song
  useEffect(() => {
    if (!currentSong && MOCK_SONGS.length > 0) {
      setCurrentSong(MOCK_SONGS[0]);
    }
  }, [MOCK_SONGS, currentSong]);

  // Fetch artists from backend and fall back to mock data
  useEffect(() => {
    const loadArtists = async () => {
      try {
        setArtistsLoading(true);
        setArtistsError(null);
        // 添加 include_albums=true 参数，直接获取专辑数据，避免打开详情页时再请求
        const response = await getAllArtists({ limit: 200, include_albums: 'true' });
        const apiArtists = Array.isArray(response) ? response : response?.data || [];

        if (apiArtists.length > 0) {
          const normalized = apiArtists.map((artist) => ({
            id: artist.id,
            name: artist.name,
            image: artist.avatar_url || artist.image || DEFAULT_ARTIST_IMAGE,
            genres: artist.genres || [],
            country: artist.country,
            bio: artist.bio,
            // 保存完整的 albums 数组（如果有的话）
            albums: Array.isArray(artist.albums) ? artist.albums : [],
            albumCount: Array.isArray(artist.albums) ? artist.albums.length : (artist.albums?.[0]?.count ?? 0),
            songCount: artist.songs?.[0]?.count ?? artist.songs?.count ?? 0,
            website: artist.website_url || artist.website,
            social_links: artist.social_links || artist.socialLinks
          }));
          setArtists(normalized);
        } else {
          setArtists(MOCK_ARTISTS);
        }
      } catch (err) {
        console.error('Failed to fetch artists:', err);
        setArtistsError('Failed to load artists from server; using offline data.');
        setArtists(MOCK_ARTISTS);
      } finally {
        setArtistsLoading(false);
      }
    };

    loadArtists();
  }, []);


  // Auth handlers
  const handleLogin = (user) => {
    setCurrentUser(user);
    localStorage.setItem('acidwave_current_user', JSON.stringify(user));
    setShowAuthPage(false);
  };

  const handleLogout = () => {
    setCurrentUser(null);
    localStorage.removeItem('acidwave_current_user');
  };

  useEffect(() => { if (audioRef.current) audioRef.current.volume = volume; }, [volume]);
  useEffect(() => {
    if (isPlaying) audioRef.current?.play().catch(() => {});
    else audioRef.current?.pause();
  }, [isPlaying, currentSong]);

  useEffect(() => {
    const handleClick = () => {
      setContextMenu(null);
      setPlaylistTrackMenu(null);
    };
    window.addEventListener('click', handleClick);
    return () => window.removeEventListener('click', handleClick);
  }, []);

  const handleTimeUpdate = () => {
    if (audioRef.current) {
      const currentTime = audioRef.current.currentTime;
      setProgress(currentTime);
      setDuration(audioRef.current.duration || 0);
      const index = MOCK_LYRICS.findIndex((lyric, i) => {
        const nextTime = MOCK_LYRICS[i + 1]?.time || Infinity;
        return currentTime >= lyric.time && currentTime < nextTime;
      });
      if (index !== -1 && index !== activeLyricIndex) setActiveLyricIndex(index);
    }
  };

  useEffect(() => {
    if (currentView === 'lyrics' && lyricsContainerRef.current) {
      const activeElement = document.getElementById(`lyric-${activeLyricIndex}`);
      if (activeElement) activeElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  }, [activeLyricIndex, currentView]);

  const handleSeek = (e) => {
    const time = parseFloat(e.target.value);
    audioRef.current.currentTime = time;
    setProgress(time);
  };
  const playSong = (song) => { setCurrentSong(song); setIsPlaying(true); };
  const togglePlay = () => setIsPlaying(!isPlaying);
  const skipNext = () => {
    if (!currentSong) return;
    const idx = MOCK_SONGS.findIndex(s => s.id === currentSong.id);
    playSong(MOCK_SONGS[(idx + 1) % MOCK_SONGS.length]);
  };
  const skipPrev = () => {
    if (!currentSong) return;
    const idx = MOCK_SONGS.findIndex(s => s.id === currentSong.id);
    playSong(MOCK_SONGS[(idx - 1 + MOCK_SONGS.length) % MOCK_SONGS.length]);
  };
  const closeLyrics = () => { setCurrentView('albums'); }; 
  
  const handleCreatePlaylist = async () => {
    if (newPlaylistName.trim()) {
      try {
        // Attempt to create playlist via API
        const newPlaylist = await apiCreatePlaylist({
          name: newPlaylistName.trim(),
          description: 'User created playlist',
          cover_url: 'https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=500',
          is_public: true
        });

        // Update local state
        setPlaylists([...playlists, newPlaylistName.trim()]);
        if (setApiPlaylists && apiPlaylists) {
          setApiPlaylists([...apiPlaylists, transformPlaylistData(newPlaylist)]);
        }
      } catch (error) {
        console.error('Failed to create playlist:', error);
        // Also create locally even if API fails
        setPlaylists([...playlists, newPlaylistName.trim()]);
      }

      setNewPlaylistName("");
      setCurrentView('library');
      setIsPlaylistOpen(true);
    }
  };

  const openPlaylist = (name) => {
    setSelectedPlaylist(name);
    setCurrentView('playlist-detail');
    
    // Initialize playlist tracks if not already initialized
    if (!playlistTracks[name]) {
      setPlaylistTracks({
        ...playlistTracks,
        [name]: [...MOCK_PLAYLIST_TRACKS]
      });
    }
  }

  const handleContextMenu = (e, playlist) => {
    e.preventDefault(); 
    setContextMenu({ x: e.pageX, y: e.pageY, playlist });
  };

  const handleDeletePlaylist = async () => {
    if (contextMenu?.playlist) {
      try {
        // Try to find playlist ID if API data is available
        const playlistObj = apiPlaylists?.find(p => p.name === contextMenu.playlist);
        if (playlistObj) {
          await apiDeletePlaylist(playlistObj.id);
        }
      } catch (error) {
        console.error('Failed to delete playlist:', error);
      }

      // Update local state
      setPlaylists(playlists.filter(p => p !== contextMenu.playlist));
      if (selectedPlaylist === contextMenu.playlist) {
        setCurrentView('library');
        setSelectedPlaylist(null);
      }
      setContextMenu(null);
    }
  };

  const toggleFavorite = (e, songId) => {
    e.stopPropagation();
    if (favorites.includes(songId)) {
      setFavorites(favorites.filter(id => id !== songId));
    } else {
      setFavorites([...favorites, songId]);
    }
  };

  // Handle opening album detail page
  const handleOpenAlbumDetail = (song) => {
    // Group songs by album to create album object
    const albumSongs = MOCK_SONGS.filter(s => s.album === song.album && s.artist === song.artist);

    const albumObj = {
      id: song.albumData?.id || `album-${song.album}`,
      title: song.album,
      artist: song.artistData || song.artist,
      cover_url: song.cover,
      release_date: song.year ? `${song.year}-01-01` : null,
      genre: song.genre,
      total_tracks: albumSongs.length,
      duration: albumSongs.reduce((sum, s) => sum + (s.duration || 0), 0),
      tracks: albumSongs.map((s, index) => ({
        ...s,
        track_number: s.track_number || index + 1
      })),
      license: song.license,
      attribution: song.attribution,
      source_url: song.source_url,
      requires_attribution: song.requires_attribution,
      rating: song.rating || 4
    };

    setSelectedAlbum(albumObj);
    setShowAlbumDetail(true);
  };

  // Handle opening artist detail page
  const handleOpenArtistDetail = (artist) => {
    setSelectedArtistId(artist.id);
    setSelectedArtistInfo({
      ...artist,
      top_songs: artist.top_songs || [],
      albums: artist.albums || []
    });
    setShowArtistDetail(true);
  };


  // Handle playing album
  const handlePlayAlbum = (tracks) => {
    if (tracks && tracks.length > 0) {
      playSong(tracks[0]);
      // TODO: Add queue management to play all tracks
    }
  };

  const getFilteredAlbums = () => {
    let filtered;
    switch (albumFilter) {
      case 'RECENTLY_PLAYED': filtered = MOCK_SONGS.slice(0, 3); break;
      case 'RECENTLY_ADDED': filtered = [...MOCK_SONGS].reverse(); break;
      case 'ALL': default: filtered = MOCK_SONGS; break;
    }
    const start = (albumsPage - 1) * ALBUMS_PER_PAGE;
    const end = start + ALBUMS_PER_PAGE;
    return {
      items: filtered.slice(start, end),
      total: filtered.length,
      totalPages: Math.ceil(filtered.length / ALBUMS_PER_PAGE)
    };
  };

  const getFilteredSongs = () => {
    let filtered = MOCK_SONGS;
    if (songsGenreFilter !== 'ALL') {
      filtered = filtered.filter(s => s.genre === songsGenreFilter);
    }
    if (songsSearchQuery) {
      const q = songsSearchQuery.toLowerCase();
      filtered = filtered.filter(s =>
        s.title.toLowerCase().includes(q) ||
        s.artist.toLowerCase().includes(q) ||
        s.album.toLowerCase().includes(q)
      );
    }
    const start = (songsPage - 1) * SONGS_PER_PAGE;
    const end = start + SONGS_PER_PAGE;
    return {
      items: filtered.slice(start, end),
      total: filtered.length,
      totalPages: Math.ceil(filtered.length / SONGS_PER_PAGE)
    };
  };

  const getFilteredArtists = () => {
    let filtered = artists;
    if (artistsSearchQuery) {
      const q = artistsSearchQuery.toLowerCase();
      filtered = filtered.filter(artist => artist.name.toLowerCase().includes(q));
    }
    const start = (artistsPage - 1) * ARTISTS_PER_PAGE;
    const end = start + ARTISTS_PER_PAGE;
    return {
      items: filtered.slice(start, end),
      total: filtered.length,
      totalPages: Math.ceil(filtered.length / ARTISTS_PER_PAGE)
    };
  };

  // Get songs for favorites view
  const getFavorites = () => {
    return MOCK_SONGS.filter(song => favorites.includes(song.id));
  };

  // Get paginated playlist tracks
  const getPlaylistTracks = () => {
    // Get tracks for the selected playlist, or default to all songs
    const tracks = playlistTracks[selectedPlaylist] || MOCK_PLAYLIST_TRACKS;
    const start = (playlistPage - 1) * PLAYLIST_ITEMS_PER_PAGE;
    const end = start + PLAYLIST_ITEMS_PER_PAGE;
    return {
      items: tracks.slice(start, end),
      total: tracks.length,
      totalPages: Math.ceil(tracks.length / PLAYLIST_ITEMS_PER_PAGE)
    };
  };

  return (
    <div className="h-screen w-full bg-[#050505] text-gray-300 font-mono flex flex-col overflow-hidden selection:bg-[#CCFF00] selection:text-black">
      
      <div className="fixed inset-0 pointer-events-none opacity-[0.03] z-[100]" style={{ backgroundImage: `url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noiseFilter'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noiseFilter)'/%3E%3C/svg%3E")` }}></div>

      {contextMenu && (
        <div 
          className="fixed z-[9999] bg-black border border-[#CCFF00] shadow-[4px_4px_0_0_#CCFF00] min-w-[160px]"
          style={{ top: contextMenu.y, left: contextMenu.x }}
          onClick={(e) => e.stopPropagation()}
        >
          <div className="px-3 py-2 border-b border-[#333] text-[10px] text-gray-500 font-bold uppercase tracking-widest">
            {contextMenu.playlist}
          </div>
          <button 
            onClick={handleDeletePlaylist}
            className="flex items-center gap-2 w-full p-3 hover:bg-[#CCFF00] hover:text-black text-[#FF00FF] text-xs font-bold font-mono transition-colors text-left"
          >
            <Trash2 size={14} /> DELETE_SEQUENCE
          </button>
        </div>
      )}

      <div className="flex-1 flex overflow-hidden relative z-10">
        
        {/* Mobile Sidebar Overlay */}
        {isSidebarOpen && (
          <div 
            className="fixed inset-0 bg-black/80 backdrop-blur-sm z-40 lg:hidden"
            onClick={() => setIsSidebarOpen(false)}
          />
        )}
        
        {/* --- LEFT SIDEBAR --- */}
        <div className={`
          w-64 bg-black flex flex-col shrink-0 border-r border-[#333]
          fixed lg:relative inset-y-0 left-0 z-50
          transform transition-transform duration-300 ease-in-out
          ${isSidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'}
        `}>
          <div className="h-20 flex items-center justify-center border-b border-[#333] bg-[#0a0a0a] relative overflow-hidden group">
             <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/10 to-transparent -translate-x-full group-hover:translate-x-full transition-transform duration-1000"></div>
             <h1 className="text-3xl font-black italic tracking-tighter text-white" style={{ textShadow: '2px 2px 0px #CCFF00' }}>ACID<span className="text-transparent bg-clip-text bg-gradient-to-b from-gray-100 to-gray-500">WAVE</span></h1>
          </div>

          <div className="p-6 flex flex-col gap-4">
            <div onClick={() => setCurrentView('albums')} className={`flex items-center gap-4 cursor-pointer hover:text-[#CCFF00] transition-colors ${currentView === 'albums' ? 'text-[#CCFF00]' : ''}`}>
               <Album size={20} /> <span className="font-bold tracking-widest text-sm">ALBUMS</span>
            </div>
            <div onClick={() => setCurrentView('songs')} className={`flex items-center gap-4 cursor-pointer hover:text-[#CCFF00] transition-colors ${currentView === 'songs' ? 'text-[#CCFF00]' : ''}`}>
               <Music size={20} /> <span className="font-bold tracking-widest text-sm">SONGS</span>
            </div>
            <div onClick={() => setCurrentView('artists')} className={`flex items-center gap-4 cursor-pointer hover:text-[#CCFF00] transition-colors ${currentView === 'artists' ? 'text-[#CCFF00]' : ''}`}>
               <Users size={20} /> <span className="font-bold tracking-widest text-sm">ARTISTS</span>
            </div>
          </div>

          <div className="flex-1 overflow-hidden flex flex-col px-6 pt-2">
             <div
               className="flex items-center justify-between mb-4 cursor-pointer hover:text-[#CCFF00] group border-b border-[#333] pb-2 transition-colors"
               onClick={() => setIsPlaylistOpen(!isPlaylistOpen)}
             >
                <div className="flex items-center gap-4">
                   <Library size={20} /> <span className="font-bold tracking-widest text-sm">PLAYLISTS</span>
                </div>
                {isPlaylistOpen ? <ChevronDown size={14} /> : <ChevronRight size={14} />}
             </div>

             {isPlaylistOpen && (
               <div className="flex-1 overflow-y-auto space-y-3 pb-4 custom-scrollbar">
                  <div onClick={() => setCurrentView('create-playlist')} className={`flex items-center gap-3 cursor-pointer group ${currentView === 'create-playlist' ? 'text-[#CCFF00]' : 'hover:text-[#CCFF00]'}`}>
                     <div className={`w-4 h-4 border border-dashed border-gray-500 flex items-center justify-center ${currentView === 'create-playlist' ? 'border-[#CCFF00]' : 'group-hover:border-[#CCFF00]'}`}>+</div>
                     <span className="text-xs font-bold">INIT_NEW_LIST</span>
                  </div>
                  <div 
                    onClick={() => setCurrentView('favorites')}
                    className={`flex items-center gap-3 cursor-pointer font-bold p-2 border border-[#FF00FF]/30 bg-[#FF00FF]/5 transition-colors ${currentView === 'favorites' ? 'text-[#FF00FF] border-[#FF00FF] shadow-[0_0_10px_rgba(255,0,255,0.2)]' : 'text-[#FF00FF] hover:bg-[#FF00FF]/10'}`}
                  >
                     <Heart size={14} fill="#FF00FF" />
                     <span className="text-xs">FAVORITES.DAT</span>
                     <span className="text-[9px] ml-auto opacity-70">{favorites.length}</span>
                  </div>
                  {playlists.map((pl, idx) => (
                    <div key={idx} onClick={() => openPlaylist(pl)} onContextMenu={(e) => handleContextMenu(e, pl)} className={`flex items-center gap-3 cursor-pointer hover:text-white opacity-70 hover:opacity-100 ${selectedPlaylist === pl && currentView === 'playlist-detail' ? 'text-[#CCFF00] opacity-100' : ''}`}>
                       <ListMusic size={14} />
                       <span className="text-xs truncate font-mono">{pl}</span>
                    </div>
                  ))}
               </div>
             )}
          </div>
          
          <div className="p-4 border-t border-[#333] bg-[#0a0a0a]">
             {currentUser ? (
               <div className="space-y-2">
                 <div className="flex items-center gap-3 border border-[#333] p-2 hover:border-[#CCFF00] transition-colors group">
                   <div className="w-8 h-8 bg-gradient-to-br from-gray-100 to-gray-400 rounded-sm overflow-hidden flex-shrink-0">
                     {currentUser.avatar ? (
                       <img src={currentUser.avatar} alt={currentUser.username} className="w-full h-full object-cover" />
                     ) : (
                       <div className="w-full h-full flex items-center justify-center bg-gradient-to-br from-[#CCFF00] to-[#FF00FF]">
                         <User size={16} className="text-black" />
                       </div>
                     )}
                   </div>
                   <div className="text-xs flex-1 min-w-0">
                     <div className="font-bold text-white truncate">{currentUser.username}</div>
                     <div className="text-[#CCFF00] text-[10px] tracking-wider">AUTHENTICATED</div>
                   </div>
                 </div>
                 <button
                   onClick={handleLogout}
                   className="w-full flex items-center justify-center gap-2 border border-[#333] p-2 hover:border-red-500 hover:text-red-500 text-gray-500 transition-colors text-xs font-bold"
                 >
                   <LogOut size={14} />
                   <span className="tracking-wider">LOGOUT</span>
                 </button>
               </div>
             ) : (
               <button
                 onClick={() => setShowAuthPage(true)}
                 className="w-full flex items-center justify-center gap-3 border border-[#333] p-3 hover:border-[#CCFF00] hover:bg-[#CCFF00]/10 cursor-pointer transition-colors group"
               >
                 <div className="w-8 h-8 bg-gradient-to-br from-gray-100 to-gray-400 rounded-sm flex items-center justify-center">
                   <User size={16} className="text-black" />
                 </div>
                 <div className="text-xs text-left">
                   <div className="font-bold text-gray-400 group-hover:text-white transition-colors">GUEST_MODE</div>
                   <div className="text-[#CCFF00] text-[10px] tracking-wider">CLICK_TO_LOGIN</div>
                 </div>
               </button>
             )}
          </div>
        </div>

        {/* --- MAIN CONTENT --- */}
        <div className="flex-1 overflow-y-auto bg-[#050505] relative custom-scrollbar">
          
          {/* Top Bar */}
          <div className="sticky top-0 z-20 px-4 sm:px-8 py-5 flex justify-between items-center bg-[#050505]/90 backdrop-blur-md border-b border-[#333]">
             {/* Mobile Menu Button */}
             <button
               onClick={() => setIsSidebarOpen(!isSidebarOpen)}
               className="lg:hidden text-gray-400 hover:text-[#CCFF00] transition-colors p-2 border border-[#333] hover:border-[#CCFF00]"
             >
               <Menu size={20} />
             </button>
             
             {/* Right Side Icons */}
             <div className="flex gap-4 items-center ml-auto">
                <Bell size={18} className="hover:text-[#CCFF00] cursor-pointer" />
             </div>
          </div>

          <div className="p-4 sm:p-6 lg:p-8 pb-24 lg:pb-32 h-full">

             {/* Loading and error states */}
             {songsLoading && (currentView === 'songs' || currentView === 'albums') && (
               <LoadingSpinner message={currentView === 'songs' ? "LOADING_SONGS..." : "LOADING_ALBUMS..."} />
             )}
             {songsError && (currentView === 'songs' || currentView === 'albums') && (
               <ErrorDisplay error={songsError} retry={reloadSongs} />
             )}

             {/* --- SONGS VIEW (TABLE LAYOUT WITH FILTERS) --- */}
             {!songsLoading && !songsError && currentView === 'songs' && (() => {
               const songsData = getFilteredSongs();
               return (
               <div className="animate-in fade-in duration-300">

                  {/* Header & Filters */}
                  <div className="mb-8">
                    <h2 className="text-4xl font-black text-white italic tracking-tighter mb-6 border-b border-[#333] pb-4">GLOBAL_ARCHIVE</h2>
                    
                    <div className="flex flex-col lg:flex-row gap-4 justify-between items-start lg:items-end">
                      {/* Genre Matrix Filters */}
                      <div className="flex flex-wrap gap-2">
                        <button
                          onClick={() => { setSongsGenreFilter('ALL'); setSongsPage(1); }}
                          className={`px-4 py-2 text-xs font-bold border border-[#333] transition-all hover:bg-[#222] ${songsGenreFilter === 'ALL' ? 'bg-white text-black' : 'text-gray-400'}`}
                        >
                          ALL_DATA
                        </button>
                        {CATEGORIES.map(cat => (
                          <button
                            key={cat.id}
                            onClick={() => { setSongsGenreFilter(cat.name); setSongsPage(1); }}
                            className={`px-4 py-2 text-xs font-bold border border-[#333] transition-all hover:brightness-125 ${cat.bg} ${songsGenreFilter === cat.name ? 'ring-2 ring-white shadow-[0_0_10px_rgba(255,255,255,0.5)]' : 'opacity-80 hover:opacity-100'}`}
                          >
                            {cat.name}
                          </button>
                        ))}
                      </div>

                      {/* Local Search */}
                      <div className="relative w-full lg:w-64">
                        <input
                          type="text"
                          placeholder="FILTER_RESULTS..."
                          className="w-full bg-black border border-[#333] text-[#CCFF00] text-xs py-2 pl-8 pr-4 focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 font-mono"
                          value={songsSearchQuery}
                          onChange={(e) => { setSongsSearchQuery(e.target.value); setSongsPage(1); }}
                        />
                        <Filter size={12} className="absolute left-2.5 top-2.5 text-gray-500" />
                      </div>
                    </div>
                  </div>

                   {/* Songs Table */}
                   <div className="w-full text-left border border-[#333] bg-[#0a0a0a] overflow-x-auto">
                      {/* Table Header */}
                      <div className="grid grid-cols-[32px_minmax(120px,3fr)_minmax(100px,2fr)_minmax(100px,2fr)_50px_50px_32px] sm:grid-cols-[40px_3fr_2fr_2fr_60px_60px_40px] gap-2 sm:gap-4 p-2 sm:p-3 border-b border-[#333] bg-black text-[#CCFF00] text-[9px] sm:text-[10px] font-bold uppercase tracking-widest sticky top-0">
                         <div className="flex justify-center"><Square size={12} className="sm:w-[14px] sm:h-[14px]" /></div>
                         <div>Title</div>
                         <div className="hidden md:block">Album</div>
                         <div className="hidden sm:block">Artist</div>
                         <div className="hidden lg:block">Year</div>
                         <div>Time</div>
                         <div className="text-center"><Heart size={10} className="sm:w-3 sm:h-3" /></div>
                      </div>

                      {/* Table Rows */}
                      <div className="divide-y divide-[#222]">
                         {songsData.items.map((track) => (
                            <div
                               key={track.id}
                               onClick={() => playSong(track)}
                               className={`grid grid-cols-[32px_minmax(120px,3fr)_minmax(100px,2fr)_minmax(100px,2fr)_50px_50px_32px] sm:grid-cols-[40px_3fr_2fr_2fr_60px_60px_40px] gap-2 sm:gap-4 p-2 sm:p-3 hover:bg-[#151515] group transition-colors cursor-pointer items-center text-[10px] sm:text-xs font-mono ${currentSong?.id === track.id ? 'text-[#CCFF00]' : 'text-gray-400'}`}
                            >
                               <div className="flex justify-center">
                                  <div className={`w-2 h-2 sm:w-3 sm:h-3 border border-[#444] ${currentSong?.id === track.id ? 'bg-[#CCFF00] border-[#CCFF00]' : 'group-hover:border-[#CCFF00]'}`}></div>
                               </div>
                               <div className="font-bold truncate text-white">{track.title}</div>
                               <div className="hidden md:block truncate group-hover:text-white">{track.album}</div>
                               <div className="hidden sm:block truncate group-hover:text-white">{track.artist}</div>
                               <div className="hidden lg:block opacity-50">{track.year}</div>
                               <div className="text-[9px] sm:text-xs">{formatTime(track.duration)}</div>
                               <div className="flex justify-center" onClick={(e) => toggleFavorite(e, track.id)}>
                                 <Heart
                                   size={12}
                                   className={`sm:w-[14px] sm:h-[14px] transition-all hover:scale-125 ${favorites.includes(track.id) ? 'text-[#FF00FF] fill-[#FF00FF]' : 'text-gray-700 hover:text-[#FF00FF]'}`}
                                 />
                               </div>
                            </div>
                         ))}
                        {songsData.items.length === 0 && (
                          <div className="p-8 text-center text-gray-600 text-xs font-mono">NO_DATA_FOUND</div>
                        )}
                     </div>
                  </div>

                  {/* Pagination */}
                  <Pagination
                    currentPage={songsPage}
                    totalPages={songsData.totalPages}
                    onPageChange={(page) => setSongsPage(page)}
                  />
               </div>
               );
             })()}

             {/* --- FAVORITES VIEW --- */}
             {currentView === 'favorites' && (
               <div className="animate-in fade-in duration-300">
                  
                  <div className="mb-8 border-b border-[#333] pb-4">
                    <h2 className="text-4xl font-black text-[#FF00FF] italic tracking-tighter mb-2">FAVORITE_DATA</h2>
                    <p className="font-mono text-xs text-gray-500">[ ENCRYPTED COLLECTION // {favorites.length} ITEMS ]</p>
                  </div>

                   <div className="w-full text-left border border-[#333] bg-[#0a0a0a] overflow-x-auto">
                      <div className="grid grid-cols-[32px_minmax(120px,3fr)_minmax(100px,2fr)_minmax(100px,2fr)_50px_32px] sm:grid-cols-[40px_3fr_2fr_2fr_60px_40px] gap-2 sm:gap-4 p-2 sm:p-3 border-b border-[#333] bg-black text-[#FF00FF] text-[9px] sm:text-[10px] font-bold uppercase tracking-widest sticky top-0">
                         <div className="flex justify-center"><Square size={12} className="sm:w-[14px] sm:h-[14px]" /></div>
                         <div>Title</div>
                         <div className="hidden md:block">Album</div>
                         <div className="hidden sm:block">Artist</div>
                         <div>Time</div>
                         <div className="text-center"><Heart size={10} className="sm:w-3 sm:h-3" /></div>
                      </div>

                      <div className="divide-y divide-[#222]">
                         {getFavorites().map((track) => (
                            <div
                               key={track.id}
                               onClick={() => playSong(track)}
                               className={`grid grid-cols-[32px_minmax(120px,3fr)_minmax(100px,2fr)_minmax(100px,2fr)_50px_32px] sm:grid-cols-[40px_3fr_2fr_2fr_60px_40px] gap-2 sm:gap-4 p-2 sm:p-3 hover:bg-[#151515] group transition-colors cursor-pointer items-center text-[10px] sm:text-xs font-mono ${currentSong?.id === track.id ? 'text-[#CCFF00]' : 'text-gray-400'}`}
                            >
                               <div className="flex justify-center">
                                  <div className={`w-2 h-2 sm:w-3 sm:h-3 border border-[#444] ${currentSong?.id === track.id ? 'bg-[#CCFF00] border-[#CCFF00]' : 'group-hover:border-[#CCFF00]'}`}></div>
                               </div>
                               <div className="font-bold truncate text-white">{track.title}</div>
                               <div className="hidden md:block truncate group-hover:text-white">{track.album}</div>
                               <div className="hidden sm:block truncate group-hover:text-white">{track.artist}</div>
                               <div className="text-[9px] sm:text-xs">{formatTime(track.duration)}</div>
                               <div className="flex justify-center" onClick={(e) => toggleFavorite(e, track.id)}>
                                 <Heart size={12} className="sm:w-[14px] sm:h-[14px] text-[#FF00FF] fill-[#FF00FF] transition-all hover:scale-125" />
                               </div>
                            </div>
                         ))}
                        {favorites.length === 0 && (
                          <div className="p-12 text-center flex flex-col items-center justify-center text-gray-600 font-mono border-2 border-dashed border-[#333] m-4 bg-[#050505]">
                             <Heart size={48} className="mb-4 text-[#333]" />
                             <p className="text-sm">NO_FAVORITES_DETECTED</p>
                             <p className="text-xs mt-2 opacity-50">MARK DATA AS [LIKED] TO POPULATE THIS LIST</p>
                          </div>
                        )}
                     </div>
                  </div>
               </div>
             )}

             {!songsLoading && !songsError && currentView === 'albums' && (() => {
               const albumsData = getFilteredAlbums();
               return (
               <div className="animate-in fade-in duration-300">
                  <div className="flex flex-col sm:flex-row items-start sm:items-end justify-between border-b border-[#333] pb-4 mb-8 gap-4">
                      <h2 className="text-4xl font-black text-white italic tracking-tighter">ALBUM_ARCHIVE</h2>
                      <div className="flex gap-2 bg-[#0a0a0a] p-1 border border-[#333] rounded-sm">
                          {['ALL', 'RECENTLY_PLAYED', 'RECENTLY_ADDED'].map(filter => (
                              <button key={filter} onClick={() => { setAlbumFilter(filter); setAlbumsPage(1); }} className={`px-4 py-1.5 text-[10px] font-bold font-mono transition-all uppercase tracking-widest ${albumFilter === filter ? 'bg-[#CCFF00] text-black shadow-[0_0_10px_#CCFF00]' : 'text-gray-500 hover:text-white hover:bg-[#111]'}`}>
                                  {filter.replace('_', ' ')}
                              </button>
                          ))}
                      </div>
                  </div>
                   <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-3 sm:gap-4 lg:gap-6">
                    {albumsData.items.map(song => (
                       <SongCard
                         key={song.id}
                         song={song}
                         onClick={playSong}
                         onAlbumClick={handleOpenAlbumDetail}
                         isCurrent={currentSong?.id === song.id}
                       />
                    ))}
                  </div>

                  {/* Pagination */}
                  <Pagination
                    currentPage={albumsPage}
                    totalPages={albumsData.totalPages}
                    onPageChange={(page) => setAlbumsPage(page)}
                  />
               </div>
               );
             })()}

             {/* --- ARTISTS VIEW --- */}
             {currentView === 'artists' && (() => {
               const artistsData = getFilteredArtists();
               return (
               <div className="animate-in fade-in duration-300">

                  <div className="flex flex-col md:flex-row items-start md:items-end justify-between border-b border-[#333] pb-4 mb-8 gap-4">
                    <h2 className="text-4xl font-black text-white italic tracking-tighter">ARTIST_DATABASE</h2>

                    {/* Artists Search Bar */}
                    <div className="relative w-full md:w-64 lg:w-96">
                      <input
                        type="text"
                        placeholder="SEARCH_DATABASE..."
                        className="w-full bg-black border border-[#333] text-[#CCFF00] text-xs py-2 pl-10 pr-4 focus:outline-none focus:border-[#CCFF00] placeholder:text-gray-700 font-mono transition-colors"
                        value={artistsSearchQuery}
                        onChange={(e) => { setArtistsSearchQuery(e.target.value); setArtistsPage(1); }}
                      />
                      <Search size={14} className="absolute left-3.5 top-2.5 text-gray-500" />
                    </div>
                  </div>

                  {/* Loading State */}
                  {artistsLoading && (
                    <LoadingSpinner message="LOADING_ARTISTS..." />
                  )}

                  {/* Error State */}
                  {artistsError && !artistsLoading && (
                    <div className="mb-4 p-3 bg-yellow-500/10 border border-yellow-500/30 text-yellow-500 text-xs font-mono">
                      {artistsError}
                    </div>
                  )}

                  {!artistsLoading && (
                     <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 sm:gap-6 lg:gap-8">
                      {artistsData.items.map(artist => (
                        <div 
                          key={artist.id} 
                          className="flex flex-col items-center group cursor-pointer"
                          onClick={() => handleOpenArtistDetail(artist)}
                        >
                           <div className="w-32 h-32 sm:w-40 sm:h-40 rounded-full overflow-hidden border-2 border-[#333] group-hover:border-[#CCFF00] group-hover:shadow-[0_0_15px_#CCFF00] transition-all relative duration-300">
                              <img src={artist.image} alt={artist.name} className="w-full h-full object-cover saturate-50 group-hover:saturate-100 transition-all duration-300" />
                              <div className="absolute inset-0 bg-[#CCFF00]/20 opacity-0 group-hover:opacity-100 transition-opacity"></div>
                           </div>
                           <span className="mt-4 font-bold text-sm text-gray-400 group-hover:text-white font-mono tracking-widest text-center transition-colors">{artist.name}</span>
                        </div>
                      ))}
                      {artistsData.items.length === 0 && (
                        <div className="col-span-full py-20 text-center border border-dashed border-[#333]">
                          <p className="text-gray-600 font-mono text-sm">NO_ARTIST_DATA_FOUND</p>
                        </div>
                      )}
                    </div>
                  )}

                  {/* Pagination */}
                  <Pagination
                    currentPage={artistsPage}
                    totalPages={artistsData.totalPages}
                    onPageChange={(page) => setArtistsPage(page)}
                  />
               </div>
               );
             })()}

             {currentView === 'create-playlist' && (
               <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
                  <div className="mb-8 border-b border-[#333] pb-4">
                     <h2 className="text-4xl font-black text-white italic tracking-tighter">CONSTRUCT_<span className="text-[#CCFF00]">PLAYLIST</span></h2>
                     <p className="font-mono text-xs text-gray-500 mt-2">[INITIALIZING NEW SEQUENCE PROTOCOL]</p>
                  </div>
                  <div className="flex flex-col md:flex-row gap-8 mb-12">
                     <div className="group w-52 h-52 bg-[#0a0a0a] border-2 border-dashed border-[#333] hover:border-[#CCFF00] flex flex-col items-center justify-center cursor-pointer transition-all relative overflow-hidden">
                        <Upload size={32} className="text-gray-500 group-hover:text-[#CCFF00] mb-2 transition-colors z-10" />
                        <span className="text-[10px] font-bold text-gray-600 group-hover:text-white font-mono tracking-widest z-10">UPLOAD_SOURCE</span>
                     </div>
                     <div className="flex-1 flex flex-col gap-6">
                        <div className="flex flex-col gap-2">
                           <label className="text-[10px] font-bold text-gray-500 tracking-[0.2em]">SEQUENCE_ID</label>
                           <input type="text" placeholder="ENTER_NAME..." className="bg-black border border-[#333] p-4 text-xl font-bold text-[#CCFF00] focus:outline-none focus:border-[#CCFF00] font-mono" value={newPlaylistName} onChange={(e) => setNewPlaylistName(e.target.value)}/>
                        </div>
                        <div className="flex gap-4 mt-auto">
                           <ChromeButton className="flex-1" active={true} onClick={handleCreatePlaylist}>COMPILE_DATA</ChromeButton>
                           <button onClick={() => setCurrentView('library')} className="flex-1 border border-[#333] hover:border-red-500 hover:text-red-500 text-gray-500 font-bold text-sm tracking-widest transition-colors py-2 uppercase">ABORT</button>
                        </div>
                     </div>
                  </div>
               </div>
             )}

             {currentView === 'playlist-detail' && (() => {
               const playlistData = getPlaylistTracks();
               
               // Handle right-click on playlist track
               const handlePlaylistTrackContextMenu = (e, track) => {
                 e.preventDefault();
                 setPlaylistTrackMenu({
                   x: e.clientX,
                   y: e.clientY,
                   track,
                   playlistName: selectedPlaylist
                 });
               };

               // Handle download track
               const handleDownloadTrack = (track) => {
                 setPlaylistTrackMenu(null);
                 if (!track.url) {
                   alert('Download not available for this track');
                   return;
                 }
                 const a = document.createElement('a');
                 a.href = track.url;
                 a.target = '_blank';
                 a.download = `${track.artist || 'Unknown'} - ${track.title}.mp3`;
                 document.body.appendChild(a);
                 a.click();
                 document.body.removeChild(a);
               };

               // Handle remove from playlist
               const handleRemoveFromPlaylist = (track) => {
                 setPlaylistTrackMenu(null);
                 
                 // Get current tracks for this playlist
                 const currentTracks = playlistTracks[selectedPlaylist] || MOCK_PLAYLIST_TRACKS;
                 
                 // Remove the track
                 const updatedTracks = currentTracks.filter(t => t.id !== track.id);
                 
                 // Update the state
                 setPlaylistTracks({
                   ...playlistTracks,
                   [selectedPlaylist]: updatedTracks
                 });
                 
                 // TODO: Call API to remove from playlist
                 // await removeSongFromPlaylist(playlistId, track.id);
               };

               return (
               <div className="animate-in fade-in duration-300">
                  <div className="flex flex-col gap-6 mb-8">
                     <div className="flex items-end gap-4 mb-2">
                        <h2 className="text-5xl md:text-6xl font-black text-white italic tracking-tighter uppercase break-all line-clamp-2">{selectedPlaylist}</h2>
                     </div>
                     <div className="flex flex-wrap items-center gap-6 border-b border-[#333] pb-6">
                        <button 
                          onClick={() => {
                            const tracks = playlistTracks[selectedPlaylist] || MOCK_PLAYLIST_TRACKS;
                            if (tracks.length > 0) playSong(tracks[0]);
                          }} 
                          className="flex items-center gap-2 bg-[#CCFF00] text-black px-6 py-2 font-bold hover:bg-white transition-colors clip-path-slant" 
                          style={{ clipPath: 'polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%)' }}
                        >
                           <Play size={18} fill="black" /> PLAY
                        </button>
                        <span className="text-gray-500 text-xs font-mono ml-4">
                          Right-click track for options
                        </span>
                     </div>
                  </div>
                   <div className="w-full text-left border border-[#333] bg-[#0a0a0a] overflow-x-auto">
                      <div className="grid grid-cols-[32px_32px_minmax(120px,2fr)_minmax(100px,1.5fr)_minmax(100px,1.5fr)_60px] sm:grid-cols-[40px_40px_2fr_1.5fr_1.5fr_80px] gap-2 sm:gap-4 p-2 sm:p-3 border-b border-[#333] bg-black text-[#CCFF00] text-[9px] sm:text-[10px] font-bold uppercase tracking-widest sticky top-0">
                         <div className="flex justify-center"><Square size={12} className="sm:w-[14px] sm:h-[14px]" /></div>
                         <div>#</div>
                         <div>Title</div>
                         <div className="hidden sm:block">Album</div>
                         <div className="hidden md:block">Artist</div>
                         <div>Time</div>
                      </div>
                      <div className="divide-y divide-[#222]">
                         {playlistData.items.length > 0 ? (
                           playlistData.items.map((track, i) => (
                             <div 
                               key={track.id} 
                               onClick={() => playSong(track)} 
                               onContextMenu={(e) => handlePlaylistTrackContextMenu(e, track)}
                               className={`grid grid-cols-[32px_32px_minmax(120px,2fr)_minmax(100px,1.5fr)_minmax(100px,1.5fr)_60px] sm:grid-cols-[40px_40px_2fr_1.5fr_1.5fr_80px] gap-2 sm:gap-4 p-2 sm:p-3 hover:bg-[#151515] group transition-colors cursor-pointer items-center text-[10px] sm:text-xs font-mono ${currentSong?.id === track.id ? 'bg-[#CCFF00]/10 text-[#CCFF00]' : 'text-gray-400'}`}
                             >
                               <div className="flex justify-center">
                                 <div className={`w-2 h-2 sm:w-3 sm:h-3 border ${currentSong?.id === track.id ? 'bg-[#CCFF00] border-[#CCFF00]' : 'border-[#444] group-hover:border-[#CCFF00]'}`}></div>
                               </div>
                               <div className={currentSong?.id === track.id ? 'text-[#CCFF00]' : 'group-hover:text-white'}>{(playlistPage - 1) * PLAYLIST_ITEMS_PER_PAGE + i + 1}</div>
                               <div className={`font-bold truncate ${currentSong?.id === track.id ? 'text-[#CCFF00]' : 'text-white'}`}>{track.title}</div>
                               <div className="hidden sm:block truncate hover:text-white">{track.album}</div>
                               <div className="hidden md:block truncate hover:text-white">{track.artist}</div>
                               <div className="text-[9px] sm:text-xs">{formatTime(track.duration)}</div>
                             </div>
                           ))
                         ) : (
                          <div className="p-12 text-center text-gray-500">
                            <ListMusic size={48} className="mx-auto mb-4 text-gray-600" />
                            <p className="text-sm font-mono">EMPTY_PLAYLIST</p>
                            <p className="text-xs mt-2 opacity-50">Add songs to this playlist</p>
                          </div>
                        )}
                     </div>
                  </div>

                  {/* Playlist Track Context Menu */}
                  {playlistTrackMenu && (
                    <div
                      className="fixed bg-[#111] border border-[#333] rounded-lg shadow-2xl py-2 min-w-[200px] z-[100]"
                      style={{
                        left: Math.min(playlistTrackMenu.x, window.innerWidth - 220),
                        top: Math.min(playlistTrackMenu.y, window.innerHeight - 120)
                      }}
                      onClick={(e) => e.stopPropagation()}
                    >
                      <div className="px-3 py-1 text-[10px] text-gray-500 font-mono uppercase tracking-wider border-b border-[#222] mb-1 truncate">
                        {playlistTrackMenu.track?.title}
                      </div>
                      
                      <button
                        onClick={() => handleDownloadTrack(playlistTrackMenu.track)}
                        className="w-full flex items-center gap-3 px-4 py-2 text-sm text-gray-300 hover:bg-[#CCFF00] hover:text-black transition-colors"
                      >
                        <Download size={16} />
                        <span>Download</span>
                      </button>
                      
                      <button
                        onClick={() => handleRemoveFromPlaylist(playlistTrackMenu.track)}
                        className="w-full flex items-center gap-3 px-4 py-2 text-sm text-red-400 hover:bg-red-500 hover:text-white transition-colors"
                      >
                        <Trash2 size={16} />
                        <span>Remove from Playlist</span>
                      </button>
                    </div>
                  )}

                  {/* Pagination */}
                  <Pagination
                    currentPage={playlistPage}
                    totalPages={playlistData.totalPages}
                    onPageChange={(page) => setPlaylistPage(page)}
                  />
               </div>
               );
             })()}

             {currentView === 'lyrics' && currentSong && (
               <div className="flex flex-col h-full animate-in zoom-in-95 duration-300 relative">
                  <div className="absolute inset-0 flex items-center justify-center opacity-10 pointer-events-none"><div className="w-[500px] h-[500px] bg-[#CCFF00] blur-[150px] rounded-full animate-pulse"></div></div>
                  <div className="flex justify-between items-center mb-8 relative z-10">
                     <div><h2 className="text-2xl font-black italic text-white uppercase">{currentSong.title}</h2><p className="text-[#CCFF00] font-mono text-sm tracking-widest">{currentSong.artist}</p></div>
                     <button onClick={closeLyrics} className="p-2 border border-[#333] hover:border-[#CCFF00] hover:text-[#CCFF00] text-gray-500 transition-colors rounded-full"><Minimize2 size={20} /></button>
                  </div>
                  <div ref={lyricsContainerRef} className="flex-1 overflow-y-auto custom-scrollbar pr-4 relative z-10 text-center space-y-8" style={{ scrollBehavior: 'smooth', maskImage: 'linear-gradient(to bottom, transparent, black 20%, black 80%, transparent)' }}>
                     <div className="h-[40vh]"></div> 
                     {MOCK_LYRICS.map((line, index) => (
                        <div key={index} id={`lyric-${index}`} className={`transition-all duration-500 transform ${index === activeLyricIndex ? 'scale-110 text-[#CCFF00] blur-none opacity-100 font-black text-2xl md:text-4xl' : 'scale-95 text-gray-600 blur-[1px] opacity-40 font-bold text-xl md:text-2xl'}`}>{line.text}</div>
                     ))}
                     <div className="h-[40vh]"></div>
                  </div>
               </div>
             )}

             {currentView === 'library' && (
                <div className="border border-[#333] border-dashed h-96 flex flex-col items-center justify-center bg-[#0a0a0a]">
                   <Disc size={64} className="text-[#333] mb-4" />
                   <h2 className="text-2xl font-black text-white mb-2">NULL_DATA</h2>
                   <p className="font-mono text-xs text-gray-500 mb-6">[EMPTY_COLLECTION]</p>
                   <ChromeButton onClick={() => setCurrentView('create-playlist')}>INITIALIZE_LIST</ChromeButton>
                </div>
             )}
          </div>
        </div>
      </div>

       {/* --- BOTTOM PLAYER (CHROME BAR) --- */}
       {currentSong && (
       <div className="fixed bottom-0 left-0 right-0 bg-gradient-to-b from-[#111] to-black border-t border-[#333] z-[100]">
          {/* Mobile Layout - Compact */}
          <div className="lg:hidden">
             {/* Progress Bar on Top for Mobile */}
             <div className="w-full h-1 bg-[#111] border-b border-[#333] relative">
                <div className="h-full bg-[#CCFF00] relative shadow-[0_0_8px_#CCFF00]" style={{ width: `${(progress / (duration || 1)) * 100}%` }}></div>
                <input type="range" min={0} max={duration || 0} value={progress} onChange={handleSeek} className="absolute inset-0 w-full h-full opacity-0 cursor-pointer" />
             </div>
             
             {/* Compact Player Controls */}
             <div className="flex items-center justify-between px-3 py-2 h-16">
                {/* Left: Song Info */}
                <div className="flex items-center gap-2 flex-1 min-w-0 group cursor-pointer" onClick={() => handleOpenAlbumDetail(currentSong)}>
                   <div className={`w-10 h-10 border border-[#333] relative overflow-hidden flex-shrink-0 ${isPlaying ? 'animate-pulse' : ''} group-hover:border-[#CCFF00] transition-colors`}>
                      <img src={currentSong.cover} className="w-full h-full object-cover saturate-50 group-hover:saturate-100 opacity-80 group-hover:opacity-100 transition-all" alt=""/>
                   </div>
                   <div className="flex-1 min-w-0">
                      <div className="text-white text-xs font-bold font-mono tracking-wide truncate">{currentSong.title}</div>
                      <div className="text-[9px] text-[#CCFF00] uppercase tracking-widest truncate">{currentSong.artist}</div>
                   </div>
                </div>
                
                {/* Center: Play Controls */}
                <div className="flex items-center gap-3 px-2">
                   <SkipBack onClick={skipPrev} size={18} className="text-gray-300 hover:text-[#CCFF00] cursor-pointer flex-shrink-0" />
                   <button onClick={togglePlay} className="w-10 h-10 bg-gradient-to-b from-gray-200 via-white to-gray-400 rounded-full flex items-center justify-center shadow-[0_0_15px_rgba(255,255,255,0.3)] hover:scale-105 transition-transform active:scale-95 flex-shrink-0">
                     {isPlaying ? <Pause size={16} fill="black" /> : <Play size={16} fill="black" className="ml-0.5" />}
                   </button>
                   <SkipForward onClick={skipNext} size={18} className="text-gray-300 hover:text-[#CCFF00] cursor-pointer flex-shrink-0" />
                </div>
                
                {/* Right: Attribution & Heart */}
                <div className="flex items-center gap-2 flex-shrink-0">
                   <SongAttributionButton song={currentSong} />
                   <Heart size={16} className={`transition-all hover:scale-125 ${favorites.includes(currentSong.id) ? 'text-[#FF00FF] fill-[#FF00FF]' : 'text-[#333] hover:text-[#FF00FF]'}`} onClick={(e) => toggleFavorite(e, currentSong.id)} />
                </div>
             </div>
          </div>

          {/* Desktop Layout - Full */}
          <div className="hidden lg:flex items-center justify-between px-6 h-24">
             <div className="w-[30%] flex items-center gap-4 group cursor-pointer" onClick={() => handleOpenAlbumDetail(currentSong)}>
                <div className={`w-14 h-14 border border-[#333] relative overflow-hidden ${isPlaying ? 'animate-pulse' : ''} group-hover:border-[#CCFF00] transition-colors`}>
                   <img src={currentSong.cover} className="w-full h-full object-cover saturate-50 group-hover:saturate-100 opacity-80 group-hover:opacity-100 transition-all" alt=""/>
                   <div className="absolute inset-0 bg-gradient-to-tr from-[#CCFF00]/20 to-transparent"></div>
                   <div className="absolute inset-0 bg-black/60 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                     <Album size={24} className="text-[#CCFF00]" />
                   </div>
                </div>
                <div>
                   <div className="text-white text-sm font-bold font-mono tracking-wide group-hover:text-[#CCFF00] transition-colors">{currentSong.title}</div>
                   <div className="text-[10px] text-[#CCFF00] uppercase tracking-widest group-hover:text-white transition-colors">{currentSong.artist}</div>
                </div>
                <Heart size={16} className={`transition-all hover:scale-125 ml-2 ${favorites.includes(currentSong.id) ? 'text-[#FF00FF] fill-[#FF00FF]' : 'text-[#333] hover:text-[#FF00FF]'}`} onClick={(e) => toggleFavorite(e, currentSong.id)} />
             </div>
             <div className="w-[40%] flex flex-col items-center gap-2">
                <div className="flex items-center gap-6">
                   <Shuffle size={16} className="text-gray-500 hover:text-white cursor-pointer" />
                   <SkipBack onClick={skipPrev} size={20} className="text-gray-300 hover:text-[#CCFF00] cursor-pointer" />
                   <button onClick={togglePlay} className="w-12 h-12 bg-gradient-to-b from-gray-200 via-white to-gray-400 rounded-full flex items-center justify-center shadow-[0_0_15px_rgba(255,255,255,0.3)] hover:scale-105 transition-transform active:scale-95">
                     {isPlaying ? <Pause size={20} fill="black" /> : <Play size={20} fill="black" className="ml-1" />}
                   </button>
                   <SkipForward onClick={skipNext} size={20} className="text-gray-300 hover:text-[#CCFF00] cursor-pointer" />
                   <Repeat size={16} className="text-gray-500 hover:text-white cursor-pointer" />
                </div>
                <div className="w-full flex items-center gap-3 text-[10px] font-mono font-bold text-gray-500">
                   <span>{formatTime(progress)}</span>
                   <div className="flex-1 h-2 bg-[#111] border border-[#333] relative cursor-pointer group">
                      <div className="h-full bg-[#CCFF00] relative shadow-[0_0_8px_#CCFF00]" style={{ width: `${(progress / (duration || 1)) * 100}%` }}></div>
                      <input type="range" min={0} max={duration || 0} value={progress} onChange={handleSeek} className="absolute inset-0 w-full h-full opacity-0 cursor-pointer" />
                   </div>
                   <span>{formatTime(duration || currentSong.duration)}</span>
                </div>
             </div>
             <div className="w-[30%] flex items-center justify-end gap-4">
                <SongAttributionButton song={currentSong} />
                <Mic2 size={16} className="text-gray-600" />
                <ListMusic size={16} className="text-gray-600" />
                <div className="flex items-center gap-2 w-28 group">
                   <Volume2 size={16} className="text-gray-400" />
                   <div className="flex-1 h-1 bg-[#333] relative">
                      <div className="h-full bg-white group-hover:bg-[#CCFF00]" style={{ width: `${volume * 100}%` }}></div>
                      <input type="range" min={0} max={1} step={0.01} value={volume} onChange={(e) => setVolume(parseFloat(e.target.value))} className="absolute inset-0 opacity-0 cursor-pointer" />
                   </div>
                </div>
             </div>
          </div>
       </div>
       )}

      {currentSong && (
        <audio ref={audioRef} src={currentSong.url} onTimeUpdate={handleTimeUpdate} onEnded={skipNext} />
      )}

      {/* Auth Page Modal */}
      {showAuthPage && (
        <AuthPage
          onLogin={handleLogin}
          onClose={() => setShowAuthPage(false)}
        />
      )}

      {/* Artist Detail Page Overlay */}
      {showArtistDetail && (selectedArtistId || selectedArtistInfo) && (
        <ArtistDetailPage
          key={selectedArtistId || 'artist-detail'}
          artistId={selectedArtistId}
          initialArtist={selectedArtistInfo}
          onClose={() => { setShowArtistDetail(false); setSelectedArtistId(null); setSelectedArtistInfo(null); }}
          onPlaySong={playSong}
          onAlbumClick={handleOpenAlbumDetail}
        />
      )}


      {/* Album Detail Page Overlay */}
      {showAlbumDetail && selectedAlbum && (
        <AlbumDetailPage
          album={selectedAlbum}
          onClose={() => setShowAlbumDetail(false)}
          onPlaySong={playSong}
          onPlayAlbum={handlePlayAlbum}
          currentSong={currentSong}
          playlists={apiPlaylists || []}
          onAddToPlaylist={async (playlistId, songId) => {
            try {
              await addSongToPlaylist(playlistId, songId);
            } catch (error) {
              console.error('Failed to add song to playlist:', error);
            }
          }}
        />
      )}

      <style>{`
        .custom-scrollbar::-webkit-scrollbar { width: 4px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: #000; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #333; }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover { background: #CCFF00; }
        .clip-path-slant { clip-path: polygon(10% 0, 100% 0, 100% 80%, 90% 100%, 0 100%, 0 20%); }
      `}</style>
    </div>
  );
}
