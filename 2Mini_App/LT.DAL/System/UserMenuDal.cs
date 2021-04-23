/**
* Title: 用户权限相关的操作
* Author: yueye
* Date: 2018/1/8 10:11:17
* Desp:
*/

using LT.Core;
using LT.Model.System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace LT.DAL.System
{
    public class UserMenuDal : BaseDal
    {
        /// <summary>
        /// 获取用户权限列表，根据用户ID
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<MenuModel> GetUserMenuListByUserId(string userId)
        {
            string sql = @"select distinct menu.* from Sys_Menu menu
                           inner join Sys_RoleMenu rolemenu on rolemenu.F_MenuId=menu.F_Id
                           inner join Sys_UserRole userrole on userrole.F_RoleId = rolemenu.F_RoleId
                           where userrole.F_UserId=@UserId order by menu.F_SortNum";
            DbParameter[] paramters = new DbParameter[]
            {
                new SqlParameter("@UserId",SqlDbType.NVarChar){Value =userId }
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
    }
}
