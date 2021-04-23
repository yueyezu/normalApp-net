/**
* Title: Web页面窗体的基类
* Author: yueye
* Date: 2018/1/4 17:47:42
* Desp: 对于界面打开的验证以及权限等的验证进行了添加
 * 只有受登录以及授权限制的功能集成该类即可，对于不需要该限制的，直接集成原生的Page类即可。
*/

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using LT.Code;

namespace LT.Core
{
    public class BaseAspxPage : Page
    {
        /// <summary>
        /// 当前的界面的加载前执行的方法。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            //判断当前的session中没用用户登录信息，标示用户未登录，直接调转到登录界面。
            if (OperatorProvider.Provider.GetCurrent() == null)
            {
                Response.Write("<script>top.location.href='/WebMaster/Login/Login.aspx'</script>");
                Response.End();
                //Response.Redirect("/WebMaster/Login/Login.aspx"); //对于iframe的页面,不适合使用
            }

            //当前session在全局的session信息是否被强制下线验证，如果已经强制下线，则返回提示信息。
            if (OperatorProvider.CheckIsNoLogin())
            {
                Response.Redirect("/WebMaster/Offline/offline.htm?msg=您的帐号在其他地方已登录，请重新登录！");
            }

            //当用户登录没有问题后，对当前系统的授权情况进行验证，主要是对于机器码以及授权到期验证。
            string licenceMsg = Licence.Target.PageCheckLicence();
            if (licenceMsg != "true")
            {
                string url = "/WebMaster/Error/error.htm?msg=授权验证问题&detail=" + licenceMsg;
                Response.Redirect(WebHelper.UrlEncode(url));
            }

            //LoadHeader();
        }

        //TODO 暂时预留，后续需要的话进行修改。
        //protected virtual void LoadHeader()
        //{
        //    string headerStr =
        //        "<script src=\"Resources/js/jquery/jquery-1.11.3.min.js\" type=\"text/javascript\"></script>"
        //        + "<link href=\"Resources/js/easyui/themes/icon.css\" rel=\"stylesheet\" type=\"text/css\" />"
        //        + "<link href=\"Resources/js/easyui/themes/default/easyui.css\" rel=\"stylesheet\" type=\"text/css\" />"
        //        + "<link href=\"Resources/css/easyuiExt.css\" rel=\"stylesheet\" type=\"text/css\" />"
        //        + "<script src=\"Resources/js/easyui/jquery.easyui.min.js\" type=\"text/javascript\"></script>"
        //        + "<script src=\"Resources/js/easyui/locale/easyui-lang-zh_CN.js\" type=\"text/javascript\"></script>"
        //        + "<link href=\"Resources/css/common.css\" rel=\"stylesheet\" type=\"text/css\" />"
        //        + "<link href=\"Resources/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\" />"
        //        + "<script src=\"Resources/js/custom/common.js\" type=\"text/javascript\"></script>";

        //    if (Page.Header != null)
        //    {
        //        Page.Header.Controls.AddAt(2, new Literal() { Text = headerStr });
        //    }
        //}
    }
}
