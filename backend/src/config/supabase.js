import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

// Validate environment variables
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseAnonKey = process.env.SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables. Please check your .env file.');
}

// Create Supabase client
export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    autoRefreshToken: true,
    persistSession: false
  }
});

// Test database connection
export async function testConnection() {
  try {
    // 尝试查询 songs 表来测试连接(这个表应该存在)
    const { error } = await supabase.from('songs').select('count').limit(1);

    if (error) {
      // 如果 songs 表不存在,检查是否是表不存在的错误
      if (error.code === 'PGRST204' || error.message.includes('does not exist')) {
        console.warn('⚠️  Supabase connected, but "songs" table not found.');
        console.warn('   Please run the schema.sql file in Supabase SQL Editor.');
        return true; // 连接成功,但表未创建
      }
      console.error('❌ Supabase connection error:', error.message);
      return false;
    }

    console.log('✅ Supabase connected successfully');
    return true;
  } catch (error) {
    console.error('❌ Supabase connection error:', error.message);
    return false;
  }
}
