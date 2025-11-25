# 🎵 免费音乐资源获取指南

本文档介绍如何为你的 acidwave 项目获取免费、合法的音乐资源。

## 📚 推荐的免费音乐资源

### 1. Bensound ⭐ 最推荐 (已集成)
- **网站**: https://www.bensound.com
- **授权**: 免费使用,需要署名
- **特点**: 高质量音乐,直接可用的 MP3 链接
- **使用方式**: 已在 `sample-data.sql` 中集成
- **署名要求**: 在应用中添加 "Music by Bensound.com"

```javascript
// 前端署名示例
<footer>
  Music by <a href="https://www.bensound.com">Bensound.com</a>
</footer>
```

### 2. Free Music Archive (FMA)
- **网站**: https://freemusicarchive.org
- **授权**: Creative Commons (多种授权类型)
- **API**: 有官方 API
- **特点**: 海量音乐,质量高

**使用方法**:
1. 浏览网站选择音乐
2. 下载 MP3 文件
3. 上传到 Supabase Storage
4. 在数据库中记录链接

### 3. Jamendo Music
- **网站**: https://www.jamendo.com
- **API**: https://developer.jamendo.com
- **授权**: Creative Commons
- **特点**: 超过50万首曲目,有完整的 API

**API 集成步骤**:
```bash
# 1. 注册获取 API Key
# 访问 https://developer.jamendo.com/v3.0

# 2. 使用我们提供的集成服务
# 文件: backend/src/services/jamendo.js
```

### 4. Incompetech (Kevin MacLeod)
- **网站**: https://incompetech.com/music
- **授权**: CC BY 4.0
- **特点**: 2000+ 首音乐,分类清晰
- **署名**: "Music by Kevin MacLeod (incompetech.com)"

### 5. ccMixter
- **网站**: http://ccmixter.org
- **授权**: Creative Commons
- **特点**: Remix 和原创音乐

### 6. Pixabay Music
- **网站**: https://pixabay.com/music
- **授权**: Pixabay License (免费商用)
- **特点**: 无需署名,完全免费

### 7. YouTube Audio Library
- **网站**: https://studio.youtube.com/channel/UC.../music
- **授权**: 免费使用,部分需要署名
- **特点**: YouTube 官方,质量有保证

---

## 🚀 快速开始 - 三种方法

### 方法 1: 使用预置的示例数据 (最简单) ⭐

```bash
# 1. 在 Supabase 中创建表结构
# 运行 backend/database/schema.sql

# 2. 导入示例音乐数据
# 运行 backend/database/sample-data.sql
```

这将添加 10 首来自 Bensound 的免费音乐和 4 个播放列表。

### 方法 2: 使用 Jamendo API (推荐用于生产)

```bash
# 1. 获取 Jamendo API Key
# 访问 https://developer.jamendo.com

# 2. 配置环境变量
echo "JAMENDO_CLIENT_ID=your_client_id" >> backend/.env

# 3. 使用导入路由
curl -X POST http://localhost:3000/api/import/jamendo \
  -H "Content-Type: application/json" \
  -d '{"limit": 50}'
```

### 方法 3: 手动上传音乐文件

#### 步骤 1: 下载音乐
从上述网站下载免费音乐文件

#### 步骤 2: 上传到 Supabase Storage

```javascript
// 在 Supabase Dashboard 中:
// 1. Storage -> Create Bucket -> 命名为 "music"
// 2. 设置为 public bucket
// 3. 上传 MP3 文件

// 或者使用代码上传:
import { supabase } from './config/supabase.js';

async function uploadMusic(file) {
  const { data, error } = await supabase.storage
    .from('music')
    .upload(`songs/${file.name}`, file, {
      cacheControl: '3600',
      upsert: false
    });

  if (error) throw error;

  // 获取公开 URL
  const { data: urlData } = supabase.storage
    .from('music')
    .getPublicUrl(data.path);

  return urlData.publicUrl;
}
```

#### 步骤 3: 添加到数据库

