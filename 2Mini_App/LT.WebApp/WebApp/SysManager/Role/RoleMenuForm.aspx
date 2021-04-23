<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleMenuForm.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Role.RoleMenuForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>赋予权限</title>
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
    <style type="text/css">
        #roleMenuTree .tree-file, #roleMenuTree .tree-folder, #roleMenuTree .tree-folder-open {
            background: none;
        }
    </style>
</head>
<body class="easyui-layout">
    <div region="center" style="padding: 10px 20px 0 20px;">
        <ul id="roleMenuTree"></ul>
    </div>
    <div data-options="region:'south'" class="formBtnsPanel">
        <a id="btnSubmit" class="easyui-linkbutton"><span class="fa fa-check"></span>提交</a>
        <a id="btnCancel" class="easyui-linkbutton"><span class="fa fa-remove"></span>取消</a>
    </div>
    <script>
        var basePath = "../../../";
        var $tree = $("#roleMenuTree");

        $(function () {
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段
            var winData = getWinData(winParam.winid);   //获取通过封装的data传过来的值
            $tree.tree({
                url: basePath + 'Ashx/SysManager/RoleHandler.ashx?action=FindRoleMenuTree&roleId=' + winData.data.fId,
                checkbox: true
            });


            //提交按钮的操作
            $("#btnSubmit").click(function () {
                var selectItem = $tree.tree('getChecked', ['checked', 'indeterminate']);

                var menuIds = '';
                $.each(selectItem, function (i, r) {
                    menuIds += r.id + ";";
                });
                menuIds = menuIds.trimEnd(';');

                doAjax({
                    url: basePath + "Ashx/SysManager/RoleHandler.ashx",
                    action: 'AddRoleMenu',
                    type:'post',
                    data: {
                        'menuIds': menuIds,
                        'roleId': winData.data.fId,
                        'roleName': winData.data.fName
                    },
                    success: function (msg) {
                        alertSuccess(msg);
                        closeWindow(winParam.winid);
                    }
                });
            });

            //取消按钮的操作
            $("#btnCancel").click(function () {
                closeWindow(winParam.winid);
            });
        });
    </script>
</body>
</html>
