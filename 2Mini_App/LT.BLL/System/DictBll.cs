/**
* Title: 字典操作的逻辑处理类
* Author: yueye
* Date: 2018/1/8 13:50:01
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class DictBll : TreeBll<DictModel>
    {
        DictDal dal = new DictDal();
        /// <summary>
        /// 获取数据处理层的对象
        /// </summary>
        /// <returns></returns>
        public override TreeDal<DictModel> GetDal()
        {
            return dal;
        }

        /// <summary>
        /// 获取全部的字典信息，用于系统首次登录缓存到前台
        /// </summary>
        /// <returns></returns>
        public List<DictModel> GetAllDict()
        {
            return dal.GetAllDict();
        }

        /// <summary>
        /// 对树查询的内容进行筛选操作
        /// </summary>
        /// <param name="modelList"></param>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        protected override List<DictModel> FilterGridTree(List<DictModel> modelList, Dictionary<string, string> queryParam)
        {
            var con = ExtLinq.True<DictModel>();
            if (queryParam.ContainsKey("keyword"))
            {
                con = con.And(t => t.F_Name.Contains(queryParam["keyword"]));
            }

            modelList = modelList.TreeWhere(con.ToPredicate());
            return modelList;
        }

        /// <summary>
        /// 进行字典添加时检测字典编号是否已存在使用。
        /// </summary>
        /// <param name="fCode">字典编号</param>
        /// <param name="fId">字典的ID</param>
        /// <returns>
        /// 如果该字典编号已存在，则返回false
        /// 如果字典编号不存在，则返回true
        /// </returns>
        public bool IsExsitDictCode(string fCode, string fId)
        {
            return dal.IsExsitDictCode(fCode, fId);
        }
    }
}
