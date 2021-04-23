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
    [FuncMsg("系统管理", "菜单按钮管理")]
    public class MenuButtonHandler : FormAshx<MenuModel>
    {
        MenuButtonBll bll = new MenuButtonBll();
        public override FormBll<MenuModel> GetBll()
        {
            return bll;
        }

        /// <summary>
        /// 获取查询的参数信息，并转换到dictionary中，该对象直接传输到DAL层。
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected override Dictionary<string, string> GetQueryParam(HttpContext context)
        {
            Dictionary<string, string> queryParams = RequestParamToDictionary(context.Request);
            queryParams.Add("type", "3");

            return queryParams;
        }
    }
}