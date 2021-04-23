using LT.BLL.System;
using LT.Core;
using LT.Model.System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using LT.Code;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "系统设置")]
    public class ConfigsHandler : BaseAshx
    {
        ConfigsBll configsBll = new ConfigsBll();

        /// <summary>
        /// 获取配置列表信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FindList(HttpContext context)
        {
            List<ConfigsModel> modelList = configsBll.FindList();

            var temp = modelList.Select(t => new
            {
                name = t.F_Name,
                value = t.F_Value,
                group = t.F_Group,
                editor = t.F_ValueType,
                F_Id = t.F_Id,
                F_Key = t.F_Key
            });

            return JsonResult(temp);
        }

        /// <summary>
        /// 修改配置列表信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string SubmitForm(HttpContext context)
        {
            string changes = context.Request.Params["changes"].ToString();
            List<ConfigsModel> changeObj = JsonHelp.ToList<ConfigsModel>(changes).ToList();


            bool result = configsBll.SubmitForm(changeObj);

            if (result)
            {
                //修改配置成功后，写入系统日志
                string optContent = "修改后配置为：";
                foreach (ConfigsModel configsModel in changeObj)
                {
                    optContent += string.Format("{0}:{2}; ", configsModel.F_Name, configsModel.F_Id, configsModel.F_Value);
                }
                AddSysLog("修改", optContent);

                return SuccessResult("修改成功！");
            }

            return ErrorResult(JsonRpcErrorEnum.UpdateError, "修改失败！");
        }
    }
}