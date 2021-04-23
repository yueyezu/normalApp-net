/**
* Title:菜单按钮业务处理
* Author: yueye
* Date: 2018/3/1 14:18:38
* Desp:
*/

using LT.Core;
using LT.DAL.System;
using LT.Model.System;

namespace LT.BLL.System
{
    public class MenuButtonBll : FormBll<MenuModel>
    {
        MenuButtonDal dal = new MenuButtonDal();

        public override FormDal<MenuModel> GetDal()
        {
            return dal;
        }


        /// <summary>
        /// 表单信息添加
        /// </summary>
        /// <param name="model">表单信息</param>
        /// <returns></returns>
        public override bool AddForm(MenuModel model)
        {
            model.Create();
            model.F_Type = 3;
            model.F_Layers = string.Format("{0}|#{1}#", model.F_Layers, model.F_Id);

            return GetDal().AddForm(model);
        }
    }
}
