<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Dict.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>字典管理</title>
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
    <div region="north" style="overflow: hidden; height: 40px; border-bottom-color: #e5e5e5">
        <div class="queryPanel">
            <span>关&nbsp;&nbsp;键&nbsp;&nbsp;词：</span>
            <input id="keyword" class="easyui-textbox" />
            <a id="btnQueryDict" class="easyui-linkbutton"><span class="fa fa-search"></span>查询</a>
        </div>
    </div>
    <div region="center" data-options="border:false">
        <div id="gridDict-tb">
            <a id="btnAddDict" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEditDict" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDeleteDict" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
        </div>
        <table id="gridDict" style="table-layout: fixed;"></table>
    </div>

    <script type="text/javascript">
        var basePath = "../../../";
        var $gridList = $("#gridDict");

        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.treegrid({
                idField: 'F_Id', treeField: 'F_Name',
                fitColumns: true, toolbar: '#gridDict-tb',
                url: basePath + 'Ashx/SysManager/DictHandler.ashx?action=FindGridTree',
                columns: [[
                    { title: '名称', field: 'F_Name', width: 100, align: 'center' },
                    { title: '编码', field: 'F_Code', width: 100, align: 'center' },
                    { title: '排序码', field: 'F_SortNum', width: 100, align: 'center' },
                    {
                        title: '允许删除', field: 'F_EnableDelete', width: 100, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 1 ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>';
                        }
                    },
                    {
                        title: '有效标志', field: 'F_EnabledFlag', width: 100, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 1 ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>';
                        }
                    },
                    {
                        title: '操作', field: 'cz', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            return '<a href="javascript:detail(\'' + row.F_Id + '\')" class="row-operation">详细</a>';
                        }
                    }
                ]],
                onBeforeLoad: function (row, param) {
                    return getQueryParam(param);
                },
                onDblClickRow: function (row) {
                    detail(row.F_Id);
                }
            });

            //查询操作
            $('#btnQueryDict').click(function (event) {
                $gridList.treegrid('reload');
            });

            //添加按钮操作
            $('#btnAddDict').click(function (event) {
                openFullWindow({
                    id: 'AddFormDict',
                    title: '添加字典信息',
                    url: 'WebApp/SysManager/Dict/Form.aspx',
                    wintype: 'add',
                    width: 560,
                    height: 320,
                    close: function (id, frameId) {
                        $gridList.treegrid('reload');
                    }
                });
            });

            //修改按钮的操作
            $('#btnEditDict').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行修改项！");
                    return;
                }
                openFullWindow({
                    id: 'EditFormDict',
                    title: '修改字典信息',
                    url: 'WebApp/SysManager/Dict/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 560,
                    height: 320,
                    close: function (id, frameId) {
                        $gridList.treegrid('reload');
                    }
                });
            });

            //删除按钮操作
            $('#btnDeleteDict').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行删除项！");
                    return;
                }
                if (selectItem.F_EnableDelete == 0) {
                    alertWarnning("该数据不能被删除！");
                    return;
                }
                confirm("请确认该字典值是否在使用中！<br />确定要删除选择的项？", function (e) {
                    if (e) {
                        treeDelete(selectItem.F_Id);
                    };
                });
            });

            //获取数据之前对于查询条件进行附加
            function getQueryParam(param) {
                param.keyword = $("#keyword").val();
            }

            function treeDelete(fId) {
                doAjax({
                    url: basePath + 'Ashx/SysManager/DictHandler.ashx',
                    action: "DeleteForm",
                    data: {
                        'fId': fId
                    },
                    success: function (msg) {
                        if (msg == "hasChildren") {
                            alertWarnning("当前数据存在下级数据或者存在字典值数据，不允许删除！");
                        } else {
                            alertSuccess(msg);
                            $gridList.treegrid('reload');
                        }
                    }
                });
            }
        });

        function detail(id) {
            openFullWindow({
                id: 'dictDetailForm',
                title: '字典详细信息',
                url: 'WebApp/SysManager/Dict/Detail.aspx?fId=' + id,
                width: 640,
                height: 380
            });
        }
    </script>
</body>
</html>
