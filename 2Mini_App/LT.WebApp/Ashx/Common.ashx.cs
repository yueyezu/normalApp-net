using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LT.BLL.System;
using LT.Core;
using LT.Model.System;

namespace LT.WebApp.Ashx
{
    /// <summary>
    /// Common 的摘要说明
    /// </summary>
    public class Common : BaseAshx
    {
        /// <summary>
        /// 获取字典的字典项信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string GetDictItems(HttpContext context)
        {
            string dictCode = context.Request["dictCode"];

            DictItemBll dictItemBll = new DictItemBll();
            List<DictItemModel> dictItems = dictItemBll.GetDictItemByDict(dictCode);

            switch (dictCode)
            {
                case "menuTypeDict":    //这个只是预留作参考用，实际使用意义不大，可删除
                    var menuTypeDic = dictItems.Select(t => new { text = t.F_Name, value = t.F_Code });
                    return JsonResult(menuTypeDic);
                    break;

                default:
                    var defaultDict = dictItems.Select(t => new { text = t.F_Name, value = t.F_Code });
                    return JsonResult(defaultDict);
                    break;
            }
        }
    }
}