/**********************************
* Title: 框架的相关请求
* Author: yueye
* Date: 2018-01-03
* Desp: 处理框架中的一些方法。
***********************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using LT.BLL.System;
using LT.Code;
using LT.Core;
using LT.Model.System;

namespace LT.WebApp.Ashx
{
    [CheckLogin(false)]
    public class Master : BaseAshx
    {
        private UserBll userBll = new UserBll();
        private UserLoginBll userLoginBll = new UserLoginBll();

        /// <summary>
        /// 获取验证码
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string GetVerifyCode(HttpContext context)
        {
            byte[] codeImg = VerifyCode.Verify.GetVerifyCode();
            return FileResult(context.Response, codeImg, "verifyCode");
        }

        /// <summary>
        /// 验证用户名密码，并检测是否运行登录。
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string CheckLogin(HttpContext context)
        {
            string account = context.Request["account"];
            string password = context.Request["password"];
            string verify = context.Request["verifyCode"];
            string forceLogin = context.Request["forceLogin"] ?? "false";

            //1、对验证码进行校验。
            if (!VerifyCode.Verify.CheckVerifyCode(verify))
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "验证码错误。");
            }

            //2、校验IP登录限制信息
            string thisIp = NetHelper.GetClientIp();
            //TODO 这里Ip限制待实现
            // FilterIPApp filterIpApp = new FilterIPApp();
            // if (!filterIpApp.CheckIpIsEnable(thisIp))
            // {
            //     throw new Exception("当前用户IP被禁止登录，请联系管理员。");
            // }

            //3、获取用户信息。
            UserModel user = userBll.GetUserByAccount(account);
            if (user == null)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "用户不存在！");
            }
            if (user.F_DeleteFlag == 1)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "该用户已被删除！");
            }

            //4、验证用户登录信息。
            UserLoginModel userLogin = userLoginBll.CheckLogin(user.F_Id, password);
            if (userLogin == null)
            {
                return ErrorResult(JsonRpcErrorEnum.BusinessError, "用户登录验证失败，请重试！");
            }

            //5、 单用户登录验证
            #region 单用户登录验证
            string allProviderValue = user.F_Id + "|" + userLogin.F_Id; //全局的用户信息缓存的内容
            if (userLogin.F_MultiUserLogin == 0)
            {
                List<string> nowSessionIds = OperatorProvider.AllProvider
                    .Where(t => t.Value == allProviderValue)
                    .Select(t => t.Key).ToList();
                if (nowSessionIds.Any())
                {
                    if (forceLogin == "false")
                    {
                        //如果已经登陆，则提示已经登陆，是否强制登录。
                        return SuccessResult("hasLogin");
                    }

                    //如果强制登录，则直接将其他登录用户修改为以下线状态
                    foreach (string nowSessionId in nowSessionIds)
                    {
                        MyLog.Debug(nowSessionId + "设置为强制下线");
                        OperatorProvider.AllProvider[nowSessionId] = "logout";
                    }
                }
            }

            #endregion

            //6、用户登录成功后，将登录的最新信息更新到数据库
            userLoginBll.LoginUpdate(userLogin);

            //7、缓存当前操作用户信息
            #region 缓存当前操作用户信息

            OperatorModel op = new OperatorModel();
            op.UserId = user.F_Id;
            op.UserCode = user.F_Account; //帐号
            op.UserName = user.F_NickName; //昵称
            op.UserPhoto = user.F_HeadIcon; //头像
            op.CompanyId = user.F_OrganizeId; //组织架构
            op.DepartmentId = user.F_DepartmentId; //部门
            op.RoleId = user.F_RoleId; //岗位
            op.LoginIpAddress = thisIp;
            op.LoginIpAddressName = NetHelper.GetLocation(thisIp);
            //operate.LoginToken = DESEncrypt.Encrypt(Guid.NewGuid().ToString());
            op.LoginToken = userLogin.F_Id;
            op.LoginTime = DateTime.Now;
            op.IsSystem = Convert.ToBoolean(user.F_IsAdmin); //是否是管理员
            //这里判定是否是初始密码实现方案有两个：
            //1、 根据配置的默认密码与当前密码进行对比，进行提醒。但是如果配置修改后，对于之前的密码无法做到有效检测。
            //2、 根据密码修改的时间进行判定，如果密码修改时间不存在，则认为是未进行修改。此处采用这种。
            op.IsDefaultPwd = userLogin.F_ChangePassTime == null;

            OperatorProvider.Provider.AddCurrent(op);

            #endregion

            //8、将登陆信息缓存到整体变量中
            OperatorProvider.AddToAllProvider(allProviderValue);

            //9、记录系统登录日志
            BaseSysLogModel sysLog = new BaseSysLogModel();
            sysLog.F_System = Configs.GetSetting("systemFlag");
            sysLog.F_Module = "登录注销";
            sysLog.F_OptType = "登录";
            sysLog.F_OptContent = string.Format("用户{0}({1})登录系统。", op.UserName, op.UserCode);
            SysLogProvider.GetInstance().WirteSysLog(sysLog);

            return SuccessResult("true");
        }

        /// <summary>
        /// 用户注销操作
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public string Logout(HttpContext context)
        {
            OperatorModel op = OperatorProvider.Provider.GetCurrent();

            //日志输出的对象，注销前先构造好，注销完成后，直接输入到日志
            BaseSysLogModel sysLog = new BaseSysLogModel();
            sysLog.F_System = Configs.GetSetting("systemFlag");
            sysLog.F_Module = "登录注销";
            sysLog.F_OptType = "注销";
            sysLog.F_OptContent = string.Format("用户{0}({1})注销系统。", op.UserName, op.UserCode);
            sysLog.F_CreateUserId = op.UserId;

            //删除掉当前session的登录记录信息
            string providerMsg = OperatorProvider.RemoveFromAllProvider();
            //删除掉当前session缓存的信息
            OperatorProvider.Provider.RemoveCurrent();
            if (!OperatorProvider.AllProvider.ContainsValue(providerMsg))   //该帐号注销后，检测是否还有该值得信息存在
            {
                userLoginBll.LogoutUpdate(op.LoginToken);
            }

            //记录注销登录日志
            SysLogProvider.GetInstance().WirteSysLog(sysLog);

            return SuccessResult("注销成功！");
        }

        #region 系统缓存信息获取

        /// <summary>
        /// 返回所有的缓存信息
        /// </summary>
        /// <returns></returns>
        public string LoadAllCache(HttpContext context)
        {
            OperatorModel operatormsg = OperatorProvider.Provider.GetCurrent();
            List<MenuModel> menus = new UserMenuBll().GetUserMenuListByUserId(operatormsg.UserId);
            var caches = new
            {
                userMsg = new
                {
                    userId = operatormsg.UserId,
                    UserName = operatormsg.UserName,
                    userAccount = operatormsg.UserCode,
                    userPhoto = operatormsg.UserPhoto,
                    isDefaultPwd = operatormsg.IsDefaultPwd.ToString().ToLower()
                },
                dictItems = GetDataItemList(),
                menuAuths = GetMenuAuth(menus.FindAll(t => t.F_Type == 1 || t.F_Type == 2), "0"),
                btnAuths = GetButtonAuth(menus.FindAll(t => t.F_Type == 3), menus.FindAll(t => t.F_Type == 2))
            };

            return SuccessResult(caches);
        }

        /// <summary>
        /// 获取所有的字典信息的方法
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, object> GetDataItemList()
        {
            var dicts = new DictBll().GetAllDict();
            var dictItems = new DictItemBll().GetAllDictItem();
            Dictionary<string, object> dictionaryList = new Dictionary<string, object>();
            foreach (DictModel item in dicts)
            {
                var dataItemList = dictItems.FindAll(t => t.F_DictId.Equals(item.F_Id));
                Dictionary<string, string> dictionaryItemList = new Dictionary<string, string>();
                foreach (var itemList in dataItemList)
                {
                    dictionaryItemList.Add(itemList.F_Code, itemList.F_Name);
                }
                if (!dictionaryList.ContainsKey(item.F_Code))
                {
                    dictionaryList.Add(item.F_Code, dictionaryItemList);
                }
            }
            return dictionaryList;
        }

        /// <summary>
        /// 获取权限中模块与功能的列表
        /// </summary>
        /// <param name="data"></param>
        /// <param name="parentId">初始的父ID</param>
        /// <returns></returns>
        private string GetMenuAuth(List<MenuModel> data, string parentId)
        {
            StringBuilder sbJson = new StringBuilder();
            sbJson.Append("[");
            List<MenuModel> entitys = data.FindAll(t => t.F_ParentId == parentId);
            if (entitys.Count > 0)
            {
                foreach (var item in entitys)
                {
                    StringBuilder strJson = new StringBuilder("{");
                    strJson.AppendFormat("\"id\":\"{0}\",\"iconCls\":\"{1}\",", item.F_Code, item.F_Icon);
                    strJson.AppendFormat("\"text\":\"{0}\",\"type\":\"{1}\",", item.F_Name, item.F_Type);
                    strJson.AppendFormat("\"url\":\"{0}\",\"attributes\":\"{1}\"", item.F_Url, item.F_Id);
                    if (data.Exists(t => t.F_ParentId == item.F_Id)) //判断是否有下级元素，有的话才会加入到功能列表中
                    {
                        strJson.AppendFormat(",\"children\":{0}", GetMenuAuth(data, item.F_Id));
                    }
                    sbJson.Append(strJson + "},");
                }
                sbJson = sbJson.Remove(sbJson.Length - 1, 1);
            }
            sbJson.Append("]");
            return sbJson.ToString();
        }

        /// <summary>
        /// 对用户所具有的按钮信息进行剥离，并封装为需要的格式。
        /// </summary>
        /// <param name="allBtns">所有的按钮信息</param>
        /// <param name="allFuncs">所有的功能的列表</param>
        /// <returns></returns>
        private Dictionary<string, object> GetButtonAuth(List<MenuModel> allBtns, List<MenuModel> allFuncs)
        {
            //TODO yueye 目前只是支持功能下只可以列一级的按钮，这里需要考虑如果按钮也是多级别的情况，如何进行处理
            List<string> menus = allBtns.Select(t => t.F_ParentId).Distinct().ToList();
            Dictionary<string, object> dictionary = new Dictionary<string, object>();
            foreach (string item in menus)
            {
                var buttonList = allBtns.Where(t => t.F_ParentId.Equals(item));
                var menuModel = allFuncs.Where(t => t.F_Id == item).FirstOrDefault();
                if (menuModel != null) dictionary.Add(menuModel.F_Code, buttonList);
            }
            return dictionary;
        }

        #endregion
    }
}