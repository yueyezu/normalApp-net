using LT.BLL.System;
using LT.Code;
using LT.Core;
using LT.Model.System;
using System.Collections.Generic;
using System.Web;

namespace LT.WebApp.Ashx.SysManager
{
    /// <summary>
    /// Configs 的摘要说明
    /// </summary>
    [FuncMsg("系统管理", "用户管理")]
    public class UserHandler : FormAshx<UserModel>
    {
        UserBll userBll = new UserBll();
        UserLoginBll userLoginBll = new UserLoginBll();

        /// <summary>
        /// 获取表单对象
        /// </summary>
        /// <returns></returns>
        public override FormBll<UserModel> GetBll()
        {
            return userBll;
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
        /// 修改密码
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string ChangePassword(HttpContext context)
        {
            string newPwd = context.Request["newPwd"];
            string oldPwd = context.Request["oldPwd"];

            OperatorModel op = OperatorProvider.Provider.GetCurrent();
            //这里缺少验证密码是否正确
            if (userLoginBll.ChangePwd(oldPwd, newPwd, op.UserId))
            {
                //修改配置成功后，写入系统日志
                string optContent = string.Format("{0}({1})对密码进行了修改", op.UserName, op.UserCode);
                AddSysLog("修改", optContent);
                return SuccessResult("修改成功!");
            }
            else
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "修改失败！");
            }
        }

        /// <summary>
        /// 重置密码
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string ResetPassword(HttpContext context)
        {
            string fId = context.Request["fId"];
            string fName = context.Request["fName"];
            if (userLoginBll.ResetPwd(fId))
            {
                string password = Configs.GetSetting("defaultPassword");
                AddSysLog("重置密码", fName + ": 密码被重置");
                return SuccessResult("密码重置为:" + password);
            }
            else
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "密码重置失败！");
            }
        }

        /// <summary>
        /// 检测用户帐号是否已存在
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string IsExsitUser(HttpContext context)
        {
            string fAccount = context.Request["fAccount"];
            string fId = context.Request["fId"];

            bool result = userBll.IsExsitUser(fAccount, fId);
            if (result)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该用户账号已被使用！");
            }
            else
            {
                return SuccessResult("true");
            }
        }

        /// <summary>
        /// 获取角色列表信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FindUserRoleList(HttpContext context)
        {
            string userId = context.Request.Params["userId"];
            List<UserRoleModel> modelList = userBll.FindUserRoleList(userId);

            return SuccessResult(modelList.ToJson());
        }

        /// <summary>
        /// 添加用户的角色信息
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string AddUserRole(HttpContext context)
        {
            string roleIds = context.Request.Params["roleIds"];
            string userId = context.Request.Params["userId"];
            string fName = context.Request.Params["fName"];
            string roleNames = context.Request.Params["roleNames"];

            bool result = userBll.AddUserRole(roleIds, userId);
            if (result)
            {
                string optContent = string.Format("{0}修改赋予角色：{1}", fName, roleNames);
                AddSysLog("赋予角色", optContent);

                return SuccessResult("修改成功");
            }

            return ErrorResult(JsonRpcErrorEnum.AddError, "修改失败");
        }
    }
}