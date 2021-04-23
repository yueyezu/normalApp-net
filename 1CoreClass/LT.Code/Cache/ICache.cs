/**
* Title: 缓存类接口
* Author: other
* Date: long long ago
* Desp: 缓存类的接口，在对外扩展时可以使用到，与CacheFactory配合使用
*/

using System;

namespace LT.Code
{
    public interface ICache
    {
        T GetCache<T>(string cacheKey) where T : class;
        void WriteCache<T>(T value, string cacheKey) where T : class;
        void WriteCache<T>(T value, string cacheKey, DateTime expireTime) where T : class;
        void RemoveCache(string cacheKey);
        void RemoveCache();
    }
}
