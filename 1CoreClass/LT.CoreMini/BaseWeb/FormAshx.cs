/**
* Title: 单独表单处理的基类
* Author: yueye
* Date: 2018/1/3 11:06:07
* Desp: 这里采用虚类进行实现，无法直接进行调用，可以通过其继承类来使用这些实现的方法。
*/

using System;
using System.Collections.Generic;
using System.Web;
using LT.Code;

namespace LT.Core
{
    public abstract class FormAshx<TModel> : BaseAshx where TModel : BaseEntity<TModel>, new()
    {
        /// <summary>
        /// 获取BLL层处理的操作类，这里为虚类，必须要在子类中进行实现的。
        /// </summary>
        /// <returns></returns>
        public abstract FormBll<TModel> GetBll();

        #region 表单基本操作方法

        /// <summary>
        /// 查询列表
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindList(HttpContext context)
        {
            Dictionary<string, string> queryParam = GetQueryParam(context);
            //查询参数的校验,后期需要再说吧
            //string checkStr = QueryParamCheck(queryParam);
            //if (!string.IsNullOrEmpty(checkStr))
            //{
            //    return ErrorResult(JsonRpcErrorEnum.ParamError, checkStr);
            //}

            //TODO 这里对于排序之类的参数还需要考虑处理
            List<TModel> modelList = GetBll().FindList(queryParam);   //只是查询菜单项

            var gridlist = new
            {
                total = modelList.Count,
                rows = modelList
            };

            return JsonResult(gridlist);
        }

        /// <summary>
        /// 带有分页的列表信息查询
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindPageList(HttpContext context)
        {
            Pagination pagination = new Pagination();
            pagination.rows = Convert.ToInt32(context.Request["rows"]);
            pagination.page = Convert.ToInt32(context.Request["page"]);

            Dictionary<string, string> queryParam = GetQueryParam(context);
            //查询参数的校验,后期需要再说吧
            //string checkStr = QueryParamCheck(queryParam);
            //if (!string.IsNullOrEmpty(checkStr))
            //{
            //    return ErrorResult(JsonRpcErrorEnum.ParamError, checkStr);
            //}

            List<TModel> modelList = GetBll().FindPageList(queryParam, pagination);   //只是查询菜单项

            var gridlist = new
            {
                total = pagination.records,
                rows = modelList
            };

            return JsonResult(gridlist);
        }

        /// <summary>
        /// 获取下拉列表的项
        /// </summary>
        /// <returns></returns>
        public virtual string FindSelectList(HttpContext context)
        {
            Dictionary<string, string> queryParam = GetQueryParam(context);
            List<TModel> modelList = GetBll().FindList(queryParam);   //只是查询菜单项

            List<ComboSelectModel> selectList = ModelListToSelectList(modelList);

            return JsonResult(selectList);
        }

        /// <summary>
        /// 根据Id获取对象的内容
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public virtual string FindForm(HttpContext context)
        {
            string fId = context.Request["fId"];
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
                optType = "添加";
                result = GetBll().AddForm(model);
            }
            else
            {
                optType = "修改";
                result = GetBll().EditForm(model);
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
            bool result = GetBll().DeleteForm(fId);

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
        /// 获取数据提交的参数，这里只是对于但对象的适用
        /// 如果是多对象的需要对提交方法进行重写
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
        /// 如果是下拉选择的对象，必须要继承该方法,因为Name值不存在
        /// </summary>
        /// <param name="modelList">当前对象</param>
        /// <returns></returns>
        public virtual List<ComboSelectModel> ModelListToSelectList(List<TModel> modelList)
        {
            return new List<ComboSelectModel>();
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
