<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Configs.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统配置</title>
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
<body style="height: 100%">
    <div style="border: 1px #bbb solid; width: 600px; height: 90%;">
        <table id="configGrid"></table>
    </div>
    <a id="btnSubmit" btnauth="true" class="easyui-linkbutton" style="margin-left: 550px; margin-top: 8px;"><span class="fa fa-save"></span>保存</a>
    <script>
        var basePath = "../../../";
        var $configGrid = $("#configGrid");

        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $configGrid.propertygrid({
                url: basePath + 'Ashx/SysManager/ConfigsHandler.ashx?action=FindList',
                showGroup: true,
                scrollbarSize: 0,
                fit: true,
                columns: [
                    [
                        { field: 'name', title: '属性', width: 150, sortable: true },
                        { field: 'value', title: '属性值', width: 450, resizable: false }
                    ]
                ]
            });

            $('#btnSubmit').click(function () {
                var changes = $configGrid.propertygrid('getChanges', 'updated');

                var changeArr = [];
                $.each(changes, function (i, row) {
                    changeArr.push({
                        F_Id: row.F_Id,
                        F_Name: row.name,
                        F_Value: row.value
                    });
                });

                doAjax({
                    url: basePath + "Ashx/SysManager/ConfigsHandler.ashx",
                    action: 'SubmitForm',
                    type: 'post',
                    data: {
                        changes: JSON.stringify(changeArr)
                    },
                    success: function (msg) {
                        alertSuccess(msg);
                        $configGrid.propertygrid('acceptChanges');
                    }
                });
            });
        });
    </script>
</body>
</html>
