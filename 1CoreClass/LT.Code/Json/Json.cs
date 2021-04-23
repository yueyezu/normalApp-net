/**
* Title: Json转化方法的封装
* Author: yueye
* Date: 2017/12/12 14:32:43
* Desp: 可以实现对json格式数据的双向转化。注意 dynamic类型无法直接转化，可以先封装为object类型在进行转化。
*/

using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

//缺少编译器要求的成员“ystem.Runtime.CompilerServices.ExtensionAttribute..ctor”  
namespace System.Runtime.CompilerServices
{
    public class ExtensionAttribute : Attribute { }
}

namespace LT.Code
{
    public static class JsonHelp
    {
        /// <summary>
        /// 对象转为json字符串
        /// </summary>
        /// <param name="obj">需要转化的对象</param>
        /// <returns></returns>
        public static string ToJson(this object obj)
        {
            IsoDateTimeConverter timeConverter = new IsoDateTimeConverter { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" };
            return JsonConvert.SerializeObject(obj, timeConverter);
        }
        /// <summary>
        /// 对象转为Json字符串,可对日期格式的转化进行控制
        /// </summary>
        /// <param name="obj">对象</param>
        /// <param name="datetimeformats">日期的格式：yyyy-MM-dd HH:mm:ss</param>
        /// <returns></returns>
        public static string ToJson(this object obj, string datetimeformats)
        {
            var timeConverter = new IsoDateTimeConverter { DateTimeFormat = datetimeformats };
            return JsonConvert.SerializeObject(obj, timeConverter);
        }

        /// <summary>
        /// Json字符串转为对象
        /// </summary>
        /// <param name="json">json字符串</param>
        /// <returns></returns>
        public static object ToObject(this string json)
        {
            return json == null ? null : JsonConvert.DeserializeObject(json);
        }
        /// <summary>
        /// 根据对象的类型，将json字符串转为对象
        /// </summary>
        /// <typeparam name="T">对象泛型</typeparam>
        /// <param name="json">json字符串</param>
        /// <returns></returns>
        public static T ToObject<T>(this string json)
        {
            return json == null ? default(T) : JsonConvert.DeserializeObject<T>(json);
        }

        /// <summary>
        /// 将列表类型json转化为列表对象
        /// </summary>
        /// <typeparam name="T">对象的泛型</typeparam>
        /// <param name="json">json字符串</param>
        /// <returns></returns>
        public static List<T> ToList<T>(this string json)
        {
            return json == null ? null : JsonConvert.DeserializeObject<List<T>>(json);
        }
    }
}
