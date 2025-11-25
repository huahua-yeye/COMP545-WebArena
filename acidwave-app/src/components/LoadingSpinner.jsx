// Loading spinner component
import React from 'react';
import { Disc } from 'lucide-react';
import { API_CONFIG } from '../services/api';

export default function LoadingSpinner({ message = "LOADING_DATA..." }) {
  return (
    <div className="flex flex-col items-center justify-center h-96 animate-in fade-in duration-500">
      <Disc size={64} className="text-[#CCFF00] animate-spin mb-4" />
      <p className="text-sm font-mono font-bold text-gray-500 tracking-widest animate-pulse">
        {message}
      </p>
      <div className="mt-4 flex gap-1">
        <div className="w-2 h-2 bg-[#CCFF00] animate-bounce" style={{ animationDelay: '0ms' }}></div>
        <div className="w-2 h-2 bg-[#CCFF00] animate-bounce" style={{ animationDelay: '150ms' }}></div>
        <div className="w-2 h-2 bg-[#CCFF00] animate-bounce" style={{ animationDelay: '300ms' }}></div>
      </div>
    </div>
  );
}

export function ErrorDisplay({ error, retry }) {
  return (
    <div className="flex flex-col items-center justify-center h-96 border-2 border-dashed border-red-500/30 bg-red-500/5 animate-in fade-in duration-500">
      <div className="text-red-500 text-6xl mb-4">⚠</div>
      <h3 className="text-xl font-black text-red-500 mb-2 font-mono">CONNECTION_ERROR</h3>
      <p className="text-sm text-gray-500 font-mono mb-6 text-center max-w-md">
        {error || "Failed to load data from server. Please check if backend is running."}
      </p>
      {retry && (
        <button
          onClick={retry}
          className="px-6 py-3 bg-red-500 text-black font-bold text-sm uppercase tracking-widest hover:bg-red-400 transition-colors"
        >
          RETRY_CONNECTION
        </button>
      )}
      <div className="text-xs text-gray-700 font-mono mt-4 text-center">
        <p className="mb-1">Backend URL:</p>
        <p className="text-[#CCFF00] font-bold">{API_CONFIG.baseURL}</p>
        <p className="text-gray-600 mt-2 text-[10px]">
          {API_CONFIG.baseURL.includes('localhost') ? '🔴 LOCAL' : '🟢 PRODUCTION'}
        </p>
      </div>
    </div>
  );
}
