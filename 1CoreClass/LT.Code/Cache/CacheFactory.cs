/**
* Title: 缓存类创建工厂
* Author: other
* Date: long long ago
* Desp: 用户获取Cache对象
*/
namespace LT.Code
{
    public class CacheFactory
    {
        public static ICache Cache()
        {
            return new Cache();
        }
    }
}
