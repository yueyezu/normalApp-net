/**
* Title: 字典项的管理方法
* Author: yueye
* Date: 2018/1/8 13:59:49
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
    public class DictItemDal : TreeDal<DictItemModel>
    {
        public override string TableName
        {
            get { return "Sys_DictItem"; }
        }

        /// <summary>
        /// 获取所有的字典信息,根据字典的Id信息。
        /// 如果字典的Code信息不传，则认为查询全部的字典值信息。
        /// </summary>
        /// <param name="dictCode">字典的编码信息</param>
        /// <returns></returns>
        public List<DictItemModel> GetAllDictItem(string dictCode)
        {
            string sql = @"select dicitem.* from Sys_DictItem dicitem
                        inner join Sys_Dict dict 
                        on dicitem.F_DictId = dict.F_Id and dict.F_DeleteFlag=0 and dict.F_EnabledFlag=1
                        where dicitem.F_DeleteFlag=0 and dicitem.F_EnabledFlag=1";
            if (!string.IsNullOrEmpty(dictCode))
            {
                sql += " and dict.F_Code='" + dictCode + "'";
            }

            List<DictItemModel> dictitems = new List<DictItemModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                while (dr.Read())
                {
                    DictItemModel item = ReaderToModel<DictItemModel>(dr);

                    dictitems.Add(item);
                }
            }
            return dictitems;
        }

        /// <summary>
        /// 获取树结构的所有信息
        /// </summary>
        /// <param name="queryParam">查询的参数信息</param>
        /// <returns></returns>
        public override List<DictItemModel> FindTree(Dictionary<string, string> queryParam)
        {
            string sql = @"select dictItem.* from Sys_DictItem dictItem where F_DeleteFlag=0 order by F_SortNum";
            List<DictItemModel> dictItems = new List<DictItemModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                while (dr.Read())
                {
                    DictItemModel dictItem = ReaderToModel<DictItemModel>(dr);

                    dictItems.Add(dictItem);
                }
            }
            return dictItems;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override DictItemModel FindForm(string fId)
        {
            string sql = "select * from Sys_DictItem where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            DictItemModel dictItem = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    dictItem = ReaderToModel<DictItemModel>(dr);
                }
            }
            return dictItem;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(DictItemModel model)
        {
            string sql = @"INSERT INTO Sys_DictItem
				(F_Id,F_DictId,F_ParentId,F_Layers,F_Code,F_Name,F_IsDefault,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_Description,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_DictId,@F_ParentId,@F_Layers,@F_Code,@F_Name,@F_IsDefault,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_Description,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_DictId == null ? new SqlParameter("@F_DictId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DictId", SqlDbType.VarChar, 36) { Value = model.F_DictId },
                model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = model.F_Name },
				model.F_IsDefault == null ? new SqlParameter("@F_IsDefault", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_IsDefault", SqlDbType.Int, -1) { Value = model.F_IsDefault },
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
        public override bool EditForm(DictItemModel model)
        {
            string sql = @"UPDATE Sys_DictItem SET 
				F_DictId=@F_DictId,F_ParentId=@F_ParentId,F_Layers=@F_Layers,F_Code=@F_Code,F_Name=@F_Name,F_IsDefault=@F_IsDefault,F_SortNum=@F_SortNum,F_EnableDelete=@F_EnableDelete,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_Description=@F_Description,F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_DictId == null ? new SqlParameter("@F_DictId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DictId", SqlDbType.VarChar, 36) { Value = model.F_DictId },
                model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
			    model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 60) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 60) { Value = model.F_Name },
				model.F_IsDefault == null ? new SqlParameter("@F_IsDefault", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_IsDefault", SqlDbType.Int, -1) { Value = model.F_IsDefault },
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
        /// 根据Id删除相应的数据
        /// </summary>
        /// <param name="fId">要删除的表单ID信息</param>
        /// <returns></returns>
        public override bool DeleteForm(string fId)
        {
            string sql = @"delete Sys_DictItem where F_Layers like (
                           select top 1 t.F_Layers + '%' from Sys_DictItem t 
                           where t.F_Id = @F_Id)"; ;
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line >= 1;
        }

    }
}
