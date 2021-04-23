using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Data.SQLite;
using LT.Code;
using MySql.Data.MySqlClient;

namespace LT.Core
{
    public class DapperFactory
    {
        private static Dictionary<string, DapperHelper> dbHelperTemps = new Dictionary<string, DapperHelper>();
        private static string dbconnEncrypt = null;

        /// <summary>
        /// 构造函数，主要是更新日志的配置文件
        /// </summary>
        static DapperFactory()
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
        public static DapperHelper GetDapperHelper()
        {
            return GetDapperHelper(Configs.GetSetting("defaultDbKey"));
        }
        /// <summary>
        /// 获取数据库的操作对象，根据配置信息
        /// </summary>
        /// <param name="connKey">配置项的配置Key值</param>
        /// <returns></returns>
        public static DapperHelper GetDapperHelper(string connKey)
        {
            //先看连接的缓存，如果在缓存中存在，则直接返回缓存内容。
            if (dbHelperTemps.ContainsKey(connKey))
            {
                return dbHelperTemps[connKey];
            }

            DbTypeEnum typeEnum = DbTypeEnum.No;
            ConnectionStringSettings connSetting = GetConnSetting(connKey);
            switch (connSetting.ProviderName)
            {
                case "System.Data.SqlClient":   //SqlServer数据库的处理
                    typeEnum = DbTypeEnum.SqlServer;
                    break;
                case "System.Data.SqlLite":
                    typeEnum = DbTypeEnum.SQLite;
                    break;
                case "System.Data.OracleClient":
                    typeEnum = DbTypeEnum.Oracle;
                    break;
                case "MySql.Data.MySqlClient":
                    typeEnum = DbTypeEnum.MySql;
                    break;
                default:
                    break;
            }
            DapperHelper dapperHelper = new DapperHelper(connSetting.ConnectionString, typeEnum);
            dbHelperTemps.Add("dbconn", dapperHelper);

            return dapperHelper;
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
