<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.User.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户详细</title>
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
</head>
<body>
    <form id="formUser" class="formCls" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th class="formTitle">帐号：</th>
                <td class="formValue">
                    <input name="F_Account" id="F_Account" type="text" class="easyui-textbox" data-options="required:true" disabled="disabled" />
                </td>
                <th class="formTitle">姓名：</th>
                <td class="formValue">
                    <input name="F_RealName" id="F_RealName" type="text" class="easyui-textbox" data-options="required:true" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">呢称：</th>
                <td class="formValue">
                    <input name="F_NickName" id="F_NickName" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">性别：</th>
                <td class="formValue">
                    <label for='F_Sex_Man'>
                        <input type="radio" id="F_Sex_Man" name="F_Sex" value="1" checked="checked" disabled="disabled" />男
                    </label>
                    <label for='F_Sex_WoMan'>
                        <input type="radio" id="F_Sex_WoMan" name="F_Sex" value="0" disabled="disabled" />女
                    </label>
                </td>
            </tr>
            <tr>
                <th class="formTitle">微信：</th>
                <td class="formValue">
                    <input name="F_WeChat" id="F_WeChat" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">电话：</th>
                <td class="formValue">
                    <input name="F_Phone" id="F_Phone" type="text" class="easyui-textbox" data-options="validType:'mobile'" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">邮件：</th>
                <td class="formValue">
                    <input name="F_Email" id="F_Email" type="text" class="easyui-textbox" data-options="validType:'email'" disabled="disabled" />
                </td>
                <th class="formTitle">生日：</th>
                <td class="formValue">
                    <input name="F_Birthday" id="F_Birthday" type="text" class="easyui-datebox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">排序码：</th>
                <td class="formValue">
                    <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0" disabled="disabled" />
                </td>
                <th class="formTitle">组织：</th>
                <td class="formValue">
                    <input name="F_OrganizeId" id="F_OrganizeId" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">部门：</th>
                <td class="formValue">
                    <input name="F_DepartmentId" id="F_DepartmentId" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">岗位：</th>
                <td class="formValue">
                    <input name="F_RoleId" id="F_RoleId" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">是否管理员：</th>
                <td class="formValue">
                    <label for='F_IsAdmin_True'>
                        <input type="radio" id="F_IsAdmin_True" name="F_IsAdmin" value="1" checked="checked" disabled="disabled" />是
                    </label>
                    <label for='F_IsAdmin_False'>
                        <input type="radio" id="F_IsAdmin_False" name="F_IsAdmin" value="0" disabled="disabled" />否
                    </label>
                </td>
                <th class="formTitle">允许删除：</th>
                <td class="formValue">
                    <label for='F_EnableDelete_True'>
                        <input type="radio" id="F_EnableDelete_True" name="F_EnableDelete" value="1" checked="checked" disabled="disabled" />允许
                    </label>
                    <label for='F_EnableDelete_False'>
                        <input type="radio" id="F_EnableDelete_False" name="F_EnableDelete" value="0" disabled="disabled" />不允许
                    </label>
                </td>
            </tr>
            <tr>
                <th class="formTitle">有效标志：</th>
                <td class="formValue">
                    <label for='F_EnabledFlag_True'>
                        <input type="radio" id="F_EnabledFlag_True" name="F_EnabledFlag" value="1" checked="checked" disabled="disabled" />是
                    </label>
                    <label for='F_EnabledFlag_False'>
                        <input type="radio" id="F_EnabledFlag_False" name="F_EnabledFlag" value="0" disabled="disabled" />否
                    </label>
                </td>
            </tr>
            <tr>
                <th class="formTitle">备注：</th>
                <td class="formValue" colspan="3">
                    <input name="F_Remark" id="F_Remark" type="text" class="easyui-textbox" data-options="width:480,height:60,multiline:true" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">创建人：</th>
                <td class="formValue">
                    <input id='F_CreateUserId' name="F_CreateUserId" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">创建时间：</th>
                <td class="formValue">
                    <input id='F_CreateTime' name="F_CreateTime" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">修改人：</th>
                <td class="formValue">
                    <input id='F_LastModifyUserId' name="F_LastModifyUserId" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">修改时间：</th>
                <td class="formValue">
                    <input id='F_LastModifyTime' name="F_LastModifyTime" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
        </table>
        <input name="F_Id" id="F_Id" type="hidden" />
    </form>
    <script type="text/javascript">
        var $form = $("#formUser");
        var basePath = "../../../";

        $(function () {
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段

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

            //获取用户的详细信息
            doAjax({
                url: basePath + 'Ashx/SysManager/UserHandler.ashx',
                action: "FindForm",
                data: {
                    'fId': winParam.fId
                },
                success: function (data) {
                    $form.form('load', data);
                }
            });
        });
    </script>
</body>
</html>