```sql
INSERT INTO songs (title, artist, album, duration, url, cover_url, genre)
VALUES (
  'Your Song Title',
  'Artist Name',
  'Album Name',
  180,
  'https://your-project.supabase.co/storage/v1/object/public/music/songs/song.mp3',
  'https://your-project.supabase.co/storage/v1/object/public/music/covers/cover.jpg',
  'Pop'
);
```

---

## 📝 版权和署名

### 必须遵守的规则:

1. **Bensound**: 添加署名 "Music by Bensound.com"
2. **Kevin MacLeod**: 添加署名 "Music by Kevin MacLeod (incompetech.com)"
3. **CC BY**: 必须署名原作者
4. **CC0/Public Domain**: 无需署名
5. **Pixabay License**: 无需署名

### 推荐的署名位置:

```html
<!-- 在应用的 footer 中 -->
<footer class="app-footer">
  <p>Music provided by:</p>
  <ul>
    <li><a href="https://www.bensound.com">Bensound.com</a></li>
    <li><a href="https://incompetech.com">Kevin MacLeod (incompetech.com)</a></li>
    <li><a href="https://www.jamendo.com">Jamendo Music</a></li>
  </ul>
</footer>
```

---

## 🎯 最佳实践

### 1. 文件存储
- 小项目: 使用 Bensound/Incompetech 的直接链接
- 生产环境: 上传到 Supabase Storage 或 CDN

### 2. 音频格式
- 推荐: MP3 (兼容性最好)
- 备选: OGG, WebM
- 比特率: 128-320 kbps

### 3. 封面图片
- 尺寸: 500x500 或 1000x1000
- 格式: JPG/PNG
- 来源: Unsplash, Pexels (免费图片)

### 4. 数据库最佳实践

```javascript
// 添加歌曲时检查是否已存在
const { data: existing } = await supabase
  .from('songs')
  .select('id')
  .eq('title', title)
  .eq('artist', artist)
  .single();

if (!existing) {
  // 插入新歌曲
}
```

---

## 🔧 工具和脚本

### 批量导入脚本

创建文件 `backend/scripts/import-music.js`:

```javascript
import { supabase } from '../src/config/supabase.js';
import fs from 'fs';

const musicData = [
  {
    title: 'Song 1',
    artist: 'Artist 1',
    url: 'https://...',
    // ...
  }
];

async function importMusic() {
  const { data, error } = await supabase
    .from('songs')
    .insert(musicData);

  if (error) {
    console.error('Error:', error);
  } else {
    console.log(`Imported ${data.length} songs`);
  }
}

importMusic();
```

运行:
```bash
node backend/scripts/import-music.js
```

---

## 📊 推荐的初始数据集

### 适合演示的曲目组合:

1. **轻音乐** (5首) - Bensound 的 Acoustic 系列
2. **流行音乐** (5首) - Jamendo 的热门曲目
3. **背景音乐** (5首) - Kevin MacLeod 的 Cinematic 系列
4. **电子音乐** (5首) - ccMixter 的 Remix

总计: 20首歌曲,足够进行功能演示

---

## ⚠️ 注意事项

1. **不要使用**:
   - 盗版音乐
   - 未授权的商业音乐
   - YouTube 视频中的音频(除非来自 Audio Library)

2. **检查授权**:
   - 每首歌都要检查具体的授权条款
   - 商业使用需要额外注意

3. **备份**:
   - 保存授权文档
   - 记录音乐来源

---

## 🎉 快速测试

运行以下命令快速测试你的音乐系统:

```bash
# 1. 导入示例数据
psql -U postgres -d your_db -f backend/database/sample-data.sql

# 2. 测试 API
curl http://localhost:3000/api/songs

# 3. 播放测试
# 在浏览器中打开任意歌曲的 URL
```

---

## 📞 资源链接

- Bensound: https://www.bensound.com/royalty-free-music
- FMA: https://freemusicarchive.org
- Jamendo API: https://developer.jamendo.com
- Incompetech: https://incompetech.com/music/royalty-free/music.html
- Pixabay Music: https://pixabay.com/music/

有问题?查看各平台的使用条款和授权协议。
