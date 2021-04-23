/**
* Title:菜单按钮管理操作
* Author: yueye
* Date: 2018/3/1 14:19:26
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
    public class MenuButtonDal : FormDal<MenuModel>
    {   
        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        public override List<MenuModel> FindList(Dictionary<string, string> queryParam)
        {
            string sql = @"select menu.* from Sys_Menu menu where 1=1 and F_DeleteFlag=0";
            sql += " and menu.F_Type =@F_Type and menu.F_Name like @F_Name and F_ParentId=@F_ParentId order by F_SortNum";
            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_Type",SqlDbType.NVarChar){Value =queryParam["type"]} , 
                new SqlParameter("@F_Name",SqlDbType.NVarChar){Value =string.Format("%{0}%",queryParam["keyword"]) } ,
                new SqlParameter("@F_ParentId",SqlDbType.NVarChar){Value =queryParam["pFid"] } 
            };
            List<MenuModel> menus = new List<MenuModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql, paramters))
            {
                while (dr.Read())
                {
                    MenuModel menu = ReaderToModel<MenuModel>(dr);

                    menus.Add(menu);
                }
            }
            return menus;
        }

        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public override List<MenuModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            string sql = @"select menu.* from Sys_Menu menu where 1=1 and F_DeleteFlag=0 ";
            sql += " and menu.F_Type =@F_Type and menu.F_Name like @F_Name and F_ParentId=@F_ParentId order by F_SortNum";
            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_Type",SqlDbType.NVarChar){Value =queryParam["type"]} , 
                new SqlParameter("@F_Name",SqlDbType.NVarChar){Value =queryParam["keyword"]} ,
                new SqlParameter("@F_ParentId",SqlDbType.NVarChar){Value =queryParam["pFid"] } 
            };

            string pageSql = DbHelper.GetPageSql(sql, pagination, "F_SortNum", paramters);
            List<MenuModel> menus = new List<MenuModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(pageSql, paramters))
            {
                while (dr.Read())
                {
                    MenuModel menu = ReaderToModel<MenuModel>(dr);

                    menus.Add(menu);
                }
            }
            return menus;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override MenuModel FindForm(string fId)
        {
            string sql = "select * from sys_Menu where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            MenuModel menu = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    menu = ReaderToModel<MenuModel>(dr);
                }
            }
            return menu;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(MenuModel model)
        {
            string sql = @"INSERT INTO Sys_Menu
				(F_Id,F_ParentId,F_Layers,F_Type,F_Code,F_Name,F_Icon,F_Location,F_Event,F_Url,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_Remark,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_ParentId,@F_Layers,@F_Type,@F_Code,@F_Name,@F_Icon,@F_Location,@F_Event,@F_Url,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_Remark,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_ParentId == null ? new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_ParentId", SqlDbType.VarChar, 36) { Value = model.F_ParentId },
				model.F_Layers == null ? new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_Layers", SqlDbType.VarChar, 200) { Value = model.F_Layers },
				model.F_Type == null ? new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = model.F_Type },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 72) { Value = model.F_Name },
				model.F_Icon == null ? new SqlParameter("@F_Icon", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Icon", SqlDbType.NVarChar, 72) { Value = model.F_Icon },
				model.F_Location == null ? new SqlParameter("@F_Location", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Location", SqlDbType.VarChar, 36) { Value = model.F_Location },
				model.F_Event == null ? new SqlParameter("@F_Event", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Event", SqlDbType.NVarChar, 72) { Value = model.F_Event },
				model.F_Url == null ? new SqlParameter("@F_Url", SqlDbType.NVarChar, 400) { Value = DBNull.Value } : new SqlParameter("@F_Url", SqlDbType.NVarChar, 400) { Value = model.F_Url },
				model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_Remark == null ? new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = DBNull.Value } : new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = model.F_Remark },
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
        public override bool EditForm(MenuModel model)
        {
            string sql = @"UPDATE Sys_Menu SET 
				F_Code=@F_Code,F_Name=@F_Name,F_Icon=@F_Icon,F_Location=@F_Location,F_Event=@F_Event,F_Url=@F_Url,F_SortNum=@F_SortNum,F_EnableDelete=@F_EnableDelete,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_Remark=@F_Remark,F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.NVarChar, 72) { Value = model.F_Name },
				model.F_Icon == null ? new SqlParameter("@F_Icon", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Icon", SqlDbType.NVarChar, 72) { Value = model.F_Icon },
				model.F_Location == null ? new SqlParameter("@F_Location", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Location", SqlDbType.VarChar, 36) { Value = model.F_Location },
				model.F_Event == null ? new SqlParameter("@F_Event", SqlDbType.NVarChar, 72) { Value = DBNull.Value } : new SqlParameter("@F_Event", SqlDbType.NVarChar, 72) { Value = model.F_Event },
				model.F_Url == null ? new SqlParameter("@F_Url", SqlDbType.NVarChar, 400) { Value = DBNull.Value } : new SqlParameter("@F_Url", SqlDbType.NVarChar, 400) { Value = model.F_Url },
				model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_Remark == null ? new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = DBNull.Value } : new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = model.F_Remark },
				model.F_LastModifyUserId == null ? new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = model.F_LastModifyUserId },
				model.F_LastModifyTime == null ? new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = model.F_LastModifyTime },
				model.F_DeleteUserId == null ? new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = model.F_DeleteUserId },
				model.F_DeleteTime == null ? new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = model.F_DeleteTime },
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id }
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
            string sql = "delete from Sys_Menu where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }
    }
}
