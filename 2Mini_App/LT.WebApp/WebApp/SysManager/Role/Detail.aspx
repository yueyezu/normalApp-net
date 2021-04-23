<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Role.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色详细</title>
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
    <form id="formRoleShow" class="formCls" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th class="formTitle">角色编号：</th>
                <td class="formValue">
                    <input id='F_Code' name="F_Code" type="text" class="easyui-textbox" disabled="disabled" />
                </td>
                <th class="formTitle">角色名称：</th>
                <td class="formValue">
                    <input id='F_Name' name="F_Name" type="text" class="easyui-textbox" disabled="disabled" />
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
                <th class="formTitle">排序码：</th>
                <td class="formValue">
                    <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0" disabled="disabled" />
                </td>
                <th></th>
                <td></td>
            </tr>
            <tr>
                <th class="formTitle">备注：</th>
                <td class="formValue" colspan="3">
                    <input name="F_Remark" multiline="true" class="easyui-textbox" data-options="width:400,height:60" disabled="disabled" />
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
        var basePath = "../../../";
        var $form = $('#formRoleShow');

        $(function () {
            var winParam = requestParam(); //获取url传过来的值，必须有：wintype,winid字段

            //获取用户的详细信息
            doAjax({
                url: basePath + 'Ashx/SysManager/RoleHandler.ashx',
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
