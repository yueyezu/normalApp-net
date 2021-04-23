/**
* Title: 树状结构的数据的逻辑处理层基类。
* Author: yueye
* Date: 2018/2/9 17:45:16
* Desp: 对于树结构的一些基本的操作进行了定义，这里只适合单表的情况。
 * 该方法为虚类，必须被继承后才可以正式使用。
*/

using System.Collections.Generic;

namespace LT.Core
{
    public abstract class TreeBll<TModel> : BaseBll where TModel : BaseTreeEntity<TModel>, new()
    {
        /// <summary>
        /// 数据处理层的对象获取，虚类，需要被继承才可以使用。
        /// </summary>
        /// <returns></returns>
        public abstract TreeDal<TModel> GetDal();

        #region 表单的操作方法

        /// <summary>
        /// 查询树的所有数据，并进行筛选后，返回到Action层
        /// </summary>
        /// <param name="queryParam">前台传过来的所有的查询参数</param>
        /// <returns></returns>
        public virtual List<TModel> FindTree(Dictionary<string, string> queryParam)
        {
            List<TModel> modelList = GetDal().FindTree(queryParam);
            modelList = FilterGridTree(modelList, queryParam);

            return modelList;
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="fId">查询单个表单的依据，ID信息</param>
        /// <returns></returns>
        public virtual TModel FindForm(string fId)
        {
            return GetDal().FindForm(fId);
        }

        /// <summary>
        /// 添加表单数据
        /// </summary>
        /// <param name="model">表单对象</param>
        /// <returns></returns>
        public virtual bool AddForm(TModel model)
        {
            model.Create();
            model.F_Layers = GetModelLayers(model.F_ParentId, model.F_Id);
            return GetDal().AddForm(model);
        }

        /// <summary>
        /// 修改表单数据的操作
        /// </summary>
        /// <param name="model">表单对象</param>
        /// <returns></returns>
        public virtual bool EditForm(TModel model)
        {
            model.Modify(model.F_Id);

            TModel oldModel = GetDal().FindForm(model.F_Id);
            model.F_Layers = oldModel.F_Layers; //TODO yueye 对于数据对于null数据的处理还需要在进行考虑实现方式

            bool result = GetDal().EditForm(model);
            if (result && oldModel.F_ParentId != model.F_ParentId)  //如果父级未发生修改的话，对层级是不会产生影响的，所以不需要修改。
            {
                string newLayer = GetModelLayers(model.F_ParentId, model.F_Id);
                result = GetDal().ChangeAllLayer(oldModel.F_Layers, newLayer);
            }

            return result;
        }

        /// <summary>
        /// 删除表单数据的操作
        /// TODO yueye 对于树结构数据，级联删除需要考虑实现方式。
        /// </summary>
        /// <param name="fId">要删除数据的ID信息</param>
        /// <returns></returns>
        public virtual bool DeleteForm(string fId)
        {
            return GetDal().DeleteForm(fId);
        }

        /// <summary>
        /// 检测当前节点是否存在子节点
        /// </summary>
        /// <param name="fId">当前节点的Id</param>
        /// <returns>如果存在，则返回true</returns>
        public bool IsExistChild(string fId)
        {
            return GetDal().IsExistChild(fId);
        }
        #endregion

        /// <summary>
        /// 查询树列表时，对树的数据进行筛选
        /// 如果没有规则可以直接返回相应的list即可。
        /// </summary>
        /// <param name="modelList">查询出来的所有树信息的列表</param>
        /// <param name="queryParam">传输过来的查询条件</param>
        /// <returns></returns>
        protected virtual List<TModel> FilterGridTree(List<TModel> modelList, Dictionary<string, string> queryParam)
        {
            return modelList;
        }

        /// <summary>
        /// 获取当前对象的层级信息
        /// </summary>
        /// <param name="parentId">父级数据的Id信息</param>
        /// <param name="fId">当前对象的Id信息</param>
        /// <returns></returns>
        protected string GetModelLayers(string parentId, string fId)
        {
            string nowLayer;
            if (string.IsNullOrEmpty(parentId) || "0".Equals(parentId))
            {
                nowLayer = string.Format("#{0}#", fId);
            }
            else
            {
                string layers = GetDal().GetParentLayer(parentId);  //获取父类的层级码
                nowLayer = string.IsNullOrEmpty(layers)
                    ? string.Format("#{0}#", fId)
                    : string.Format("{0}|#{1}#", layers, fId);
            }
            return nowLayer;
        }

    }
}
