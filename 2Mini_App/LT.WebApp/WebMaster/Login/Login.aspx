<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LT.WebApp.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<link rel="Shortcut Icon" href="/minlogo.ico" />--%>
    <title>系统登录</title>
    <!-- jquery -->
    <script src="../../Resources/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../Resources/js/jquery/jquery.md5.js" type="text/javascript"></script>
    <script src="../../Resources/js/jquery/jquery.cookie.js" type="text/javascript"></script>
    <!-- easyUI -->
    <link href="../../Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../Resources/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../Resources/css/easyuiExt.css" rel="stylesheet" type="text/css" />
    <script src="../../Resources/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../Resources/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <!-- commonjs -->
    <link href="../../Resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="../../Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="../../Resources/js/custom/common.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="login.css" />
    <script type="text/javascript">
        var licenceMsg = '<%=licenceMsg %>';
        $(function () {
            $('#loginbody').css('height', $(window).height() - 200);
        });
    </script>
</head>
<body>
    <div class="login-header">
        <img src="img/logo.png" />
    </div>
    <div id="loginbody" class="login-body">
        <div class="login-pnl">
            <form id="loginForm" class="formCls" method="post">
                <div>
                    <i style="background: url(img/user.png) left center no-repeat;"></i>
                    <input id="account" name="account" placeholder="用户名" />
                </div>
                <div>
                    <i style="background: url(img/password.png) left center no-repeat;"></i>
                    <input type="password" id="password" name="password" placeholder="登录密码" />
                </div>
                <div style="border: none">
                    <input id="verifyCode" name="verifyCode" style="width: 120px; text-indent: 10px;" placeholder="验证码" />
                    <img id="verifyCodeImg" style="width: 100px;" src="../../Ashx/Master.ashx?action=GetVerifyCode" />
                </div>
                <div style="text-align: center; border: none">
                    <a id="btnLogin">登录</a><br />
                </div>
                <div style="text-align: center; line-height: 20px; border: none">
                    <a id="btnforgetPwd">忘记密码？</a>
                </div>
            </form>
        </div>
    </div>
    <div class="login-foot">
        版权所属青岛励图高科信息技术有限公司
    </div>

    <script type="text/javascript" src="../login.js"></script>
</body>
</html>
