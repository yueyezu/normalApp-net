<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRoleForm.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.User.UserRoleForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>赋予角色</title>
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
    <div region="center" style="padding: 5px 10px 0 10px;">
        <div id="roleList"></div>
        <input name="F_Id" id="F_Id" type="hidden" />
        <input name="F_RealName" id="F_RealName" type="hidden" />
    </div>
    <div data-options="region:'south'" class="formBtnsPanel">
        <a id="btnSubmit" class="easyui-linkbutton"><span class="fa fa-check"></span>提交</a>
        <a id="btnCancel" class="easyui-linkbutton"><span class="fa fa-remove"></span>取消</a>
    </div>

    <script>
        var basePath = "../../../";
        var $datalist = $("#roleList");
        $(function () {
            var winParam = requestParam(); //获取url传过来的值，必须有：wintype,winid字段
            var winData = getWinData(winParam.winid);   //获取通过封装的data传过来的值

            $datalist.datalist({
                url: basePath + 'Ashx/SysManager/RoleHandler.ashx?action=FindList&fType=1',
                idField: "F_Id",
                textField: 'F_Name',
                checkbox: true,
                lines: true,
                fit: true,
                singleSelect: false,
                onLoadSuccess: function () {
                    doAjax({
                        url: basePath + 'Ashx/SysManager/UserHandler.ashx',
                        action: "FindUserRoleList",
                        data: {
                            'userId': winData.data.fId
                        },
                        success: function (data) {
                            data = $.parseJSON(data);
                            $.each(data, function (i, r) {
                                $datalist.datalist('selectRecord', r.F_RoleId);
                            });
                        }
                    });
                }
            });

            //提交按钮的操作
            $("#btnSubmit").click(function () {
                var selectItem = $datalist.datalist('getSelections');

                var roleIds = '';
                $.each(selectItem, function (i, r) {
                    roleIds += r.F_Id + ";";
                });
                roleIds = roleIds.trimEnd(';');

                var roleNames = '';
                $.each(selectItem, function (i, r) {
                    roleNames += r.F_Name + ",";
                });
                roleNames = roleNames.trimEnd(',');
                doAjax({
                    url: basePath + "Ashx/SysManager/UserHandler.ashx",
                    action: 'AddUserRole',
                    type: 'post',
                    data: {
                        'roleIds': roleIds,
                        'userId': winData.data.fId,
                        'fName': winData.data.fName,
                        'roleNames': roleNames
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
