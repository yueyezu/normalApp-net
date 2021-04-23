/**
* Title: 角色管理的相关操作
* Author: yueye
* Date: 2018/1/8 10:18:11
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
    public class RoleDal : FormDal<RoleModel>
    {
        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        public override List<RoleModel> FindList(Dictionary<string, string> queryParam)
        {
            string sql = @"select role.* from Sys_Role role where F_DeleteFlag=@F_DeleteFlag and F_Type=@F_Type and (F_Name like  @F_Name or F_Code like  @F_Code) order by F_SortNum";
            List<DbParameter> paramters = new List<DbParameter>();
            paramters.Add(new SqlParameter("@F_DeleteFlag", SqlDbType.Int) { Value = queryParam["fDeleteFlag"] });
            paramters.Add(new SqlParameter("@F_Name", SqlDbType.NVarChar)
            {
                Value = queryParam.ContainsKey("keyword") ? string.Format("%{0}%", queryParam["keyword"]) : "%%"
            });
            paramters.Add(new SqlParameter("@F_Code", SqlDbType.NVarChar)
            {
                Value = queryParam.ContainsKey("keyword") ? string.Format("%{0}%", queryParam["keyword"]) : "%%"

            });
            paramters.Add(new SqlParameter("@F_Type", SqlDbType.Int) { Value = queryParam["fType"] });
            List<RoleModel> roles = new List<RoleModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    RoleModel role = ReaderToModel<RoleModel>(dr);

                    roles.Add(role);
                }
            }
            return roles;
        }

        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public override List<RoleModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            string sql = @"select role.* from Sys_Role role where F_DeleteFlag=@F_DeleteFlag and F_Type=@F_Type and (F_Name like  @F_Name or F_Code like  @F_Code)";
            List<DbParameter> paramters = new List<DbParameter>();
            paramters.Add(new SqlParameter("@F_DeleteFlag", SqlDbType.Int) { Value = queryParam["fDeleteFlag"] });
            paramters.Add(new SqlParameter("@F_Name", SqlDbType.NVarChar)
            {
                Value = queryParam.ContainsKey("keyword") ? string.Format("%{0}%", queryParam["keyword"]) : "%%"
            });
            paramters.Add(new SqlParameter("@F_Code", SqlDbType.NVarChar)
            {
                Value = queryParam.ContainsKey("keyword") ? string.Format("%{0}%", queryParam["keyword"]) : "%%"

            }); paramters.Add(new SqlParameter("@F_Type", SqlDbType.Int) { Value = queryParam["fType"] });
            string pageSql = DbHelper.GetPageSql(sql, pagination, "F_SortNum", paramters.ToArray());
            List<RoleModel> roles = new List<RoleModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(pageSql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    RoleModel role = ReaderToModel<RoleModel>(dr);
                    roles.Add(role);
                }
            }
            return roles;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override RoleModel FindForm(string fId)
        {
            string sql = "select * from sys_Role where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            RoleModel role = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    role = ReaderToModel<RoleModel>(dr);
                }
            }
            return role;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(RoleModel model)
        {
            string sql = @"INSERT INTO Sys_Role
				(F_Id,F_Code,F_Name,F_Type,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_Remark,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_Code,@F_Name,@F_Type,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_Remark,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.VarChar, 36) { Value = model.F_Name },
                model.F_Type == null ? new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = model.F_Type },
                model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
                //通过系统添加的都是认为可删除的
				new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = 1 },  
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
        public override bool EditForm(RoleModel model)
        {
            string sql = @"UPDATE Sys_Role SET 
				F_Code=@F_Code,F_Name=@F_Name,F_Type=@F_Type,F_SortNum=@F_SortNum,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_Remark=@F_Remark,
                F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_Code == null ? new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Code", SqlDbType.VarChar, 36) { Value = model.F_Code },
				model.F_Name == null ? new SqlParameter("@F_Name", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Name", SqlDbType.VarChar, 36) { Value = model.F_Name },
				model.F_Type == null ? new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_Type", SqlDbType.Int, -1) { Value = model.F_Type },
                model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
                //这里不需要操作是否运行删除字段，只有直接动数据库时才可以操作。
                //model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
				model.F_EnabledFlag == null ? new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnabledFlag", SqlDbType.Int, -1) { Value = model.F_EnabledFlag },
				model.F_DeleteFlag == null ? new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_DeleteFlag", SqlDbType.Int, -1) { Value = model.F_DeleteFlag },
				model.F_Remark == null ? new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = DBNull.Value } : new SqlParameter("@F_Remark", SqlDbType.NVarChar, 400) { Value = model.F_Remark },
				model.F_LastModifyUserId == null ? new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyUserId", SqlDbType.VarChar, 36) { Value = model.F_LastModifyUserId },
				model.F_LastModifyTime == null ? new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastModifyTime", SqlDbType.DateTime, 8) { Value = model.F_LastModifyTime },
				model.F_DeleteUserId == null ? new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DeleteUserId", SqlDbType.VarChar, 36) { Value = model.F_DeleteUserId },
				model.F_DeleteTime == null ? new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_DeleteTime", SqlDbType.DateTime, 8) { Value = model.F_DeleteTime },
            };
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 根据Id删除相应的数据
        /// </summary>
        /// <param name="fId">要删除的表单ID信息</param>
        /// <returns></returns>
        public override bool DeleteForm(string fId)
        {
            string sql = "update Sys_Role set F_DeleteFlag=1 where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 进行角色添加时检测角色是否已存在使用。
        /// </summary>
        /// <param name="fCode">角色编号</param>
        /// <param name="fId">角色的ID</param>
        /// <returns>
        /// 如果该角色已存在，则返回true
        /// 如果角色不存在，则返回false
        /// </returns>
        public bool IsExsitRoleCode(string fCode, string fId)
        {
            string sql = "select * from sys_Role where F_Code=@F_Code and F_Id!=@F_Id";

            DbParameter[] parameters = new DbParameter[]{
                new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId },
				new SqlParameter("@F_Code", SqlDbType.VarChar){ Value = fCode }
			};

            object role = DbHelper.ExecuteScalar(sql, parameters);
            return role != null;
        }

        /// <summary>
        /// 获取角色的权限信息   
        /// </summary>
        /// <param name="roleId">角色Id</param>
        /// <returns></returns>
        public List<MenuModel> FindRoleMenuTree(string roleId)
        {
            string sql = @"select menu.*, ISNULL(rolemenu.F_Id, -1) as hasMenu
                    from Sys_Menu menu 
                    left join Sys_RoleMenu rolemenu 
                    on menu.F_Id = rolemenu.F_MenuId and  rolemenu.F_RoleId = @F_RoleId
                    where menu.F_EnabledFlag=1 and menu.F_DeleteFlag=0";
            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_RoleId",SqlDbType.NVarChar){Value = roleId}, 
            };

            //这里以menu的实体类传递角色赋予的权限信息，其中使用remark标识是否已经赋给了该角色
            List<MenuModel> menus = new List<MenuModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, paramters))
            {
                while (dr.Read())
                {
                    MenuModel menu = ReaderToModel<MenuModel>(dr);
                    menu.F_Remark = dr["hasMenu"].ToString();
                    menus.Add(menu);
                }
            }
            return menus;
        }

        /// <summary>
        /// 添加角色的权限信息
        /// </summary>
        /// <param name="roleMenus">新设置的权限的信息</param>
        /// <param name="roleId">角色的编号</param>
        /// <returns></returns>
        public bool AddRoleMenu(List<RoleMenuModel> roleMenus, string roleId)
        {
            List<string> addSqls = new List<string>();
            List<DbParameter[]> addParams = new List<DbParameter[]>();
            string delSql = "delete Sys_RoleMenu where F_RoleId=@F_RoleId";
            DbParameter[] delParams = new DbParameter[] { 
				new SqlParameter("@F_RoleId", SqlDbType.VarChar, 36){ Value = roleId },
            };
            addSqls.Add(delSql);
            addParams.Add(delParams);

            foreach (RoleMenuModel userrole in roleMenus)
            {
                string addSql = "insert into Sys_RoleMenu (F_Id,F_MenuId,F_RoleId) values(@F_Id,@F_MenuId,@F_RoleId)";
                DbParameter[] addParam = new DbParameter[]{
				    new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = userrole.F_Id },
				    new SqlParameter("@F_MenuId", SqlDbType.VarChar, 36) { Value = userrole.F_MenuId },
				    new SqlParameter("@F_RoleId", SqlDbType.VarChar, 36) { Value = userrole.F_RoleId },
			    };

                addSqls.Add(addSql);
                addParams.Add(addParam);
            }

            int line = DbHelper.ExecuteSqls(addSqls, addParams);

            return line >= roleMenus.Count;
        }
    }
}
