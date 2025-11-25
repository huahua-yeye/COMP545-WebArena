// Jamendo API 集成服务
// 获取免费音乐数据

const JAMENDO_CLIENT_ID = 'your_client_id_here'; // 在 https://developer.jamendo.com 注册获取
const JAMENDO_API_BASE = 'https://api.jamendo.com/v3.0';

/**
 * 从 Jamendo 获取热门歌曲
 * @param {number} limit - 获取数量
 * @returns {Promise<Array>} 歌曲列表
 */
export async function fetchJamendoTracks(limit = 20) {
  try {
    const url = `${JAMENDO_API_BASE}/tracks/?client_id=${JAMENDO_CLIENT_ID}&format=json&limit=${limit}&audioformat=mp32`;

    const response = await fetch(url);
    const data = await response.json();

    // 转换为我们的数据格式
    return data.results.map(track => ({
      title: track.name,
      artist: track.artist_name,
      album: track.album_name,
      duration: track.duration,
      url: track.audio,
      cover_url: track.album_image || track.image,
      genre: track.musicinfo?.tags?.genres?.[0] || 'Unknown',
      year: track.releasedate ? new Date(track.releasedate).getFullYear() : null,
      external_id: track.id
    }));
  } catch (error) {
    console.error('Error fetching from Jamendo:', error);
    throw error;
  }
}

/**
 * 搜索 Jamendo 音乐
 * @param {string} query - 搜索关键词
 * @param {number} limit - 结果数量
 */
export async function searchJamendoTracks(query, limit = 20) {
  try {
    const url = `${JAMENDO_API_BASE}/tracks/?client_id=${JAMENDO_CLIENT_ID}&format=json&limit=${limit}&search=${encodeURIComponent(query)}&audioformat=mp32`;

    const response = await fetch(url);
    const data = await response.json();

    return data.results.map(track => ({
      title: track.name,
      artist: track.artist_name,
      album: track.album_name,
      duration: track.duration,
      url: track.audio,
      cover_url: track.album_image || track.image,
      genre: track.musicinfo?.tags?.genres?.[0] || 'Unknown'
    }));
  } catch (error) {
    console.error('Error searching Jamendo:', error);
    throw error;
  }
}
