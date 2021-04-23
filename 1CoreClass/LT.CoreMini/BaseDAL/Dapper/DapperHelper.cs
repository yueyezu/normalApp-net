using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Data.SQLite;
using System.Linq;
using Dapper;
using MySql.Data.MySqlClient;

namespace LT.Core
{
    /// <summary>
    /// 数据库的类型枚举
    /// </summary>
    public enum DbTypeEnum
    {
        No, SqlServer, Oracle, SQLite, MySql
    }

    public class DapperHelper
    {
        private string connStr = "";
        private DbTypeEnum dbType = DbTypeEnum.No;

        /// <summary>
        /// 初始化方法
        /// </summary>
        /// <param name="connStr"></param>
        /// <param name="dbType"></param>
        public DapperHelper(string connStr, DbTypeEnum dbType)
        {
            this.connStr = connStr;
            this.dbType = dbType;
        }

        /// <summary>
        /// 根据当前配置的内容，获取数据库连接
        /// </summary>
        /// <returns></returns>
        private IDbConnection GetDbConnection()
        {
            IDbConnection conn = null;
            switch (dbType)
            {
                case DbTypeEnum.SqlServer:   //SqlServer数据库的处理
                    conn = new SqlConnection(connStr);
                    break;
                case DbTypeEnum.SQLite:
                    conn = new SQLiteConnection(connStr);
                    break;
                case DbTypeEnum.Oracle:
                    conn = new OracleConnection(connStr);
                    break;
                case DbTypeEnum.MySql:
                    conn = new MySqlConnection(connStr);
                    break;
                default:
                    throw new ArgumentException("数据库连接字符串配置错误。");
                    break;
            }
            return conn;
        }

        /// <summary>
        /// 查询操作
        /// </summary>
        /// <typeparam name="T">返回集合的类型</typeparam>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数化值</param>
        /// <returns></returns>
        public IEnumerable<T> Query<T>(string sql, object param = null)
        {
            IEnumerable<T> list = default(IEnumerable<T>);
            if (!string.IsNullOrEmpty(sql))
            {
                using (IDbConnection conn = GetDbConnection())
                {
                    list = conn.Query<T>(sql, param);
                }
            }
            return list;
        }

        /// <summary>
        /// 执行存储过程查询操作
        /// </summary>
        /// <typeparam name="T">返回集合的类型</typeparam>
        /// <param name="storedName">存储过程</param>
        /// <param name="param">参数化值</param>
        /// <returns></returns>
        public IEnumerable<T> QueryStored<T>(string storedName, object param = null)
        {
            IEnumerable<T> list = default(IEnumerable<T>);
            if (!string.IsNullOrEmpty(storedName))
            {
                using (IDbConnection conn = GetDbConnection())
                {
                    list = conn.Query<T>(storedName, CommandType.StoredProcedure);
                }
            }
            return list;
        }

        /// <summary>
        /// 查询操作返回默认第一条数据(如返回null则创建默认类型)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public T FirstOrDefault<T>(string sql, object param = null)
        {
            var model = default(T);
            if (!string.IsNullOrEmpty(sql))
            {
                using (IDbConnection conn = GetDbConnection())
                {
                    model = conn.Query<T>(sql, param).FirstOrDefault();
                }
            }
            return model == null ? Activator.CreateInstance<T>() : model;
        }

        /// <summary>
        /// 批量执行sql语句
        /// </summary>
        /// <param name="sqls"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public int Excutes(List<string> sqls, List<object> param)
        {
            int count = 0;
            using (IDbConnection conn = GetDbConnection())
            {
                IDbTransaction transaction = conn.BeginTransaction();
                try
                {
                    for (int i = 0; i < sqls.Count; i++)
                    {
                        count += conn.Execute(sqls[i], param[i], transaction);
                    }
                    transaction.Commit();
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    count = 0;
                }
            }
            return count;
        }

        /// <summary>
        /// 非查询操作
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public int Excute(string sql, object param = null)
        {
            using (IDbConnection conn = GetDbConnection())
            {
                return conn.Execute(sql, param);
            }
        }
    }
}
