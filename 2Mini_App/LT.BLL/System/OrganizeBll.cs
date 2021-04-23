/**
* Title: 组织架构的业务逻辑处理层
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
    public class OrganizeBll : TreeBll<OrganizeModel>
    {
        OrganizeDal dal = new OrganizeDal();
        /// <summary>
        /// 获取数据处理层的对象
        /// </summary>
        /// <returns></returns>
        public override TreeDal<OrganizeModel> GetDal()
        {
            return dal;
        }

        /// <summary>
        /// 对树查询的内容进行筛选操作
        /// </summary>
        /// <param name="modelList"></param>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        protected override List<OrganizeModel> FilterGridTree(List<OrganizeModel> modelList, Dictionary<string, string> queryParam)
        {
            var con = ExtLinq.True<OrganizeModel>();
            if (queryParam.ContainsKey("keyword"))
            {
                con = con.And(t => t.F_Name.Contains(queryParam["keyword"]));
                con = con.Or(t => t.F_ShortName != null && t.F_ShortName.Contains(queryParam["keyword"]));
            }

            modelList = modelList.TreeWhere(con.ToPredicate());
            modelList = modelList.OrderBy(t => t.F_SortNum).ToList();   // 使用TreeWhere后会打乱原排序，这里进行重新排序
            return modelList;
        }
    }
}
