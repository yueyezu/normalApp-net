/**
* Title: 组织架构的操作方法
* Author: zhangzhao
* Date: 2018/3/8 
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
    public class OrganizeDal : TreeDal<OrganizeModel>
    {
        public override string TableName
        {
            get { return "Sys_Organize"; }
        }

        /// <summary>
        /// 获取树结构的所有信息
        /// </summary>
        /// <param name="queryParam">查询的参数信息</param>
        /// <returns></returns>
        public override List<OrganizeModel> FindTree(Dictionary<string, string> queryParam)
        {
            string sql = @"select * from Sys_Organize where F_DeleteFlag=0 ";
            DbParameter[] parameters = null;
            if (queryParam.ContainsKey("fType"))
            {
                sql += "and F_Type=@F_Type";
                parameters = new DbParameter[]{
				    new SqlParameter("@F_Type", SqlDbType.VarChar){ Value = queryParam["fType"] }
			    };
            }
            sql += " order by F_SortNum";

            List<OrganizeModel> organizes = new List<OrganizeModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                while (dr.Read())
                {
                    OrganizeModel organize = ReaderToModel<OrganizeModel>(dr);

                    organizes.Add(organize);
                }
            }
            return organizes;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override OrganizeModel FindForm(string fId)
        {
            string sql = "select * from Sys_Organize where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            OrganizeModel organize = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    organize = ReaderToModel<OrganizeModel>(dr);
                }
            }
            return organize;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(OrganizeModel model)
        {
            string sql = @"INSERT INTO Sys_Organize
				(F_Id,F_ParentId,F_Layers,F_Type,F_Code,F_Name,F_ShortName,F_ManagerId,F_Phone,F_Address,F_Description,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_ParentId,@F_Layers,@F_Type,@F_Code,@F_Name,@F_ShortName,@F_ManagerId,@F_Phone,@F_Address,@F_Description,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Type == 0 ? new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = model.F_Type },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 36) { Value = model.F_Name },
				model.F_ShortName == null ? new SqlParameter("@F_ShortName", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ShortName", SqlDbType.NVarChar, 36) { Value = model.F_ShortName },
                model.F_ManagerId == null ? new SqlParameter("@F_ManagerId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ManagerId", SqlDbType.NVarChar, 36) { Value = model.F_ManagerId },
                model.F_Phone == null ? new SqlParameter("@F_Phone", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Phone", SqlDbType.NVarChar, 36) { Value = model.F_Phone },
                model.F_Address == null ? new SqlParameter("@F_Address", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Address", SqlDbType.NVarChar, 200) { Value = model.F_Address },
                model.F_Description == null ? new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = model.F_Description },
                model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
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
        public override bool EditForm(OrganizeModel model)
        {
            string sql = @"UPDATE Sys_Organize SET 
				F_ParentId=@F_ParentId,F_Layers=@F_Layers,F_Type=@F_Type,F_Code=@F_Code,F_Name=@F_Name,F_ShortName=@F_ShortName,F_ManagerId=@F_ManagerId,F_Phone=@F_Phone,F_Address=@F_Address,F_Description=@F_Description,F_SortNum=@F_SortNum,F_EnableDelete=@F_EnableDelete,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Type == null ? new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = model.F_Type },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 36) { Value = model.F_Name },
				model.F_ShortName == null ? new SqlParameter("@F_ShortName", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ShortName", SqlDbType.NVarChar, 36) { Value = model.F_ShortName },
                model.F_ManagerId == null ? new SqlParameter("@F_ManagerId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ManagerId", SqlDbType.NVarChar, 36) { Value = model.F_ManagerId },
                model.F_Phone == null ? new SqlParameter("@F_Phone", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Phone", SqlDbType.NVarChar, 36) { Value = model.F_Phone },
                model.F_Address == null ? new SqlParameter("@F_Address", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Address", SqlDbType.NVarChar, 200) { Value = model.F_Address },
                model.F_Description == null ? new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Description", SqlDbType.NVarChar, 200) { Value = model.F_Description },
                model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_LastModifyUserId == null ? new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = model.F_LastModifyUserId },
				model.F_LastModifyTime == null ? new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = model.F_LastModifyTime },
				model.F_DeleteUserId == null ? new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = model.F_DeleteUserId },
				model.F_DeleteTime == null ? new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = model.F_DeleteTime },
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line > 0;
        }

        /// <summary>
        /// 根据Id删除相应的数据
        /// </summary>
        /// <param name="fId">要删除的表单ID信息</param>
        /// <returns></returns>
        public override bool DeleteForm(string fId)
        {
            string sql = "update Sys_Organize set F_DeleteFlag=1 where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line >= 1;
        }
    }
}
