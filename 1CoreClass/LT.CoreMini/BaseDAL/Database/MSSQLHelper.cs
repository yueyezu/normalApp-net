/**********************************************
* Title: SqlServer数据库操作的类
* Author: yueye
* Date: 2017-12-13
* Desp: SqlServer数据库操作的类
***********************************************/

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.Core
{
    public class MSSqlHelper : IDbHelper
    {
        private string connStr = null;

        /// <summary>
        /// 单例模式，声明隐式的构造函数
        /// </summary>
        private MSSqlHelper(string con)
        {
            connStr = con;
        }

        /// <summary>
        /// 非单例模式获取数据库帮助类
        /// </summary>
        /// <param name="con">数据库的连接字符串</param>
        /// <returns></returns>
        public static IDbHelper GetNewInstance(string con)
        {
            return new MSSqlHelper(con);
        }

        #region 单例模式

        /// <summary>
        /// 单例的实体类，
        /// </summary>
        private static MSSqlHelper instance = null;
        private static readonly object lockHelper = new object();

        /// <summary>
        /// 获取单例的信息
        /// </summary>
        /// <param name="con">数据库连接字符串</param>
        /// <returns></returns>
        public static IDbHelper GetInstance(string con)
        {
            if (null == instance)
            {
                lock (lockHelper)
                {
                    if (null == instance)
                    {
                        instance = new MSSqlHelper(con);
                    }
                }
            }
            return instance;
        }

        #endregion

        #region 公用方法

        /// <summary>
        /// 表是否存在
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>返回表是否存在，如果存在返回true,如果不存在返回false</returns>
        public bool TableExists(string tableName)
        {
            string strsql = "select count(*) from sysobjects where id = object_id(N'[" + tableName + "]') and OBJECTPROPERTY(id, N'IsUserTable') = 1";
            object obj = ExecuteScalar(strsql);
            int cmdresult;
            if ((Equals(obj, null)) || (Equals(obj, DBNull.Value)))
            {
                cmdresult = 0;
            }
            else
            {
                cmdresult = int.Parse(obj.ToString());
            }
            if (cmdresult == 0)
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// 检查当前数据库表是否能存在相应列
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="columnName">列名</param>
        /// <returns>如果列存在则返回true</returns>
        public bool ColumnExists(string tableName, string columnName)
        {
            string sql = "select count(1) from syscolumns where [id]=object_id('" + tableName + "') and [name]='" + columnName + "'";
            object res = ExecuteScalar(sql);
            if (res == null)
            {
                return false;
            }
            return Convert.ToInt32(res) > 0;
        }

        /// <summary>
        /// 获取总数
        /// </summary>
        /// <param name="sql">查询语句</param>
        /// <param name="dbParameter">查询的参数</param>
        /// <returns>返回查询数据的总行数</returns>
        public int GetPageCount(string sql, params DbParameter[] dbParameter)
        {
            sql = "select count(*) from ( " + sql + " ) as newTable";
            var count = Convert.ToInt32(ExecuteScalar(sql, dbParameter));

            return count;
        }
        /// <summary>
        /// 获取分页查询的语句
        /// </summary>
        /// <param name="sql">查询语句</param>
        /// <param name="pagination">分页信息</param>
        /// <param name="sort">排序语句</param>
        /// <param name="dbParameter">查询参数</param>
        /// <returns></returns>
        public string GetPageSql(string sql, Pagination pagination, string sort, params DbParameter[] dbParameter)
        {
            pagination.records = GetPageCount(sql, dbParameter);
            int index = (pagination.page - 1) * pagination.rows + 1;
            int end = pagination.page * pagination.rows;

            sql = string.Format("select * from (select *, row_number() over(order by {0}) as number from ({1}) as newTable1) as newTable2" +
                    " where newTable2.number between {2} and {3}",
                    sort, sql, index, end);

            return sql;
        }

        #endregion

        #region 数据库操作方法

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="sqlString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        public int ExecuteNonQuery(string sqlString)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (DbCommand cmd = new SqlCommand(sqlString, connection))
                {
                    try
                    {
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (SqlException)
                    {
                        connection.Close();
                        throw;
                    }
                }
            }
        }
        public int ExecuteNonQuery(DbConnection connection, string sqlString)
        {

            using (SqlCommand cmd = new SqlCommand(sqlString, (SqlConnection)connection))
            {
                try
                {
                    if (connection.State != ConnectionState.Open)
                        connection.Open();
                    int rows = cmd.ExecuteNonQuery();
                    return rows;
                }
                catch (SqlException)
                {
                    connection.Close();
                    throw;
                }
            }
        }

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="sqlString">SQL语句</param>
        /// <param name="cmdParms">查询参数</param>
        /// <returns>影响的记录数</returns>
        public int ExecuteNonQuery(string sqlString, params DbParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, sqlString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        public int ExecuteNonQuery(DbConnection connection, string sqlString, params DbParameter[] cmdParms)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                try
                {
                    PrepareCommand(cmd, connection, sqlString, cmdParms);
                    int rows = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    return rows;
                }
                catch (SqlException e)
                {
                    throw e;
                }
            }
        }
        public int ExecuteNonQuery(string sqlString, CommandType cmdType, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                PrepareCommand(cmd, conn, cmdType, sqlString, cmdParms);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="sqlString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public object ExecuteScalar(string sqlString)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(sqlString, connection))
                {
                    try
                    {
                        connection.Open();
                        object obj = cmd.ExecuteScalar();
                        if ((Equals(obj, null)) || (Equals(obj, DBNull.Value)))
                        {
                            return null;
                        }
                        return obj;
                    }
                    catch (SqlException e)
                    {
                        connection.Close();
                        throw e;
                    }
                }
            }
        }
        public object ExecuteScalar(DbConnection connection, string sqlString)
        {
            using (SqlCommand cmd = new SqlCommand(sqlString, (SqlConnection)connection))
            {
                try
                {
                    if (connection.State != ConnectionState.Open)
                        connection.Open();
                    object obj = cmd.ExecuteScalar();
                    if ((Equals(obj, null)) || (Equals(obj, DBNull.Value)))
                    {
                        return null;
                    }
                    return obj;
                }
                catch (SqlException e)
                {
                    connection.Close();
                    throw e;
                }
            }
        }

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）
        /// </summary>
        /// <param name="sqlString">计算查询结果语句</param>
        /// <param name="cmdParms">查询参数列表</param>
        /// <returns>查询结果（object）</returns>
        public object ExecuteScalar(string sqlString, params DbParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, sqlString, cmdParms);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Equals(obj, null)) || (Equals(obj, DBNull.Value)))
                        {
                            return null;
                        }
                        return obj;
                    }
                    catch (SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        public object ExecuteScalar(DbConnection connection, string sqlString, params DbParameter[] cmdParms)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                try
                {
                    PrepareCommand(cmd, connection, sqlString, cmdParms);
                    object obj = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    if ((Equals(obj, null)) || (Equals(obj, DBNull.Value)))
                    {
                        return null;
                    }
                    return obj;
                }
                catch (SqlException e)
                {
                    throw e;
                }
            }
        }
        public object ExecuteScalar(string sqlString, CommandType cmdType, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                PrepareCommand(cmd, conn, cmdType, sqlString, cmdParms);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行查询语句，返回SqlDataReader ( 注意：调用该方法后，一定要对SqlDataReader进行Close )
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <returns>SqlDataReader</returns>
        public DbDataReader ExecuteReader(string sqlString)
        {
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sqlString, connection);
            try
            {
                connection.Open();
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                return myReader;
            }
            catch (SqlException e)
            {
                connection.Close();
                throw e;
            }
        }
        public DbDataReader ExecuteReader(DbConnection connection, string sqlString)
        {
            SqlCommand cmd = new SqlCommand(sqlString, (SqlConnection)connection);
            try
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlDataReader myReader = cmd.ExecuteReader();
                return myReader;
            }
            catch (SqlException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 执行查询语句，返回SqlDataReader 
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <param name="cmdParms">查询的参数</param>
        /// <returns>SqlDataReader</returns>
        public DbDataReader ExecuteReader(string sqlString, params DbParameter[] cmdParms)
        {
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, sqlString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (SqlException e)
            {
                throw e;
            }
        }
        public DbDataReader ExecuteReader(DbConnection connection, string sqlString, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, sqlString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (SqlException e)
            {
                throw e;
            }
        }
        public DbDataReader ExecuteReader(string sqlString, CommandType cmdType, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                PrepareCommand(cmd, conn, cmdType, sqlString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader();
                cmd.Parameters.Clear();
                return myReader;
            }
        }

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <returns>DataSet</returns>
        public DataSet ExecuteDataSet(string sqlString)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SqlDataAdapter command = new SqlDataAdapter(sqlString, connection);
                    command.Fill(ds, "ds");
                }
                catch (SqlException e)
                {
                    throw e;
                }
                return ds;
            }
        }
        public DataSet ExecuteDataSet(DbConnection connection, string sqlString)
        {
            DataSet ds = new DataSet();
            try
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlDataAdapter command = new SqlDataAdapter(sqlString, (SqlConnection)connection);
                command.Fill(ds, "ds");
            }
            catch (SqlException e)
            {
                throw e;
            }
            return ds;
        }

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <param name="cmdParms">查询的参数列表</param>
        /// <returns>DataSet</returns>
        public DataSet ExecuteDataSet(string sqlString, params DbParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, connection, sqlString, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (SqlException ex)
                    {
                        throw ex;
                    }
                    return ds;
                }
            }
        }
        public DataSet ExecuteDataSet(DbConnection connection, string sqlString, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, connection, sqlString, cmdParms);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                try
                {
                    da.Fill(ds, "ds");
                    cmd.Parameters.Clear();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                return ds;
            }
        }
        public DataSet ExecuteDataSet(string sqlString, CommandType cmdType, params DbParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                PrepareCommand(cmd, conn, cmdType, sqlString, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (SqlException ex)
                    {
                        throw ex;
                    }
                    return ds;
                }
            }
        }

        /// <summary>
        ///使用现有的SQL事务执行一个sql命令（不返回数据集）
        /// </summary>
        /// <param name="trans">一个现有的事务</param>
        /// <param name="cmdType">命令类型(存储过程, 文本, 等等)</param>
        /// <param name="cmdText">存储过程名称或者sql命令语句</param>
        /// <param name="commandParameters">执行命令所用参数的集合</param>
        /// <returns>执行命令所影响的行数</returns>
        private int ExecuteNonQuery(DbTransaction trans, CommandType cmdType, string cmdText, params DbParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }
        /// <summary>
        /// 进行事务处理，返回总共受影响的行数
        /// </summary>
        /// <param name="cmdTypes">命令的类型集合</param>
        /// <param name="cmdTexts">命令的内容集合</param>
        /// <param name="parameterses">命令的参数集合</param>
        /// <returns></returns>
        public int ExecuteSqls(List<CommandType> cmdTypes, List<string> cmdTexts, List<DbParameter[]> parameterses)
        {
            int count = 0;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction trans = conn.BeginTransaction();
                try
                {
                    if (parameterses == null && cmdTypes != null)
                    {
                        for (int i = 0; i < cmdTexts.Count; i++)
                        {
                            count += ExecuteNonQuery(trans, cmdTypes[i], cmdTexts[i], null);
                        }
                    }
                    else if (cmdTypes == null && parameterses != null)
                    {
                        for (int i = 0; i < cmdTexts.Count; i++)
                        {
                            count += ExecuteNonQuery(trans, CommandType.Text, cmdTexts[i], parameterses[i]);
                        }
                    }
                    else if (cmdTypes == null)
                    {
                        for (int i = 0; i < cmdTexts.Count; i++)
                        {
                            count += ExecuteNonQuery(trans, CommandType.Text, cmdTexts[i], null);
                        }
                    }
                    else
                    {
                        for (int i = 0; i < cmdTexts.Count; i++)
                        {
                            count += ExecuteNonQuery(trans, cmdTypes[i], cmdTexts[i], parameterses[i]);
                        }
                    }
                    trans.Commit();
                }
                catch (Exception)
                {
                    trans.Rollback();
                    throw;
                }
            }
            return count;
        }
        public int ExecuteSqls(DbConnection conn, List<CommandType> cmdTypes, List<string> cmdTexts, List<DbParameter[]> parameterses)
        {
            int count = 0;

            if (conn.State != ConnectionState.Open)
                conn.Open();
            DbTransaction trans = conn.BeginTransaction();
            try
            {
                if (parameterses == null && cmdTypes != null)
                {
                    for (int i = 0; i < cmdTexts.Count; i++)
                    {
                        count += ExecuteNonQuery(trans, cmdTypes[i], cmdTexts[i], null);
                    }
                }
                else if (cmdTypes == null && parameterses != null)
                {
                    for (int i = 0; i < cmdTexts.Count; i++)
                    {
                        count += ExecuteNonQuery(trans, CommandType.Text, cmdTexts[i], parameterses[i]);
                    }

                }
                else if (cmdTypes == null)
                {
                    for (int i = 0; i < cmdTexts.Count; i++)
                    {
                        count += ExecuteNonQuery(trans, CommandType.Text, cmdTexts[i], null);
                    }
                }
                else
                {
                    for (int i = 0; i < cmdTexts.Count; i++)
                    {
                        count += ExecuteNonQuery(trans, cmdTypes[i], cmdTexts[i], parameterses[i]);
                    }
                }
                trans.Commit();
            }
            catch (Exception)
            {
                trans.Rollback();
                throw;
            }
            return count;
        }
        public int ExecuteSqls(List<string> sqlStrings, List<DbParameter[]> cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    connection.Open();
                    SqlTransaction trans = connection.BeginTransaction();
                    cmd.Transaction = trans;
                    try
                    {
                        int rows = 0;
                        for (int i = 0; i < sqlStrings.Count; i++)
                        {
                            PrepareCommand(cmd, connection, sqlStrings[i], cmdParms[i]);
                            rows += cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();
                        }

                        trans.Commit();
                        return rows;
                    }
                    catch (SqlException)
                    {
                        trans.Rollback();
                        throw;
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }
        public int ExecuteSqls(List<string> sqlStrings)
        {
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    connection.Open();
                    cmd.Connection = connection;
                    SqlTransaction trans = connection.BeginTransaction();
                    cmd.Transaction = trans;
                    try
                    {
                        int rows = 0;
                        for (int i = 0; i < sqlStrings.Count; i++)
                        {
                            cmd.CommandText = sqlStrings[i];

                            rows += cmd.ExecuteNonQuery();
                        }

                        trans.Commit();
                        return rows;
                    }
                    catch (SqlException)
                    {
                        trans.Rollback();
                        throw;
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }

        /// <summary>
        /// 准备执行的command指令
        /// </summary>
        /// <param name="cmd">command对象</param>
        /// <param name="conn">connection对象</param>
        /// <param name="trans">事务对象</param>
        /// <param name="cmdType">语句的类型</param>
        /// <param name="cmdText">执行的语句</param>
        /// <param name="cmdParms">参数</param>
        private void PrepareCommand(DbCommand cmd, DbConnection conn, DbTransaction trans, CommandType cmdType, string cmdText, DbParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (DbParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput ||
                         parameter.Direction == ParameterDirection.Input) && (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
        private void PrepareCommand(DbCommand cmd, DbConnection conn, string cmdText, DbParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (cmdParms != null)
            {
                foreach (DbParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput ||
                         parameter.Direction == ParameterDirection.Input) && (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
        private void PrepareCommand(DbCommand cmd, DbConnection conn, CommandType cmdType, string cmdText, DbParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (DbParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }

        #endregion

        public void Dispose()
        {
            //TODO 处理方式待定
        }
    }
}
