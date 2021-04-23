/**
* Title:菜单操作的业务处理类
* Author: yueye
* Date: 2018/1/25 13:56:59
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;
using System.Linq;

namespace LT.BLL.System
{
    public class MenuBll : TreeBll<MenuModel>
    {
        MenuDal dal = new MenuDal();
        /// <summary>
        /// 获取数据处理层的对象
        /// </summary>
        /// <returns></returns>
        public override TreeDal<MenuModel> GetDal()
        {
            return dal;
        }

        /// <summary>
        /// 对树查询的内容进行筛选操作
        /// </summary>
        /// <param name="modelList"></param>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        protected override List<MenuModel> FilterGridTree(List<MenuModel> modelList, Dictionary<string, string> queryParam)
        {
            var con = ExtLinq.True<MenuModel>();
            if (queryParam.ContainsKey("keyword"))
            {
                con = con.And(t => t.F_Name.Contains(queryParam["keyword"]));
            }

            modelList = modelList.TreeWhere(con.ToPredicate());
            modelList = modelList.OrderBy(t => t.F_SortNum).ToList(); // 使用TreeWhere后会打乱原排序，这里进行重新排序

            return modelList;
        }

        /// <summary>
        /// 进行菜单添加时检测菜单编号是否已存在使用。
        /// </summary>
        /// <param name="fCode">菜单编号</param>
        /// <param name="fId">菜单的ID</param>
        /// <returns>
        /// 如果该菜单编号已存在，则返回false
        /// 如果菜单编号不存在，则返回true
        /// </returns>
        public bool IsExsitMenuCode(string fCode, string fId)
        {
            return dal.IsExsitMenuCode(fCode, fId);
        }
    }
}
