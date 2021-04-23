<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMessage.aspx.cs" Inherits="LT.WebApp.WebMaster.UserMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息</title>
    <!-- jquery -->
    <script src="../../../Resources/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- easyUI -->
    <link href="../../../Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/easyuiExt.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../../Resources/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <!-- commonJs -->
    <link href="../../../Resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/custom/common.js" type="text/javascript"></script>
    <style>
        .formTitle {
            width: 60px;
            line-height: 44px;
        }
    </style>
</head>
<body class="easyui-layout">
    <div data-options="region:'center'">
        <form id="formUserMessage" class="formCls" method="post">
            <table>
                <tr>
                    <th class="formTitle">帐号：</th>
                    <td class="formValue">
                        <input name="F_Account" id="F_Account" type="text" class="easyui-textbox" data-options="required:true,readonly:true" />
                    </td>
                    <th class="formTitle">姓名：</th>
                    <td class="formValue">
                        <input name="F_RealName" id="F_RealName" type="text" class="easyui-textbox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">呢称：</th>
                    <td class="formValue">
                        <input name="F_NickName" id="F_NickName" type="text" class="easyui-textbox" />
                    </td>
                    <th class="formTitle">性别：</th>
                    <td class="formValue">
                        <label for='F_Sex_Man'>
                            <input type="radio" id="F_Sex_Man" name="F_Sex" value="1" checked="checked" />男
                        </label>
                        <label for='F_Sex_WoMan'>
                            <input type="radio" id="F_Sex_WoMan" name="F_Sex" value="0" />女
                        </label>
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">微信：</th>
                    <td class="formValue">
                        <input name="F_WeChat" id="F_WeChat" type="text" class="easyui-textbox" />
                    </td>
                    <th class="formTitle">电话：</th>
                    <td class="formValue">
                        <input name="F_Phone" id="F_Phone" type="text" class="easyui-textbox" data-options="validType:'mobile'" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">邮件：</th>
                    <td class="formValue">
                        <input name="F_Email" id="F_Email" type="text" class="easyui-textbox" data-options="validType:'email'" />
                    </td>
                    <th class="formTitle">生日：</th>
                    <td class="formValue">
                        <input name="F_Birthday" id="F_Birthday" type="text" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">组织：</th>
                    <td class="formValue">
                        <input name="F_OrganizeId" id="F_OrganizeId" type="text" data-options="readonly:true" />
                    </td>
                    <th class="formTitle">部门：</th>
                    <td class="formValue">
                        <input name="F_DepartmentId" id="F_DepartmentId" type="text" data-options="readonly:true" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">岗位：</th>
                    <td class="formValue">
                        <input name="F_RoleId" id="F_RoleId" type="text" data-options="readonly:true" />
                    </td>
                </tr>
            </table>
            <input name="F_Id" id="F_Id" type="hidden" />
            <input id="F_SortNum" name="F_SortNum" type="hidden" />
            <input id="F_IsAdmin" name="F_IsAdmin" type="hidden" />
            <input id="F_EnableDelete" name="F_EnableDelete" type="hidden" />
            <input id="F_EnabledFlag" name="F_EnabledFlag" type="hidden" />
            <input id="F_Remark" name="F_Remark" type="hidden" />
        </form>
    </div>
    <div data-options="region:'south'" class="formBtnsPanel">
        <a id="btnSubmit" class="easyui-linkbutton" data-options="plain:true"><span class="fa fa-check"></span>提交</a>
        <a id="btnCancel" class="easyui-linkbutton" data-options="plain:true"><span class="fa fa-remove"></span>取消</a>
    </div>

    <script type="text/javascript">
        var basePath = "../../../";
        var $form = $("#formUserMessage");

        $(function () {
            var userId = $top.ltcache.userMsg.userId;
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段
            var nowForm = $form.ltform({
                url: basePath + "Ashx/SysManager/UserHandler.ashx",
                action: 'SubmitForm',
                success: function (data) {
                    alertSuccess(data, function () {
                        closeWindow(winParam.winid);
                    });
                }
            });

            //组织信息
            $('#F_OrganizeId').combobox({
                url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx?action=FindSelectList&fType=1',
                width: 175,
                panelHeight: 80,
                editable: false
            });

            //部门信息
            $('#F_DepartmentId').combobox({
                url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx?action=FindSelectList&fType=2',
                width: 175,
                panelHeight: 80,
                editable: false
            });

            //岗位信息
            $('#F_RoleId').combobox({
                url: basePath + 'Ashx/SysManager/RoleHandler.ashx?action=FindSelectList&fType=2',
                width: 175,
                panelHeight: 80,
                editable: false
            });

            doAjax({
                url: basePath + 'Ashx/SysManager/UserHandler.ashx',
                action: "FindForm",
                data: {
                    'fId': userId
                },
                success: function (data) {
                    $form.form('load', data);
                }
            });

            //提交按钮的操作
            $("#btnSubmit").click(function () {
                nowForm.submit();
            });

            //取消按钮的操作
            $('#btnCancel').click(function () {
                closeWindow(winParam.winid);
            });
        });
    </script>
</body>
</html>
