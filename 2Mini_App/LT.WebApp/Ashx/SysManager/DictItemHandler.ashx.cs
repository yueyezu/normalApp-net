using LT.BLL.System;
using LT.Core;
using LT.Model.System;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "字典值管理")]
    public class DictItemHandler : TreeAshx<DictItemModel>
    {
        private readonly DictItemBll bll = new DictItemBll();

        /// <summary>
        /// 框架中定义的必须要实现的方法，获取逻辑处理层的对象。
        /// </summary>
        /// <returns></returns>
        public override TreeBll<DictItemModel> GetBll()
        {
            return bll;
        }
    }
}