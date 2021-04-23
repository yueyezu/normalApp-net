/**
* Title: 数据处理层的树状表单的基类
* Author: yueye
* Date: 2018/2/9 18:25:16
* Desp: 对于数据的处理方法进行了定义，大部分的方法都是需要在具体的实现类中进行编写的。
 * 主要是对于sql查询方法的编写。
*/

using System;
using System.Collections.Generic;
using LT.Code;

namespace LT.Core
{
    public abstract class TreeDal<TModel> : BaseDal where TModel : BaseTreeEntity<TModel>, new()
    {
        public abstract string TableName { get; }

        public abstract List<TModel> FindTree(Dictionary<string, string> queryParam);

        public abstract TModel FindForm(string fId);

        public abstract bool AddForm(TModel model);

        public abstract bool EditForm(TModel model);

        public abstract bool DeleteForm(string fId);

        /// <summary>
        /// 获取父节点的层级信息
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public virtual string GetParentLayer(string parentId)
        {
            string sql = String.Format("select t.F_Layers from {0} t where t.F_Id = '{1}'", TableName, parentId);

            string layers = DbHelper.ExecuteScalar(sql).ToString();
            return layers;
        }

        /// <summary>
        /// 修改所有相关层级的内容
        /// 包括当前层级以及其所有子集的层级关系。
        /// </summary>
        /// <param name="oldLevel">原层级内容</param>
        /// <param name="newLevel">新的层级内容</param>
        /// <returns></returns>
        public virtual bool ChangeAllLayer(string oldLevel, string newLevel)
        {
            string sql = String.Format("update {2} set F_Layers = replace(F_Layers,'{0}' , '{1}') where F_Layers like '{0}%'", oldLevel, newLevel, TableName);
            int num = DbHelper.ExecuteNonQuery(sql);

            return num >= 1;
        }

        /// <summary>
        /// 检测当前节点是否存在子节点
        /// </summary>
        /// <param name="fId">当前节点的Id</param>
        /// <returns>如果存在，则返回true</returns>
        public virtual bool IsExistChild(string fId)
        {
            string sql = String.Format("select COUNT(*) from {0} t where t.F_ParentId = '{1}'", TableName, fId);
            int num = DbHelper.ExecuteScalar(sql).ToInt();

            return num >= 1;
        }
    }
}
