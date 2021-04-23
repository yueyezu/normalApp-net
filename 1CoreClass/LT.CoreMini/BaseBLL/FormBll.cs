/**
* Title: 表单型数据的逻辑处理层基类。
* Author: yueye
* Date: 2018/2/9 17:45:46
* Desp:
*/

using System.Collections.Generic;

namespace LT.Core
{
    public abstract class FormBll<TModel> : BaseBll where TModel : BaseEntity<TModel>, new()
    {
        /// <summary>
        /// 获取数据处理层的对象，虚方法，需要在后台进行实现
        /// </summary>
        /// <returns></returns>
        public abstract FormDal<TModel> GetDal();
        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="queryParam">传过来的所有查询参数信息</param>
        /// <returns></returns>
        public virtual List<TModel> FindList(Dictionary<string, string> queryParam)
        {
            return GetDal().FindList(queryParam);
        }

        /// <summary>
        /// 带有分页的列表信息查询
        /// </summary>
        /// <param name="queryParam">传过来的所有查询参数信息</param>
        /// <param name="pagination">分页的相关控制信息</param>
        /// <returns></returns>
        public virtual List<TModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination)
        {
            return GetDal().FindPageList(queryParam, pagination);
        }

        /// <summary>
        /// 根据表单的ID获取当前表单的信息
        /// </summary>
        /// <param name="fId">表单的ID信息</param>
        /// <returns></returns>
        public virtual TModel FindForm(string fId)
        {
            return GetDal().FindForm(fId);
        }
        /// <summary>
        /// 表单信息添加
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public virtual bool AddForm(TModel model)
        {
            model.Create();
            return GetDal().AddForm(model);
        }
        /// <summary>
        /// 表单信息修改
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public virtual bool EditForm(TModel model)
        {
            model.Modify(model.F_Id);
            return GetDal().EditForm(model);
        }
        /// <summary>
        /// 表单信息删除
        /// </summary>
        /// <param name="fId">表单Id</param>
        /// <returns></returns>
        public virtual bool DeleteForm(string fId)
        {
            return GetDal().DeleteForm(fId);
        }

    }
}
