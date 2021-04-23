using LT.BLL.System;
using LT.Core;
using LT.Model.System;
using System.Web;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "字典管理")]
    public class DictHandler : TreeAshx<DictModel>
    {
        private readonly DictBll bll = new DictBll();

        /// <summary>
        /// 框架中定义的必须要实现的方法，获取逻辑处理层的对象。
        /// </summary>
        /// <returns></returns>
        public override TreeBll<DictModel> GetBll()
        {
            return bll;
        }

        /// <summary>
        /// 检测字典编号是否已存在
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string IsExsitDictCode(HttpContext context)
        {
            string fCode = context.Request["fCode"];
            string fId = context.Request["fId"];

            bool result = bll.IsExsitDictCode(fCode, fId);
            if (result)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该字典编号已存在！");
            }
            else
            {
                return SuccessResult("true");
            }
        }
    }
}