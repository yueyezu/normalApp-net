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
    [FuncMsg("系统管理", "组织管理")]
    public class OrganizeHandler : TreeAshx<OrganizeModel>
    {
        private readonly OrganizeBll bll = new OrganizeBll();

        /// <summary>
        /// 框架中定义的必须要实现的方法，获取逻辑处理层的对象。
        /// </summary>
        /// <returns></returns>
        public override TreeBll<OrganizeModel> GetBll()
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
            Dictionary<string, string> queryParams = base.GetQueryParam(context);

            return queryParams;
        }
    }
}