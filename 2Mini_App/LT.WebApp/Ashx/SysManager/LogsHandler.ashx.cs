using LT.BLL.System;
using LT.Core;
using LT.Model.System;
using System;
using System.Collections.Generic;
using System.Web;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Log 的摘要说明
    /// </summary>
    public class LogsHandler : BaseAshx
    {
        LogsBll logsBll = new LogsBll();

        /// <summary>
        /// 获取日志列表信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FindPageList(HttpContext context)
        {
            Pagination pagination = new Pagination();
            pagination.rows = Convert.ToInt32(context.Request["rows"]);
            pagination.page = Convert.ToInt32(context.Request["page"]);

            Dictionary<string, string> queryParam = RequestParamToDictionary(context.Request);

            List<LogsModel> modelList = logsBll.FindPageList(queryParam, pagination);   //只是查询菜单项

            var gridlist = new
            {
                total = pagination.records,
                rows = modelList
            };

            return JsonResult(gridlist);
        }

        /// <summary>
        /// 根据Id数组集合删除数据表中的数据
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string DeleteForms(HttpContext context)
        {
            string fIds = context.Request["fIds"];
            bool result = logsBll.DeleteForms(fIds);
            if (result)
            {
                return SuccessResult("删除成功");
            }
            return ErrorResult(JsonRpcErrorEnum.DeleteError, "删除失败！");
        }

        /// <summary>
        /// 清空所有的操作日志信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string ClearLogs(HttpContext context)
        {
            bool result = logsBll.ClearLogs();
            if (result)
            {
                return SuccessResult("操作成功");
            }
            return ErrorResult(JsonRpcErrorEnum.DeleteError, "操作失败！");
        }

        /// <summary>
        /// 获取日志表单信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FindForm(HttpContext context) {
            string fId = context.Request.Params["fId"];

            LogsModel logModel = logsBll.FindForm(fId);

            return SuccessResult(logModel);
        }
    }
}