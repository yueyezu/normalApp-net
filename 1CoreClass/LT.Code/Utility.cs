/**
* Title: 工具类，所有未分类好的都可以放到这个方法中。
* Author: yueye
* Date: 2017-12-13
* Desp: 后期慢慢完善。
*/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace LT.Code
{
    public static class Utility
    {
        #region Stopwatch计时器

        /// <summary>
        /// 计时器开始
        /// </summary>
        /// <returns></returns>
        public static Stopwatch TimerStart()
        {
            Stopwatch watch = new Stopwatch();
            watch.Reset();
            watch.Start();
            return watch;
        }
        /// <summary>
        /// 计时器结束
        /// </summary>
        /// <param name="watch"></param>
        /// <returns></returns>
        public static string TimerEnd(Stopwatch watch)
        {
            watch.Stop();
            double costtime = watch.ElapsedMilliseconds;
            return costtime.ToString();
        }

        #endregion

        #region 自动生成编号

        /// <summary>
        /// 表示全局唯一标识符 (GUID)。
        /// </summary>
        /// <returns></returns>
        public static string GuId()
        {
            return Guid.NewGuid().ToString();
        }

        /// <summary>
        /// 自动生成编号  20100825114540985
        /// </summary>
        /// <returns></returns>
        public static string CreateNo()
        {
            string strRandom = Ext.GetRandom(100, 1000).ToString(); //生成编号
            string code = DateTime.Now.ToString("yyyyMMddHHmmss") + strRandom;//形如
            return code;
        }

        #endregion

        #region Assembly操作类

        /// <summary>
        /// 获取所有继承对应基类或者接口的类
        /// </summary>
        /// <param name="baseType">基类类型</param>
        /// <returns></returns>
        public static IEnumerable<Type> GetAllSubClass(Type baseType)
        {
            if (baseType.IsInterface)
            {
                foreach (var assembly in AppDomain.CurrentDomain.GetAssemblies())
                {
                    foreach (var type in assembly.GetTypes())
                    {
                        if (type.GetInterfaces().Any(t => t == baseType))
                        {
                            yield return type;
                        }
                    }
                }
            }
            else
            {
                foreach (var assembly in AppDomain.CurrentDomain.GetAssemblies())
                {
                    foreach (var type in assembly.GetTypes())
                    {
                        if (type.BaseType == baseType)
                        {
                            yield return type;
                            break;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 根据类型信息，获取该类型的实例对象
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static Object GetInstanceByType(Type type)
        {
            //第一种实现方法
            return Activator.CreateInstance(type);
            //第二种实现方法
            //if (type.FullName != null)
            //    return type.Assembly.CreateInstance(type.FullName);
            //else
            //    return null;
        }

        #endregion

        /// <summary>
        /// 用于检测当前代码环境是否是在开发环境下
        /// </summary>
        /// <returns></returns>
        public static bool IsDesignMode()
        {
            bool returnFlag = false;

#if DEBUG
            if (LicenseManager.UsageMode == LicenseUsageMode.Designtime)
            {
                returnFlag = true;
            }
            else if (Process.GetCurrentProcess().ProcessName == "devenv")
            {
                returnFlag = true;
            }
#endif

            return returnFlag;
        }
    }
}
