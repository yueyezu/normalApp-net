/**
* Title: 用户管理的逻辑处理层
* Author: yueye
* Date: 2018/1/25 13:56:59
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class UserBll : FormBll<UserModel>
    {
        private UserDal userDal = new UserDal();
        public UserLoginDal UserLoginDal = new UserLoginDal();

        /// <summary>
        /// 获取数据处理层的信息
        /// </summary>
        /// <returns></returns>
        public override FormDal<UserModel> GetDal()
        {
            return userDal;
        }


        /// <summary>
        /// 带有分页的列表信息查询
        /// </summary>
        /// <param name="queryParam">传过来的所有查询参数信息</param>
        /// <param name="pagination">分页的相关控制信息</param>
        /// <returns></returns>
        public override List<UserModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            List<UserModel> tempUserModel = base.FindPageList(queryParam, pagination);
            OrganizeDal organizeDal = new OrganizeDal();
            RoleDal roleDal = new RoleDal();

            foreach (UserModel userModel in tempUserModel)
            {
                if (!string.IsNullOrEmpty(userModel.F_DepartmentId))
                {
                    userModel.F_DepartmentId = organizeDal.FindForm(userModel.F_DepartmentId).F_Name;
                }
                if (!string.IsNullOrEmpty(userModel.F_OrganizeId))
                {
                    userModel.F_OrganizeId = organizeDal.FindForm(userModel.F_OrganizeId).F_Name;
                }
                if (!string.IsNullOrEmpty(userModel.F_RoleId))
                {
                    userModel.F_RoleId = roleDal.FindForm(userModel.F_RoleId).F_Name;
                }
            }

            return tempUserModel;
        }


        /// <summary>
        /// 表单信息添加
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public override bool AddForm(UserModel model)
        {
            UserLoginDal loginDal = new UserLoginDal();
            bool res = base.AddForm(model);
            if (res)
            {
                UserLoginModel loginModel = new UserLoginModel();
                loginModel.F_Id = Utility.GuId();
                loginModel.F_UserId = model.F_Id;
                loginModel.F_LogOnCount = 0;
                loginModel.F_MultiUserLogin = 0;
                loginModel.F_LoginStatus = 0;
                loginModel.F_EnableLogin = 1;
                loginModel.F_Secretkey = LtCore.Core.GetSecretkey();
                loginModel.F_Password = LtCore.Core.GetDbPassword(loginModel.F_Secretkey);
                loginModel.F_ChangePassTime = null;
                loginModel.F_LastVisitTime = null;

                res = loginDal.AddForm(loginModel);
            }

            return res;
        }

        /// <summary>
        /// 获取用户的信息，这里用于登录时使用
        /// </summary>
        /// <param name="account">当前用户的帐号</param>
        /// <returns></returns>
        public UserModel GetUserByAccount(string account)
        {
            UserModel nowUser = userDal.GetUserByAccount(account);

            return nowUser;
        }

        /// <summary>
        /// 进行用户添加时检测用户是否已存在使用。
        /// </summary>
        /// <param name="fAccount">用户账号</param>
        /// <param name="fId">用户的ID</param>
        /// <returns>
        /// 如果该用户已存在，则返回false
        /// 如果用户账号不存在，则返回true
        /// </returns>
        public bool IsExsitUser(string fAccount, string fId)
        {
            return userDal.IsExsitUser(fAccount, fId);
        }


        /// <summary>
        /// 获取角色列表信息
        /// </summary>
        /// <param name="userId">用户编码</param>
        /// <returns></returns>
        public List<UserRoleModel> FindUserRoleList(string userId)
        {
            return userDal.FindUserRoleList(userId);
        }

        /// <summary>
        /// 添加用户的角色信息
        /// </summary>
        /// <param name="roleIds">新设置的角色的信息</param>
        /// <param name="userId">用户的编号</param>
        /// <returns></returns>
        public bool AddUserRole(string roleIds, string userId)
        {
            List<UserRoleModel> userRoles = new List<UserRoleModel>();
            string[] roleIdArray = roleIds.Split(';');

            foreach (string roleId in roleIdArray)
            {
                UserRoleModel userRole = new UserRoleModel()
                {
                    F_Id = Utility.GuId(),
                    F_RoleId = roleId,
                    F_UserId = userId
                };
                userRoles.Add(userRole);
            }

            return userDal.AddUserRole(userRoles, userId);
        }
    }
}
