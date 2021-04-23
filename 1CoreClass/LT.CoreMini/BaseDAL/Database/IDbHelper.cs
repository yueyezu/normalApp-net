/**
* Title: 数据库操作基础类的逻辑处理方法
* Author: yueye
* Date: 2018/2/12 14:43:35
* Desp:
*/

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace LT.Core
{
    public interface IDbHelper : IDisposable
    {
        #region 公用方法
        /// <summary>
        /// 表是否存在
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>返回表是否存在，如果存在返回true,如果不存在返回false</returns>
        bool TableExists(string tableName);

        /// <summary>
        /// 检查当前数据库表是否能存在相应列
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="columnName">列名</param>
        /// <returns>如果列存在则返回true</returns>
        bool ColumnExists(string tableName, string columnName);

        /// <summary>
        /// 获取总数
        /// </summary>
        /// <param name="sql">查询语句</param>
        /// <param name="dbParameter">查询的参数</param>
        /// <returns>返回查询数据的总行数</returns>
        int GetPageCount(string sql, params DbParameter[] dbParameter);

        /// <summary>
        /// 获取分页查询的语句
        /// </summary>
        /// <param name="sql">查询语句</param>
        /// <param name="pagination">分页信息</param>
        /// <param name="sort">排序语句</param>
        /// <param name="dbParameter">查询参数</param>
        /// <returns></returns>
        string GetPageSql(string sql, Pagination pagination, string sort, params DbParameter[] dbParameter);

        #endregion

        #region 查询的方法

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="sqlString">SQL语句</param>
        /// <returns>影响的记录数</returns>
        int ExecuteNonQuery(string sqlString);
        int ExecuteNonQuery(DbConnection connection, string sqlString);

        /// <summary>
        /// 执行SQL语句，返回影响的记录数
        /// </summary>
        /// <param name="sqlString">SQL语句</param>
        /// <param name="cmdParms">查询参数</param>
        /// <returns>影响的记录数</returns>
        int ExecuteNonQuery(string sqlString, params DbParameter[] cmdParms);
        int ExecuteNonQuery(DbConnection connection, string sqlString, params DbParameter[] cmdParms);
        int ExecuteNonQuery(string sqlString, CommandType cmdType, params DbParameter[] cmdParms);

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="sqlString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        object ExecuteScalar(string sqlString);
        object ExecuteScalar(DbConnection connection, string sqlString);

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）
        /// </summary>
        /// <param name="sqlString">计算查询结果语句</param>
        /// <param name="cmdParms">查询参数列表</param>
        /// <returns>查询结果（object）</returns>
        object ExecuteScalar(string sqlString, params DbParameter[] cmdParms);
        object ExecuteScalar(DbConnection connection, string sqlString, params DbParameter[] cmdParms);
        object ExecuteScalar(string sqlString, CommandType cmdType, params DbParameter[] cmdParms);

        /// <summary>
        /// 执行查询语句，返回SqlDataReader ( 注意：调用该方法后，一定要对SqlDataReader进行Close )
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <returns>SqlDataReader</returns>
        DbDataReader ExecuteReader(string sqlString);
        DbDataReader ExecuteReader(DbConnection connection, string sqlString);

        /// <summary>
        /// 执行查询语句，返回SqlDataReader 
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <param name="cmdParms">查询的参数</param>
        /// <returns>SqlDataReader</returns>
        DbDataReader ExecuteReader(string sqlString, params DbParameter[] cmdParms);
        DbDataReader ExecuteReader(DbConnection connection, string sqlString, params DbParameter[] cmdParms);
        DbDataReader ExecuteReader(string sqlString, CommandType cmdType, params DbParameter[] cmdParms);

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <returns>DataSet</returns>
        DataSet ExecuteDataSet(string sqlString);
        DataSet ExecuteDataSet(DbConnection connection, string sqlString);

        /// <summary>
        /// 执行查询语句，返回DataSet
        /// </summary>
        /// <param name="sqlString">查询语句</param>
        /// <param name="cmdParms">查询的参数列表</param>
        /// <returns>DataSet</returns>
        DataSet ExecuteDataSet(string sqlString, params DbParameter[] cmdParms);
        DataSet ExecuteDataSet(DbConnection connection, string sqlString, params DbParameter[] cmdParms);
        DataSet ExecuteDataSet(string sqlString, CommandType cmdType, params DbParameter[] cmdParms);

        /// <summary>
        /// 进行事务处理，返回总共受影响的行数
        /// </summary>
        /// <param name="cmdTypes">命令的类型集合</param>
        /// <param name="cmdTexts">命令的内容集合</param>
        /// <param name="parameterses">命令的参数集合</param>
        /// <returns></returns>
        int ExecuteSqls(List<CommandType> cmdTypes, List<string> cmdTexts, List<DbParameter[]> parameterses);
        int ExecuteSqls(DbConnection conn, List<CommandType> cmdTypes, List<string> cmdTexts, List<DbParameter[]> parameterses);
        int ExecuteSqls(List<string> sqlStrings, List<DbParameter[]> cmdParms);
        int ExecuteSqls(List<string> sqlStrings);

        #endregion
    }
}
