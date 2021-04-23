/**
* Title: 用户登录信息管理的逻辑处理类
* Author: yueye
* Date: 2018/1/9 10:41:40
* Desp:
*/

using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System;

namespace LT.BLL.System
{
    public class UserLoginBll
    {
        private UserLoginDal dal = new UserLoginDal();

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="oldPwd">原密码</param>
        /// <param name="newPwd">新密码</param>
        /// <param name="userId">用户ID</param>
        /// <returns></returns>
        public bool ChangePwd(string oldPwd, string newPwd, string userId)
        {
            UserLoginModel userLogin = dal.GetUserLogin(userId);
            string oldPassword = LtCore.Core.GetDbPassword(userLogin.F_Secretkey, oldPwd);
            if (!userLogin.F_Password.Equals(oldPassword))  //验证输入的原密码是否正确
            {
                throw new CustomException("原密码输入有误！");
            }

            userLogin.F_Secretkey = LtCore.Core.GetSecretkey();
            userLogin.F_Password = LtCore.Core.GetDbPassword(userLogin.F_Secretkey, newPwd);
            userLogin.F_ChangePassTime = DateTime.Now;
            return dal.ChangePwd(userLogin);
        }

        /// <summary>
        /// 重置用户密码
        /// </summary>
        /// <param name="userLoginId"></param>
        /// <returns></returns>
        public bool ResetPwd(string userId)
        {
            UserLoginModel userLogin = dal.GetUserLogin(userId);
            userLogin.F_Secretkey = LtCore.Core.GetSecretkey();
            userLogin.F_Password = LtCore.Core.GetDbPassword(userLogin.F_Secretkey);
            userLogin.F_ChangePassTime = null;

            return dal.ChangePwd(userLogin);
        }


        /// <summary>
        /// 根据用户编号和用户密码，验证用户登录信息。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="password">用户录入密码</param>
        /// <returns></returns>
        public UserLoginModel CheckLogin(string userId, string password)
        {
            UserLoginModel userLogin = dal.GetUserLogin(userId);
            if (userLogin == null || userLogin.F_EnableLogin != 1)
            {
                throw new CustomException("该用户无登陆权限，请联系管理员！");
            }

            string inPassword = LtCore.Core.GetDbPassword(userLogin.F_Secretkey, password);
            if (inPassword != userLogin.F_Password)
            {
                throw new CustomException("密码不正确，请重新输入");
            }

            return userLogin;
        }

        /// <summary>
        /// 更新用户登录的数据库记录信息。
        /// </summary>
        /// <param name="userLogin">用户登录信息</param>
        /// <returns></returns>
        public bool LoginUpdate(UserLoginModel userLogin)
        {
            userLogin.F_LastVisitTime = DateTime.Now;
            userLogin.F_LogOnCount = userLogin.F_LogOnCount + 1;
            userLogin.F_LoginStatus = 1;

            return dal.LoginUpdate(userLogin);
        }

        /// <summary>
        /// 用户注销时更新用户的登录记录信息。
        /// </summary>
        /// <param name="userLoginId">用户登录</param>
        /// <returns></returns>
        public bool LogoutUpdate(string userLoginId)
        {
            UserLoginModel userLogin = new UserLoginModel();
            userLogin.F_Id = userLoginId;
            userLogin.F_LoginStatus = 0;

            return dal.LogoutUpdate(userLogin);
        }
    }
}
