/**
* Title: 对于树结构的表单项的处理方法
* Author: yueye
* Date: 2018/2/8 10:54:19
* Desp: 区别于Form表单，这里的表单存在上下级关系，定义了树结构的数据可能会用到的一些方法
 *  对于分页的树，这里不进行考虑。树分页后，实现的意义不大。
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LT.Code;

namespace LT.Core
{
    public abstract class TreeAshx<TModel> : BaseAshx where TModel : BaseTreeEntity<TModel>, new()
    {
        /// <summary>
        /// 虚方法，获取逻辑处理层对象。
        /// 该方法需要在实际使用的地方进行赋值，必须要继承实现的方法
        /// </summary>
        /// <returns></returns>
        public abstract TreeBll<TModel> GetBll();

        #region 表单操作的方法

        /// <summary>
        /// 查询树列表
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindGridTree(HttpContext context)
        {
            //首先调用查询条件对于检索内容进行查询
            Dictionary<string, string> queryParam = GetQueryParam(context);
            //查询参数的校验,后期需要再说吧
            //string checkStr = QueryParamCheck(queryParam);
            //if (!string.IsNullOrEmpty(checkStr))
            //{
            //    return ErrorResult(JsonRpcErrorEnum.ParamError, checkStr);
            //}

            //查询所有树结构的项，同时并进行了相应的筛选处理
            List<TModel> modelList = GetBll().FindTree(queryParam);

            var treeList = new List<TreeGridModel>();
            foreach (var item in modelList)
            {
                TreeGridModel treeModel = new TreeGridModel();
                bool isLeaf = modelList.Count(t => t.F_ParentId == item.F_Id) == 0;
                treeModel.id = item.F_Id;
                treeModel.text = item.F_Name;
                treeModel.isLeaf = isLeaf;
                treeModel.parentId = item.F_ParentId;
                treeModel.expanded = !isLeaf;
                treeModel.entityJson = item.ToJson();
                treeList.Add(treeModel);
            }

            return treeList.TreeGridJson();
        }

        /// <summary>
        /// 获取下拉列表的项，树结构的时候
        /// </summary>
        /// <returns></returns>
        public virtual string FindSelectTree(HttpContext context)
        {
            Dictionary<string, string> queryParam = GetQueryParam(context);
            List<TModel> modelList = GetBll().FindTree(queryParam); //只是查询菜单项

            List<TreeSelectModel> treeList = ModelListToSelectList(modelList);

            return ContentResult(treeList.TreeSelectJson());
        }

        /// <summary>
        /// 获取下拉列表的项，非树结构时
        /// </summary>
        /// <returns></returns>
        public virtual string FindSelectList(HttpContext context)
        {
            Dictionary<string, string> queryParam = GetQueryParam(context);
            List<TModel> modelList = GetBll().FindTree(queryParam); //只是查询菜单项

            List<TreeSelectModel> treeList = ModelListToSelectList(modelList);

            return JsonResult(treeList);
        }


        /// <summary>
        /// 获取树列表的项，结合UI框架中树的数据结构
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindViewTree(HttpContext context)
        {
            Dictionary<string, string> queryParam = GetQueryParam(context);
            List<TModel> modelList = GetBll().FindTree(queryParam); //只是查询菜单项

            var treeList = new List<TreeViewModel>();
            foreach (TModel item in modelList)
            {
                TreeViewModel treeModel = new TreeViewModel();
                bool hasChildren = modelList.Count(t => t.F_ParentId == item.F_Id) != 0;
                treeModel.id = item.F_Id;
                treeModel.text = item.F_Name;
                treeModel.value = item.F_Id;
                treeModel.parentId = item.F_ParentId;
                treeModel.isexpand = hasChildren;
                treeModel.complete = true;
                treeModel.hasChildren = hasChildren;
                treeList.Add(treeModel);
            }

            return ContentResult(treeList.TreeViewJson());
        }

        /// <summary>
        /// 根据Id获取对象的内容
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindForm(HttpContext context)
        {
            string fId = context.Request["fId"];
            if (string.IsNullOrEmpty(fId))
            {
                return ErrorResult(JsonRpcErrorEnum.ParamError, "输入参数错误，未找到待查询数据的ID信息。");
            }
            TModel model = GetBll().FindForm(fId);

            return SuccessResult(model);
        }

        /// <summary>
        /// 添加、修改表单数据
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string SubmitForm(HttpContext context)
        {
            var model = GetSubmitParam(context.Request);
            //后台参数校验
            string checkStr = SubmitFormCheck(model);
            if (!string.IsNullOrEmpty(checkStr))
            {
                return ErrorResult(JsonRpcErrorEnum.ParamError, checkStr);
            }

            string optType = "";
            bool result = false;
            if (string.IsNullOrEmpty(model.F_Id))
            {
                result = GetBll().AddForm(model);
                optType = "添加";
            }
            else
            {
                result = GetBll().EditForm(model);
                optType = "修改";
            }

            if (result)
            {
                //如果添加或者修改成功，将操作信息写入日志
                string optContent = model.ToJson();
                AddSysLog(optType, optContent);

                return SuccessResult("操作成功!");
            }
            return ErrorResult(JsonRpcErrorEnum.BusinessError, "操作失败，请重试！");
        }

        /// <summary>
        /// 删除对象
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string DeleteForm(HttpContext context)
        {
            string fId = context.Request["fId"];
            string cascade = context.Request["cascade"];
            if (string.IsNullOrEmpty(fId))
            {
                return ErrorResult(JsonRpcErrorEnum.ParamError, "输入参数错误，未找到待删除数据的ID信息。");
            }

            //检测是否存在下级数据
            if (cascade != "true" && GetBll().IsExistChild(fId))
            {
                return SuccessResult("hasChildren");
            }

            bool result = false;
            result = GetBll().DeleteForm(fId);

            if (result)
            {
                //如果删除成功，将操作信息写入日志
                string optContent = "删除数据ID为：" + fId;
                AddSysLog("删除", optContent);

                return SuccessResult("删除成功!");
            }

            return ErrorResult(JsonRpcErrorEnum.BusinessError, "删除失败，请重试！");
        }

        #endregion

        /// <summary>
        /// 获取查询的参数信息，并转换到dictionary中，该对象直接传输到DAL层。
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected virtual Dictionary<string, string> GetQueryParam(HttpContext context)
        {
            Dictionary<string, string> queryParams = RequestParamToDictionary(context.Request);
            return queryParams;
        }

        /// <summary>
        /// 获取提交的方法
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        protected virtual TModel GetSubmitParam(HttpRequest request)
        {
            TModel model = RequstParamToModel<TModel>(request);
            // 如果该对象具有删除权限，则认为其具有删除标识字段
            // 这里对于添加和修改时，直接默认赋值为0，即不是删除状态
            if (model is IDeleteAuth)
            {
                var entity = model as IDeleteAuth;
                entity.F_DeleteFlag = 0;
            }
            return model;
        }

        /// <summary>
        /// 将查询的数据列表转化为下拉框选择用的对象
        /// 如果是下拉选择的对象，必须要继承该方法,如果需要展示和选择内容不一致时，需集成该方法
        /// </summary>
        /// <param name="modelList">当前对象</param>
        /// <returns></returns>
        public virtual List<TreeSelectModel> ModelListToSelectList(List<TModel> modelList)
        {
            var treeList = new List<TreeSelectModel>();
            foreach (TModel item in modelList)
            {
                TreeSelectModel treeModel = new TreeSelectModel();
                treeModel.id = item.F_Id;
                treeModel.text = item.F_Name;
                treeModel.value = item.F_Id;
                treeModel.parentId = item.F_ParentId;
                treeModel.data = item;
                treeList.Add(treeModel);
            }
            return treeList;
        }

        #region 参数验证的方法

        /// <summary>
        /// 对于提交的表单信息进行验证。
        /// </summary>
        /// <param name="model">提交上来的表单</param>
        /// <returns>对于提交的表单数据进行校验的方法，可集成实现。如果校验通过则返回null，如果不通过则返回错误信息。</returns>
        protected virtual string SubmitFormCheck(TModel model)
        {
            return null;
        }

        /// <summary>
        /// 查询方法的参数验证方法。
        /// </summary>
        /// <param name="queryParam"></param>
        /// <returns></returns>
        protected virtual string QueryParamCheck(Dictionary<string, string> queryParam)
        {
            return null;
        }

        #endregion
    }
}
