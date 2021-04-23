/**
* Title: 字典值的处理方法
* Author: yueye
* Date: 2018/1/8 14:03:48
* Desp:
*/

using LT.Code;
using LT.Core;
using LT.DAL.System;
using LT.Model.System;
using System.Collections.Generic;

namespace LT.BLL.System
{
    public class DictItemBll : TreeBll<DictItemModel>
    {
        DictItemDal dal = new DictItemDal();

        public override TreeDal<DictItemModel> GetDal()
        {
            return dal;
        }

        /// <summary>
        /// 系统登录初期，获取系统所有字典缓存时，使用到的方法
        /// </summary>
        /// <returns></returns>
        public List<DictItemModel> GetAllDictItem()
        {
            return dal.GetAllDictItem("");
        }

        /// <summary>
        /// 根据字典的编码信息，获取字典的所有值
        /// </summary>
        /// <param name="dictCode">字典的编码</param>
        /// <returns></returns>
        public List<DictItemModel> GetDictItemByDict(string dictCode)
        {
            return dal.GetAllDictItem(dictCode);
        }

        /// <summary>
        /// 对树查询的内容进行筛选操作
        /// </summary>
        /// <param name="modelList"></param>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        protected override List<DictItemModel> FilterGridTree(List<DictItemModel> modelList, Dictionary<string, string> queryParam)
        {
            var con = ExtLinq.True<DictItemModel>();
            if (queryParam.ContainsKey("keyword"))
            {
                con = con.And(t => t.F_Name.Contains(queryParam["keyword"]));
            }

            if (queryParam.ContainsKey("dictId"))
            {
                con = con.And(t => t.F_DictId.Contains(queryParam["dictId"]));
            }
            modelList = modelList.TreeWhere(con.ToPredicate());
            return modelList;
        }
    }
}
