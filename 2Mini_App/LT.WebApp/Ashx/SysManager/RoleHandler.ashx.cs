using LT.BLL.System;
using LT.Code;
using LT.Core;
using LT.Model.System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "角色管理")]
    public class RoleHandler : FormAshx<RoleModel>
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
            model.F_Type = 1;   //类型：1代表角色。
            return model;
        }

        /// <summary>
        /// 检测角色编号是否已存在
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
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该角色编码已存在！");
            }
            else
            {
                return SuccessResult("true");
            }
        }

        /// <summary>
        /// 获取角色的权限信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FindRoleMenuTree(HttpContext context)
        {
            string roleId = context.Request.Params["roleId"];

            List<MenuModel> roleMenus = roleBll.FindRoleMenuTree(roleId);

            var treeList = new List<TreeViewModel>();
            foreach (MenuModel item in roleMenus)
            {
                TreeViewModel treeModel = new TreeViewModel();
                bool hasChildren = roleMenus.Count(t => t.F_ParentId == item.F_Id) != 0;
                treeModel.id = item.F_Id;
                treeModel.text = (item.F_Type == 3 ? "按钮" : "菜单") + "-" + item.F_Name;
                treeModel.value = item.F_Id;
                treeModel.parentId = item.F_ParentId;
                treeModel.isexpand = hasChildren;
                treeModel.complete = true;
                treeModel.iconCls = item.F_Icon;
                treeModel.checkstate = item.F_Remark == "-1" ? 0 : 1;
                treeModel.hasChildren = hasChildren;
                treeList.Add(treeModel);
            }

            return ContentResult(treeList.TreeViewJson());
        }

        /// <summary>
        /// 下拉选择列表获取时，进行数据转化使用。
        /// </summary>
        /// <param name="modelList">当前查询到的数据列表</param>
        /// <returns></returns>
        public override List<ComboSelectModel> ModelListToSelectList(List<RoleModel> modelList)
        {
            List<ComboSelectModel> tempList = modelList.Select(item => new ComboSelectModel()
            {
                id = item.F_Id,
                value = item.F_Id,
                text = item.F_Name
            }).ToList();

            return tempList;
        }


        /// <summary>
        /// 添加角色的权限信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string AddRoleMenu(HttpContext context)
        {
            string menuIds = context.Request.Params["menuIds"];
            string roleId = context.Request.Params["roleId"];
            string roleName = context.Request.Params["roleName"];

            bool result = roleBll.AddRoleMenu(menuIds, roleId);
            if (result)
            {
                string optContent = string.Format("{0}({1})修改权限信息：{2}", roleName, roleId, menuIds);
                AddSysLog("赋予权限", optContent);
                return SuccessResult("修改成功");
            }

            return ErrorResult(JsonRpcErrorEnum.AddError, "修改失败");
        }
    }
}