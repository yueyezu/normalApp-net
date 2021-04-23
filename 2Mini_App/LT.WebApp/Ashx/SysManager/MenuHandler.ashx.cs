using LT.BLL.System;
using LT.Core;
using LT.Model.System;
using System.Collections.Generic;
using System.Web;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "菜单管理")]
    public class MenuHandler : TreeAshx<MenuModel>
    {
        private readonly MenuBll bll = new MenuBll();

        /// <summary>
        /// 框架中定义的必须要实现的方法，获取逻辑处理层的对象。
        /// </summary>
        /// <returns></returns>
        public override TreeBll<MenuModel> GetBll()
        {
            return bll;
        }

        /// <summary>
        /// 查询条件获取
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected override Dictionary<string, string> GetQueryParam(HttpContext context)
        {
            Dictionary<string, string> queryParam = base.GetQueryParam(context);
            queryParam.Add("types", "'1','2'");
            return queryParam;
        }

        /// <summary>
        /// 提交方法的参数获取
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        protected override MenuModel GetSubmitParam(HttpRequest request)
        {
            MenuModel model = base.GetSubmitParam(request);
            if (string.IsNullOrEmpty(model.F_ParentId) || model.F_ParentId == "0")
            {
                model.F_Type = 1;   //如果没有父级，则为模块。
            }
            else
            {
                model.F_Type = 2;   //如果有父级，则为功能。
            }

            return model;
        }

        /// <summary>
        /// 检测菜单编号是否已存在
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string IsExsitMenuCode(HttpContext context)
        {
            string fCode = context.Request["fCode"];
            string fId = context.Request["fId"];

            bool result = bll.IsExsitMenuCode(fCode, fId);
            if (result)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该角色已存在！");
            }
            else
            {
                return SuccessResult("true");
            }
        }
    }
}