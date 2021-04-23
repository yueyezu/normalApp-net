/**
* Title: 表单型数据表单的数据处理层处理
* Author: yueye
* Date: 2018/2/11 16:38:46
* Desp:
*/

using System.Collections.Generic;

namespace LT.Core
{
    public abstract class FormDal<TModel> : BaseDal where TModel : BaseEntity<TModel>, new()
    {
        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="queryParam">传过来的所有查询参数信息</param>
        /// <returns></returns>
        public abstract List<TModel> FindList(Dictionary<string, string> queryParam);
        /// <summary>
        /// 带有分页的列表信息查询
        /// </summary>
        /// <param name="queryParam">传过来的所有查询参数信息</param>
        /// <param name="pagination">分页的相关控制信息</param>
        /// <returns></returns>
        public abstract List<TModel> FindPageList(Dictionary<string, string> queryParam, Pagination pagination);
        /// <summary>
        /// 根据表单的ID获取当前表单的信息
        /// </summary>
        /// <param name="fId">表单的ID信息</param>
        /// <returns></returns>
        public abstract TModel FindForm(string fId);
        /// <summary>
        /// 表单信息添加
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public abstract bool AddForm(TModel model);
        /// <summary>
        /// 表单信息修改
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public abstract bool EditForm(TModel model);
        /// <summary>
        /// 表单信息删除
        /// </summary>
        /// <param name="fId">表单Id</param>
        /// <returns></returns>
        public abstract bool DeleteForm(string fId);
    }
}
