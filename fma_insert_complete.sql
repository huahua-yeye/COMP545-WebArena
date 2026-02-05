-- ============================================
-- FMA 完整数据插入SQL
-- 生成时间: 2026-02-05 02:33:01
-- 歌曲数: 200
-- 艺术家数: 41
-- 专辑数: 64
-- 在Supabase SQL Editor中执行此脚本
-- ============================================

-- ============================================
-- 第一部分: 插入艺术家
-- ============================================

-- 艺术家 1: Breuss Arrizabalaga Quintet

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Breuss Arrizabalaga Quintet',
  'Markus Breuss (Suiza) y Pelayo Arrizabalaga (Laredo/España), junto a Justo Bagüeste, fueron los creadores en 1984 de Clónicos: un taller…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FBreuss_Arrizabalaga_Quintet_-_20100421164935071.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz', 'Free-Jazz'],
  NULL,
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 2: Pierce Murphy

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Pierce Murphy',
  'Just a guy who grew up playing guitars and writing songs in Denver, Colorado. My background and training is in…',
  'https://freemusicarchive.org/image/?file=image%2FH5omxl4a6g4SyZgsmZYs2dngzcva3Bb07ZbgXm7Q.jpeg&width=290&height=290&type=artist',
  ARRAY['Jazz', 'Jazz: Vocal'],
  NULL,
  'https://freemusicarchive.org/music/Pierce_Murphy/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 3: William Ross Chernoff's Nomads

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'William Ross Chernoff''s Nomads',
  NULL,
  'https://freemusicarchive.org/image/?file=member_profile%2Fgak8us6fxjYIiBa8uQGUiTJozXkMMMr6lmd1HM88.jpg&width=145&height=145&type=user',
  ARRAY['Jazz'],
  NULL,
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 4: Beat Mekanik

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Beat Mekanik',
  'Johnathon M. Horner is a highly accomplished writer, composer, producer, audio engineer, and sound designer, boasting a remarkable career spanning…',
  'https://freemusicarchive.org/image/?file=artist_image%2FGzjBZKTsRVQlJSMpvEUaxKaK5ChkxW8HeSIK25EO.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz'],
  NULL,
  'https://freemusicarchive.org/music/beat-mekanik/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 5: Aki Streeter & Strange Sauces

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Aki Streeter & Strange Sauces',
  'Aki Streeter is one of the weirdest musical figures to ever walk the grey Earth.
Known from bands like Heimwerker,…',
  'https://freemusicarchive.org/image/?file=artist_image%2F5fF2vIMoXKCprxasOHmH3aQ7tK77eJr7nCF14FCF.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz'],
  NULL,
  'https://freemusicarchive.org/music/aki-streeter-strange-sauces/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 6: Kevin MacLeod

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Kevin MacLeod',
  'For information about usage, please see my licenses page here: http://incompetech.com/music/royalty-free/licenses/
 
Still more questions? Read the FAQ! :-)
http://incompetech.com/music/royalty-free/faq.html',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FKevin_MacLeod_-_20110715150335323.png&width=290&height=290&type=artist',
  ARRAY['Jazz'],
  NULL,
  'https://freemusicarchive.org/music/Kevin_MacLeod/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 7: Jesse Spillane

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Jesse Spillane',
  'I am a Pittsburgh-based musician who creates dynamic and exciting instrumental music which spans multiple genres and styles. I have…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FJesse_Spillane_-_20160223145908080.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz'],
  NULL,
  'https://freemusicarchive.org/music/Jesse_Spillane/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 8: Vic Dillahay

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Vic Dillahay',
  'Guitarist. (occasional musician)',
  'https://freemusicarchive.org/image/?file=artist_image%2FJn4dLSrCKtbcMBiViVIga5tI5IRXbtdo1pROEqRk.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz', 'Free-Jazz', 'Ambient'],
  NULL,
  'https://freemusicarchive.org/music/vic-dillahay/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 9: 1st Contact

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  '1st Contact',
  'Most of our tracks are "out of the blue": no arrangement, just live improvisations, recorded with our weekly sessions -…',
  'https://freemusicarchive.org/image/?file=artist_image%2FZkKUd1LKvZKe5xfCXHvch0IfS3LeTeiEbLT6jVH5.jpg&width=290&height=290&type=artist',
  ARRAY['Jazz', 'Jazz: Vocal', 'Ambient'],
  NULL,
  'https://freemusicarchive.org/music/1st-contact/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 10: Lemon Knife

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Lemon Knife',
  'Lemon Knife is a Chicago-based hard rock duo with punk edges, classic rock sensibilities, and literate lyrics on a wide…',
  'https://freemusicarchive.org/image/?file=artist_image%2F4bWsoOMj3DVyW0DG1AlCld1fnPn2IWEJ6BZ0g7ZE.jpg&width=290&height=290&type=artist',
  ARRAY['Rock', 'Psych-Rock', 'Space-Rock'],
  NULL,
  'https://freemusicarchive.org/music/lemon-knife/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 11: Jon Shuemaker

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Jon Shuemaker',
  'Multi-genre composer and songwriter. For inquiries and custom compositions his email is in Biography tab.',
  'https://freemusicarchive.org/image/?file=artist_image%2FrZxW9PwLVr6bEHlixZDr4iWhR1rj2qtQkwGinpae.jpg&width=290&height=290&type=artist',
  ARRAY['Rock', 'Loud-Rock', 'Indie-Rock'],
  NULL,
  'https://freemusicarchive.org/music/jon-shuemaker/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 12: VADE

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'VADE',
  'Hear it. Question it. Deconstruct it. Rebuild it. Repeat.',
  'https://freemusicarchive.org/image/?file=artist_image%2Fanipfk3sLGYqIUcWsn0U0bIhyieoeHKQq28kgJnZ.png&width=290&height=290&type=artist',
  ARRAY['Rock', 'Psych-Rock', 'Indie-Rock'],
  NULL,
  'https://freemusicarchive.org/music/vade/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 13: human gazpacho

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'human gazpacho',
  'Please send any project you use this music in to clay@claylomneth.com, I love to see what people are creating!

I''m…',
  'https://freemusicarchive.org/image/?file=image%2FWeYY1o12D17Bwg8l2NFYn5QCIVqqKkXt7lp7uKbS.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/human-gazpacho/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 14: Amarent

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Amarent',
  'Amarent, anagram of Maarten Schellekens, is the artist name, under which I release my electronic music.',
  'https://freemusicarchive.org/image/?file=artist_image%2FOR6m27Y1CCmQ2xbXhuCpmb1giJzE0BfD6317DOmk.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/amarent/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 15: Jangwa

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Jangwa',
  '[a.k.a. Dilating Times]. Endless sands drift slow, naive strokes in time''s long fight, moon''s tune heals the void.',
  'https://freemusicarchive.org/image/?file=artist_image%2FDJ0xxOHRLW6jodrs4APBaduylCddNHWioDt4Gf1O.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/Dilating_Times/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 16: Brylie Christopher

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Brylie Christopher',
  'Producing music for wellness and healing.',
  'https://freemusicarchive.org/image/?file=artist_image%2FzCJm6wY4APi0rKGNo7V5vtk0mYoxV90U37DASeJZ.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 17: Tea K Pea

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Tea K Pea',
  'Hi. I am here just experimenting with sounds. Hope you enjoy. Bye.',
  'https://freemusicarchive.org/image/?file=artist_image%2FMhTIqnHzQ5aVfBxl5JziPjll99gKdAEpRXSOW9PM.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/tea-k-pea/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 18: Timo Versemann

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Timo Versemann',
  NULL,
  'https://freemusicarchive.org/image/?file=image%2F9SoEYceEzlmmhGIXP9zU9Bq3IB8OfgYQWrewC3na.jpeg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/timoversemann/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 19: Anisotropic Psyche

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Anisotropic Psyche',
  'Musical gimmicks, experiments and music for my private video productions, which I like to share with the community. Have fun…',
  'https://freemusicarchive.org/image/?file=artist_image%2F18dsqVABhldLV8vCek80qAfcyw3eIFgpFzIKzV0s.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/anisotropic-psyche/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 20: Marihiko Hara

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Marihiko Hara',
  NULL,
  NULL,
  ARRAY['Electronic', 'Ambient Electronic'],
  NULL,
  'https://freemusicarchive.org/music/Marihiko_Hara/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 21: Itsensäsyöjät

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Itsensäsyöjät',
  NULL,
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=290&height=290&type=album',
  ARRAY['Electronic', 'Minimal Electronic'],
  NULL,
  'https://freemusicarchive.org/music/Itsenssyjt/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 22: Ieva

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Ieva',
  NULL,
  NULL,
  ARRAY['Electronic', 'Ambient Electronic'],
  NULL,
  'https://freemusicarchive.org/music/Ieva/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 23: Justin Tuijl

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Justin Tuijl',
  'I''LL NEVER USE A.I.
I have been making music & DJing for years & have several different project names. Output…',
  'https://freemusicarchive.org/image/?file=artist_image%2F83EZOjq9pk3EC1SDCJrh1Vjc0a92CQvu4NUH03Ev.jpg&width=290&height=290&type=artist',
  ARRAY['Electronic', 'Ambient Electronic'],
  NULL,
  'https://freemusicarchive.org/music/justin-tuijl/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 24: HoliznaCC0

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'HoliznaCC0',
  'Hi! I''ve really enjoyed uploading music here. so many people are doing so many interesting things, and I get to…',
  'https://freemusicarchive.org/image/?file=image%2FkKZ8JbB01ExxQFeb92STpyoUT13K7VZ6qUQgQNR7.jpeg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Power-Pop', 'Synth Pop'],
  NULL,
  'https://freemusicarchive.org/music/holiznacc0/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 25: Zane Little

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Zane Little',
  'Hello! I''m Zane Little, a dedicated composer specialized in crafting royalty-free music for video games. My experience covers a broad…',
  'https://freemusicarchive.org/image/?file=artist_image%2Fz1yJG7dIb2XtYiliyPNPWejxhcL0uyYugojQd1Lp.jpg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Experimental Pop', 'Synth Pop'],
  NULL,
  'https://freemusicarchive.org/music/zane-little/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 26: Adeline Yeo (HP)

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Adeline Yeo (HP)',
  'Adeline Yeo (HP) is an unsigned Indie Musician based in Asia region, Singapore. With no prior musical knowledge and experience,…',
  'https://freemusicarchive.org/image/?file=artist_image%2FEiKWBZmcKafIggrpAozoMDPSqK3uULqkJAm9XUf4.jpg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Experimental Pop', 'C-pop'],
  NULL,
  'https://freemusicarchive.org/music/adeline-yeo-hp/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 27: Andrey Petrov

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Andrey Petrov',
  NULL,
  'https://freemusicarchive.org/image/?file=member_profile%2Ftl4Tbc2jOa3GLQoLLaOrNbI4zwZ00IwwARpEJLav.png&width=145&height=145&type=user',
  ARRAY['Pop', 'Experimental Pop', 'Power-Pop'],
  NULL,
  'https://freemusicarchive.org/music/andrey-petrov/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 28: SUPERARE

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'SUPERARE',
  'Hey! :) Please support me by sending any amount to this Paypal link, it helps me continue to create amazing…',
  'https://freemusicarchive.org/image/?file=artist_image%2Fnsj5DwBIPk6R4txIgtjoD5mKUKKd70QoDrtmjPhk.jpg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Synth Pop'],
  NULL,
  'https://freemusicarchive.org/music/superare/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 29: Tadz

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Tadz',
  'Hey! :) Please support me by sending any amount to this Paypal link, it helps me continue to create amazing…',
  'https://freemusicarchive.org/image/?file=artist_image%2F42zCfVnR9qYhEW9JdNIjo3wMMS3AjnWEW6crSupC.jpg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Power-Pop'],
  NULL,
  'https://freemusicarchive.org/music/tadz/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 30: Origami Repetika

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Origami Repetika',
  'I enjoy making music for me to listen to & sharing it with anyone interested.',
  'https://freemusicarchive.org/image/?file=image%2Fq5ZuEMNt4L5rb03pwBk2cblTnIcoNhF9Aor3sZoL.jpeg&width=290&height=290&type=artist',
  ARRAY['Pop', 'Synth Pop'],
  NULL,
  'https://freemusicarchive.org/music/Origami_Repetika/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 31: Kate Kody

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Kate Kody',
  NULL,
  'https://freemusicarchive.org/image/?file=artist_image%2Fs91x9sVbGBl3WpMcR4lf84cZrDZkWwbZnefeTn6J.png&width=290&height=290&type=artist',
  ARRAY['Pop', 'Synth Pop'],
  NULL,
  'https://freemusicarchive.org/music/kate-kody/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 32: A. Cooper

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'A. Cooper',
  'Hello, my name is A. Cooper. I''m an independent musician with introversion and autism. I only make beats, I don''t…',
  'https://freemusicarchive.org/image/?file=album_image%2FrKAwF8cbaXidL7Fu7OsjUjUKXamEDYnufTJwazVL.png&width=290&height=290&type=album',
  ARRAY['Pop'],
  NULL,
  'https://freemusicarchive.org/music/a-cooper/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 33: Greg Atkinson

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Greg Atkinson',
  '“Strange harmonic twists underlining powerful and emotive lyrics” - Tom Robinson, BBC6 Music





"Greg does Brains" :) (BBC Tees Introducing).…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FGreg_Atkinson_-_2017042862302434.jpg&width=290&height=290&type=artist',
  ARRAY['Folk', 'British Folk'],
  NULL,
  'https://freemusicarchive.org/music/Greg_Atkinson/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 34: Austin Moffa

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Austin Moffa',
  NULL,
  'https://freemusicarchive.org/image/?file=image%2FrlxO8P7g5hJEnXUwcYi9LzbySeyvtWY7iaqlF2ma.jpeg&width=290&height=290&type=artist',
  ARRAY['Folk', 'Psych-Folk'],
  NULL,
  'https://freemusicarchive.org/music/austin-moffa/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 35: Howie Mitchell & Charlotte Williams

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Howie Mitchell & Charlotte Williams',
  NULL,
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=290&height=290&type=album',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 36: Katy Kirby

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Katy Kirby',
  'En toute simplicité, Katy Kirby nous livre une folk douce et épurée.',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FKaty_Kirby_-_2015110482139537.jpg&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/Katy_Kirby/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 37: Josh Woodward

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Josh Woodward',
  'Josh Woodward seems to have a career death wish. A prolific indie acoustic-rock songwriter, he has released ten albums in…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FJosh_Woodward_-_2013101594658340.jpg&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/Josh_Woodward/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 38: Ben von Wildenhaus

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Ben von Wildenhaus',
  'RECORDINGS UNDER FIVE MINUTES BY BEN VON WILDENHAUS DELIVERED THROUGH THE MEDIUM OF PODCAST FROM BROOKLYN, NY. ALWAYS NO LYRICSINSTRUMENTAL…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FBen_von_Wildenhaus_-_2012022693222183.png&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/BenWildenhaus/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 39: Kelly Latimore

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Kelly Latimore',
  NULL,
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FKelly_Latimore_-_2014072250338651.jpg&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/Kelly_Latimore/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 40: Howie Mitchell

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'Howie Mitchell',
  NULL,
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FHowie_Mitchell_-_20120811154850471.jpg&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/Howie_Mitchell/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();

