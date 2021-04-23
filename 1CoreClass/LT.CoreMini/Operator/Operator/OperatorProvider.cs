/**
* Title: 用户信息类
* Author: yueye
* Date: 2017-12-13
* Desp: 用于缓存用户session信息的类。
*/

using System;
using System.Collections.Generic;
using System.Linq;
using LT.Code;

namespace LT.Core
{
    public class OperatorProvider
    {
        /// <summary>
        /// 获取当前对象的实例
        /// </summary>
        public static OperatorProvider Provider
        {
            get { return new OperatorProvider(); }
        }

        #region 全局登录信息的操作管理，主要用于控制单用户登录使用。

        /// <summary>
        /// 存储全局的登录信息的缓存变量，存储结构为：
        /// key： sessionId
        /// value: user.F_Id + "|" + userLogin.F_Id
        /// </summary>
        public static Dictionary<string, string> AllProvider = new Dictionary<string, string>();

        /// <summary>
        /// 将用户登录信息插入到当前session中。
        /// </summary>
        /// <param name="allProviderValue"></param>
        public static void AddToAllProvider(string allProviderValue)
        {
            string sessionId = WebHelper.GetSessionId();
            Log logger = LogFactory.GetLogger(typeof(OperatorProvider));
            logger.Debug(sessionId + "加入到全局缓存");

            lock (AllProvider)
            {
                if (AllProvider.ContainsKey(sessionId))
                {
                    AllProvider[sessionId] = allProviderValue;
                }
                else
                {
                    AllProvider.Add(sessionId, allProviderValue);
                }
            }
        }

        /// <summary>
        /// 将当前sessionId的项，在全局登录缓存中删除掉。
        /// 并返回移除项的对应的值信息
        /// </summary>
        public static string RemoveFromAllProvider()
        {
            string sessionId = WebHelper.GetSessionId();
            Log logger = LogFactory.GetLogger(typeof(OperatorProvider));
            logger.Debug(sessionId + "移除全局缓存");

            string providerMsg = null;
            lock (AllProvider)
            {
                if (AllProvider.ContainsKey(sessionId))
                {
                    providerMsg = AllProvider[sessionId];
                    AllProvider.Remove(sessionId);
                }
            }
            return providerMsg;
        }

        /// <summary>
        /// 检测当前session下的用户的登录状态情况
        /// 找不到该session的缓存、对应缓存已经修改为下线状态则返回true，即已经下线。
        /// 否则返回false，即在线。
        /// </summary>
        /// <returns></returns>
        public static bool CheckIsNoLogin()
        {
            string sessionId = WebHelper.GetSessionId();
            lock (AllProvider)
            {
                if (AllProvider.ContainsKey(sessionId))
                {
                    string value = AllProvider[sessionId];
                    if (value == "logout")
                    {
                        return true;
                    }
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// 获取所有在线的用户数，依据SessionID
        /// </summary>
        /// <returns></returns>
        public static int GetAllOnlineUser()
        {
            lock (AllProvider)
            {
                return AllProvider.Count(t => t.Value != "logout");
            }
        }

        #endregion

        #region 登录信息的缓存

        private string LoginUserKey = "lt_loginuserkey";
        private string LoginProvider = Configs.GetSetting("LoginProvider");

        /// <summary>
        /// 获取当前操作人员的信息
        /// </summary>
        /// <returns></returns>
        public OperatorModel GetCurrent()
        {
            OperatorModel operatorModel = new OperatorModel();
            string tempOperator = null;
            if (LoginProvider == "Cookie")
            {
                tempOperator = WebHelper.GetCookie(LoginUserKey);
            }
            else
            {
                tempOperator = WebHelper.GetSession(LoginUserKey);
            }
            if (string.IsNullOrEmpty(tempOperator))
            {
                return null;
            }
            operatorModel = DESEncrypt.Decrypt(tempOperator).ToObject<OperatorModel>();
            return operatorModel;
        }

        /// <summary>
        /// 添加操作者的缓存信息
        /// </summary>
        /// <param name="operatorModel">操作人员</param>
        public void AddCurrent(OperatorModel operatorModel)
        {
            if (LoginProvider == "Cookie")
            {
                WebHelper.WriteCookie(LoginUserKey, DESEncrypt.Encrypt(operatorModel.ToJson()), 60);
            }
            else
            {
                WebHelper.WriteSession(LoginUserKey, DESEncrypt.Encrypt(operatorModel.ToJson()));
            }

            WebHelper.WriteCookie("LT_mac", MD5Encrypt.GetMD5_32(SystemHelper.GetMacByNetworkInterface().ToJson()));
        }

        /// <summary>
        /// 移除当前操作人员信息
        /// </summary>
        public void RemoveCurrent()
        {
            if (LoginProvider == "Cookie")
            {
                WebHelper.RemoveCookie(LoginUserKey.Trim());
            }
            else
            {
                WebHelper.RemoveSession(LoginUserKey.Trim());
            }
        }

        #endregion

    }
}
