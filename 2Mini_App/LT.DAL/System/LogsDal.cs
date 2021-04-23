/**
* Title: 日志的管理方法
* Author: zhangzhao
* Date: 2018/3/20
* Desp:
*/

using LT.Core;
using LT.Model.System;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class LogsDal : BaseDal
    {
        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam">查询条件</param>
        /// <param name="pagination">分页信息</param>
        /// <returns></returns>
        public List<LogsModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            string sql = @"select logs.* from Sys_Logs logs where 1=1 ";
            List<DbParameter> paramters = new List<DbParameter>();
            if (!string.IsNullOrEmpty(queryParam["system"]))
            {
                sql += " and F_System=@F_System";
                paramters.Add(new SqlParameter("@F_System", SqlDbType.NVarChar) { Value = queryParam["system"] });
            }

            if (!string.IsNullOrEmpty(queryParam["startTime"]))
            {
                sql += " and F_CreateTime > @startTime";
                paramters.Add(new SqlParameter("@startTime", SqlDbType.NVarChar) { Value = queryParam["startTime"] });
            }
            if (!string.IsNullOrEmpty(queryParam["endTime"]))
            {
                sql += " and F_CreateTime < @endTime";
                paramters.Add(new SqlParameter("@endTime", SqlDbType.NVarChar) { Value = queryParam["endTime"] });
            }

            if (!string.IsNullOrEmpty(queryParam["keyword"]))
            {
                sql += " and (F_OptContent like @keyword or F_Module like @keyword )";
                paramters.Add(new SqlParameter("@keyword", SqlDbType.NVarChar)
                {
                    Value = string.Format("%{0}%", queryParam["keyword"])
                });
            }

            string pageSql = DbHelper.GetPageSql(sql, pagination, "F_CreateTime", paramters.ToArray());
            List<LogsModel> logs = new List<LogsModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(pageSql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    LogsModel log = ReaderToModel<LogsModel>(dr);
                    logs.Add(log);
                }
            }
            return logs;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public bool AddForm(LogsModel model)
        {
            string sql = @"INSERT INTO Sys_Logs
				(F_Id,F_System,F_Module,F_OptType,F_OptContent,F_IPAddress,F_IPCity,F_CreateUserId,F_CreateTime) 
				VALUES(@F_Id,@F_System,@F_Module,@F_OptType,@F_OptContent,@F_IPAddress,@F_IPCity,@F_CreateUserId,@F_CreateTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_System == null ? new SqlParameter("@F_System", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_System", SqlDbType.VarChar, 36) { Value = model.F_System },
				model.F_Module == null ? new SqlParameter("@F_Module", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Module", SqlDbType.VarChar, 36) { Value = model.F_Module },
				model.F_OptType == null ? new SqlParameter("@F_OptType", SqlDbType.VarChar, 10) { Value = DBNull.Value } : new SqlParameter("@F_OptType", SqlDbType.VarChar, 10) { Value = model.F_OptType },
				model.F_OptContent == null ? new SqlParameter("@F_OptContent", SqlDbType.VarChar, 1000) { Value = DBNull.Value } : new SqlParameter("@F_OptContent", SqlDbType.VarChar,1000) { Value = model.F_OptContent },
				model.F_IPAddress == null ? new SqlParameter("@F_IPAddress", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_IPAddress", SqlDbType.NVarChar, 36) { Value = model.F_IPAddress },
				model.F_IPCity == null ? new SqlParameter("@F_IPCity", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_IPCity", SqlDbType.NVarChar, 36) { Value = model.F_IPCity },
				model.F_CreateUserId == null ? new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = model.F_CreateUserId },
				model.F_CreateTime == null ? new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = model.F_CreateTime },
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 批量日志写入到数据库的方法
        /// </summary>
        /// <param name="modelList">日志列表</param>
        /// <returns></returns>
        public bool AddFormList(List<LogsModel> modelList)
        {
            List<string> sqls = new List<string>();
            List<DbParameter[]> parameterList = new List<DbParameter[]>();

            foreach (LogsModel model in modelList)
            {
                string sql = @"INSERT INTO Sys_Logs
				(F_Id,F_System,F_Module,F_OptType,F_OptContent,F_IPAddress,F_IPCity,F_CreateUserId,F_CreateTime) 
				VALUES(@F_Id,@F_System,@F_Module,@F_OptType,@F_OptContent,@F_IPAddress,@F_IPCity,@F_CreateUserId,@F_CreateTime)";
                DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				    model.F_System == null ? new SqlParameter("@F_System", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_System", SqlDbType.VarChar, 36) { Value = model.F_System },
				    model.F_Module == null ? new SqlParameter("@F_Module", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Module", SqlDbType.VarChar, 36) { Value = model.F_Module },
				    model.F_OptType == null ? new SqlParameter("@F_OptType", SqlDbType.VarChar, 10) { Value = DBNull.Value } : new SqlParameter("@F_OptType", SqlDbType.VarChar, 10) { Value = model.F_OptType },
				    model.F_OptContent == null ? new SqlParameter("@F_OptContent", SqlDbType.VarChar, 1000) { Value = DBNull.Value } : new SqlParameter("@F_OptContent", SqlDbType.VarChar,1000) { Value = model.F_OptContent },
				    model.F_IPAddress == null ? new SqlParameter("@F_IPAddress", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_IPAddress", SqlDbType.NVarChar, 36) { Value = model.F_IPAddress },
				    model.F_IPCity == null ? new SqlParameter("@F_IPCity", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_IPCity", SqlDbType.NVarChar, 36) { Value = model.F_IPCity },
				    model.F_CreateUserId == null ? new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = model.F_CreateUserId },
				    model.F_CreateTime == null ? new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = model.F_CreateTime },
			    };
                sqls.Add(sql);
                parameterList.Add(parameters);
            }

            int line = DbHelper.ExecuteSqls(sqls, parameterList);
            return line == modelList.Count;
        }

        /// <summary>
        /// 根据Id删除相应的数据
        /// 批量删除
        /// </summary>
        /// <param name="fIds">要删除的表单ID信息</param>
        /// <returns></returns>
        public bool DeleteForms(string fIds)
        {
            string sql = "delete from Sys_Logs where F_Id in (" + fIds + ")";
            int line = DbHelper.ExecuteNonQuery(sql);
            return line >= 0;
        }

        /// <summary>
        /// 清空日志表中所有数据
        /// </summary>
        /// <returns></returns>
        public bool ClearLogs()
        {
            string sql = "delete from Sys_Logs";
            int line = DbHelper.ExecuteNonQuery(sql);
            return line >= 0;
        }

        /// <summary>
        /// 获取日志表单信息
        /// </summary>
        /// <param name="fId">日志Id</param>
        /// <returns></returns>
        public LogsModel FindForm(string fId)
        {
            string sql = "select * from sys_Logs where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            LogsModel log = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    log = ReaderToModel<LogsModel>(dr);
                }
            }
            return log;
        }
    }
}
