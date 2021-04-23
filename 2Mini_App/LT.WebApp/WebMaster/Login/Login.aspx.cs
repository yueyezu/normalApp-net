using System;
using LT.Core;

namespace LT.WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        public string licenceMsg = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //验证是否已经登陆过,如果已经登录过，则直接跳转到default界面即可
            if (OperatorProvider.Provider.GetCurrent() != null)
            {
                //当前session在全局的session信息是否被强制下线验证，如果已经强制下线，则返回提示信息。
                if (OperatorProvider.CheckIsNoLogin())
                {
                    OperatorProvider.RemoveFromAllProvider();
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }
                //WebHelper.WriteCookie("LT_login_error", "overdue");
                //string str = "<script type='text/javascript'>top.location.href = '/Login/Index';</script>";
                //filterContext.Result = new ContentResult() { Content = str };
            }
            if (!LtCore.initState)
            {
                string url = "/WebMaster/Error/error.htm?msg=系统初始化错误&detail=请联系管理员，查看系统日志解决";
                Response.Redirect(url);
            }


            if (!Licence.Target.LoginCheckLicence(out licenceMsg))
            {
                string url = "/WebMaster/Error/error.htm?msg=授权验证问题&detail=" + licenceMsg;
                Response.Redirect(url);
            }
        }
    }
}