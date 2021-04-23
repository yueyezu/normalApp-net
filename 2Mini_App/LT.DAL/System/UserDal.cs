/**********
 * 创建人：yueye
 * 时间：2016-01-28 20:20:06
 * 作用：用户角色权限控制管理的类，包括登录与密码修改
 * ********/

using LT.Core;
using LT.Model.System;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class UserDal : FormDal<UserModel>
    {
        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        public override List<UserModel> FindList(Dictionary<string, string> queryParam)
        {
            string keyword = "";
            if (queryParam.ContainsKey("keyword"))
                keyword = queryParam["keyword"];

            string sql = @"select users.* from Sys_User users where F_DeleteFlag=@F_DeleteFlag and (users.F_RealName like @F_RealName or users.F_Account like @F_Account or users.F_NickName like @F_NickName) order by F_SortNum";
            List<DbParameter> paramters = new List<DbParameter>();
            paramters.Add(new SqlParameter("@F_RealName", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_Account", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_NickName", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_DeleteFlag", SqlDbType.Int) { Value = queryParam["fDeleteFlag"] });

            List<UserModel> users = new List<UserModel>();

            using (DbDataReader dr = DbHelper.ExecuteReader(sql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    UserModel user = ReaderToModel<UserModel>(dr);

                    users.Add(user);
                }
            }
            return users;
        }
        /// <summary>
        /// 获取表格所有信息
        /// </summary>
        /// <param name="queryParam"></param>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public override List<UserModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            string keyword = "";
            if (queryParam.ContainsKey("keyword"))
                keyword = queryParam["keyword"];

            string sql = @"select users.* from Sys_User users where F_DeleteFlag=@F_DeleteFlag and (users.F_RealName like @F_RealName or users.F_Account like @F_Account or users.F_NickName like @F_NickName)";
            List<DbParameter> paramters = new List<DbParameter>();
            paramters.Add(new SqlParameter("@F_RealName", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_Account", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_NickName", SqlDbType.NVarChar) { Value = string.Format("%{0}%", keyword) });
            paramters.Add(new SqlParameter("@F_DeleteFlag", SqlDbType.Int) { Value = queryParam["fDeleteFlag"] });

            string pageSql = DbHelper.GetPageSql(sql, pagination, "F_SortNum", paramters.ToArray());
            List<UserModel> users = new List<UserModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(pageSql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    UserModel user = ReaderToModel<UserModel>(dr);
                    users.Add(user);
                }
            }
            return users;
        }

        /// <summary>
        /// 根据Id获取表单数据
        /// </summary>
        /// <param name="fId">要查询的表单数据的ID信息。</param>
        /// <returns></returns>
        public override UserModel FindForm(string fId)
        {
            string sql = "select * from sys_User where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            UserModel user = null;
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    user = ReaderToModel<UserModel>(dr);
                }
            }
            return user;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public override bool AddForm(UserModel model)
        {
            string sql = @"INSERT INTO Sys_User
				(F_Id,F_Account,F_RealName,F_NickName,F_HeadIcon,F_Sex,F_WeChat,F_Phone,F_Email,F_Birthday,F_OrganizeId,F_DepartmentId,F_RoleId,F_IsAdmin,F_SortNum,F_EnableDelete,F_EnabledFlag,F_DeleteFlag,F_Remark,F_CreateUserId,F_CreateTime,F_LastModifyUserId,F_LastModifyTime,F_DeleteUserId,F_DeleteTime) 
				VALUES(@F_Id,@F_Account,@F_RealName,@F_NickName,@F_HeadIcon,@F_Sex,@F_WeChat,@F_Phone,@F_Email,@F_Birthday,@F_OrganizeId,@F_DepartmentId,@F_RoleId,@F_IsAdmin,@F_SortNum,@F_EnableDelete,@F_EnabledFlag,@F_DeleteFlag,@F_Remark,@F_CreateUserId,@F_CreateTime,@F_LastModifyUserId,@F_LastModifyTime,@F_DeleteUserId,@F_DeleteTime)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_Account == null ? new SqlParameter("@F_Account", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Account", SqlDbType.VarChar, 36) { Value = model.F_Account },
				model.F_RealName == null ? new SqlParameter("@F_RealName", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_RealName", SqlDbType.VarChar, 36) { Value = model.F_RealName },
				model.F_NickName == null ? new SqlParameter("@F_NickName", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_NickName", SqlDbType.VarChar, 36) { Value = model.F_NickName },
				model.F_HeadIcon == null ? new SqlParameter("@F_HeadIcon", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_HeadIcon", SqlDbType.VarChar,200) { Value = model.F_HeadIcon },
				model.F_Sex == null ? new SqlParameter("@F_Sex", SqlDbType.NVarChar, 10) { Value = DBNull.Value } : new SqlParameter("@F_Sex", SqlDbType.NVarChar, 10) { Value = model.F_Sex },
				model.F_WeChat == null ? new SqlParameter("@F_WeChat", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_WeChat", SqlDbType.NVarChar, 36) { Value = model.F_WeChat },
				model.F_Phone == null ? new SqlParameter("@F_Phone", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Phone", SqlDbType.VarChar, 36) { Value = model.F_Phone },
				model.F_Email == null ? new SqlParameter("@F_Email", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Email", SqlDbType.NVarChar, 36) { Value = model.F_Email },
				model.F_Birthday == null ? new SqlParameter("@F_Birthday", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_Birthday", SqlDbType.DateTime, 8) { Value = model.F_Birthday },
				model.F_OrganizeId == null ? new SqlParameter("@F_OrganizeId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_OrganizeId", SqlDbType.NVarChar, 36) { Value = model.F_OrganizeId },
                model.F_DepartmentId == null ? new SqlParameter("@F_DepartmentId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DepartmentId", SqlDbType.NVarChar, 36) { Value = model.F_DepartmentId },
                model.F_RoleId == null ? new SqlParameter("@F_RoleId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_RoleId", SqlDbType.NVarChar, 36) { Value = model.F_RoleId },
                model.F_IsAdmin == null ? new SqlParameter("@F_IsAdmin", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_IsAdmin",SqlDbType.Int, -1) { Value = model.F_IsAdmin },
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
        public override bool EditForm(UserModel model)
        {
            string sql = @"UPDATE Sys_User SET 
				F_Account=@F_Account,F_RealName=@F_RealName,F_NickName=@F_NickName,F_HeadIcon=@F_HeadIcon,F_Sex=@F_Sex,F_WeChat=@F_WeChat,F_Phone=@F_Phone,F_Email=@F_Email,F_Birthday=@F_Birthday,F_OrganizeId=@F_OrganizeId,
                F_DepartmentId=@F_DepartmentId,F_RoleId=@F_RoleId,F_IsAdmin=@F_IsAdmin,F_SortNum=@F_SortNum,F_EnableDelete=@F_EnableDelete,F_EnabledFlag=@F_EnabledFlag,F_DeleteFlag=@F_DeleteFlag,F_Remark=@F_Remark,
                F_LastModifyUserId=@F_LastModifyUserId,F_LastModifyTime=@F_LastModifyTime,F_DeleteUserId=@F_DeleteUserId,F_DeleteTime=@F_DeleteTime
				WHERE F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_Account == null ? new SqlParameter("@F_Account", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Account", SqlDbType.VarChar, 36) { Value = model.F_Account },
				model.F_RealName == null ? new SqlParameter("@F_RealName", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_RealName", SqlDbType.VarChar, 36) { Value = model.F_RealName },
				model.F_NickName == null ? new SqlParameter("@F_NickName", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_NickName", SqlDbType.VarChar, 36) { Value = model.F_NickName },
				model.F_HeadIcon == null ? new SqlParameter("@F_HeadIcon", SqlDbType.VarChar, 200) { Value = DBNull.Value } : new SqlParameter("@F_HeadIcon", SqlDbType.VarChar,200) { Value = model.F_HeadIcon },
				model.F_Sex == null ? new SqlParameter("@F_Sex", SqlDbType.NVarChar, 10) { Value = DBNull.Value } : new SqlParameter("@F_Sex", SqlDbType.NVarChar, 10) { Value = model.F_Sex },
				model.F_WeChat == null ? new SqlParameter("@F_WeChat", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_WeChat", SqlDbType.NVarChar, 36) { Value = model.F_WeChat },
				model.F_Phone == null ? new SqlParameter("@F_Phone", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Phone", SqlDbType.VarChar, 36) { Value = model.F_Phone },
				model.F_Email == null ? new SqlParameter("@F_Email", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Email", SqlDbType.NVarChar, 36) { Value = model.F_Email },
				model.F_Birthday == null ? new SqlParameter("@F_Birthday", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_Birthday", SqlDbType.DateTime, 8) { Value = model.F_Birthday },
				model.F_OrganizeId == null ? new SqlParameter("@F_OrganizeId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_OrganizeId", SqlDbType.NVarChar, 36) { Value = model.F_OrganizeId },
                model.F_DepartmentId == null ? new SqlParameter("@F_DepartmentId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_DepartmentId", SqlDbType.NVarChar, 36) { Value = model.F_DepartmentId },
                model.F_RoleId == null ? new SqlParameter("@F_RoleId", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_RoleId", SqlDbType.NVarChar, 36) { Value = model.F_RoleId },
                model.F_IsAdmin == null ? new SqlParameter("@F_IsAdmin", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_IsAdmin",SqlDbType.Int, -1) { Value = model.F_IsAdmin },
                model.F_SortNum == null ? new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_SortNum", SqlDbType.Int, -1) { Value = model.F_SortNum },
				model.F_EnableDelete == null ? new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableDelete", SqlDbType.Int, -1) { Value = model.F_EnableDelete },
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
            string sql = "update Sys_User set F_DeleteFlag=1 where F_Id=@F_Id";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId }
			};
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 进行用户添加时检测用户是否已存在使用。
        /// </summary>
        /// <param name="fAccount">用户账号</param>
        /// <param name="fId">用户的ID</param>
        /// <returns>
        /// 如果该用户已存在，则返回true
        /// 如果用户账号不存在，则返回false
        /// </returns>
        public bool IsExsitUser(string fAccount, string fId)
        {
            string sql = "select * from sys_User where F_Account=@F_Account and F_Id!=@F_Id";

            DbParameter[] parameters = new DbParameter[]{
                new SqlParameter("@F_Id", SqlDbType.VarChar){ Value = fId },
				new SqlParameter("@F_Account", SqlDbType.VarChar){ Value = fAccount }
			};

            object user = DbHelper.ExecuteScalar(sql, parameters);
            return user != null;
        }

        /// <summary>
        /// 获取用户的信息，根据用户的帐号信息
        /// </summary>
        /// <param name="fAccount">用户账号</param>
        /// <returns>用户信息</returns>
        public UserModel GetUserByAccount(string fAccount)
        {
            DapperHelper dapperHelper = DapperFactory.GetDapperHelper();

            UserModel user = null;
            string sql = "select * from Sys_User u where u.F_Account=@Account";
            //TODO 想切换为dapper，暂时预留。
            //Dictionary<string, string> dics = new Dictionary<string, string>();
            //dics.Add("@Account", fAccount);
            //user = dapperHelper.FirstOrDefault<UserModel>(sql, dics);

            DbParameter[] parameters = new DbParameter[]
            {
                new SqlParameter("@Account",SqlDbType.NVarChar){Value = fAccount}, 
            };
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, parameters))
            {
                if (dr.Read())
                {
                    user = new UserModel
                    {
                        F_Id = dr["F_Id"].ToString(),
                        F_Account = dr["F_Account"].ToString(),
                        F_RealName = dr["F_RealName"].ToString(),
                        F_NickName = dr["F_NickName"].ToString(),
                        F_HeadIcon = dr["F_HeadIcon"].ToString(),
                        F_Sex = dr["F_Sex"].ToString(),
                        F_WeChat = dr["F_WeChat"].ToString(),
                        F_Phone = dr["F_Phone"].ToString(),
                        F_Email = dr["F_Email"].ToString(),
                        F_OrganizeId = dr["F_OrganizeId"].ToString(),
                        F_DepartmentId = dr["F_DepartmentId"].ToString(),
                        F_RoleId = dr["F_RoleId"].ToString(),
                        F_IsAdmin = Convert.ToInt32(dr["F_IsAdmin"]),
                        F_EnableDelete = Convert.ToInt32(dr["F_EnableDelete"]),
                        F_DeleteFlag = Convert.ToInt32(dr["F_DeleteFlag"]),
                        F_EnabledFlag = Convert.ToInt32(dr["F_EnabledFlag"]),
                        F_SortNum = Convert.ToInt32(dr["F_SortNum"].ToString()),
                        F_Remark = dr["F_Remark"].ToString()
                    };
                    if (dr["F_Birthday"] != DBNull.Value)
                    {
                        user.F_Birthday = Convert.ToDateTime(dr["F_Birthday"].ToString());
                    }
                }
            }
            return user;
        }


        /// <summary>
        /// 获取用户已分配的角色信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<UserRoleModel> FindUserRoleList(string userId)
        {
            string sql = @"select * from Sys_UserRole userRole where userRole.F_UserId=@F_UserId";

            List<DbParameter> paramters = new List<DbParameter>();
            paramters.Add(new SqlParameter("@F_UserId", SqlDbType.NVarChar) { Value = userId });

            List<UserRoleModel> roles = new List<UserRoleModel>();
            using (DbDataReader dr = DbHelper.ExecuteReader(sql, paramters.ToArray()))
            {
                while (dr.Read())
                {
                    UserRoleModel role = ReaderToModel<UserRoleModel>(dr);
                    roles.Add(role);
                }
            }
            return roles;
        }

        /// <summary>
        /// 添加用户的角色信息
        /// </summary>
        /// <param name="userRoles">新设置的用户角色信息的列表</param>
        /// <param name="userId">用户的ID信息</param>
        /// <returns></returns>
        public bool AddUserRole(List<UserRoleModel> userRoles, string userId)
        {
            List<string> addSqls = new List<string>();
            List<DbParameter[]> addParams = new List<DbParameter[]>();
            string delSql = "delete Sys_UserRole where F_UserId=@F_UserId";
            DbParameter[] delParams = new DbParameter[] { 
				new SqlParameter("@F_UserId", SqlDbType.VarChar, 36){ Value = userId },
            };
            addSqls.Add(delSql);
            addParams.Add(delParams);

            foreach (UserRoleModel userrole in userRoles)
            {
                string addSql = "insert into Sys_UserRole (F_Id,F_UserId,F_RoleId) values(@F_Id,@F_UserId,@F_RoleId)";
                DbParameter[] addParam = new DbParameter[]{
				    new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = userrole.F_Id },
				    new SqlParameter("@F_UserId", SqlDbType.VarChar, 36) { Value = userrole.F_UserId },
				    new SqlParameter("@F_RoleId", SqlDbType.VarChar, 36) { Value = userrole.F_RoleId },
			    };

                addSqls.Add(addSql);
                addParams.Add(addParam);
            }

            int line = DbHelper.ExecuteSqls(addSqls, addParams);

            return line >= userRoles.Count;
        }
    }
}
