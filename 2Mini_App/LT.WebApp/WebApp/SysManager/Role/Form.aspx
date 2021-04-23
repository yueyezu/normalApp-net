<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Role.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色管理</title>
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
<body class="easyui-layout">
    <div data-options="region:'center'">
        <form id="formRole" class="formCls" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <th class="formTitle">角色编号：</th>
                    <td class="formValue">
                        <input id='F_Code' name="F_Code" type="text" class="easyui-validatebox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">角色名称：</th>
                    <td class="formValue">
                        <input id='F_Name' name="F_Name" type="text" class="easyui-validatebox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">排序码：</th>
                    <td class="formValue">
                        <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">有效标志：</th>
                    <td class="formValue">
                        <label for='F_EnabledFlag_True'>
                            <input type="radio" id="F_EnabledFlag_True" name="F_EnabledFlag" value="1" checked="checked" />是
                        </label>
                        <label for='F_EnabledFlag_False'>
                            <input type="radio" id="F_EnabledFlag_False" name="F_EnabledFlag" value="0" />否
                        </label>
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">备注：</th>
                    <td class="formValue">
                        <input name="F_Remark" multiline="true" class="easyui-textbox" data-options="width:238,height:80" />
                    </td>
                </tr>
            </table>
            <input name="F_Id" id="F_Id" type="hidden" />
        </form>
    </div>
    <div data-options="region:'south'" class="formBtnsPanel">
        <a id="btnSubmit" class="easyui-linkbutton"><span class="fa fa-check"></span>提交</a>
        <a id="btnCancel" class="easyui-linkbutton"><span class="fa fa-remove"></span>取消</a>
    </div>
    <script type="text/javascript">
        var basePath = "../../../";
        var $form = $('#formRole');

        $(function () {
            var winParam = requestParam(); //获取url传过来的值，必须有：wintype,winid字段

            var nowForm = $form.ltform({
                url: basePath + "Ashx/SysManager/RoleHandler.ashx",
                action: 'SubmitForm',
                success: function (data) {
                    alertSuccess(data, function () {
                        closeWindow(winParam.winid);
                    });
                }
            });
            //提交按钮的操作
            $('#btnSubmit').click(function () {
                doAjax({
                    url: basePath + "Ashx/SysManager/RoleHandler.ashx",
                    action: 'IsExsitRoleCode',
                    data: {
                        fCode: $('#F_Code').val(),
                        fId: $('#F_Id').val()
                    },
                    success: function (e) {
                        nowForm.submit();
                    }
                });
            });

            //取消按钮的操作
            $("#btnCancel").click(function () {
                closeWindow(winParam.winid);
            });

            //获取角色的详细信息
            if (winParam.wintype == "edit") {
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
            }
        });
    </script>
</body>
</html>
