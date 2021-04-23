/**
* Title: 用户权限总体的操作。
* Author: yueye
* Date: 2018/1/8 10:10:06
* Desp:
*/

using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class UserMenuBll
    {
        UserMenuDal dal = new UserMenuDal();

        /// <summary>
        /// 根据用户的ID获取用户的所有权限信息。
        /// </summary>
        /// <param name="userId">用户ID</param>
        /// <returns></returns>
        public List<MenuModel> GetUserMenuListByUserId(string userId)
        {
            return dal.GetUserMenuListByUserId(userId);
        }
    }
}
