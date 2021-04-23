/**
* Title: 系统配置管理操作
* Author: zhangzhao
* Date: 2018/03/25
* Desp:
*/

using LT.Core;
using LT.Model.System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class ConfigsDal : BaseDal
    {
        /// <summary>
        /// 获取配置信息
        /// </summary>
        /// <returns></returns>
        public List<ConfigsModel> FindList()
        {
            string sql = @"select * from Sys_Configs order by F_SortNum";

            List<ConfigsModel> configs = new List<ConfigsModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                while (dr.Read())
                {
                    ConfigsModel config = ReaderToModel<ConfigsModel>(dr);

                    configs.Add(config);
                }
            }
            return configs;
        }

        /// <summary>
        /// 修改系统配置
        /// </summary>
        /// <param name="changes">修改的内容</param>
        /// <returns></returns>
        public bool SubmitForm(List<ConfigsModel> changes)
        {
            List<string> sqls = new List<string>();
            List<DbParameter[]> parameterList = new List<DbParameter[]>();

            foreach (ConfigsModel config in changes)
            {
                string sql = "update Sys_Configs set F_Value=@F_Value,F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime where F_Id=@F_Id";
                DbParameter[] parameters = new DbParameter[]{
				    new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = config.F_Id },
				    new SqlParameter("@F_Value", SqlDbType.VarChar, 200) { Value = config.F_Value },
				    new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = config.F_LastModifyUserId },
				    new SqlParameter("@F_LastModifyTime",  SqlDbType.DateTime, 8) { Value = config.F_LastModifyTime },
                };
                sqls.Add(sql);
                parameterList.Add(parameters);
            }

            int result = DbHelper.ExecuteSqls(sqls,parameterList);

            return result == changes.Count;
        }
    }
}
