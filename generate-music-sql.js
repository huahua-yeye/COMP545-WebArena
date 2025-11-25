/**
 * 🎵 音乐数据SQL生成工具
 *
 * 使用方法:
 * 1. 编辑下面的 musicData 数组
 * 2. 运行: node generate-music-sql.js
 * 3. 复制生成的SQL语句到 Supabase SQL Editor
 * 4. 执行SQL语句
 */

// ==================== 在这里填写你的音乐数据 ====================
const musicData = [
  {
    title: 'Acoustic Breeze',
    artist: 'Bensound',
    album: 'Acoustic Collection',
    duration: 157,
    quality: 'MP3 320',
    genre: 'AMBIENT',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/acoustic-breeze.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Buddy',
    artist: 'Bensound',
    album: 'Upbeat Collection',
    duration: 163,
    quality: 'MP3 320',
    genre: 'GLITCH',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/buddy.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Happy Rock',
    artist: 'Bensound',
    album: 'Rock Collection',
    duration: 113,
    quality: 'MP3 320',
    genre: 'TECHNO',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/happy-rock.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Sunny',
    artist: 'Bensound',
    album: 'Pop Collection',
    duration: 194,
    quality: 'MP3 320',
    genre: 'CYBER',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/sunny.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Tomorrow',
    artist: 'Bensound',
    album: 'Inspirational Collection',
    duration: 208,
    quality: 'MP3 320',
    genre: 'ACID',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/tomorrow.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Tenderness',
    artist: 'Bensound',
    album: 'Emotional Collection',
    duration: 226,
    quality: 'FLAC',
    genre: 'AMBIENT',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/tenderness.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Energy',
    artist: 'Bensound',
    album: 'Electronic Collection',
    duration: 177,
    quality: 'MP3 320',
    genre: 'TECHNO',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1621360841012-3f868c6883cd?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/energy.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Relaxing',
    artist: 'Bensound',
    album: 'Chill Collection',
    duration: 189,
    quality: 'MP3 320',
    genre: 'VAPOR',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1493225255756-d9584f8606e9?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/relaxing.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Funkysuspense',
    artist: 'Bensound',
    album: 'Funk Collection',
    duration: 212,
    quality: 'MP3 320',
    genre: 'GLITCH',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/funkysuspense.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  },
  {
    title: 'Moose',
    artist: 'Bensound',
    album: 'Jazzy Collection',
    duration: 181,
    quality: 'FLAC',
    genre: 'CYBER',
    year: 2023,
    cover: 'https://images.unsplash.com/photo-1619983081563-430f63602796?w=300&h=300&fit=crop',
    audio: 'http://localhost:3000/music/moose.mp3',
    license: 'CC BY 4.0',
    attribution: 'Music by Bensound',
    sourceUrl: 'https://www.bensound.com/',
    requiresAttribution: true
  }
];

// ==================== SQL 生成函数 ====================

