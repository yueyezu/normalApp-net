/**
* Title: 进行数据库调度的类
* Author: yueye
* Date: 2018/2/12 16:10:11
* Desp:
*/

using System;
using System.Collections.Generic;
using System.Configuration;
using LT.Code;

namespace LT.Core
{
    public class DbFactory
    {
        private static Dictionary<string, IDbHelper> dbHelperTemps = new Dictionary<string, IDbHelper>();
        private static string dbconnEncrypt = null;

        /// <summary>
        /// 构造函数，主要是更新日志的配置文件
        /// </summary>
        static DbFactory()
        {
            try
            {
                if (string.IsNullOrEmpty(dbconnEncrypt))
                {
                    dbconnEncrypt = ConfigurationManager.AppSettings["dbconnEncrypt"];
                    if (string.IsNullOrEmpty(dbconnEncrypt))
                    {
                        dbconnEncrypt = "true";
                    }
                }
            }
            catch (Exception)
            {
                dbconnEncrypt = "true";
            }
        }

        /// <summary>
        /// 获取数据库操作的对象,根据默认配置的key
        /// </summary>
        /// <returns></returns>
        public static IDbHelper GetDbHelper()
        {
            return GetDbHelper(Configs.GetSetting("defaultDbKey"));
        }
        /// <summary>
        /// 获取数据库的操作对象，根据配置信息
        /// </summary>
        /// <param name="connKey"></param>
        /// <returns></returns>
        public static IDbHelper GetDbHelper(string connKey)
        {
            //先看连接的缓存，如果在缓存中存在，则直接返回缓存内容。
            if (dbHelperTemps.ContainsKey(connKey))
            {
                return dbHelperTemps[connKey];
            }

            IDbHelper dbHelper = null;
            ConnectionStringSettings connSetting = GetConnSetting(connKey);
            switch (connSetting.ProviderName)
            {
                case "System.Data.SqlClient":   //SqlServer数据库的处理
                    dbHelper = MSSqlHelper.GetNewInstance(connSetting.ConnectionString);
                    break;
                case "System.Data.SqlLite":
                    dbHelper = SqliteHelper.GetNewInstance(connSetting.ConnectionString);
                    break;
                case "System.Data.OracleClient":
                    dbHelper = OracleHelper.GetNewInstance(connSetting.ConnectionString);
                    break;
                case "MySql.Data.MySqlClient":
                    dbHelper = MySqlHelper.GetNewInstance(connSetting.ConnectionString);
                    break;
                default:
                    break;
            }

            if (dbHelper != null)
            {
                dbHelperTemps.Add("dbconn", dbHelper);
            }
            return dbHelper;
        }

        /// <summary>
        /// 释放并删除掉一个数据库连接的信息
        /// </summary>
        /// <param name="connKey">数据库的配置值</param>
        public void RemoveDbHelperTemp(string connKey)
        {
            //先看连接的缓存，如果在缓存中存在，则直接返回缓存内容。
            if (dbHelperTemps.ContainsKey(connKey))
            {
                dbHelperTemps[connKey].Dispose();
                dbHelperTemps.Remove(connKey);
            }
        }

        /// <summary>
        /// 得到web.config里配置项的数据库连接信息。
        /// </summary>
        /// <param name="configName"></param>
        /// <returns></returns>
        private static ConnectionStringSettings GetConnSetting(string configName)
        {
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings[configName];
            if (dbconnEncrypt == "true")
            {
                connSetting.ConnectionString = DESEncrypt.Decrypt(connSetting.ConnectionString);
            }
            return connSetting;
        }
    }
}
