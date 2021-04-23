<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.User.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息管理</title>
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
            <span>关键词：</span>
            <input id="keyword" class="easyui-textbox" />
            <a id="btnQuery" class="easyui-linkbutton"><span class="fa fa-search"></span>查询</a>
            <a id="btnClear" class="easyui-linkbutton"><span class="fa fa-trash"></span>清空</a>
        </div>
    </div>
    <div region="center" data-options="border:false">
        <div id="user-tb">
            <a id="btnAdd" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEdit" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDelete" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
            <a id="btnReset" btnauth="true" class="easyui-linkbutton"><span class="fa fa-refresh"></span>重置密码</a>
            <a id="btnUserRole" btnauth="true" class="easyui-linkbutton"><span class="fa fa-user-secret"></span>赋予角色</a>
        </div>
        <table id="gridUser" style="table-layout: fixed;"></table>
    </div>
    <script type="text/javascript">
        var basePath = "../../../";
        var $gridList = $("#gridUser");
        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.datagrid({
                pagination: true,
                toolbar: '#user-tb',
                url: basePath + 'Ashx/SysManager/UserHandler.ashx?action=FindPageList',
                columns: [[
                    { title: '主键', field: 'F_Id', hidden: true },
                    { title: '帐号', field: 'F_Account', width: 120, align: 'center' },
                    { title: '姓名', field: 'F_RealName', width: 120, align: 'center' },
                    { title: '呢称', field: 'F_NickName', width: 120, align: 'center' },
                    {
                        title: '性别', field: 'F_Sex', width: 50, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 0 ? "女" : "男";
                        }
                    },
                    { title: '组织', field: 'F_OrganizeId', width: 120, align: 'center' },
                    { title: '部门', field: 'F_DepartmentId', width: 120, align: 'center' },
                    { title: '岗位', field: 'F_RoleId', width: 120, align: 'center' },
                    {
                        title: '是否管理员', field: 'F_IsAdmin', width: 80, align: 'center',
                        formatter: function (value, row, index) {
                            return value == 0 ? "否" : "是";
                        }
                    },
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
                    },
                    { title: '排序码', field: 'F_SortNum', width: 60, align: 'center' },
                    {
                        title: '操作', field: 'cz', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            return '<a href="javascript:detail(\'' + row.F_Id + '\')" class="row-operation">详细</a>';
                        }
                    }
                ]],
                onBeforeLoad: function (param) {
                    return getQueryParam(param);
                },
                onDblClickRow: function (index, row) {
                    detail(row.F_Id);
                }
            });

            //查询和清除按钮的操作
            $('#btnQuery').click(function (event) {
                $gridList.datagrid('reload');
            });

            $('#btnClear').click(function (event) {
                $('#keyword').textbox('clear');
            });

            //添加按钮操作
            $('#btnAdd').click(function (event) {
                openFullWindow({
                    id: 'AddFormUser',
                    title: '添加用户信息',
                    url: 'WebApp/SysManager/User/Form.aspx',
                    wintype: 'add',
                    width: 680,
                    height: 500,
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
                    id: "EditFormUser",
                    title: '修改用户信息',
                    url: 'WebApp/SysManager/User/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 680,
                    height: 500,
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
                            url: basePath + 'Ashx/SysManager/UserHandler.ashx',
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

            //赋予角色的操作
            $('#btnUserRole').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行修改项！");
                    return;
                }
                openFullWindow({
                    id: "AddRoleForm",
                    title: '修改用户角色信息',
                    url: 'WebApp/SysManager/User/UserRoleForm.aspx',
                    data: {
                        "fId": selectItem.F_Id,
                        "fName": selectItem.F_Account
                    },
                    width: 300,
                    height: 360,
                    close: function (id, frameId) {
                        $gridList.datagrid('reload');
                    }
                });
            });

            //重置密码按钮操作
            $('#btnReset').click(function (event) {
                var selectItem = $gridList.datagrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行重置的数据！");
                    return;
                }
                confirm("确定重置选择项的密码信息？", function (e) {
                    if (e) {
                        doAjax({
                            url: basePath + 'Ashx/SysManager/UserHandler.ashx',
                            action: "ResetPassword",
                            data: {
                                'fId': selectItem.F_Id,
                                'fName': selectItem.F_RealName,
                            },
                            success: function (msg) {
                                alertSuccess(msg);
                                $gridList.datagrid('reload');
                            }
                        });
                    };
                });
            });

            function getQueryParam(param) {
                param.keyword = $('#keyword').textbox('getValue');
            }
        });

        function detail(id) {
            openFullWindow({
                id: 'userDetailForm',
                title: '用户详细信息',
                url: 'WebApp/SysManager/User/Detail.aspx?fId=' + id,
                width: 690,
                height: 580
            });
        }
    </script>
</body>
</html>
