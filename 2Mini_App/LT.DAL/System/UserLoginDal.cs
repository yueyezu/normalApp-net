/**
* Title: 用户登录管理操作
* Author: yueye
* Date: 2018/1/3 18:22:34
* Desp:
*/

using LT.Core;
using LT.Model.System;
using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class UserLoginDal : BaseDal
    {
        /// <summary>
        /// 根据用户编号获取用户的登录信息
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns></returns>
        public UserLoginModel GetUserLogin(string userId)
        {
            UserLoginModel userLogin = null;
            string sql = "select * from Sys_UserLogin where F_UserId='" + userId + "'";

            using (DbDataReader dr = DbHelper.ExecuteReader(sql))
            {
                if (dr.Read())
                {
                    userLogin = new UserLoginModel
                    {
                        F_Id = dr["F_Id"].ToString(),
                        F_UserId = dr["F_UserId"].ToString(),
                        F_Password = dr["F_Password"].ToString(),
                        F_Secretkey = dr["F_Secretkey"].ToString(),
                        F_MultiUserLogin = Convert.ToInt32(dr["F_MultiUserLogin"]),
                        F_LogOnCount = Convert.ToInt32(dr["F_LogOnCount"].ToString()),
                        F_LoginStatus = Convert.ToInt32(dr["F_LoginStatus"]),
                        F_Question = dr["F_Question"].ToString(),
                        F_Answer = dr["F_Answer"].ToString(),
                        F_EnableLogin = Convert.ToInt32(dr["F_EnableLogin"])
                    };
                    if (dr["F_LastVisitTime"] != DBNull.Value)
                    {
                        userLogin.F_LastVisitTime = Convert.ToDateTime(dr["F_LastVisitTime"].ToString());
                    }
                    if (dr["F_ChangePassTime"] != DBNull.Value)
                    {
                        userLogin.F_ChangePassTime = Convert.ToDateTime(dr["F_ChangePassTime"].ToString());
                    }
                }
            }
            return userLogin;
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单的对象信息</param>
        /// <returns></returns>
        public bool AddForm(UserLoginModel model)
        {
            string sql = @"INSERT INTO Sys_UserLogin
				(F_Id,F_UserId,F_Password,F_Secretkey,F_LastVisitTime,F_ChangePassTime,F_MultiUserLogin,F_LogOnCount,F_LoginStatus,F_Question,F_Answer,F_EnableLogin) 
				VALUES(@F_Id,@F_UserId,@F_Password,@F_Secretkey,@F_LastVisitTime,@F_ChangePassTime,@F_MultiUserLogin,@F_LogOnCount,@F_LoginStatus,@F_Question,@F_Answer,@F_EnableLogin)";
            DbParameter[] parameters = new DbParameter[]{
				new SqlParameter("@F_Id", SqlDbType.VarChar, 36){ Value = model.F_Id },
				model.F_UserId == null ? new SqlParameter("@F_UserId", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_UserId", SqlDbType.VarChar, 36) { Value = model.F_UserId },
				model.F_Password == null ? new SqlParameter("@F_Password", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Password", SqlDbType.VarChar, 36) { Value = model.F_Password },
				model.F_Secretkey == null ? new SqlParameter("@F_Secretkey", SqlDbType.NVarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Secretkey", SqlDbType.VarChar, 36) { Value = model.F_Secretkey },
			    model.F_LastVisitTime == null ? new SqlParameter("@F_LastVisitTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_LastVisitTime", SqlDbType.DateTime, 8) { Value = model.F_LastVisitTime },
                model.F_ChangePassTime == null ? new SqlParameter("@F_ChangePassTime", SqlDbType.DateTime, 8) { Value = DBNull.Value } : new SqlParameter("@F_ChangePassTime", SqlDbType.DateTime, 8) { Value = model.F_ChangePassTime },
                model.F_MultiUserLogin == null ? new SqlParameter("@F_MultiUserLogin", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_MultiUserLogin", SqlDbType.Int, -1) { Value = model.F_MultiUserLogin },
                model.F_LogOnCount == null ? new SqlParameter("@F_LogOnCount", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_LogOnCount", SqlDbType.Int, -1) { Value = model.F_LogOnCount },
                model.F_LoginStatus == null ? new SqlParameter("@F_LoginStatus", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_LoginStatus", SqlDbType.Int, -1) { Value = model.F_LoginStatus },
                model.F_Question == null ? new SqlParameter("@F_Question", SqlDbType.VarChar, 100) { Value = DBNull.Value } : new SqlParameter("@F_Question", SqlDbType.VarChar, 100) { Value = model.F_Question },
                model.F_Answer == null ? new SqlParameter("@F_Answer", SqlDbType.VarChar, 36) { Value = DBNull.Value } : new SqlParameter("@F_Answer", SqlDbType.VarChar, 36) { Value = model.F_Answer },
                model.F_EnableLogin == null ? new SqlParameter("@F_EnableLogin", SqlDbType.Int, -1) { Value = DBNull.Value } : new SqlParameter("@F_EnableLogin", SqlDbType.Int, -1) { Value = model.F_EnableLogin },
            };
            int line = DbHelper.ExecuteNonQuery(sql, parameters);
            return line == 1;
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userLogin">登录用户信息</param>
        /// <returns></returns>
        public bool ChangePwd(UserLoginModel userLogin)
        {
            string sql = "update Sys_UserLogin set F_Secretkey=@F_Secretkey, F_Password=@F_Password, F_ChangePassTime=@F_ChangePassTime where F_Id=@F_Id";

            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_Secretkey",SqlDbType.NVarChar){Value =userLogin.F_Secretkey}, 
                new SqlParameter("@F_Password",SqlDbType.NVarChar){Value =userLogin.F_Password}, 
                userLogin.F_ChangePassTime == null?
                  new SqlParameter("@F_ChangePassTime",SqlDbType.DateTime){Value = DBNull.Value}:
                  new SqlParameter("@F_ChangePassTime",SqlDbType.DateTime){Value =  userLogin.F_ChangePassTime}, 
                new SqlParameter("@F_Id",SqlDbType.NVarChar){Value =userLogin.F_Id }, 
            };

            int result = DbHelper.ExecuteNonQuery(sql, paramters);
            return result == 1;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userLogin">登录用户信息</param>
        /// <returns></returns>
        public bool LoginUpdate(UserLoginModel userLogin)
        {
            string sql = "update Sys_UserLogin set F_LastVisitTime=@F_LastVisitTime, F_LogOnCount=@F_LogOnCount, F_LoginStatus=@F_LoginStatus where F_Id=@F_Id";

            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_LastVisitTime",SqlDbType.DateTime){Value =userLogin.F_LastVisitTime }, 
                new SqlParameter("@F_LogOnCount",SqlDbType.Int){Value =userLogin.F_LogOnCount }, 
                new SqlParameter("@F_LoginStatus",SqlDbType.Int){Value =userLogin.F_LoginStatus }, 
                new SqlParameter("@F_Id",SqlDbType.NVarChar){Value =userLogin.F_Id }, 
            };

            int result = DbHelper.ExecuteNonQuery(sql, paramters);
            return result == 1;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userLogin">登录用户信息</param>
        /// <returns></returns>
        public bool LogoutUpdate(UserLoginModel userLogin)
        {
            string sql = "update Sys_UserLogin set F_LoginStatus=@F_LoginStatus where F_Id=@F_Id";

            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@F_LoginStatus",SqlDbType.Int){Value =userLogin.F_LoginStatus }, 
                new SqlParameter("@F_Id",SqlDbType.NVarChar){Value =userLogin.F_Id }, 
            };

            int result = DbHelper.ExecuteNonQuery(sql, paramters);
            return result == 1;
        }
    }
}