function escapeSQL(str) {
  if (!str) return "''";
  return "'" + str.replace(/'/g, "''") + "'";
}

function generateInsertSQL(songs) {
  const values = songs.map(song => {
    // 处理许可证字段，如果未提供则使用 NULL
    const license = song.license ? escapeSQL(song.license) : 'NULL';
    const attribution = song.attribution ? escapeSQL(song.attribution) : 'NULL';
    const sourceUrl = song.sourceUrl ? escapeSQL(song.sourceUrl) : 'NULL';
    const requiresAttribution = song.requiresAttribution !== undefined ? song.requiresAttribution : false;

    return `  (${escapeSQL(song.title)}, ${escapeSQL(song.artist)}, ${escapeSQL(song.album)}, ${song.duration}, ${escapeSQL(song.audio)}, ${escapeSQL(song.cover)}, ${escapeSQL(song.genre)}, ${song.year}, ${license}, ${attribution}, ${sourceUrl}, ${requiresAttribution})`;
  }).join(',\n');

  return `-- ==================== 插入音乐数据 ====================
-- 生成时间: ${new Date().toLocaleString('zh-CN')}
-- 歌曲数量: ${songs.length}

INSERT INTO songs (title, artist, album, duration, url, cover_url, genre, year, license, attribution, source_url, requires_attribution)
VALUES
${values};

-- ==================== 验证数据 ====================
-- 运行以下查询检查数据是否正确插入:
SELECT id, title, artist, album, duration, genre, year, license, attribution, requires_attribution
FROM songs
ORDER BY created_at DESC
LIMIT ${songs.length};
`;
}

// ==================== 运行脚本 ====================

console.log('\n🎵 音乐数据SQL生成工具\n');
console.log(`📊 共有 ${musicData.length} 首歌曲\n`);
console.log('='.repeat(80));
console.log('\n✅ 生成的SQL语句:\n');
console.log(generateInsertSQL(musicData));
console.log('='.repeat(80));
console.log('\n📝 使用说明:');
console.log('1. 复制上面的SQL语句');
console.log('2. 打开 Supabase Dashboard > SQL Editor');
console.log('3. 粘贴并运行SQL语句');
console.log('4. 刷新前端页面查看效果\n');

// ==================== 数据验证 ====================

console.log('🔍 数据验证:\n');

const validGenres = ['GLITCH', 'VAPOR', 'CYBER', 'TECHNO', 'ACID', 'AMBIENT'];
let hasErrors = false;

musicData.forEach((song, index) => {
  const errors = [];
  const warnings = [];

  if (!song.title) errors.push('缺少标题');
  if (!song.artist) errors.push('缺少艺术家');
  if (!song.duration || song.duration <= 0) errors.push('时长无效');
  if (!song.audio) errors.push('缺少音频链接');
  if (song.genre && !validGenres.includes(song.genre)) {
    errors.push(`流派无效 (有效值: ${validGenres.join(', ')})`);
  }

  // 许可证验证
  if (!song.license) {
    warnings.push('缺少许可证信息');
  }
  if (song.requiresAttribution && !song.attribution) {
    warnings.push('需要署名但未提供署名信息');
  }
  if (song.requiresAttribution && !song.sourceUrl) {
    warnings.push('需要署名但未提供来源链接');
  }

  if (errors.length > 0) {
    console.log(`❌ 歌曲 ${index + 1} (${song.title}): ${errors.join(', ')}`);
    hasErrors = true;
  } else if (warnings.length > 0) {
    console.log(`⚠️  歌曲 ${index + 1}: ${song.title} - ${song.artist} (警告: ${warnings.join(', ')})`);
  } else {
    const licenseInfo = song.requiresAttribution ? `[${song.license} - 需要署名]` : `[${song.license || '无许可证'}]`;
    console.log(`✅ 歌曲 ${index + 1}: ${song.title} - ${song.artist} ${licenseInfo}`);
  }
});

if (!hasErrors) {
  console.log('\n✨ 所有数据验证通过！可以安全执行SQL语句。\n');
} else {
  console.log('\n⚠️  发现数据错误，请修改后重新运行脚本。\n');
}

// ==================== 统计信息 ====================

console.log('📊 数据统计:\n');

const genreCount = {};
const licenseCount = {};
let requiresAttributionCount = 0;

musicData.forEach(song => {
  genreCount[song.genre] = (genreCount[song.genre] || 0) + 1;
  if (song.license) {
    licenseCount[song.license] = (licenseCount[song.license] || 0) + 1;
  }
  if (song.requiresAttribution) {
    requiresAttributionCount++;
  }
});

console.log('流派分布:');
Object.entries(genreCount).forEach(([genre, count]) => {
  console.log(`  ${genre}: ${count} 首`);
});

console.log('\n许可证分布:');
if (Object.keys(licenseCount).length > 0) {
  Object.entries(licenseCount).forEach(([license, count]) => {
    console.log(`  ${license}: ${count} 首`);
  });
} else {
  console.log('  无许可证信息');
}

console.log(`\n需要署名的歌曲: ${requiresAttributionCount} 首`);

const totalDuration = musicData.reduce((sum, song) => sum + song.duration, 0);
const avgDuration = Math.round(totalDuration / musicData.length);
console.log(`\n总时长: ${Math.floor(totalDuration / 60)} 分钟`);
console.log(`平均时长: ${Math.floor(avgDuration / 60)}:${(avgDuration % 60).toString().padStart(2, '0')}\n`);
