/**
* Title: String类型的的扩展方法
* Author: other
* Date: long long ago
* Desp: 
*/

using System;

namespace LT.Code
{
    public static partial class Ext
    {
        /// <summary>
        /// 转换为字符串
        /// </summary>
        /// <param name="data">数据</param>
        public static string ToString(this object data)
        {
            return data == null ? string.Empty : data.ToString().Trim();
        }

        /// <summary>
        /// 获取局部字符串
        /// </summary>
        /// <param name="str">字符串本身</param>
        /// <param name="begin">开始的标识字符</param>
        /// <param name="end">结束的标识字符</param>
        /// <returns></returns>
        public static string Substring(this string str, string begin, string end)
        {
            int index = str.IndexOf(begin, StringComparison.Ordinal);
            if (index < 0)
            {
                return "";
            }
            str = str.Substring(index + begin.Length);
            int length = str.IndexOf(end);
            if (length >= 0)
            {
                return str.Substring(0, length);
            }
            return str;
        }

        /// <summary>
        /// 删除最后结尾的指定字符后的字符
        /// </summary>
        public static string TrimEndByChar(this string str, string strchar)
        {
            return str.Substring(0, str.LastIndexOf(strchar));
        }
    }
}
