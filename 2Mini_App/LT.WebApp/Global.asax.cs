using System;
using System.Web;
using LT.BLL.System;
using LT.Code;
using LT.Core;

namespace LT.WebApp
{
    public class Global : HttpApplication
    {
        private readonly Log myLog = LogFactory.GetLogger("Global");

        protected void Application_Start(object sender, EventArgs e)
        {
            myLog.Info("应用程序启动。。。");

            LtCore.Core.SysInit(ConfigsBll.LoadDbConfig);  //系统核心的初始化程序，该语句删除将影响系统正常运行。
        }

        //这里注释掉，主要是考虑在不登录系统时，不用保持sessionId不变
        //protected void Session_Start(object sender, EventArgs e)
        //{
        //}

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        //protected void Application_AuthenticateRequest(object sender, EventArgs e)
        //{

        //}

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 当当前会话取消时，人为关闭取消、异常取消都会执行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Session_End(object sender, EventArgs e)
        {
            //清理当前用户的登录记录信息
            try
            {
                string sessionId = WebHelper.GetSessionId();
                if (OperatorProvider.AllProvider.ContainsKey(sessionId))    //判断全局中是否存在登录记录
                {
                    var providerMsg = OperatorProvider.RemoveFromAllProvider();

                    //如果不是强制下线，且在全局的缓存中已经不存在该用户的登录信息，则标记该用户为下线状态
                    if (providerMsg != "logout" && !OperatorProvider.AllProvider.ContainsValue(providerMsg))
                    {
                        string[] usermsg = providerMsg.Split('|');
                        new UserLoginBll().LogoutUpdate(usermsg[1]);
                    }
                }
            }
            catch (Exception)
            {
                // ignored
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Application_End(object sender, EventArgs e)
        {
            myLog.Info("应用程序关闭。。。");
        }
    }
}