/**
* Title: 角色管理的业务处理
* Author: yueye
* Date: 2018/1/8 10:18:11
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class RoleBll : FormBll<RoleModel>
    {
        private RoleDal roleDal = new RoleDal();

        /// <summary>
        /// 获取数据处理层的信息
        /// </summary>
        /// <returns></returns>
        public override FormDal<RoleModel> GetDal()
        {
            return roleDal;
        }

        /// <summary>
        /// 进行角色/岗位添加时检测角色/岗位是否已存在使用。
        /// </summary>
        /// <param name="fCode">角色/岗位编号</param>
        /// <param name="fId">角色/岗位的ID</param>
        /// <returns>
        /// 如果该角色/岗位已存在，则返回false
        /// 如果角色/岗位不存在，则返回true
        /// </returns>
        public bool IsExsitRoleCode(string fCode, string fId)
        {
            return roleDal.IsExsitRoleCode(fCode, fId);
        }


        /// <summary>
        /// 获取角色的权限信息
        /// </summary>
        /// <param name="roleId">角色Id</param>
        /// <returns></returns>
        public List<MenuModel> FindRoleMenuTree(string roleId)
        {
            return roleDal.FindRoleMenuTree(roleId);
        }

        /// <summary>
        /// 添加角色的权限信息
        /// </summary>
        /// <param name="menuIds">新设置的权限的信息</param>
        /// <param name="roleId">角色的编号</param>
        /// <returns></returns>
        public bool AddRoleMenu(string menuIds, string roleId)
        {
            List<RoleMenuModel> roleMenus = new List<RoleMenuModel>();
            string[] menuIdArray = menuIds.Split(';');

            foreach (string menuId in menuIdArray)
            {
                RoleMenuModel userRole = new RoleMenuModel()
                {
                    F_Id = Utility.GuId(),
                    F_RoleId = roleId,
                    F_MenuId = menuId
                };
                roleMenus.Add(userRole);
            }

            return roleDal.AddRoleMenu(roleMenus, roleId);
        }
    }
}
