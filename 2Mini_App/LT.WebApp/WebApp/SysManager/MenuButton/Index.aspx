<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Menu.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../../../Resources/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link href="../../../Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/easyuiExt.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../../Resources/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <link href="../../../Resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/custom/common.js" type="text/javascript"></script>
    <title>按钮管理</title>
</head>
<body class="easyui-layout">
    <div region="north" style="overflow: hidden; height: 40px; border-bottom-color: #e5e5e5">
        <div class="queryPanel">
            <span >关&nbsp;&nbsp;键&nbsp;&nbsp;词：</span>
            <input id="keyword" class="easyui-textbox" />
            <a id="btnQueryButton" class="easyui-linkbutton"><span class="fa fa-search"></span>查询</a>
        </div>
    </div>
    <div region="center" data-options="border:false">
        <div id="gridMenuButton-tb">
            <a id="btnAddButton" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEditButton" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDeleteButton" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
        </div>
        <table id="gridMenuButton" style="table-layout: fixed;"></table>
    </div>

    <script type="text/javascript">
        var basePath = "../../../";
        var $gridList = $('#gridMenuButton');

        $(function () {
            var winParam = requestParam();
            var winData = getWinData(winParam.winid).data;   //获取通过封装的data传过来的值
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.datagrid({
                pagination: false, fitColumns: true, toolbar: '#gridMenuButton-tb',
                url: basePath + 'Ashx/SysManager/MenuButtonHandler.ashx?action=FindList',
                columns: [[
                    { title: '主键', field: 'F_Id', width: 55, hidden: true },
                    { title: '名称', field: 'F_Name', width: 150 },
                    { title: '编号', field: 'F_Code', width: 100 },
                    {
                        title: '图标', field: 'F_Icon', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            return '<span style="width:16px;height:16px;display: inline-block;" class="' + value + '"></span>';
                        }
                    },
                    { title: '事件', field: 'F_Event', width: 120 },
                    { title: '排序码', field: 'F_SortNum', width: 60, align: 'center' },
                    {
                        title: '允许删除', field: 'F_EnableDelete', width: 70, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 1 ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>';
                        }

                    }, {
                        title: '有效标志', field: 'F_EnabledFlag', width: 70, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 1 ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>';
                        }
                    }
                ]],
                onBeforeLoad: function (param) {
                    return getQueryParam(param);
                }
            });

            //查询和情况按钮的操作
            $('#btnQueryButton').click(function (event) {
                $gridList.datagrid('load');
            });

            //添加按钮操作
            $('#btnAddButton').click(function (event) {
                openFullWindow({
                    id: 'AddFormMenuButton',
                    title: '添加按钮信息',
                    url: 'WebApp/SysManager/MenuButton/Form.aspx',
                    data: {
                        pFid: winData.fId,
                        fLayers: winData.fLayers
                    },
                    wintype: 'add',
                    width: 560,
                    height: 360,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            //修改按钮的操作
            $('#btnEditButton').click(function (event) {
                var selectItem = $gridList.datagrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行修改项！");
                    return;
                }
                openFullWindow({
                    id: 'EditFormMenuButton',
                    title: '修改按钮信息',
                    url: 'WebApp/SysManager/MenuButton/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 560,
                    height: 360,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            //删除按钮操作
            $('#btnDeleteButton').click(function (event) {
                var selectItem = $gridList.datagrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行删除项！");
                    return;
                }
                confirm("确定要删除选择的项？", function (e) {
                    if (e) {
                        doAjax({
                            url: basePath + 'Ashx/SysManager/MenuButtonHandler.ashx',
                            action: "DeleteForm",
                            data: {
                                'fId': selectItem.F_Id
                            },
                            success: function (msg) {
                                alertSuccess(msg);
                                $gridList.datagrid('reload');
                            }
                        });
                    };
                });
            });

            //获取数据之前对于查询条件进行附加
            function getQueryParam(param) {
                param.keyword = $('#keyword').val();
                param.pFid = winData.fId;
            }
        });
    </script>
</body>
</html>