-- 艺术家 41: The Midnight Sons

INSERT INTO artists (
  name,
  bio,
  avatar_url,
  genres,
  country,
  website_url,
  social_links
)
VALUES (
  'The Midnight Sons',
  'The Midnight Sons est un trio américain de musiciens de Caroline du Nord. Cet album est centré sur le doute…',
  'https://freemusicarchive.org/image/?file=images%2Fartists%2FThe_Midnight_Sons_-_2017122645219008.jpg&width=290&height=290&type=artist',
  ARRAY['Folk'],
  NULL,
  'https://freemusicarchive.org/music/The_Midnight_Sons/',
  '{"youtube": "https://www.youtube.com/user/TribeofNoise", "instagram": "https://www.instagram.com/tribeofnoise/", "facebook": "https://www.facebook.com/freemusicarchive/"}'::jsonb
)
ON CONFLICT (name) DO UPDATE SET 
  bio = COALESCE(EXCLUDED.bio, artists.bio),
  avatar_url = COALESCE(EXCLUDED.avatar_url, artists.avatar_url),
  updated_at = NOW();


-- ============================================
-- 第二部分: 插入专辑
-- ============================================

-- 专辑 1: Nfamoudou-Boudougou by Breuss Arrizabalaga Quintet

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Nfamoudou-Boudougou',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  '2003-07-19',
  'Jazz, Free-Jazz',
  NULL,
  10,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 2: Fellow Traveler by Pierce Murphy

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Fellow Traveler',
  (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2Fc3LlLSbRw2BaCzRRETEstwKrI5DbQar62S4DhsLI.jpg&width=400&height=400&type=album',
  '2024-10-03',
  'Jazz, Jazz: Vocal',
  NULL,
  5,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Pierce_Murphy/fellow-traveler',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 3: Aim to Stay by William Ross Chernoff's Nomads

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Aim to Stay',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  NULL,
  NULL,
  'Jazz',
  NULL,
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 4: Unnamed album by Beat Mekanik

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  NULL,
  NULL,
  'Jazz',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 5: Unnamed album by Aki Streeter & Strange Sauces

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Aki Streeter & Strange Sauces' LIMIT 1),
  NULL,
  NULL,
  'Jazz',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 6: Jazz Sampler by Kevin MacLeod

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Jazz Sampler',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  '2011-07-15',
  'Jazz',
  NULL,
  16,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 7: The Meeting Place by Jesse Spillane

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'The Meeting Place',
  (SELECT id FROM artists WHERE name = 'Jesse Spillane' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FByFeIAFWQXFO4gIDW9x7PaWkx8zomWsoFMopiDpK.jpg&width=400&height=400&type=album',
  '2023-06-01',
  'Jazz',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Jesse_Spillane/the-meeting-place',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 8: We Were by Vic Dillahay

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'We Were',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  '2018-09-18',
  'Jazz, Free-Jazz, Ambient',
  NULL,
  14,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/vic-dillahay/we-were',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 9: Unnamed album by Pierce Murphy

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1),
  NULL,
  NULL,
  'Jazz, Jazz: Vocal, Holiday',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 10: Unnamed album by 1st Contact

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = '1st Contact' LIMIT 1),
  NULL,
  NULL,
  'Jazz, Jazz: Vocal, Ambient',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 11: Songs About Water and Death by Lemon Knife

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Songs About Water and Death',
  (SELECT id FROM artists WHERE name = 'Lemon Knife' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FSdcCixKP5l3gCQaj7QALCRJqeAFv3nsHdO45EAuC.jpg&width=400&height=400&type=album',
  '2018-04-19',
  'Rock, Psych-Rock, Space-Rock',
  NULL,
  13,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/lemon-knife/songs-about-water-and-death',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 12: Song Bird (Part 2) by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Song Bird (Part 2)',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  '2025-05-25',
  'Rock, Loud-Rock, Indie-Rock',
  NULL,
  16,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 13: Song Bird (Part 1) by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Song Bird (Part 1)',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  '2025-05-25',
  'Rock, Loud-Rock, Indie-Rock',
  NULL,
  16,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 14: Unnamed album by VADE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'VADE' LIMIT 1),
  NULL,
  NULL,
  'Rock, Psych-Rock, Indie-Rock',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 15: Survival Mode by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Survival Mode',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F4H8P4MG9faGsvmRapaAhb14ybFNthu4DyKP11uYt.jpg&width=400&height=400&type=album',
  '2025-05-31',
  'Rock, Loud-Rock, Indie-Rock',
  NULL,
  1,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/survival-mode',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 16: Save Our Ship by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Save Our Ship',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F0FEJ3JjicVmasLbHgoVXT6lCUli5pvMvDVDkFzkd.png&width=400&height=400&type=album',
  '2025-07-20',
  'Rock, Loud-Rock, Indie-Rock',
  NULL,
  2,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/save-our-ship',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 17: Not Alone by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Not Alone',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FcOYDiix7kypakrQMeLF9rDM10eGhvj0GbIZzeyBu.jpg&width=400&height=400&type=album',
  '2025-08-04',
  'Rock, Psych-Rock, Indie-Rock',
  NULL,
  1,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/not-alone',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 18: From the Highest Vantage by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'From the Highest Vantage',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FpfKYvnfxk2ySgpCWdhHJKklkHGAlm5efUBjoC5vT.jpg&width=400&height=400&type=album',
  '2025-04-06',
  'Rock, Loud-Rock, Psych-Rock',
  NULL,
  1,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/from-the-highest-vantage',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 19: Overcome by Jon Shuemaker

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Overcome',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FXLXuniPkTv6AcG9t0bVgCDQN7Sp0fOtLPoxh1AW4.jpg&width=400&height=400&type=album',
  '2025-07-15',
  'Rock, Loud-Rock, Indie-Rock',
  NULL,
  3,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/jon-shuemaker/overcome',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 20: Arcane Resonance by human gazpacho

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Arcane Resonance',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  '2024-05-16',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  16,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 21: Free Atmospheric Music by Amarent

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Free Atmospheric Music',
  (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FBVCWr0V1BQZ2zfmPIyv6fHvYIYR61dsAqRtif1vo.png&width=400&height=400&type=album',
  '2025-05-04',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  4,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/amarent/free-atmospheric-music',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 22: Cycles Trax by Jangwa

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Cycles Trax',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  'https://freemusicarchive.org/image/?file=image%2FG5YCuGm0KO61UaUJZoU3a8ATQ0vjjx013IwPUNTB.jpeg&width=400&height=400&type=album',
  '2022-02-13',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  8,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Dilating_Times/cycles-trax',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 23: Cycles Trax vol. VII - Loosening Bounds by Jangwa

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Cycles Trax vol. VII - Loosening Bounds',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2Ff1r8bfZ9biTatsYFBWipypRwXhZ30sT7F0iZvoJ3.jpg&width=400&height=400&type=album',
  '2025-01-31',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  5,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Dilating_Times/cycles-trax-vol-vii-loosening-bounds',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 24: Free Electronic Music by Amarent

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Free Electronic Music',
  (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FjKu4hpCAXqFgLOqYTjegMkUKqwUFRxSVxGYuQ94f.jpg&width=400&height=400&type=album',
  '2025-05-08',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  10,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/amarent/free-electronic-music',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 25: Neither and Both by Brylie Christopher

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Neither and Both',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  '2023-12-06',
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 26: Unnamed album by Jangwa

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  NULL,
  NULL,
  'Electronic, Ambient Electronic, Minimal Electronic',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 27: Unnamed album by Tea K Pea

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Tea K Pea' LIMIT 1),
  NULL,
  NULL,
  'Electronic, Ambient Electronic, Minimal Electronic',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 28: Peace & Passion by Timo Versemann

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Peace & Passion',
  (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1),
  'https://freemusicarchive.org/image/?file=image%2FhQK0rqP6r3r8Tv3xnqAxrBuQ4qRQhZsNQA0X0Qua.png&width=400&height=400&type=album',
  '2022-05-21',
  'Electronic, Minimal Electronic',
  NULL,
  6,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/timoversemann/peace-passion',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 29: Neural Awakening by Anisotropic Psyche

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Neural Awakening',
  (SELECT id FROM artists WHERE name = 'Anisotropic Psyche' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F4FkOe47GCDSC0ojhTCuGao63jaZkTx8YjvtAOVd6.jpg&width=400&height=400&type=album',
  '2023-01-24',
  'Electronic, Minimal Electronic',
  NULL,
  5,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/anisotropic-psyche/neural-awakening',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 30: Summer Tour Remix v2 [V/A] by Marihiko Hara

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Summer Tour Remix v2 [V/A]',
  (SELECT id FROM artists WHERE name = 'Marihiko Hara' LIMIT 1),
  NULL,
  NULL,
  'Electronic, Ambient Electronic',
  NULL,
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Marihiko_Hara/Summer_Tour_Remix_v2_1865',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 31: Elektrique by Itsensäsyöjät

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Elektrique',
  (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=400&height=400&type=album',
  '2017-03-20',
  'Electronic, Minimal Electronic',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Itsenssyjt/Elektrique',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 32: Electronic Church Instrumentals by Timo Versemann

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Electronic Church Instrumentals',
  (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1),
  'https://freemusicarchive.org/image/?file=image%2FTBJAwNWg6Djnl7Z7dOAQYYg3gt16dmXsWFzV67po.png&width=400&height=400&type=album',
  '2021-10-02',
  'Electronic, Ambient Electronic',
  NULL,
  4,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/timoversemann/electronic-church-instrumentals',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 33: Summer Tour Remix v2 [V/A] by Ieva

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Summer Tour Remix v2 [V/A]',
  (SELECT id FROM artists WHERE name = 'Ieva' LIMIT 1),
  NULL,
  NULL,
  'Electronic, Ambient Electronic',
  NULL,
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Ieva/Summer_Tour_Remix_v2_1865',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 34: Magic Tortoise by Justin Tuijl

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Magic Tortoise',
  (SELECT id FROM artists WHERE name = 'Justin Tuijl' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FcPtELCUwU8FzDhwstHK7w6rvGVeHSXlH9F4xfVBu.jpg&width=400&height=400&type=album',
  '2011-01-01',
  'Electronic, Ambient Electronic',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/justin-tuijl/magic-tortoise',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 35: Power Pop! by HoliznaCC0

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Power Pop!',
  (SELECT id FROM artists WHERE name = 'HoliznaCC0' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FI2odD8cOiITbu12KVloCCpxjBYS3WdnD7Mc3i7RI.png&width=400&height=400&type=album',
  '2022-05-25',
  'Pop, Power-Pop, Synth Pop',
  NULL,
  14,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/holiznacc0/power-pop',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 36: ♥ by Zane Little

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  '♥',
  (SELECT id FROM artists WHERE name = 'Zane Little' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FIpMGNjQzvneUaWpfWepqagmxMltAoUlkv6dNzsTM.png&width=400&height=400&type=album',
  '2023-05-24',
  'Pop, Experimental Pop, Synth Pop',
  NULL,
  6,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/zane-little/-2',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 37: Unnamed album by Adeline Yeo (HP)

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  NULL,
  NULL,
  'Pop, Experimental Pop, C-pop',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 38: Unnamed album by Andrey Petrov

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1),
  NULL,
  NULL,
  'Pop, Experimental Pop, Power-Pop',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 39: IV by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'IV',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2Fe4QcC8DAVTJ3GKxJROpqSo41J8wvfIVvBEPn9Ec7.jpg&width=400&height=400&type=album',
  '2022-09-03',
  'Pop, Synth Pop',
  NULL,
  5,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/iv',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 40: II by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'II',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FnBGcOaYcqIaSICsUj9I3FdnpRt9wiGfbXsiXvhYX.jpg&width=400&height=400&type=album',
  '2022-09-03',
  'Pop, Synth Pop',
  NULL,
  16,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/ii',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 41: The Best Things In Life Are FREE: PASSION, HE₳Я₸, LOVE (Pt.2) by Tadz

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'The Best Things In Life Are FREE: PASSION, HE₳Я₸, LOVE (Pt.2)',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F18cEp84WADnUfw54gfp4bfwxjWHp8QpaxVWsacfV.png&width=400&height=400&type=album',
  '2023-01-25',
  'Pop, Power-Pop',
  NULL,
  15,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/tadz/the-best-things-in-life-are-free-passion-hearayakzt-love-pt2',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 42: The Happy Puppy Collection by Origami Repetika

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'The Happy Puppy Collection',
  (SELECT id FROM artists WHERE name = 'Origami Repetika' LIMIT 1),
  'https://freemusicarchive.org/image/?file=image%2FB9o9CdJdVd733cj4IAgdouf66rTVzVpk99GIXeGN.png&width=400&height=400&type=album',
  '2021-05-05',
  'Pop, Synth Pop',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Origami_Repetika/the-happy-puppy-collection',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 43: Pop Sensation by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Pop Sensation',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FiBmveJoUr73whV4V8bcZF1sV6cWbCyzCewLnJsoV.jpg&width=400&height=400&type=album',
  '2024-04-16',
  'Pop, Synth Pop',
  NULL,
  8,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/pop-sensation',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 44: I by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'I',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FGhYXpXUu8nGANDtOl5ELAKqYcq2NYaBEJ6KY6ukj.jpg&width=400&height=400&type=album',
  '2022-07-11',
  'Pop, Synth Pop',
  NULL,
  3,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/i-1',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 45: Sunflower Orange by Kate Kody

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Sunflower Orange',
  (SELECT id FROM artists WHERE name = 'Kate Kody' LIMIT 1),
  'https://freemusicarchive.org/image/?file=image%2FgSVFhzhFA4x4nviu4GkN5PJAe4cLCVcjw6Er85xL.png&width=400&height=400&type=album',
  '2020-01-25',
  'Pop, Synth Pop',
  NULL,
  11,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/kate-kody/sunflower-orange',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 46: The Anthony Cooper ABM VI by A. Cooper

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'The Anthony Cooper ABM VI',
  (SELECT id FROM artists WHERE name = 'A. Cooper' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FAx1mtWNdwcTEgkGsyszob18AZPaWGwAJLHaSo1kL.jpg&width=400&height=400&type=album',
  '2024-07-05',
  'Pop',
  NULL,
  10,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/a-cooper/the-anthony-cooper-abm-vi',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 47: The Quest For Love by Tadz

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'The Quest For Love',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FEIj1AUDDwlI6UKOeotvCawDmnkY9P0a0QVMq5FTl.webp&width=400&height=400&type=album',
  '2023-02-01',
  'Pop',
  NULL,
  2,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/tadz/the-quest-for-love',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 48: TV Kills CreaTVity by Tadz

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'TV Kills CreaTVity',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2Fcy7x7PEtcGQJGU5AjlIs2vbhbY7GDi4l3l9NdRyF.webp&width=400&height=400&type=album',
  '2023-02-01',
  'Pop',
  NULL,
  6,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/tadz/tv-kills-creatvity',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 49: IX by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'IX',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FXEYqY4ahH3QSmxt2QYWWlwA2el2eyaVopCAyeXf2.jpg&width=400&height=400&type=album',
  '2022-09-26',
  'Pop',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/ix',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 50: V by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'V',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FapGOiE4un3IKuzmEFxfRdzLuhitheUtJOyro912Z.jpg&width=400&height=400&type=album',
  '2022-09-03',
  'Pop',
  NULL,
  6,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/v',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 51: III by SUPERARE

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'III',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2FwgNDIwskt8KiIRb9Q8bShcg8IOaMofPenlhQWfet.jpg&width=400&height=400&type=album',
  '2022-09-03',
  'Pop',
  NULL,
  52,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/superare/iii',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 52: Unnamed album by Greg Atkinson

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unnamed album',
  (SELECT id FROM artists WHERE name = 'Greg Atkinson' LIMIT 1),
  NULL,
  NULL,
  'Folk, British Folk',
  'Free Music Archive is your number 1 resource for royalty free music and ''free to download'' music.',
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 53: A Speck of Dust in Space by Austin Moffa

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'A Speck of Dust in Space',
  (SELECT id FROM artists WHERE name = 'Austin Moffa' LIMIT 1),
  'https://freemusicarchive.org/image/?file=album_image%2F3iotBXI67Z2yYGLUHebMSJqh8iQtyrpzpG9zxkCS.jpg&width=400&height=400&type=album',
  '2024-05-10',
  'Folk, Psych-Folk',
  NULL,
  15,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/austin-moffa/a-speck-of-dust-in-space',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 54: 11-14-'58 by Howie Mitchell & Charlotte Williams

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  '11-14-''58',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=400&height=400&type=album',
  '2012-11-30',
  'Folk',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/Howie__Charlotte_Williams_11-14-58',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 55: 3 by Katy Kirby

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  '3',
  (SELECT id FROM artists WHERE name = 'Katy Kirby' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKaty_Kirby_-_3_-_2015110482225882.jpg&width=400&height=400&type=album',
  '2015-06-07',
  'Folk',
  NULL,
  3,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Katy_Kirby/Katy_Kirby',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 56: Dirty Wings by Josh Woodward

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Dirty Wings',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_-_20130814162606567.jpg&width=400&height=400&type=album',
  '2010-01-12',
  'Folk',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 57: Dirty Wings (Instrumentals) by Josh Woodward

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Dirty Wings (Instrumentals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  '2013-08-14',
  'Folk',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 58: Instrumental Quaalude, vol. 1 by Ben von Wildenhaus

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Instrumental Quaalude, vol. 1',
  (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FBen_von_Wildenhaus_-_Instrumental_Quaalude_vol_1_-_20120226131333372.png&width=400&height=400&type=album',
  '2012-02-26',
  'Folk',
  NULL,
  8,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/BenWildenhaus/Instrumental_Quaalude_vol_1',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 59: Trails by Kelly Latimore

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Trails',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  '2012-04-07',
  'Folk',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 60: Early 70s by Howie Mitchell

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Early 70s',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  '2012-08-10',
  'Folk',
  NULL,
  8,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 61: Unaccountable odes by Kelly Latimore

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Unaccountable odes',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Unaccountable_odes_-_2014072551132135.jpg&width=400&height=400&type=album',
  '2014-07-25',
  'Folk',
  NULL,
  12,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Kelly_Latimore/Unaccountable_odes',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 62: Prelude by Kelly Latimore

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Prelude',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Prelude_-_2014072553626046.jpg&width=400&height=400&type=album',
  '2012-01-30',
  'Folk',
  NULL,
  7,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Kelly_Latimore/Prelude',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 63: Decartes by The Midnight Sons

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  'Decartes',
  (SELECT id FROM artists WHERE name = 'The Midnight Sons' LIMIT 1),
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FThe_Midnight_Sons_-_Decartes_-_2017122645443527.jpg&width=400&height=400&type=album',
  '2016-04-30',
  'Folk',
  NULL,
  6,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/The_Midnight_Sons/Decartes',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();

-- 专辑 64: 11-14-'58 by Howie Mitchell

INSERT INTO albums (
  title,
  artist_id,
  cover_url,
  release_date,
  genre,
  description,
  total_tracks,
  label,
  license,
  source_url,
  requires_attribution
)
VALUES (
  '11-14-''58',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  NULL,
  NULL,
  'Folk',
  NULL,
  0,
  'Free Music Archive',
  'CC BY',
  'https://freemusicarchive.org/music/Howie_Mitchell/Howie__Charlotte_Williams_11-14-58',
  true
)
ON CONFLICT (title, artist_id) DO UPDATE SET
  cover_url = COALESCE(EXCLUDED.cover_url, albums.cover_url),
  release_date = COALESCE(EXCLUDED.release_date, albums.release_date),
  updated_at = NOW();


-- ============================================
-- 第三部分: 插入歌曲
-- ============================================

-- 歌曲 1: Cherenzig by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Cherenzig',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  624,
  'https://freemusicarchive.org/track/08_-_breuss_arrizabalaga_quintet_-_cherenzig/download/',
  'https://freemusicarchive.org/track/08_-_breuss_arrizabalaga_quintet_-_cherenzig/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/08_-_breuss_arrizabalaga_quintet_-_cherenzig/',
  true,
  false,
  37756,
  68
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 2: Pensamiento by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Pensamiento',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  94,
  'https://freemusicarchive.org/track/04_-_breuss_arrizabalaga_quintet_-_pensamiento/download/',
  'https://freemusicarchive.org/track/04_-_breuss_arrizabalaga_quintet_-_pensamiento/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/04_-_breuss_arrizabalaga_quintet_-_pensamiento/',
  true,
  false,
  46721,
  71
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 3: The Dark Side Of Frigiliana by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Dark Side Of Frigiliana',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  150,
  'https://freemusicarchive.org/track/01_-_breuss_arrizabalaga_quintet_-_the_dark_side_of_frigiliana/download/',
  'https://freemusicarchive.org/track/01_-_breuss_arrizabalaga_quintet_-_the_dark_side_of_frigiliana/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/01_-_breuss_arrizabalaga_quintet_-_the_dark_side_of_frigiliana/',
  true,
  false,
  26486,
  55
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 4: They Dwell On Other Planes by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'They Dwell On Other Planes',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  404,
  'https://freemusicarchive.org/track/06_-_breuss_arrizabalaga_quintet_-_they_dwell_on_other_planes/download/',
  'https://freemusicarchive.org/track/06_-_breuss_arrizabalaga_quintet_-_they_dwell_on_other_planes/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/06_-_breuss_arrizabalaga_quintet_-_they_dwell_on_other_planes/',
  true,
  false,
  26997,
  45
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 5: Ghosts by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ghosts',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  84,
  'https://freemusicarchive.org/track/10_-_breuss_arrizabalaga_quintet_-_ghosts/download/',
  'https://freemusicarchive.org/track/10_-_breuss_arrizabalaga_quintet_-_ghosts/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/10_-_breuss_arrizabalaga_quintet_-_ghosts/',
  true,
  false,
  43299,
  58
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 6: Mount Fuji by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mount Fuji',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  312,
  'https://freemusicarchive.org/track/05_-_breuss_arrizabalaga_quintet_-_mount_fuji/download/',
  'https://freemusicarchive.org/track/05_-_breuss_arrizabalaga_quintet_-_mount_fuji/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/05_-_breuss_arrizabalaga_quintet_-_mount_fuji/',
  true,
  false,
  40093,
  179
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 7: Tiempo Espacial by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Tiempo Espacial',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  360,
  'https://freemusicarchive.org/track/09_-_breuss_arrizabalaga_quintet_-_tiempo_espacial/download/',
  'https://freemusicarchive.org/track/09_-_breuss_arrizabalaga_quintet_-_tiempo_espacial/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/09_-_breuss_arrizabalaga_quintet_-_tiempo_espacial/',
  true,
  false,
  34391,
  34
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 8: Persimmon by Pierce Murphy

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Persimmon',
  (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Fellow Traveler' AND artist_id = (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1) LIMIT 1),
  NULL,
  167,
  'https://freemusicarchive.org/track/persimmon/download/',
  'https://freemusicarchive.org/track/persimmon/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fc3LlLSbRw2BaCzRRETEstwKrI5DbQar62S4DhsLI.jpg&width=400&height=400&type=album',
  'Jazz, Jazz: Vocal',
  '2024-10-03',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Pierce Murphy',
  'https://freemusicarchive.org/music/Pierce_Murphy/fellow-traveler/persimmon/',
  true,
  false,
  3105,
  19
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 9: Tsurugi by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Tsurugi',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  293,
  'https://freemusicarchive.org/track/02_-_breuss_arrizabalaga_quintet_-_tsurugi/download/',
  'https://freemusicarchive.org/track/02_-_breuss_arrizabalaga_quintet_-_tsurugi/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/02_-_breuss_arrizabalaga_quintet_-_tsurugi/',
  true,
  false,
  24333,
  58
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 10: Zubaida by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Zubaida',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  362,
  'https://freemusicarchive.org/track/03_-_breuss_arrizabalaga_quintet_-_zubaida/download/',
  'https://freemusicarchive.org/track/03_-_breuss_arrizabalaga_quintet_-_zubaida/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/03_-_breuss_arrizabalaga_quintet_-_zubaida/',
  true,
  false,
  55457,
  128
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 11: Nfamoudou-Boudougou by Breuss Arrizabalaga Quintet

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Nfamoudou-Boudougou',
  (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Nfamoudou-Boudougou' AND artist_id = (SELECT id FROM artists WHERE name = 'Breuss Arrizabalaga Quintet' LIMIT 1) LIMIT 1),
  NULL,
  330,
  'https://freemusicarchive.org/track/07_-_breuss_arrizabalaga_quintet_-_nfamoudou-boudougou/download/',
  'https://freemusicarchive.org/track/07_-_breuss_arrizabalaga_quintet_-_nfamoudou-boudougou/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FNfamoudou-Boudougou_-_20100421153321998.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz',
  '2010-04-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Breuss Arrizabalaga Quintet',
  'https://freemusicarchive.org/music/Breuss_Arrizabalaga_Quintet/Nfamoudou-Boudougou/07_-_breuss_arrizabalaga_quintet_-_nfamoudou-boudougou/',
  true,
  false,
  81477,
  123
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 12: In Shadows by William Ross Chernoff''s Nomads

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'In Shadows',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Aim to Stay' AND artist_id = (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1) LIMIT 1),
  NULL,
  384,
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_02_In_Shadows/download/',
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_02_In_Shadows/stream/',
  NULL,
  'Jazz',
  '2017-07-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - William Ross Chernoff''s Nomads',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_02_In_Shadows/',
  true,
  false,
  9664,
  97
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 13: Aim to Stay by William Ross Chernoff''s Nomads

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Aim to Stay',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Aim to Stay' AND artist_id = (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1) LIMIT 1),
  NULL,
  250,
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_03_Aim_to_Stay/download/',
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_03_Aim_to_Stay/stream/',
  NULL,
  'Jazz',
  '2017-07-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - William Ross Chernoff''s Nomads',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_03_Aim_to_Stay/',
  true,
  false,
  8913,
  60
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 14: Old Tyme Shoppe by Beat Mekanik

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Old Tyme Shoppe',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1) LIMIT 1),
  NULL,
  153,
  'https://freemusicarchive.org/track/old-tyme-shoppe/download/',
  'https://freemusicarchive.org/track/old-tyme-shoppe/stream/',
  NULL,
  'Jazz',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Beat Mekanik',
  'https://freemusicarchive.org/music/beat-mekanik//old-tyme-shoppe/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 15: Ahmad by William Ross Chernoff''s Nomads

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ahmad',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Aim to Stay' AND artist_id = (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1) LIMIT 1),
  NULL,
  284,
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_04_Ahmad/download/',
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_04_Ahmad/stream/',
  NULL,
  'Jazz',
  '2017-07-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - William Ross Chernoff''s Nomads',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_04_Ahmad/',
  true,
  false,
  10569,
  88
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 16: Eleminator.mp3 by Aki Streeter & Strange Sauces

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Eleminator.mp3',
  (SELECT id FROM artists WHERE name = 'Aki Streeter & Strange Sauces' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Aki Streeter & Strange Sauces' LIMIT 1) LIMIT 1),
  NULL,
  164,
  'https://freemusicarchive.org/track/eleminatormp3/download/',
  'https://freemusicarchive.org/track/eleminatormp3/stream/',
  NULL,
  'Jazz',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Aki Streeter & Strange Sauces',
  'https://freemusicarchive.org/music/aki-streeter-strange-sauces//eleminatormp3/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 17: Off to Osaka by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Off to Osaka',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  109,
  'https://freemusicarchive.org/track/Off_to_Osaka/download/',
  'https://freemusicarchive.org/track/Off_to_Osaka/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Off_to_Osaka/',
  true,
  false,
  45736,
  105
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 18: Dances and Dames by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Dances and Dames',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  146,
  'https://freemusicarchive.org/track/Dances_and_Dames/download/',
  'https://freemusicarchive.org/track/Dances_and_Dames/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Dances_and_Dames/',
  true,
  false,
  65631,
  194
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 19: Off to Osaka by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Off to Osaka',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  109,
  'https://freemusicarchive.org/track/Off_to_Osaka_1502/download/',
  'https://freemusicarchive.org/track/Off_to_Osaka_1502/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Off_to_Osaka_1502/',
  true,
  false,
  41807,
  215
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 20: Faster Does It by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Faster Does It',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  181,
  'https://freemusicarchive.org/track/Faster_Does_It/download/',
  'https://freemusicarchive.org/track/Faster_Does_It/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Faster_Does_It/',
  true,
  false,
  53056,
  236
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 21: I Knew a Guy by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'I Knew a Guy',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  166,
  'https://freemusicarchive.org/track/I_Knew_a_Guy/download/',
  'https://freemusicarchive.org/track/I_Knew_a_Guy/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/I_Knew_a_Guy/',
  true,
  false,
  43386,
  116
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 22: Makie Elkino by William Ross Chernoff''s Nomads

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Makie Elkino',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Aim to Stay' AND artist_id = (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1) LIMIT 1),
  NULL,
  368,
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_01_Makie_Elkino/download/',
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_01_Makie_Elkino/stream/',
  NULL,
  'Jazz',
  '2017-07-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - William Ross Chernoff''s Nomads',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_01_Makie_Elkino/',
  true,
  false,
  5765,
  55
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 23: I Knew a Guy by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'I Knew a Guy',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  166,
  'https://freemusicarchive.org/track/I_Knew_a_Guy_1821/download/',
  'https://freemusicarchive.org/track/I_Knew_a_Guy_1821/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/I_Knew_a_Guy_1821/',
  true,
  false,
  34747,
  91
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 24: Dances and Dames by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Dances and Dames',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  146,
  'https://freemusicarchive.org/track/Dances_and_Dames_1428/download/',
  'https://freemusicarchive.org/track/Dances_and_Dames_1428/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Dances_and_Dames_1428/',
  true,
  false,
  37480,
  85
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 25: Four-Way by William Ross Chernoff''s Nomads

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Four-Way',
  (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Aim to Stay' AND artist_id = (SELECT id FROM artists WHERE name = 'William Ross Chernoff''s Nomads' LIMIT 1) LIMIT 1),
  NULL,
  304,
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_05_Four-Way/download/',
  'https://freemusicarchive.org/track/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_05_Four-Way/stream/',
  NULL,
  'Jazz',
  '2017-07-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - William Ross Chernoff''s Nomads',
  'https://freemusicarchive.org/music/William_Ross_Chernoffs_Nomads/Aim_to_Stay/William_Ross_Chernoffs_Nomads_-_Aim_to_Stay_-_05_Four-Way/',
  true,
  false,
  13750,
  142
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 26: At the End of the Show by Jesse Spillane

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'At the End of the Show',
  (SELECT id FROM artists WHERE name = 'Jesse Spillane' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'The Meeting Place' AND artist_id = (SELECT id FROM artists WHERE name = 'Jesse Spillane' LIMIT 1) LIMIT 1),
  NULL,
  134,
  'https://freemusicarchive.org/track/at-the-end-of-the-show/download/',
  'https://freemusicarchive.org/track/at-the-end-of-the-show/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FByFeIAFWQXFO4gIDW9x7PaWkx8zomWsoFMopiDpK.jpg&width=400&height=400&type=album',
  'Jazz',
  '2023-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jesse Spillane',
  'https://freemusicarchive.org/music/Jesse_Spillane/the-meeting-place/at-the-end-of-the-show/',
  true,
  false,
  5046,
  52
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 27: Faster Does It by Kevin MacLeod

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Faster Does It',
  (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Jazz Sampler' AND artist_id = (SELECT id FROM artists WHERE name = 'Kevin MacLeod' LIMIT 1) LIMIT 1),
  NULL,
  181,
  'https://freemusicarchive.org/track/Faster_Does_It_1271/download/',
  'https://freemusicarchive.org/track/Faster_Does_It_1271/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKevin_MacLeod_-_Jazz_Sampler_-_20110715143147236.jpg&width=400&height=400&type=album',
  'Jazz',
  '2011-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kevin MacLeod',
  'https://freemusicarchive.org/music/Kevin_MacLeod/Jazz_Sampler/Faster_Does_It_1271/',
  true,
  false,
  44313,
  139
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 28: Dance of the Small Kitchen by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Dance of the Small Kitchen',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  156,
  'https://freemusicarchive.org/track/dance-of-the-small-kitchen/download/',
  'https://freemusicarchive.org/track/dance-of-the-small-kitchen/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/dance-of-the-small-kitchen/',
  true,
  false,
  711,
  3
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 29: The Lies We Tell Ourselves by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Lies We Tell Ourselves',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  487,
  'https://freemusicarchive.org/track/the-lies-we-tell-ourselves/download/',
  'https://freemusicarchive.org/track/the-lies-we-tell-ourselves/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/the-lies-we-tell-ourselves/',
  true,
  false,
  555,
  3
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 30: Against Silence by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Against Silence',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  153,
  'https://freemusicarchive.org/track/against-silence/download/',
  'https://freemusicarchive.org/track/against-silence/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/against-silence/',
  true,
  false,
  463,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 31: The Song I Need to Hear by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Song I Need to Hear',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  242,
  'https://freemusicarchive.org/track/the-song-i-need-to-hear/download/',
  'https://freemusicarchive.org/track/the-song-i-need-to-hear/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/the-song-i-need-to-hear/',
  true,
  false,
  733,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 32: Somewhere She Still Is by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Somewhere She Still Is',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  368,
  'https://freemusicarchive.org/track/somewhere-she-still-is/download/',
  'https://freemusicarchive.org/track/somewhere-she-still-is/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/somewhere-she-still-is/',
  true,
  false,
  1414,
  14
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 33: Your Girl by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Your Girl',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  215,
  'https://freemusicarchive.org/track/your-girl/download/',
  'https://freemusicarchive.org/track/your-girl/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/your-girl/',
  true,
  false,
  604,
  3
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 34: UFS by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'UFS',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  289,
  'https://freemusicarchive.org/track/ufs/download/',
  'https://freemusicarchive.org/track/ufs/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/ufs/',
  true,
  false,
  398,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 35: Danielle Marie by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Danielle Marie',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  495,
  'https://freemusicarchive.org/track/danielle-marie/download/',
  'https://freemusicarchive.org/track/danielle-marie/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/danielle-marie/',
  true,
  false,
  363,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 36: The One Nice Weekend In September by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The One Nice Weekend In September',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  143,
  'https://freemusicarchive.org/track/the-one-nice-weekend-in-september/download/',
  'https://freemusicarchive.org/track/the-one-nice-weekend-in-september/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/the-one-nice-weekend-in-september/',
  true,
  false,
  475,
  3
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 37: Good King Wenceslaus by Pierce Murphy

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Good King Wenceslaus',
  (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Pierce Murphy' LIMIT 1) LIMIT 1),
  NULL,
  228,
  'https://freemusicarchive.org/track/good-king-wenceslaus/download/',
  'https://freemusicarchive.org/track/good-king-wenceslaus/stream/',
  NULL,
  'Jazz, Jazz: Vocal, Holiday',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Pierce Murphy',
  'https://freemusicarchive.org/music/Pierce_Murphy//good-king-wenceslaus/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 38: Nur Du by 1st Contact

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Nur Du',
  (SELECT id FROM artists WHERE name = '1st Contact' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = '1st Contact' LIMIT 1) LIMIT 1),
  NULL,
  211,
  'https://freemusicarchive.org/track/nur-du/download/',
  'https://freemusicarchive.org/track/nur-du/stream/',
  NULL,
  'Jazz, Jazz: Vocal, Ambient',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - 1st Contact',
  'https://freemusicarchive.org/music/1st-contact//nur-du/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 39: Replaced by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Replaced',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  383,
  'https://freemusicarchive.org/track/replaced/download/',
  'https://freemusicarchive.org/track/replaced/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/replaced/',
  true,
  false,
  817,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 40: Old Dog by Vic Dillahay

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Old Dog',
  (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'We Were' AND artist_id = (SELECT id FROM artists WHERE name = 'Vic Dillahay' LIMIT 1) LIMIT 1),
  NULL,
  318,
  'https://freemusicarchive.org/track/old-dog/download/',
  'https://freemusicarchive.org/track/old-dog/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4rAxAuvgsoOUL6pMbOZkdoxu2fO5W21EFLq6PrUX.jpg&width=400&height=400&type=album',
  'Jazz, Free-Jazz, Ambient',
  '2025-02-27',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Vic Dillahay',
  'https://freemusicarchive.org/music/vic-dillahay/we-were/old-dog/',
  true,
  false,
  821,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 41: Not on Mars by Lemon Knife

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Not on Mars',
  (SELECT id FROM artists WHERE name = 'Lemon Knife' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Songs About Water and Death' AND artist_id = (SELECT id FROM artists WHERE name = 'Lemon Knife' LIMIT 1) LIMIT 1),
  NULL,
  232,
  'https://freemusicarchive.org/track/not-on-mars/download/',
  'https://freemusicarchive.org/track/not-on-mars/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FSdcCixKP5l3gCQaj7QALCRJqeAFv3nsHdO45EAuC.jpg&width=400&height=400&type=album',
  'Rock, Psych-Rock, Space-Rock',
  '2023-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Lemon Knife',
  'https://freemusicarchive.org/music/lemon-knife/songs-about-water-and-death/not-on-mars/',
  true,
  false,
  4357,
  48
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 42: A Lady of Elegance by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'A Lady of Elegance',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  173,
  'https://freemusicarchive.org/track/a-lady-of-elegance/download/',
  'https://freemusicarchive.org/track/a-lady-of-elegance/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/a-lady-of-elegance/',
  true,
  false,
  398,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 43: Straight No Filter by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Straight No Filter',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  265,
  'https://freemusicarchive.org/track/straight-no-filter/download/',
  'https://freemusicarchive.org/track/straight-no-filter/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/straight-no-filter/',
  true,
  false,
  326,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 44: Set the Mark by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Set the Mark',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  217,
  'https://freemusicarchive.org/track/set-the-mark-1/download/',
  'https://freemusicarchive.org/track/set-the-mark-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/set-the-mark-1/',
  true,
  false,
  456,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 45: Demonic Dong - 9/21/25, 5.01 AM by VADE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Demonic Dong - 9/21/25, 5.01 AM',
  (SELECT id FROM artists WHERE name = 'VADE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'VADE' LIMIT 1) LIMIT 1),
  NULL,
  124,
  'https://freemusicarchive.org/track/demonic-dong-92125-501-am/download/',
  'https://freemusicarchive.org/track/demonic-dong-92125-501-am/stream/',
  NULL,
  'Rock, Psych-Rock, Indie-Rock',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - VADE',
  'https://freemusicarchive.org/music/vade//demonic-dong-92125-501-am/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 46: 11 MPH by Beat Mekanik

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '11 MPH',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1) LIMIT 1),
  NULL,
  186,
  'https://freemusicarchive.org/track/11-mph/download/',
  'https://freemusicarchive.org/track/11-mph/stream/',
  NULL,
  'Rock, Psych-Rock, Indie-Rock',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Beat Mekanik',
  'https://freemusicarchive.org/music/beat-mekanik//11-mph/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 47: Survival Mode by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Survival Mode',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Survival Mode' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  173,
  'https://freemusicarchive.org/track/survival-mode/download/',
  'https://freemusicarchive.org/track/survival-mode/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4H8P4MG9faGsvmRapaAhb14ybFNthu4DyKP11uYt.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-06-04',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/survival-mode/survival-mode/',
  true,
  false,
  572,
  9
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 48: Clear As Day by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Clear As Day',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  202,
  'https://freemusicarchive.org/track/clear-as-day/download/',
  'https://freemusicarchive.org/track/clear-as-day/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/clear-as-day/',
  true,
  false,
  193,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 49: You Drag Me Down by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'You Drag Me Down',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Save Our Ship' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  256,
  'https://freemusicarchive.org/track/you-drag-me-down/download/',
  'https://freemusicarchive.org/track/you-drag-me-down/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F0FEJ3JjicVmasLbHgoVXT6lCUli5pvMvDVDkFzkd.png&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-07-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/save-our-ship/you-drag-me-down/',
  true,
  false,
  486,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 50: Everything Is Not What It Seems by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Everything Is Not What It Seems',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  170,
  'https://freemusicarchive.org/track/everything-is-not-what-it-seems-1/download/',
  'https://freemusicarchive.org/track/everything-is-not-what-it-seems-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/everything-is-not-what-it-seems-1/',
  true,
  false,
  198,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 51: Straight Shot to the Sun by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Straight Shot to the Sun',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  210,
  'https://freemusicarchive.org/track/straight-shot-to-the-sun-1/download/',
  'https://freemusicarchive.org/track/straight-shot-to-the-sun-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/straight-shot-to-the-sun-1/',
  true,
  false,
  186,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 52: Life (Time) by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Life (Time)',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  271,
  'https://freemusicarchive.org/track/life-time-1/download/',
  'https://freemusicarchive.org/track/life-time-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/life-time-1/',
  true,
  false,
  166,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 53: Hello Depression by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Hello Depression',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  232,
  'https://freemusicarchive.org/track/hello-depression-1/download/',
  'https://freemusicarchive.org/track/hello-depression-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/hello-depression-1/',
  true,
  false,
  172,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 54: Pressure (A Way Out) by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Pressure (A Way Out)',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  145,
  'https://freemusicarchive.org/track/pressure-a-way-out/download/',
  'https://freemusicarchive.org/track/pressure-a-way-out/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/pressure-a-way-out/',
  true,
  false,
  165,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 55: Not Alone by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Not Alone',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Not Alone' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  209,
  'https://freemusicarchive.org/track/not-alone-1/download/',
  'https://freemusicarchive.org/track/not-alone-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FcOYDiix7kypakrQMeLF9rDM10eGhvj0GbIZzeyBu.jpg&width=400&height=400&type=album',
  'Rock, Psych-Rock, Indie-Rock',
  '2025-08-04',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/not-alone/not-alone-1/',
  true,
  false,
  919,
  10
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 56: High by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'High',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  248,
  'https://freemusicarchive.org/track/high-4/download/',
  'https://freemusicarchive.org/track/high-4/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/high-4/',
  true,
  false,
  278,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 57: Villain by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Villain',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  237,
  'https://freemusicarchive.org/track/villain-1/download/',
  'https://freemusicarchive.org/track/villain-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/villain-1/',
  true,
  false,
  241,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 58: Separate Entities by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Separate Entities',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  248,
  'https://freemusicarchive.org/track/separate-entities-1/download/',
  'https://freemusicarchive.org/track/separate-entities-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/separate-entities-1/',
  true,
  false,
  369,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 59: Paint Me (The Bad Guy) by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Paint Me (The Bad Guy)',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  175,
  'https://freemusicarchive.org/track/paint-me-the-bad-guy-1/download/',
  'https://freemusicarchive.org/track/paint-me-the-bad-guy-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/paint-me-the-bad-guy-1/',
  true,
  false,
  167,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 60: From the Highest Vantage by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'From the Highest Vantage',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'From the Highest Vantage' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  326,
  'https://freemusicarchive.org/track/from-the-highest-vantage/download/',
  'https://freemusicarchive.org/track/from-the-highest-vantage/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FpfKYvnfxk2ySgpCWdhHJKklkHGAlm5efUBjoC5vT.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Psych-Rock',
  '2025-04-06',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/from-the-highest-vantage/from-the-highest-vantage/',
  true,
  false,
  1576,
  6
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 61: No Power in the Darkness by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'No Power in the Darkness',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  185,
  'https://freemusicarchive.org/track/no-power-in-the-darkness-1/download/',
  'https://freemusicarchive.org/track/no-power-in-the-darkness-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/no-power-in-the-darkness-1/',
  true,
  false,
  169,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 62: Extinguish the Darkness by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Extinguish the Darkness',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  245,
  'https://freemusicarchive.org/track/extinguish-the-darkness-1/download/',
  'https://freemusicarchive.org/track/extinguish-the-darkness-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/extinguish-the-darkness-1/',
  true,
  false,
  151,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 63: Early Grave by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Early Grave',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  242,
  'https://freemusicarchive.org/track/early-grave/download/',
  'https://freemusicarchive.org/track/early-grave/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/early-grave/',
  true,
  false,
  150,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 64: I Am Not Your Victim by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'I Am Not Your Victim',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Overcome' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  214,
  'https://freemusicarchive.org/track/i-am-not-your-victim/download/',
  'https://freemusicarchive.org/track/i-am-not-your-victim/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FXLXuniPkTv6AcG9t0bVgCDQN7Sp0fOtLPoxh1AW4.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/overcome/i-am-not-your-victim/',
  true,
  false,
  542,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 65: Overcome by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Overcome',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Overcome' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  202,
  'https://freemusicarchive.org/track/overcome-1/download/',
  'https://freemusicarchive.org/track/overcome-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FXLXuniPkTv6AcG9t0bVgCDQN7Sp0fOtLPoxh1AW4.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-07-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/overcome/overcome-1/',
  true,
  false,
  253,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 66: Cost of Change by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Cost of Change',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Save Our Ship' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  234,
  'https://freemusicarchive.org/track/cost-of-change/download/',
  'https://freemusicarchive.org/track/cost-of-change/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F0FEJ3JjicVmasLbHgoVXT6lCUli5pvMvDVDkFzkd.png&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-07-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/save-our-ship/cost-of-change/',
  true,
  false,
  394,
  3
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 67: Mountain Climb by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mountain Climb',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  225,
  'https://freemusicarchive.org/track/mountain-climb/download/',
  'https://freemusicarchive.org/track/mountain-climb/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/mountain-climb/',
  true,
  false,
  235,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 68: Spare Change by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Spare Change',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  289,
  'https://freemusicarchive.org/track/spare-change-1/download/',
  'https://freemusicarchive.org/track/spare-change-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/spare-change-1/',
  true,
  false,
  171,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 69: When I Wake Up by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'When I Wake Up',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  298,
  'https://freemusicarchive.org/track/when-i-wake-up/download/',
  'https://freemusicarchive.org/track/when-i-wake-up/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/when-i-wake-up/',
  true,
  false,
  150,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 70: Sacred by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Sacred',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  366,
  'https://freemusicarchive.org/track/sacred-1/download/',
  'https://freemusicarchive.org/track/sacred-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/sacred-1/',
  true,
  false,
  161,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 71: No Sign Above by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'No Sign Above',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  237,
  'https://freemusicarchive.org/track/no-sign-above/download/',
  'https://freemusicarchive.org/track/no-sign-above/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/no-sign-above/',
  true,
  false,
  132,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 72: Invincible by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Invincible',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  244,
  'https://freemusicarchive.org/track/invincible/download/',
  'https://freemusicarchive.org/track/invincible/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/invincible/',
  true,
  false,
  147,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 73: Tapestry by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Tapestry',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  177,
  'https://freemusicarchive.org/track/tapestry-1/download/',
  'https://freemusicarchive.org/track/tapestry-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/tapestry-1/',
  true,
  false,
  146,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 74: Direction by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Direction',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  153,
  'https://freemusicarchive.org/track/direction-1/download/',
  'https://freemusicarchive.org/track/direction-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/direction-1/',
  true,
  false,
  213,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 75: UFO by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'UFO',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  222,
  'https://freemusicarchive.org/track/ufo-2/download/',
  'https://freemusicarchive.org/track/ufo-2/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/ufo-2/',
  true,
  false,
  155,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 76: If I Died Tomorrow by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'If I Died Tomorrow',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  190,
  'https://freemusicarchive.org/track/if-i-died-tomorrow/download/',
  'https://freemusicarchive.org/track/if-i-died-tomorrow/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/if-i-died-tomorrow/',
  true,
  false,
  231,
  6
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 77: Morality Salience by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Morality Salience',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  180,
  'https://freemusicarchive.org/track/morality-salience/download/',
  'https://freemusicarchive.org/track/morality-salience/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FYpLvDXOVxmugkAY418iK4goVLV6vjAxLCLWrRYfg.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-2/morality-salience/',
  true,
  false,
  129,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 78: Don't Let Your Mind Play Tricks On You by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Don''t Let Your Mind Play Tricks On You',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  225,
  'https://freemusicarchive.org/track/dont-let-your-mind-play-tricks-on-you/download/',
  'https://freemusicarchive.org/track/dont-let-your-mind-play-tricks-on-you/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/dont-let-your-mind-play-tricks-on-you/',
  true,
  false,
  432,
  2
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 79: Face the Day by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Face the Day',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  142,
  'https://freemusicarchive.org/track/face-the-day-1/download/',
  'https://freemusicarchive.org/track/face-the-day-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/face-the-day-1/',
  true,
  false,
  335,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 80: Ride the Wave by Jon Shuemaker

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ride the Wave',
  (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Song Bird (Part 1)' AND artist_id = (SELECT id FROM artists WHERE name = 'Jon Shuemaker' LIMIT 1) LIMIT 1),
  NULL,
  197,
  'https://freemusicarchive.org/track/ride-the-wave-1/download/',
  'https://freemusicarchive.org/track/ride-the-wave-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiGQ5MYCGgnYUdxnz6uMD8Aw5EshyEAmp3QNVrPtn.jpg&width=400&height=400&type=album',
  'Rock, Loud-Rock, Indie-Rock',
  '2025-05-31',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jon Shuemaker',
  'https://freemusicarchive.org/music/jon-shuemaker/song-bird-part-1/ride-the-wave-1/',
  true,
  false,
  124,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 81: Varnyr's Room by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Varnyr''s Room',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  319,
  'https://freemusicarchive.org/track/varnyrs-room/download/',
  'https://freemusicarchive.org/track/varnyrs-room/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/varnyrs-room/',
  true,
  false,
  9094,
  34
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 82: Tuesday Night by Amarent

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Tuesday Night',
  (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Free Atmospheric Music' AND artist_id = (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1) LIMIT 1),
  NULL,
  625,
  'https://freemusicarchive.org/track/tuesday-night/download/',
  'https://freemusicarchive.org/track/tuesday-night/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FBVCWr0V1BQZ2zfmPIyv6fHvYIYR61dsAqRtif1vo.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2025-06-05',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Amarent',
  'https://freemusicarchive.org/music/amarent/free-atmospheric-music/tuesday-night/',
  true,
  false,
  4986,
  31
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 83: Planes of Purple Dust by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Planes of Purple Dust',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  252,
  'https://freemusicarchive.org/track/planes-of-purple-dust/download/',
  'https://freemusicarchive.org/track/planes-of-purple-dust/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/planes-of-purple-dust/',
  true,
  false,
  7633,
  30
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 84: Blink Dogs by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Blink Dogs',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  471,
  'https://freemusicarchive.org/track/blink-dogs/download/',
  'https://freemusicarchive.org/track/blink-dogs/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/blink-dogs/',
  true,
  false,
  11246,
  41
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 85: Jam No. 3 (Mauthausen) by Jangwa

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Jam No. 3 (Mauthausen)',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Cycles Trax' AND artist_id = (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1) LIMIT 1),
  NULL,
  1214,
  'https://freemusicarchive.org/track/jam-no-3-mauthausen/download/',
  'https://freemusicarchive.org/track/jam-no-3-mauthausen/stream/',
  'https://freemusicarchive.org/image/?file=image%2FG5YCuGm0KO61UaUJZoU3a8ATQ0vjjx013IwPUNTB.jpeg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2022-02-13',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jangwa',
  'https://freemusicarchive.org/music/Dilating_Times/cycles-trax/jam-no-3-mauthausen/',
  true,
  false,
  3644,
  21
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 86: Circlet of Blasting by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Circlet of Blasting',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  198,
  'https://freemusicarchive.org/track/circlet-of-blasting/download/',
  'https://freemusicarchive.org/track/circlet-of-blasting/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/circlet-of-blasting/',
  true,
  false,
  10464,
  46
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 87: Falena by Jangwa

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Falena',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Cycles Trax vol. VII - Loosening Bounds' AND artist_id = (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1) LIMIT 1),
  NULL,
  703,
  'https://freemusicarchive.org/track/falena/download/',
  'https://freemusicarchive.org/track/falena/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Ff1r8bfZ9biTatsYFBWipypRwXhZ30sT7F0iZvoJ3.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-12-12',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jangwa',
  'https://freemusicarchive.org/music/Dilating_Times/cycles-trax-vol-vii-loosening-bounds/falena/',
  true,
  false,
  2753,
  20
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 88: A Visit to Kali the Artificer by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'A Visit to Kali the Artificer',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  367,
  'https://freemusicarchive.org/track/a-visit-to-kali-the-artificer/download/',
  'https://freemusicarchive.org/track/a-visit-to-kali-the-artificer/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/a-visit-to-kali-the-artificer/',
  true,
  false,
  10992,
  27
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 89: D2 by Amarent

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'D2',
  (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Free Electronic Music' AND artist_id = (SELECT id FROM artists WHERE name = 'Amarent' LIMIT 1) LIMIT 1),
  NULL,
  192,
  'https://freemusicarchive.org/track/d2/download/',
  'https://freemusicarchive.org/track/d2/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FjKu4hpCAXqFgLOqYTjegMkUKqwUFRxSVxGYuQ94f.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2025-06-05',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Amarent',
  'https://freemusicarchive.org/music/amarent/free-electronic-music/d2/',
  true,
  false,
  2278,
  30
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 90: The Outer Planes by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Outer Planes',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  258,
  'https://freemusicarchive.org/track/the-outer-planes/download/',
  'https://freemusicarchive.org/track/the-outer-planes/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/the-outer-planes/',
  true,
  false,
  10515,
  48
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 91: A Gentle Fog Descends by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'A Gentle Fog Descends',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  430,
  'https://freemusicarchive.org/track/a-gentle-fog-descends/download/',
  'https://freemusicarchive.org/track/a-gentle-fog-descends/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/a-gentle-fog-descends/',
  true,
  false,
  36055,
  84
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 92: Stone Of Stumbling by Jangwa

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Stone Of Stumbling',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1) LIMIT 1),
  NULL,
  364,
  'https://freemusicarchive.org/track/stone-of-stumbling/download/',
  'https://freemusicarchive.org/track/stone-of-stumbling/stream/',
  NULL,
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jangwa',
  'https://freemusicarchive.org/music/Dilating_Times//stone-of-stumbling/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 93: Ethereal Cafe by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ethereal Cafe',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  415,
  'https://freemusicarchive.org/track/ethereal-cafe/download/',
  'https://freemusicarchive.org/track/ethereal-cafe/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/ethereal-cafe/',
  true,
  false,
  22188,
  54
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 94: Mostly Melody by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mostly Melody',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  360,
  'https://freemusicarchive.org/track/mostly-melody/download/',
  'https://freemusicarchive.org/track/mostly-melody/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/mostly-melody/',
  true,
  false,
  13621,
  32
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 95: Everyting Tastes Different by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Everyting Tastes Different',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  351,
  'https://freemusicarchive.org/track/everyting-tastes-different/download/',
  'https://freemusicarchive.org/track/everyting-tastes-different/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/everyting-tastes-different/',
  true,
  false,
  16221,
  37
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 96: Early Birds by Jangwa

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Early Birds',
  (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Cycles Trax vol. VII - Loosening Bounds' AND artist_id = (SELECT id FROM artists WHERE name = 'Jangwa' LIMIT 1) LIMIT 1),
  NULL,
  512,
  'https://freemusicarchive.org/track/early-birds-1/download/',
  'https://freemusicarchive.org/track/early-birds-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Ff1r8bfZ9biTatsYFBWipypRwXhZ30sT7F0iZvoJ3.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2025-04-15',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Jangwa',
  'https://freemusicarchive.org/music/Dilating_Times/cycles-trax-vol-vii-loosening-bounds/early-birds-1/',
  true,
  false,
  1990,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 97: A Most Joyous Occasion by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'A Most Joyous Occasion',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  336,
  'https://freemusicarchive.org/track/a-most-joyous-occasion/download/',
  'https://freemusicarchive.org/track/a-most-joyous-occasion/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/a-most-joyous-occasion/',
  true,
  false,
  25704,
  45
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 98: Melancholy Aurora by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Melancholy Aurora',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  302,
  'https://freemusicarchive.org/track/melancholy-aurora/download/',
  'https://freemusicarchive.org/track/melancholy-aurora/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/melancholy-aurora/',
  true,
  false,
  14444,
  38
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 99: Memories of Fallen Comrades by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Memories of Fallen Comrades',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  209,
  'https://freemusicarchive.org/track/memories-of-fallen-comrades/download/',
  'https://freemusicarchive.org/track/memories-of-fallen-comrades/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/memories-of-fallen-comrades/',
  true,
  false,
  2490,
  11
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 100: Ranger's Lament by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ranger''s Lament',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  228,
  'https://freemusicarchive.org/track/rangers-lament/download/',
  'https://freemusicarchive.org/track/rangers-lament/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/rangers-lament/',
  true,
  false,
  4166,
  29
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 101: The Companionship of Isolation by Brylie Christopher

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Companionship of Isolation',
  (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neither and Both' AND artist_id = (SELECT id FROM artists WHERE name = 'Brylie Christopher' LIMIT 1) LIMIT 1),
  NULL,
  322,
  'https://freemusicarchive.org/track/the-companionship-of-isolation/download/',
  'https://freemusicarchive.org/track/the-companionship-of-isolation/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FVpLM0oNTJoE5d5OvGatLx2wJqmLikAIP6Zc5IE6Z.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2023-12-11',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Brylie Christopher',
  'https://freemusicarchive.org/music/Brylie_Christopher_Oxley/neither-and-both/the-companionship-of-isolation/',
  true,
  false,
  9857,
  33
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 102: Necromancy in the Underdark by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Necromancy in the Underdark',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  359,
  'https://freemusicarchive.org/track/necromancy-in-the-underdark/download/',
  'https://freemusicarchive.org/track/necromancy-in-the-underdark/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/necromancy-in-the-underdark/',
  true,
  false,
  3816,
  18
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 103: The Undermountain by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Undermountain',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  293,
  'https://freemusicarchive.org/track/the-undermountain/download/',
  'https://freemusicarchive.org/track/the-undermountain/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/the-undermountain/',
  true,
  false,
  4172,
  16
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 104: Antechamber of Madness by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Antechamber of Madness',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  172,
  'https://freemusicarchive.org/track/antechamber-of-madness/download/',
  'https://freemusicarchive.org/track/antechamber-of-madness/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/antechamber-of-madness/',
  true,
  false,
  3906,
  9
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 105: A Storm at Camp by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'A Storm at Camp',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  356,
  'https://freemusicarchive.org/track/a-storm-at-camp/download/',
  'https://freemusicarchive.org/track/a-storm-at-camp/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/a-storm-at-camp/',
  true,
  false,
  9034,
  37
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 106: mewmew by Tea K Pea

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'mewmew',
  (SELECT id FROM artists WHERE name = 'Tea K Pea' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Tea K Pea' LIMIT 1) LIMIT 1),
  NULL,
  216,
  'https://freemusicarchive.org/track/mewmew/download/',
  'https://freemusicarchive.org/track/mewmew/stream/',
  NULL,
  'Electronic, Ambient Electronic, Minimal Electronic',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Tea K Pea',
  'https://freemusicarchive.org/music/tea-k-pea//mewmew/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 107: The Road to the Black Rose Tavern by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Road to the Black Rose Tavern',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  422,
  'https://freemusicarchive.org/track/the-road-to-the-black-rose-tavern/download/',
  'https://freemusicarchive.org/track/the-road-to-the-black-rose-tavern/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/the-road-to-the-black-rose-tavern/',
  true,
  false,
  8815,
  45
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 108: Rumors of a Dungeon by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Rumors of a Dungeon',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  272,
  'https://freemusicarchive.org/track/rumors-of-a-dungeon/download/',
  'https://freemusicarchive.org/track/rumors-of-a-dungeon/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/rumors-of-a-dungeon/',
  true,
  false,
  13181,
  40
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 109: Mass Healing Word by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mass Healing Word',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  358,
  'https://freemusicarchive.org/track/mass-healing-word/download/',
  'https://freemusicarchive.org/track/mass-healing-word/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/mass-healing-word/',
  true,
  false,
  4825,
  30
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 110: Cryptic Chamber by human gazpacho

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Cryptic Chamber',
  (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Arcane Resonance' AND artist_id = (SELECT id FROM artists WHERE name = 'human gazpacho' LIMIT 1) LIMIT 1),
  NULL,
  187,
  'https://freemusicarchive.org/track/cryptic-chamber/download/',
  'https://freemusicarchive.org/track/cryptic-chamber/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIEUT2k7igcppGinyM9BE3C4sKnLf2aJZyBJdf8X9.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic, Minimal Electronic',
  '2024-05-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - human gazpacho',
  'https://freemusicarchive.org/music/human-gazpacho/arcane-resonance/cryptic-chamber/',
  true,
  false,
  2863,
  12
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 111: Danket, Danket dem Herrn by Timo Versemann

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Danket, Danket dem Herrn',
  (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Peace & Passion' AND artist_id = (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1) LIMIT 1),
  NULL,
  469,
  'https://freemusicarchive.org/track/danket-danket-dem-herrn/download/',
  'https://freemusicarchive.org/track/danket-danket-dem-herrn/stream/',
  'https://freemusicarchive.org/image/?file=image%2FhQK0rqP6r3r8Tv3xnqAxrBuQ4qRQhZsNQA0X0Qua.png&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2022-05-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Timo Versemann',
  'https://freemusicarchive.org/music/timoversemann/peace-passion/danket-danket-dem-herrn/',
  true,
  false,
  7359,
  26
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 112: Winter Agony by Anisotropic Psyche

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Winter Agony',
  (SELECT id FROM artists WHERE name = 'Anisotropic Psyche' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Neural Awakening' AND artist_id = (SELECT id FROM artists WHERE name = 'Anisotropic Psyche' LIMIT 1) LIMIT 1),
  NULL,
  164,
  'https://freemusicarchive.org/track/winter-agony/download/',
  'https://freemusicarchive.org/track/winter-agony/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F4FkOe47GCDSC0ojhTCuGao63jaZkTx8YjvtAOVd6.jpg&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2023-01-21',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Anisotropic Psyche',
  'https://freemusicarchive.org/music/anisotropic-psyche/neural-awakening/winter-agony/',
  true,
  false,
  1973,
  24
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 113: color for me by Marihiko Hara

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'color for me',
  (SELECT id FROM artists WHERE name = 'Marihiko Hara' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Summer Tour Remix v2 [V/A]' AND artist_id = (SELECT id FROM artists WHERE name = 'Marihiko Hara' LIMIT 1) LIMIT 1),
  NULL,
  302,
  'https://freemusicarchive.org/track/05_color_for_me/download/',
  'https://freemusicarchive.org/track/05_color_for_me/stream/',
  NULL,
  'Electronic, Ambient Electronic',
  '2010-02-08',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Marihiko Hara',
  'https://freemusicarchive.org/music/Marihiko_Hara/Summer_Tour_Remix_v2_1865/05_color_for_me/',
  true,
  false,
  9310,
  12
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 114: Room reverberating by Itsensäsyöjät

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Room reverberating',
  (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Elektrique' AND artist_id = (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1) LIMIT 1),
  NULL,
  316,
  'https://freemusicarchive.org/track/06-Room_reverberating/download/',
  'https://freemusicarchive.org/track/06-Room_reverberating/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2017-03-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Itsensäsyöjät',
  'https://freemusicarchive.org/music/Itsenssyjt/Elektrique/06-Room_reverberating/',
  true,
  false,
  7757,
  10
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 115: Kyrie Eleison by Timo Versemann

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Kyrie Eleison',
  (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Electronic Church Instrumentals' AND artist_id = (SELECT id FROM artists WHERE name = 'Timo Versemann' LIMIT 1) LIMIT 1),
  NULL,
  269,
  'https://freemusicarchive.org/track/kyrie-eleison-1/download/',
  'https://freemusicarchive.org/track/kyrie-eleison-1/stream/',
  'https://freemusicarchive.org/image/?file=image%2FTBJAwNWg6Djnl7Z7dOAQYYg3gt16dmXsWFzV67po.png&width=400&height=400&type=album',
  'Electronic, Ambient Electronic',
  '2021-10-02',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Timo Versemann',
  'https://freemusicarchive.org/music/timoversemann/electronic-church-instrumentals/kyrie-eleison-1/',
  true,
  false,
  15041,
  42
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 116: constellation by Ieva

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'constellation',
  (SELECT id FROM artists WHERE name = 'Ieva' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Summer Tour Remix v2 [V/A]' AND artist_id = (SELECT id FROM artists WHERE name = 'Ieva' LIMIT 1) LIMIT 1),
  NULL,
  313,
  'https://freemusicarchive.org/track/04_constellation/download/',
  'https://freemusicarchive.org/track/04_constellation/stream/',
  NULL,
  'Electronic, Ambient Electronic',
  '2010-02-08',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Ieva',
  'https://freemusicarchive.org/music/Ieva/Summer_Tour_Remix_v2_1865/04_constellation/',
  true,
  false,
  11937,
  31
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 117: Born In A Spoon by Justin Tuijl

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Born In A Spoon',
  (SELECT id FROM artists WHERE name = 'Justin Tuijl' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Magic Tortoise' AND artist_id = (SELECT id FROM artists WHERE name = 'Justin Tuijl' LIMIT 1) LIMIT 1),
  NULL,
  585,
  'https://freemusicarchive.org/track/born-in-a-spoon/download/',
  'https://freemusicarchive.org/track/born-in-a-spoon/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FcPtELCUwU8FzDhwstHK7w6rvGVeHSXlH9F4xfVBu.jpg&width=400&height=400&type=album',
  'Electronic, Ambient Electronic',
  '2024-02-06',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Justin Tuijl',
  'https://freemusicarchive.org/music/justin-tuijl/magic-tortoise/born-in-a-spoon/',
  true,
  false,
  918,
  8
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 118: Midnight beat (goes on) by Itsensäsyöjät

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Midnight beat (goes on)',
  (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Elektrique' AND artist_id = (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1) LIMIT 1),
  NULL,
  235,
  'https://freemusicarchive.org/track/05-Midnight_beat_goes_on/download/',
  'https://freemusicarchive.org/track/05-Midnight_beat_goes_on/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2017-03-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Itsensäsyöjät',
  'https://freemusicarchive.org/music/Itsenssyjt/Elektrique/05-Midnight_beat_goes_on/',
  true,
  false,
  6617,
  20
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 119: Space-age elevator jazz by Itsensäsyöjät

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Space-age elevator jazz',
  (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Elektrique' AND artist_id = (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1) LIMIT 1),
  NULL,
  191,
  'https://freemusicarchive.org/track/03-Space-age_elevator_jazz/download/',
  'https://freemusicarchive.org/track/03-Space-age_elevator_jazz/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2017-03-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Itsensäsyöjät',
  'https://freemusicarchive.org/music/Itsenssyjt/Elektrique/03-Space-age_elevator_jazz/',
  true,
  false,
  10254,
  12
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 120: untitled by Itsensäsyöjät

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'untitled',
  (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Elektrique' AND artist_id = (SELECT id FROM artists WHERE name = 'Itsensäsyöjät' LIMIT 1) LIMIT 1),
  NULL,
  166,
  'https://freemusicarchive.org/track/04-untitled/download/',
  'https://freemusicarchive.org/track/04-untitled/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FItsenssyjt_-_Elektrique_-_2017032082704457.jpg&width=400&height=400&type=album',
  'Electronic, Minimal Electronic',
  '2017-03-20',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Itsensäsyöjät',
  'https://freemusicarchive.org/music/Itsenssyjt/Elektrique/04-untitled/',
  true,
  false,
  7087,
  28
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 121: Mutant Club by HoliznaCC0

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mutant Club',
  (SELECT id FROM artists WHERE name = 'HoliznaCC0' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Power Pop!' AND artist_id = (SELECT id FROM artists WHERE name = 'HoliznaCC0' LIMIT 1) LIMIT 1),
  NULL,
  130,
  'https://freemusicarchive.org/track/mutant-club/download/',
  'https://freemusicarchive.org/track/mutant-club/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FI2odD8cOiITbu12KVloCCpxjBYS3WdnD7Mc3i7RI.png&width=400&height=400&type=album',
  'Pop, Power-Pop, Synth Pop',
  '2023-05-24',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - HoliznaCC0',
  'https://freemusicarchive.org/music/holiznacc0/power-pop/mutant-club/',
  true,
  false,
  79531,
  427
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 122: Got a Feeling by Zane Little

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Got a Feeling',
  (SELECT id FROM artists WHERE name = 'Zane Little' LIMIT 1),
  (SELECT id FROM albums WHERE title = '♥' AND artist_id = (SELECT id FROM artists WHERE name = 'Zane Little' LIMIT 1) LIMIT 1),
  NULL,
  199,
  'https://freemusicarchive.org/track/got-a-feeling/download/',
  'https://freemusicarchive.org/track/got-a-feeling/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIpMGNjQzvneUaWpfWepqagmxMltAoUlkv6dNzsTM.png&width=400&height=400&type=album',
  'Pop, Experimental Pop, Synth Pop',
  '2023-07-08',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Zane Little',
  'https://freemusicarchive.org/music/zane-little/-2/got-a-feeling/',
  true,
  false,
  50040,
  83
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 123: Ill-Fated Fantasy by Zane Little

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ill-Fated Fantasy',
  (SELECT id FROM artists WHERE name = 'Zane Little' LIMIT 1),
  (SELECT id FROM albums WHERE title = '♥' AND artist_id = (SELECT id FROM artists WHERE name = 'Zane Little' LIMIT 1) LIMIT 1),
  NULL,
  206,
  'https://freemusicarchive.org/track/ill-fated-fantasy/download/',
  'https://freemusicarchive.org/track/ill-fated-fantasy/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FIpMGNjQzvneUaWpfWepqagmxMltAoUlkv6dNzsTM.png&width=400&height=400&type=album',
  'Pop, Experimental Pop, Synth Pop',
  '2023-07-08',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Zane Little',
  'https://freemusicarchive.org/music/zane-little/-2/ill-fated-fantasy/',
  true,
  false,
  30551,
  89
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 124: 在你离开后 (ZaiNiLiKaiHou) by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '在你离开后 (ZaiNiLiKaiHou)',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  263,
  'https://freemusicarchive.org/track/zainilikaihou/download/',
  'https://freemusicarchive.org/track/zainilikaihou/stream/',
  NULL,
  'Pop, Experimental Pop, C-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//zainilikaihou/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 125: Making Clouds by Beat Mekanik

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Making Clouds',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1) LIMIT 1),
  NULL,
  150,
  'https://freemusicarchive.org/track/making-clouds/download/',
  'https://freemusicarchive.org/track/making-clouds/stream/',
  NULL,
  'Pop, Experimental Pop, Synth Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Beat Mekanik',
  'https://freemusicarchive.org/music/beat-mekanik//making-clouds/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 126: Electric Daydream by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Electric Daydream',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  154,
  'https://freemusicarchive.org/track/electric-daydream/download/',
  'https://freemusicarchive.org/track/electric-daydream/stream/',
  NULL,
  'Pop, Experimental Pop, Synth Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//electric-daydream/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 127: 心跳的声音 (XinTiaoDeShengYin) by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '心跳的声音 (XinTiaoDeShengYin)',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  232,
  'https://freemusicarchive.org/track/xintiaodeshengyin/download/',
  'https://freemusicarchive.org/track/xintiaodeshengyin/stream/',
  NULL,
  'Pop, Experimental Pop, C-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//xintiaodeshengyin/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 128: 사랑의 빈도 by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '사랑의 빈도',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  223,
  'https://freemusicarchive.org/track/-13/download/',
  'https://freemusicarchive.org/track/-13/stream/',
  NULL,
  'Pop, Experimental Pop, K-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//-13/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 129: 寂静的夜空 (JiJingDeYeKong) by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '寂静的夜空 (JiJingDeYeKong)',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  150,
  'https://freemusicarchive.org/track/jijingdeyekong/download/',
  'https://freemusicarchive.org/track/jijingdeyekong/stream/',
  NULL,
  'Pop, Experimental Pop, C-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//jijingdeyekong/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 130: 你是我的星辰 (NiShiWoDeXingChen) by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '你是我的星辰 (NiShiWoDeXingChen)',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  254,
  'https://freemusicarchive.org/track/nishiwodexingchen/download/',
  'https://freemusicarchive.org/track/nishiwodexingchen/stream/',
  NULL,
  'Pop, Experimental Pop, C-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//nishiwodexingchen/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 131: 风中的呢喃 (FengZhongDeNeNan) by Adeline Yeo (HP)

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  '风中的呢喃 (FengZhongDeNeNan)',
  (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Adeline Yeo (HP)' LIMIT 1) LIMIT 1),
  NULL,
  295,
  'https://freemusicarchive.org/track/fengzhongdenenan/download/',
  'https://freemusicarchive.org/track/fengzhongdenenan/stream/',
  NULL,
  'Pop, Experimental Pop, C-pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Adeline Yeo (HP)',
  'https://freemusicarchive.org/music/adeline-yeo-hp//fengzhongdenenan/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 132: I won't hear the wind's tale by Andrey Petrov

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'I won''t hear the wind''s tale',
  (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1) LIMIT 1),
  NULL,
  96,
  'https://freemusicarchive.org/track/i-wont-hear-the-winds-tale/download/',
  'https://freemusicarchive.org/track/i-wont-hear-the-winds-tale/stream/',
  NULL,
  'Pop, Experimental Pop, Power-Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Andrey Petrov',
  'https://freemusicarchive.org/music/andrey-petrov//i-wont-hear-the-winds-tale/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 133: This Is What We Live For by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'This Is What We Live For',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IV' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  105,
  'https://freemusicarchive.org/track/this-is-what-we-live-for/download/',
  'https://freemusicarchive.org/track/this-is-what-we-live-for/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fe4QcC8DAVTJ3GKxJROpqSo41J8wvfIVvBEPn9Ec7.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-07-12',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/iv/this-is-what-we-live-for/',
  true,
  false,
  7159,
  19
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 134: Disco Ball by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Disco Ball',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'II' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  156,
  'https://freemusicarchive.org/track/disco-ball/download/',
  'https://freemusicarchive.org/track/disco-ball/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FnBGcOaYcqIaSICsUj9I3FdnpRt9wiGfbXsiXvhYX.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/ii/disco-ball/',
  true,
  false,
  10858,
  36
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 135: Hyperreal by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Hyperreal',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IV' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  226,
  'https://freemusicarchive.org/track/hyperreal/download/',
  'https://freemusicarchive.org/track/hyperreal/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fe4QcC8DAVTJ3GKxJROpqSo41J8wvfIVvBEPn9Ec7.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-06-28',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/iv/hyperreal/',
  true,
  false,
  8150,
  19
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 136: Dopamine Hits by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Dopamine Hits',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IV' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  85,
  'https://freemusicarchive.org/track/dopamine-hits/download/',
  'https://freemusicarchive.org/track/dopamine-hits/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fe4QcC8DAVTJ3GKxJROpqSo41J8wvfIVvBEPn9Ec7.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/iv/dopamine-hits/',
  true,
  false,
  9794,
  53
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 137: Flashback by Beat Mekanik

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Flashback',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1) LIMIT 1),
  NULL,
  184,
  'https://freemusicarchive.org/track/flashback/download/',
  'https://freemusicarchive.org/track/flashback/stream/',
  NULL,
  'Pop, Synth Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Beat Mekanik',
  'https://freemusicarchive.org/music/beat-mekanik//flashback/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 138: Don't Look Back (No Regrets) by Tadz

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Don''t Look Back (No Regrets)',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'The Best Things In Life Are FREE: PASSION, HE₳Я₸, LOVE (Pt.2)' AND artist_id = (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1) LIMIT 1),
  NULL,
  129,
  'https://freemusicarchive.org/track/dont-look-back-no-regrets-1/download/',
  'https://freemusicarchive.org/track/dont-look-back-no-regrets-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F18cEp84WADnUfw54gfp4bfwxjWHp8QpaxVWsacfV.png&width=400&height=400&type=album',
  'Pop, Power-Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Tadz',
  'https://freemusicarchive.org/music/tadz/the-best-things-in-life-are-free-passion-hearayakzt-love-pt2/dont-look-back-no-regrets-1/',
  true,
  false,
  9230,
  9
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 139: Love Love What Can You Say Love by Origami Repetika

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Love Love What Can You Say Love',
  (SELECT id FROM artists WHERE name = 'Origami Repetika' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'The Happy Puppy Collection' AND artist_id = (SELECT id FROM artists WHERE name = 'Origami Repetika' LIMIT 1) LIMIT 1),
  NULL,
  150,
  'https://freemusicarchive.org/track/love-love-what-can-you-say-love/download/',
  'https://freemusicarchive.org/track/love-love-what-can-you-say-love/stream/',
  'https://freemusicarchive.org/image/?file=image%2FB9o9CdJdVd733cj4IAgdouf66rTVzVpk99GIXeGN.png&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2021-05-05',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Origami Repetika',
  'https://freemusicarchive.org/music/Origami_Repetika/the-happy-puppy-collection/love-love-what-can-you-say-love/',
  true,
  false,
  26899,
  59
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 140: Love by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Love',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Pop Sensation' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  172,
  'https://freemusicarchive.org/track/love-7/download/',
  'https://freemusicarchive.org/track/love-7/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiBmveJoUr73whV4V8bcZF1sV6cWbCyzCewLnJsoV.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2024-04-18',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/pop-sensation/love-7/',
  true,
  false,
  3112,
  15
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 141: In Your Dreams by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'In Your Dreams',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'I' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  126,
  'https://freemusicarchive.org/track/in-your-dreams/download/',
  'https://freemusicarchive.org/track/in-your-dreams/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FGhYXpXUu8nGANDtOl5ELAKqYcq2NYaBEJ6KY6ukj.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-07-10',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/i-1/in-your-dreams/',
  true,
  false,
  7540,
  36
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 142: Blue Moon by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Blue Moon',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IV' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  119,
  'https://freemusicarchive.org/track/blue-moon/download/',
  'https://freemusicarchive.org/track/blue-moon/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fe4QcC8DAVTJ3GKxJROpqSo41J8wvfIVvBEPn9Ec7.jpg&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/iv/blue-moon/',
  true,
  false,
  10478,
  39
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 143: Я не увижу сказки ветра (RUS) by Andrey Petrov

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Я не увижу сказки ветра (RUS)',
  (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1) LIMIT 1),
  NULL,
  99,
  'https://freemusicarchive.org/track/ya-ne-uvizu-skazki-vetra-rus/download/',
  'https://freemusicarchive.org/track/ya-ne-uvizu-skazki-vetra-rus/stream/',
  NULL,
  'Pop, Experimental Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Andrey Petrov',
  'https://freemusicarchive.org/music/andrey-petrov//ya-ne-uvizu-skazki-vetra-rus/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 144: Pink by Kate Kody

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Pink',
  (SELECT id FROM artists WHERE name = 'Kate Kody' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Sunflower Orange' AND artist_id = (SELECT id FROM artists WHERE name = 'Kate Kody' LIMIT 1) LIMIT 1),
  NULL,
  129,
  'https://freemusicarchive.org/track/pink/download/',
  'https://freemusicarchive.org/track/pink/stream/',
  'https://freemusicarchive.org/image/?file=image%2FgSVFhzhFA4x4nviu4GkN5PJAe4cLCVcjw6Er85xL.png&width=400&height=400&type=album',
  'Pop, Synth Pop',
  '2021-09-28',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kate Kody',
  'https://freemusicarchive.org/music/kate-kody/sunflower-orange/pink/',
  true,
  false,
  738,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 145: Flashy by Beat Mekanik

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Flashy',
  (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Beat Mekanik' LIMIT 1) LIMIT 1),
  NULL,
  143,
  'https://freemusicarchive.org/track/flashy/download/',
  'https://freemusicarchive.org/track/flashy/stream/',
  NULL,
  'Pop, Synth Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Beat Mekanik',
  'https://freemusicarchive.org/music/beat-mekanik//flashy/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 146: Winter (Зима) by Andrey Petrov

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Winter (Зима)',
  (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1) LIMIT 1),
  NULL,
  85,
  'https://freemusicarchive.org/track/winter-zima/download/',
  'https://freemusicarchive.org/track/winter-zima/stream/',
  NULL,
  'Pop, Power-Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Andrey Petrov',
  'https://freemusicarchive.org/music/andrey-petrov//winter-zima/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 147: Missed Call by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Missed Call',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Pop Sensation' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  136,
  'https://freemusicarchive.org/track/missed-call/download/',
  'https://freemusicarchive.org/track/missed-call/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiBmveJoUr73whV4V8bcZF1sV6cWbCyzCewLnJsoV.jpg&width=400&height=400&type=album',
  'Pop',
  '2024-04-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/pop-sensation/missed-call/',
  true,
  false,
  821,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 148: Life & Death by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Life & Death',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Pop Sensation' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  113,
  'https://freemusicarchive.org/track/life-death/download/',
  'https://freemusicarchive.org/track/life-death/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiBmveJoUr73whV4V8bcZF1sV6cWbCyzCewLnJsoV.jpg&width=400&height=400&type=album',
  'Pop',
  '2024-04-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/pop-sensation/life-death/',
  true,
  false,
  836,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 149: Tough Girls by A. Cooper

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Tough Girls',
  (SELECT id FROM artists WHERE name = 'A. Cooper' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'The Anthony Cooper ABM VI' AND artist_id = (SELECT id FROM artists WHERE name = 'A. Cooper' LIMIT 1) LIMIT 1),
  NULL,
  265,
  'https://freemusicarchive.org/track/tough-girls/download/',
  'https://freemusicarchive.org/track/tough-girls/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FAx1mtWNdwcTEgkGsyszob18AZPaWGwAJLHaSo1kL.jpg&width=400&height=400&type=album',
  'Pop',
  '2024-07-05',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - A. Cooper',
  'https://freemusicarchive.org/music/a-cooper/the-anthony-cooper-abm-vi/tough-girls/',
  true,
  false,
  1424,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 150: Teamwork by Tadz

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Teamwork',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'The Quest For Love' AND artist_id = (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1) LIMIT 1),
  NULL,
  198,
  'https://freemusicarchive.org/track/teamwork-1/download/',
  'https://freemusicarchive.org/track/teamwork-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FEIj1AUDDwlI6UKOeotvCawDmnkY9P0a0QVMq5FTl.webp&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Tadz',
  'https://freemusicarchive.org/music/tadz/the-quest-for-love/teamwork-1/',
  true,
  false,
  2612,
  6
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 151: Home by Tadz

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Home',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'TV Kills CreaTVity' AND artist_id = (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1) LIMIT 1),
  NULL,
  211,
  'https://freemusicarchive.org/track/home-3/download/',
  'https://freemusicarchive.org/track/home-3/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fcy7x7PEtcGQJGU5AjlIs2vbhbY7GDi4l3l9NdRyF.webp&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Tadz',
  'https://freemusicarchive.org/music/tadz/tv-kills-creatvity/home-3/',
  true,
  false,
  1801,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 152: Splish Splash by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Splish Splash',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IX' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  93,
  'https://freemusicarchive.org/track/splish-splash/download/',
  'https://freemusicarchive.org/track/splish-splash/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FXEYqY4ahH3QSmxt2QYWWlwA2el2eyaVopCAyeXf2.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/ix/splish-splash/',
  true,
  false,
  1924,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 153: Girl by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Girl',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'V' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  79,
  'https://freemusicarchive.org/track/girl/download/',
  'https://freemusicarchive.org/track/girl/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FapGOiE4un3IKuzmEFxfRdzLuhitheUtJOyro912Z.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-07-12',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/v/girl/',
  true,
  false,
  1516,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 154: Gyaldem by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Gyaldem',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'III' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  101,
  'https://freemusicarchive.org/track/gyaldem/download/',
  'https://freemusicarchive.org/track/gyaldem/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FwgNDIwskt8KiIRb9Q8bShcg8IOaMofPenlhQWfet.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/iii/gyaldem/',
  true,
  false,
  1253,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 155: You’ve got to be kidding by Andrey Petrov

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'You’ve got to be kidding',
  (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Andrey Petrov' LIMIT 1) LIMIT 1),
  NULL,
  161,
  'https://freemusicarchive.org/track/youve-got-to-be-kidding/download/',
  'https://freemusicarchive.org/track/youve-got-to-be-kidding/stream/',
  NULL,
  'Pop',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Andrey Petrov',
  'https://freemusicarchive.org/music/andrey-petrov//youve-got-to-be-kidding/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 156: Beach Babes by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Beach Babes',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'II' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  107,
  'https://freemusicarchive.org/track/beach-babes/download/',
  'https://freemusicarchive.org/track/beach-babes/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FnBGcOaYcqIaSICsUj9I3FdnpRt9wiGfbXsiXvhYX.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/ii/beach-babes/',
  true,
  false,
  2472,
  14
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 157: BILLboard by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'BILLboard',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'II' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  102,
  'https://freemusicarchive.org/track/billboard/download/',
  'https://freemusicarchive.org/track/billboard/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FnBGcOaYcqIaSICsUj9I3FdnpRt9wiGfbXsiXvhYX.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/ii/billboard/',
  true,
  false,
  1019,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 158: Replay by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Replay',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Pop Sensation' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  151,
  'https://freemusicarchive.org/track/replay/download/',
  'https://freemusicarchive.org/track/replay/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FiBmveJoUr73whV4V8bcZF1sV6cWbCyzCewLnJsoV.jpg&width=400&height=400&type=album',
  'Pop',
  '2024-04-16',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/pop-sensation/replay/',
  true,
  false,
  741,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 159: Hey Friends by SUPERARE

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Hey Friends',
  (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'IX' AND artist_id = (SELECT id FROM artists WHERE name = 'SUPERARE' LIMIT 1) LIMIT 1),
  NULL,
  127,
  'https://freemusicarchive.org/track/hey-friends/download/',
  'https://freemusicarchive.org/track/hey-friends/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2FXEYqY4ahH3QSmxt2QYWWlwA2el2eyaVopCAyeXf2.jpg&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - SUPERARE',
  'https://freemusicarchive.org/music/superare/ix/hey-friends/',
  true,
  false,
  1726,
  6
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 160: TLC & THC by Tadz

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'TLC & THC',
  (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'TV Kills CreaTVity' AND artist_id = (SELECT id FROM artists WHERE name = 'Tadz' LIMIT 1) LIMIT 1),
  NULL,
  222,
  'https://freemusicarchive.org/track/tlc-thc-1/download/',
  'https://freemusicarchive.org/track/tlc-thc-1/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2Fcy7x7PEtcGQJGU5AjlIs2vbhbY7GDi4l3l9NdRyF.webp&width=400&height=400&type=album',
  'Pop',
  '2022-06-01',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Tadz',
  'https://freemusicarchive.org/music/tadz/tv-kills-creatvity/tlc-thc-1/',
  true,
  false,
  1961,
  1
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 161: Freyasberg by Greg Atkinson

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Freyasberg',
  (SELECT id FROM artists WHERE name = 'Greg Atkinson' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unnamed album' AND artist_id = (SELECT id FROM artists WHERE name = 'Greg Atkinson' LIMIT 1) LIMIT 1),
  NULL,
  202,
  'https://freemusicarchive.org/track/Freyasberg/download/',
  'https://freemusicarchive.org/track/Freyasberg/stream/',
  NULL,
  'Folk, British Folk',
  NULL,
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Greg Atkinson',
  'https://freemusicarchive.org/music/Greg_Atkinson//Freyasberg/',
  true,
  false,
  0,
  0
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 162: You Will Fall by Austin Moffa

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'You Will Fall',
  (SELECT id FROM artists WHERE name = 'Austin Moffa' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'A Speck of Dust in Space' AND artist_id = (SELECT id FROM artists WHERE name = 'Austin Moffa' LIMIT 1) LIMIT 1),
  NULL,
  199,
  'https://freemusicarchive.org/track/you-will-fall/download/',
  'https://freemusicarchive.org/track/you-will-fall/stream/',
  'https://freemusicarchive.org/image/?file=album_image%2F3iotBXI67Z2yYGLUHebMSJqh8iQtyrpzpG9zxkCS.jpg&width=400&height=400&type=album',
  'Folk, Psych-Folk',
  '2024-05-10',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Austin Moffa',
  'https://freemusicarchive.org/music/austin-moffa/a-speck-of-dust-in-space/you-will-fall/',
  true,
  false,
  1929,
  28
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 163: Barbry Allen by Howie Mitchell & Charlotte Williams

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Barbry Allen',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1),
  (SELECT id FROM albums WHERE title = '11-14-''58' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1) LIMIT 1),
  NULL,
  194,
  'https://freemusicarchive.org/track/Track_2-BarbryAllen/download/',
  'https://freemusicarchive.org/track/Track_2-BarbryAllen/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-11-29',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell & Charlotte Williams',
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/Howie__Charlotte_Williams_11-14-58/Track_2-BarbryAllen/',
  true,
  false,
  1861,
  8
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 164: Sosban Fach by Howie Mitchell & Charlotte Williams

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Sosban Fach',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1),
  (SELECT id FROM albums WHERE title = '11-14-''58' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1) LIMIT 1),
  NULL,
  31,
  'https://freemusicarchive.org/track/Track_4-SosbanFach/download/',
  'https://freemusicarchive.org/track/Track_4-SosbanFach/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-11-29',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell & Charlotte Williams',
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/Howie__Charlotte_Williams_11-14-58/Track_4-SosbanFach/',
  true,
  false,
  2683,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 165: Come Back to Nashville by Katy Kirby

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Come Back to Nashville',
  (SELECT id FROM artists WHERE name = 'Katy Kirby' LIMIT 1),
  (SELECT id FROM albums WHERE title = '3' AND artist_id = (SELECT id FROM artists WHERE name = 'Katy Kirby' LIMIT 1) LIMIT 1),
  NULL,
  185,
  'https://freemusicarchive.org/track/Katy_Kirby_-_3_-_02_Come_Back_to_Nashville/download/',
  'https://freemusicarchive.org/track/Katy_Kirby_-_3_-_02_Come_Back_to_Nashville/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKaty_Kirby_-_3_-_2015110482225882.jpg&width=400&height=400&type=album',
  'Folk',
  '2015-11-04',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Katy Kirby',
  'https://freemusicarchive.org/music/Katy_Kirby/Katy_Kirby/Katy_Kirby_-_3_-_02_Come_Back_to_Nashville/',
  true,
  false,
  7178,
  38
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 166: Omaha by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Omaha',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  183,
  'https://freemusicarchive.org/track/JoshWoodward-DW-09-Omaha/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-09-Omaha/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_-_20130814162606567.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings/JoshWoodward-DW-09-Omaha/',
  true,
  false,
  9103,
  15
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 167: Mixed Up by Howie Mitchell & Charlotte Williams

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Mixed Up',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1),
  (SELECT id FROM albums WHERE title = '11-14-''58' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1) LIMIT 1),
  NULL,
  236,
  'https://freemusicarchive.org/track/Track_6-MixedUp/download/',
  'https://freemusicarchive.org/track/Track_6-MixedUp/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-11-29',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell & Charlotte Williams',
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/Howie__Charlotte_Williams_11-14-58/Track_6-MixedUp/',
  true,
  false,
  2372,
  10
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 168: Gravity (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Gravity (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  235,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-04-Gravity/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-04-Gravity/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-04-Gravity/',
  true,
  false,
  6098,
  22
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 169: Week Six by Ben von Wildenhaus

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Week Six',
  (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Instrumental Quaalude, vol. 1' AND artist_id = (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1) LIMIT 1),
  NULL,
  190,
  'https://freemusicarchive.org/track/05_Week_Six/download/',
  'https://freemusicarchive.org/track/05_Week_Six/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FBen_von_Wildenhaus_-_Instrumental_Quaalude_vol_1_-_20120226131333372.png&width=400&height=400&type=album',
  'Folk',
  '2012-02-26',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Ben von Wildenhaus',
  'https://freemusicarchive.org/music/BenWildenhaus/Instrumental_Quaalude_vol_1/05_Week_Six/',
  true,
  false,
  1872,
  4
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 170: Fields of Phosphene by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Fields of Phosphene',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  260,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_08_Fields_of_Phosphene/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_08_Fields_of_Phosphene/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_08_Fields_of_Phosphene/',
  true,
  false,
  982,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 171: I Want to Destroy Something Beautiful (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'I Want to Destroy Something Beautiful (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  228,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-01-IWantToDestroySomethingBeautiful/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-01-IWantToDestroySomethingBeautiful/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-01-IWantToDestroySomethingBeautiful/',
  true,
  false,
  5185,
  13
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 172: Matty Groves by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Matty Groves',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  364,
  'https://freemusicarchive.org/track/07_MattyGroves/download/',
  'https://freemusicarchive.org/track/07_MattyGroves/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/07_MattyGroves/',
  true,
  false,
  4309,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 173: Ode to Humming by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ode to Humming',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unaccountable odes' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  283,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_10_Ode_to_Humming/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_10_Ode_to_Humming/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Unaccountable_odes_-_2014072551132135.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Unaccountable_odes/Kelly_Latimore_-_Unaccountable_Odes_-_10_Ode_to_Humming/',
  true,
  false,
  2358,
  12
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 174: The Vagabond (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Vagabond (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  267,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-05-TheVagabond/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-05-TheVagabond/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-05-TheVagabond/',
  true,
  false,
  7739,
  24
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 175: Trails by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Trails',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  146,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_11_Trails/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_11_Trails/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_11_Trails/',
  true,
  false,
  2248,
  11
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 176: Insomnia by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Insomnia',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  210,
  'https://freemusicarchive.org/track/JoshWoodward-DW-03-Insomnia/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-03-Insomnia/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_-_20130814162606567.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings/JoshWoodward-DW-03-Insomnia/',
  true,
  false,
  11635,
  33
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 177: Nincompoop by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Nincompoop',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  112,
  'https://freemusicarchive.org/track/JoshWoodward-DW-12-Nincompoop/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-12-Nincompoop/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_-_20130814162606567.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings/JoshWoodward-DW-12-Nincompoop/',
  true,
  false,
  5221,
  12
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 178: Snacilep Gnivid ot Edo by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Snacilep Gnivid ot Edo',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Prelude' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  74,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Prelude_-_02_Snacilep_Gnivid_ot_Edo/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Prelude_-_02_Snacilep_Gnivid_ot_Edo/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Prelude_-_2014072553626046.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Prelude/Kelly_Latimore_-_Prelude_-_02_Snacilep_Gnivid_ot_Edo/',
  true,
  false,
  1745,
  8
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 179: Stickybee (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Stickybee (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  199,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-02-Stickybee/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-02-Stickybee/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-02-Stickybee/',
  true,
  false,
  9841,
  44
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 180: Ode to Travis' Dream by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ode to Travis'' Dream',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unaccountable odes' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  178,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_03_Ode_to_Travis_Dream/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_03_Ode_to_Travis_Dream/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Unaccountable_odes_-_2014072551132135.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Unaccountable_odes/Kelly_Latimore_-_Unaccountable_Odes_-_03_Ode_to_Travis_Dream/',
  true,
  false,
  1468,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 181: Variable (Moses) by The Midnight Sons

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Variable (Moses)',
  (SELECT id FROM artists WHERE name = 'The Midnight Sons' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Decartes' AND artist_id = (SELECT id FROM artists WHERE name = 'The Midnight Sons' LIMIT 1) LIMIT 1),
  NULL,
  178,
  'https://freemusicarchive.org/track/The_Midnight_Sons_-_Descartes_-_02_Variable_Moses/download/',
  'https://freemusicarchive.org/track/The_Midnight_Sons_-_Descartes_-_02_Variable_Moses/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FThe_Midnight_Sons_-_Decartes_-_2017122645443527.jpg&width=400&height=400&type=album',
  'Folk',
  '2017-12-26',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - The Midnight Sons',
  'https://freemusicarchive.org/music/The_Midnight_Sons/Decartes/The_Midnight_Sons_-_Descartes_-_02_Variable_Moses/',
  true,
  false,
  1510,
  9
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 182: Cello by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Cello',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  408,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_04_Cello/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_04_Cello/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_04_Cello/',
  true,
  false,
  9625,
  35
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 183: Cien Volando (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Cien Volando (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  186,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-08-CienVolando/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-08-CienVolando/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-08-CienVolando/',
  true,
  false,
  4081,
  11
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 184: My Own Heart Let Me More Have Pity On by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'My Own Heart Let Me More Have Pity On',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  235,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_01_My_Own_Heart_Let_Me_More_Have_Pity_On/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_01_My_Own_Heart_Let_Me_More_Have_Pity_On/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_01_My_Own_Heart_Let_Me_More_Have_Pity_On/',
  true,
  false,
  1405,
  8
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 185: Ode to the Beloved Basement Saints by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Ode to the Beloved Basement Saints',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Unaccountable odes' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  245,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_12_Ode_to_the_Beloved_Basement_Saints/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Unaccountable_Odes_-_12_Ode_to_the_Beloved_Basement_Saints/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Unaccountable_odes_-_2014072551132135.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Unaccountable_odes/Kelly_Latimore_-_Unaccountable_Odes_-_12_Ode_to_the_Beloved_Basement_Saints/',
  true,
  false,
  1575,
  11
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 186: Gallows Hill (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Gallows Hill (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  252,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-11-GallowsHill/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-11-GallowsHill/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-11-GallowsHill/',
  true,
  false,
  4520,
  7
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 187: The Raven and the Swan (No Vocals) by Josh Woodward

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The Raven and the Swan (No Vocals)',
  (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Dirty Wings (Instrumentals)' AND artist_id = (SELECT id FROM artists WHERE name = 'Josh Woodward' LIMIT 1) LIMIT 1),
  NULL,
  233,
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-07-TheRavenAndTheSwan/download/',
  'https://freemusicarchive.org/track/JoshWoodward-DW-NoVox-07-TheRavenAndTheSwan/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FJosh_Woodward_-_Dirty_Wings_Instrumentals_-_20130814170930590.jpg&width=400&height=400&type=album',
  'Folk',
  '2013-08-14',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Josh Woodward',
  'https://freemusicarchive.org/music/Josh_Woodward/Dirty_Wings_Instrumentals/JoshWoodward-DW-NoVox-07-TheRavenAndTheSwan/',
  true,
  false,
  4387,
  10
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 188: Prelude by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Prelude',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Prelude' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  282,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Prelude_-_01_Prelude/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Prelude_-_01_Prelude/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Prelude_-_2014072553626046.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Prelude/Kelly_Latimore_-_Prelude_-_01_Prelude/',
  true,
  false,
  2348,
  13
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 189: What Wondrous Love Is This? by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'What Wondrous Love Is This?',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = '11-14-''58' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  123,
  'https://freemusicarchive.org/track/Track_8-WhatWondrousLoveIsThis/download/',
  'https://freemusicarchive.org/track/Track_8-WhatWondrousLoveIsThis/stream/',
  NULL,
  'Folk',
  '2012-11-29',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Howie__Charlotte_Williams_11-14-58/Track_8-WhatWondrousLoveIsThis/',
  true,
  false,
  5094,
  16
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 190: Abiding by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Abiding',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  444,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_12_Abiding/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_12_Abiding/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_12_Abiding/',
  true,
  false,
  1762,
  10
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 191: Week Four by Ben von Wildenhaus

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Week Four',
  (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Instrumental Quaalude, vol. 1' AND artist_id = (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1) LIMIT 1),
  NULL,
  225,
  'https://freemusicarchive.org/track/03_Week_Four/download/',
  'https://freemusicarchive.org/track/03_Week_Four/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FBen_von_Wildenhaus_-_Instrumental_Quaalude_vol_1_-_20120226131333372.png&width=400&height=400&type=album',
  'Folk',
  '2012-02-26',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Ben von Wildenhaus',
  'https://freemusicarchive.org/music/BenWildenhaus/Instrumental_Quaalude_vol_1/03_Week_Four/',
  true,
  false,
  2052,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 192: Instrumental by Howie Mitchell & Charlotte Williams

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Instrumental',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1),
  (SELECT id FROM albums WHERE title = '11-14-''58' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell & Charlotte Williams' LIMIT 1) LIMIT 1),
  NULL,
  110,
  'https://freemusicarchive.org/track/Track_5-InstrGuitarAndDulcDuet/download/',
  'https://freemusicarchive.org/track/Track_5-InstrGuitarAndDulcDuet/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell__Charlotte_Williams_-_Howie__Charlotte_Williams_11-14-58_-_20121129225553268.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-11-29',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell & Charlotte Williams',
  'https://freemusicarchive.org/music/Howie_Mitchell__Charlotte_Williams/Howie__Charlotte_Williams_11-14-58/Track_5-InstrGuitarAndDulcDuet/',
  true,
  false,
  11196,
  26
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 193: Lucky's Tune by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Lucky''s Tune',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  301,
  'https://freemusicarchive.org/track/02_LuckysTune/download/',
  'https://freemusicarchive.org/track/02_LuckysTune/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/02_LuckysTune/',
  true,
  false,
  2766,
  13
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 194: Leaving Rooms by Kelly Latimore

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Leaving Rooms',
  (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Trails' AND artist_id = (SELECT id FROM artists WHERE name = 'Kelly Latimore' LIMIT 1) LIMIT 1),
  NULL,
  182,
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_10_Leaving_Rooms/download/',
  'https://freemusicarchive.org/track/Kelly_Latimore_-_Trails_-_10_Leaving_Rooms/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FKelly_Latimore_-_Trails_-_2014072543917770.jpg&width=400&height=400&type=album',
  'Folk',
  '2014-07-25',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Kelly Latimore',
  'https://freemusicarchive.org/music/Kelly_Latimore/Trails_1134/Kelly_Latimore_-_Trails_-_10_Leaving_Rooms/',
  true,
  false,
  1767,
  24
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 195: David's Tune by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'David''s Tune',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  225,
  'https://freemusicarchive.org/track/01_DavidsTune/download/',
  'https://freemusicarchive.org/track/01_DavidsTune/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/01_DavidsTune/',
  true,
  false,
  2114,
  8
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 196: The False Bride by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'The False Bride',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  284,
  'https://freemusicarchive.org/track/08_TheFalseBride/download/',
  'https://freemusicarchive.org/track/08_TheFalseBride/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/08_TheFalseBride/',
  true,
  false,
  2495,
  5
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 197: Week Seven by Ben von Wildenhaus

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Week Seven',
  (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Instrumental Quaalude, vol. 1' AND artist_id = (SELECT id FROM artists WHERE name = 'Ben von Wildenhaus' LIMIT 1) LIMIT 1),
  NULL,
  257,
  'https://freemusicarchive.org/track/06_Week_Seven/download/',
  'https://freemusicarchive.org/track/06_Week_Seven/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FBen_von_Wildenhaus_-_Instrumental_Quaalude_vol_1_-_20120226131333372.png&width=400&height=400&type=album',
  'Folk',
  '2012-02-26',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Ben von Wildenhaus',
  'https://freemusicarchive.org/music/BenWildenhaus/Instrumental_Quaalude_vol_1/06_Week_Seven/',
  true,
  false,
  12322,
  62
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 198: Infinity by The Midnight Sons

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Infinity',
  (SELECT id FROM artists WHERE name = 'The Midnight Sons' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Decartes' AND artist_id = (SELECT id FROM artists WHERE name = 'The Midnight Sons' LIMIT 1) LIMIT 1),
  NULL,
  251,
  'https://freemusicarchive.org/track/The_Midnight_Sons_-_Descartes_-_05_Infinity/download/',
  'https://freemusicarchive.org/track/The_Midnight_Sons_-_Descartes_-_05_Infinity/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FThe_Midnight_Sons_-_Decartes_-_2017122645443527.jpg&width=400&height=400&type=album',
  'Folk',
  '2017-12-26',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - The Midnight Sons',
  'https://freemusicarchive.org/music/The_Midnight_Sons/Decartes/The_Midnight_Sons_-_Descartes_-_05_Infinity/',
  true,
  false,
  3380,
  11
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 199: John's Laughing Place by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'John''s Laughing Place',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  170,
  'https://freemusicarchive.org/track/03_JohnsLaughingPlace/download/',
  'https://freemusicarchive.org/track/03_JohnsLaughingPlace/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/03_JohnsLaughingPlace/',
  true,
  false,
  2237,
  9
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();

-- 歌曲 200: Old Molly Hare by Howie Mitchell

INSERT INTO songs (
  title,
  artist_id,
  album_id,
  track_number,
  duration,
  url,
  playback_url,
  cover_url,
  genre,
  release_date,
  lyrics,
  external_id,
  license,
  attribution,
  source_url,
  requires_attribution,
  is_explicit,
  plays,
  likes
)
VALUES (
  'Old Molly Hare',
  (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1),
  (SELECT id FROM albums WHERE title = 'Early 70s' AND artist_id = (SELECT id FROM artists WHERE name = 'Howie Mitchell' LIMIT 1) LIMIT 1),
  NULL,
  253,
  'https://freemusicarchive.org/track/04_OldMollyHare/download/',
  'https://freemusicarchive.org/track/04_OldMollyHare/stream/',
  'https://freemusicarchive.org/image/?file=images%2Falbums%2FHowie_Mitchell_-_Early_70s_-_2012081010545672.jpg&width=400&height=400&type=album',
  'Folk',
  '2012-08-09',
  NULL,
  NULL,
  'CC BY',
  'Music from Free Music Archive - Howie Mitchell',
  'https://freemusicarchive.org/music/Howie_Mitchell/Early_70s/04_OldMollyHare/',
  true,
  false,
  2458,
  6
)
ON CONFLICT (title, artist_id, album_id) DO UPDATE SET
  url = COALESCE(EXCLUDED.url, songs.url),
  playback_url = COALESCE(EXCLUDED.playback_url, songs.playback_url),
  cover_url = COALESCE(EXCLUDED.cover_url, songs.cover_url),
  plays = EXCLUDED.plays,
  likes = EXCLUDED.likes,
  updated_at = NOW();


-- ============================================
-- 完成！
-- ============================================