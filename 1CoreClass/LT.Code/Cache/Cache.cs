/**
* Title: 缓存类
* Author: other
* Date: long long ago
* Desp: 调用系统的缓存内容，进行缓存信息的操纵。
*/

using System;
using System.Collections;
using System.Web;

namespace LT.Code
{
    public class Cache : ICache
    {
        private static System.Web.Caching.Cache cache = HttpRuntime.Cache;

        /// <summary>
        /// 获取缓存数据
        /// </summary>
        /// <typeparam name="T">对象</typeparam>
        /// <param name="cacheKey">key值</param>
        /// <returns></returns>
        public T GetCache<T>(string cacheKey) where T : class
        {
            if (cache[cacheKey] != null)
            {
                return (T)cache[cacheKey];
            }
            return default(T);
        }

        /// <summary>
        /// 写入缓存信息
        /// </summary>
        /// <typeparam name="T">缓存值的类型</typeparam>
        /// <param name="value">缓存值</param>
        /// <param name="cacheKey">缓存key</param>
        public void WriteCache<T>(T value, string cacheKey) where T : class
        {
            cache.Insert(cacheKey, value, null, DateTime.Now.AddMinutes(10), System.Web.Caching.Cache.NoSlidingExpiration);
        }
        /// <summary>
        /// 写入缓存信息
        /// </summary>
        /// <typeparam name="T">缓存值的类型</typeparam>
        /// <param name="value">缓存值</param>
        /// <param name="cacheKey">缓存key</param>
        /// <param name="expireTime">超时时间</param>
        public void WriteCache<T>(T value, string cacheKey, DateTime expireTime) where T : class
        {
            cache.Insert(cacheKey, value, null, expireTime, System.Web.Caching.Cache.NoSlidingExpiration);
        }

        /// <summary>
        /// 根据key清除缓存
        /// </summary>
        /// <param name="cacheKey">key值</param>
        public void RemoveCache(string cacheKey)
        {
            cache.Remove(cacheKey);
        }
        /// <summary>
        /// 清除缓存，全部信息
        /// </summary>
        public void RemoveCache()
        {
            IDictionaryEnumerator CacheEnum = cache.GetEnumerator();
            while (CacheEnum.MoveNext())
            {
                cache.Remove(CacheEnum.Key.ToString());
            }
        }
    }
}
