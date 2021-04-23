/**
* Title: 字典项的管理功能
* Author: yueye
* Date: 2018/1/8 13:51:08
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.Model.System;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class DictDal : TreeDal<DictModel>
    {
        public override string TableName
        {
            get { return "Sys_Dict"; }
        }

        /// <summary>
        /// 获取所有的字典信息
        /// </summary>
        /// <returns></returns>
        public List<DictModel> GetAllDict()
        {
            string sql = @"select * from Sys_Dict dic where F_DeleteFlag=0 and F_EnabledFlag=1";
            List<DictModel> dicts = new List<DictModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                while (dr.Read())
                {
                    DictModel dict = ReaderToModel<DictModel>(dr);

                    dicts.Add(dict);
                }
            }
            return dicts;
        }

        /// <summary>
        /// 获取树结构的所有信息
        /// </summary>
        /// <param name="queryParam">查询的参数信息</param>
        /// <returns></returns>
        public override List<DictModel> FindTree(Dictionary<string, string> queryParam)
        {
            string sql = @"select dict.* from Sys_Dict dict where 1=1 and F_DeleteFlag=0 order by F_SortNum";
            List<DictModel> dicts = new List<DictModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                while (dr.Read())
                {
                    DictModel dict = ReaderToModel<DictModel>(dr);

                    dicts.Add(dict);
                }
            }
            return dicts;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override DictModel FindForm(string fId)
        {
            string sql = "select * from Sys_Dict where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            DictModel dict = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    dict = ReaderToModel<DictModel>(dr);
                }
            }
            return dict;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(DictModel model)
        {
            string sql = @"INSERT INTO Sys_Dict
				(F_Id,F_ParentId,F_Layers,F_Code,F_Name,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_Description,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_ParentId,@F_Layers,@F_Code,@F_Name,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_Description,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = model.F_Name },
				model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_Description == null ? new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = model.F_Description },
				model.F_CreateUserId == null ? new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_CreateUserId", SqlDbType.VarChar, 36) { Value = model.F_CreateUserId },
				model.F_CreateTime == null ? new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_CreateTime", SqlDbType.DateTime, 8) { Value = model.F_CreateTime },
				model.F_LastModifyUserId == null ? new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = model.F_LastModifyUserId },
				model.F_LastModifyTime == null ? new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = model.F_LastModifyTime },
				model.F_DeleteUserId == null ? new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = model.F_DeleteUserId },
				model.F_DeleteTime == null ? new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = model.F_DeleteTime },
			};

            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 修改表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool EditForm(DictModel model)
        {
            string sql = @"UPDATE Sys_Dict SET 
				F_ParentId=@F_ParentId,F_Layers=@F_Layers,F_Code=@F_Code,F_Name=@F_Name,F_SortNum=@F_SortNum,F_EnableDelete=@F_EnableDelete,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_Description=@F_Description,F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = model.F_Name },
				model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_Description == null ? new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = model.F_Description },
				model.F_LastModifyUserId == null ? new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = model.F_LastModifyUserId },
				model.F_LastModifyTime == null ? new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = model.F_LastModifyTime },
				model.F_DeleteUserId == null ? new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = model.F_DeleteUserId },
				model.F_DeleteTime == null ? new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = model.F_DeleteTime },
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line > 0;
        }

        /// <summary>
        /// 检测当前字典节点是否存在下级以及字典值信息
        /// </summary>
        /// <param name="fId">字典ID</param>
        /// <returns></returns>
        public override bool IsExistChild(string fId)
        {
            string sql = String.Format(@"select sum(a) from (
                                        select COUNT(*) a from Sys_Dict t where t.F_ParentId = '{0}'
                                        union all
                                        select COUNT(*) b from Sys_DictItem ti where ti.F_DictId = '{0}'
                                        )t", fId);
            int num = DbHelper.ExecuteScalar(sql).ToInt();

            return num >= 1;
        }

        /// <summary>
        /// 根据Id删除相应的数据
        /// </summary>
        /// <param name="fId">要删除的表单ID信息</param>
        /// <returns></returns>
        public override bool DeleteForm(string fId)
        {
            //            string sql = @"delete Sys_Dict where F_Layers like (
            //                           select top 1 t.F_Layers + '%' from Sys_Dict t 
            //                           where t.F_Id = @F_Id)";
            string sql = "delete from Sys_Dict where F_Id = @F_Id";

            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line >= 1;
        }

        /// <summary>
        /// 进行字典添加时检测字典编号是否已存在使用。
        /// </summary>
        /// <param name="fCode">字典编号</param>
        /// <param name="fId">字典的ID</param>
        /// <returns>
        /// 如果该字典已存在，则返回true
        /// 如果字典不存在，则返回false
        /// </returns>
        public bool IsExsitDictCode(string fCode, string fId)
        {
            string sql = "select * from Sys_Dict where F_Code=@F_Code and F_Id!=@F_Id";

            DbParameter[] parameters = new DbParameter[]{
                new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId },
				new SqlParameter("@F_Code", SqlDbType.VarChar){ Value = fCode }
			};

            object role = DbHelper.ExecuteScalar(sql, parameters);
            return role != null;
        }
    }
}
