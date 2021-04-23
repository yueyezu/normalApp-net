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
    [FuncMsg("系统管理", "岗位管理")]
    public class QuartersHandler : FormAshx<RoleModel>
    {

        RoleBll roleBll = new RoleBll();

        /// <summary>
        /// 获取表单对象
        /// </summary>
        /// <returns></returns>
        public override FormBll<RoleModel> GetBll()
        {
            return roleBll;
        }

        /// <summary>
        /// 获取查询的参数信息，并转换到dictionary中，该对象直接传输到DAL层。
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected override Dictionary<string, string> GetQueryParam(HttpContext context)
        {
            Dictionary<string, string> queryParams = base.GetQueryParam(context);
            queryParams.Add("fDeleteFlag", "0");    //加上删除的标识，0为未删除
            return queryParams;
        }

        /// <summary>
        /// 提交方法的参数获取
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        protected override RoleModel GetSubmitParam(HttpRequest request)
        {
            RoleModel model = base.GetSubmitParam(request);
            model.F_Type = 2;   //类型：2代表岗位。
            return model;
        }

        /// <summary>
        /// 检测角色/岗位编号是否已存在
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string IsExsitRoleCode(HttpContext context)
        {
            string fCode = context.Request["fCode"];
            string fId = context.Request["fId"];

            bool result = roleBll.IsExsitRoleCode(fCode, fId);
            if (result)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该岗位已存在！");
            }
            else
            {
                return SuccessResult("true");
            }
        }
    }
}