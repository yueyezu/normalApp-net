<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Role.Index" %>

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
    <div region="north" style="overflow: hidden; height: 40px; border-bottom-color: #e5e5e5">
        <div class="queryPanel">
            <span>关键字：</span>
            <input id="keyword" class="easyui-textbox" />
            <a id="btnQuery" class="easyui-linkbutton"><span class="fa fa-search"></span>查询</a>
        </div>
    </div>
    <div region="center" data-options="border:false">
        <div id="role-tb">
            <a id="btnAdd" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEdit" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDelete" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
            <a id="btnAddMenu" btnauth="true" class="easyui-linkbutton"><span class="fa fa-users"></span>赋予权限</a>
        </div>
        <table id="gridRole" style="table-layout: fixed;"></table>
    </div>
    <script>
        var basePath = "../../../";
        var $gridList = $('#gridRole');
        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.datagrid({
                fitColumns: true,
                showPageList: false,
                pagination: true,
                toolbar: '#role-tb',
                url: basePath + 'Ashx/SysManager/RoleHandler.ashx?action=FindPageList',
                columns: [[
                    { title: '角色编号', field: 'F_Code', width: 100, align: 'center' },
                    { title: '角色名称', field: 'F_Name', width: 100, align: 'center' },
                    {
                        title: '允许删除', field: 'F_EnableDelete', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 1 ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>';
                        }
                    },
                    { title: '排序码', field: 'F_SortNum', width: 60, align: 'center' },
                    {
                        title: '有效标志', field: 'F_EnabledFlag', width: 60, align: 'center',
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
                onDblClickRow: function (index, row) {
                    detail(row.F_Id);
                },
                onBeforeLoad: function (param) {
                    return getQueryParam(param);
                }
            });

            //查询按钮的操作
            $('#btnQuery').click(function (event) {
                $gridList.datagrid('reload');
            });

            //添加按钮操作
            $('#btnAdd').click(function (event) {
                openFullWindow({
                    id: 'AddFormRole',
                    title: '添加角色信息',
                    url: 'WebApp/SysManager/Role/Form.aspx',
                    wintype: 'add',
                    width: 380,
                    height: 360,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            //修改按钮的操作
            $('#btnEdit').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行修改项！");
                    return;
                }
                openFullWindow({
                    id: 'EditFormRole',
                    title: '修改角色信息',
                    url: 'WebApp/SysManager/Role/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 380,
                    height: 360,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            //删除按钮操作
            $('#btnDelete').click(function (event) {
                var selectItem = $gridList.datagrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行删除的数据！");
                    return;
                }
                if (selectItem.F_EnableDelete == 0) {
                    alertWarnning("该数据不允许删除！");
                    return;
                }
                confirm("确定要删除选中数据？", function (e) {
                    if (e) {
                        doAjax({
                            url: basePath + 'Ashx/SysManager/RoleHandler.ashx',
                            action: "DeleteForm",
                            data: {
                                'fId': selectItem.F_Id
                            },
                            success: function (e) {
                                $gridList.datagrid('reload');
                            }
                        });
                    };
                });
            });

            //赋予角色权限的操作
            $('#btnAddMenu').click(function (event) {
                var selectItem = $gridList.datagrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行修改项！");
                    return;
                }
                openFullWindow({
                    id: 'giveRoleForm',
                    title: '赋予角色权限',
                    url: 'WebApp/SysManager/Role/RoleMenuForm.aspx?fId=',
                    data: {
                        "fId": selectItem.F_Id,
                        "fName": selectItem.F_Name
                    },
                    wintype: 'edit',
                    width: 400,
                    height: 500,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            function getQueryParam(param) {
                param.keyword = $('#keyword').val();
                param.fType = 1;
            }

        });
        function detail(id) {
            openFullWindow({
                id: 'roleDetailForm',
                title: '角色详细信息',
                url: 'WebApp/SysManager/Role/Detail.aspx?fId=' + id,
                width: 550,
                height: 360
            });
        }
    </script>
</body>
</html>
