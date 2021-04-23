<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Menu.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <title>菜单管理</title>
</head>
<body class="easyui-layout">
    <div region="north" style="overflow: hidden; height: 40px; border-bottom-color: #e5e5e5">
        <div class="queryPanel">
            <span>关&nbsp;&nbsp;键&nbsp;&nbsp;词：</span>
            <input id="keyword" class="easyui-textbox" />
            <a id="btnQuery" class="easyui-linkbutton"><span class="fa fa-search"></span>查询</a>
        </div>
    </div>
    <div region="center" data-options="border:false">
        <div id="gridMenu-tb">
            <a id="btnAdd" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEdit" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDelete" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
            <a id="btnMenuManage" btnauth="true" class="easyui-linkbutton"><span class="fa fa-cubes"></span>按钮管理</a>
        </div>
        <table id="gridMenu" style="table-layout: fixed;"></table>
    </div>

    <script type="text/javascript">
        var basePath = "../../../";
        var $gridList = $('#gridMenu');

        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.treegrid({
                striped: true,
                idField: 'F_Id', treeField: 'F_Name',
                fitColumns: true, toolbar: '#gridMenu-tb',
                url: basePath + 'Ashx/SysManager/MenuHandler.ashx?action=FindGridTree',
                columns: [[
                    { title: '主键', field: 'F_Id', width: 55, hidden: true },
                    { title: '父级', field: 'F_ParentId', width: 55, hidden: true },
                    { title: '名称', field: 'F_Name', width: 150 },
                    {
                        title: '类型', field: 'F_Type', width: 80,
                        formatter: function (value, row, index) {
                            return $top.ltcache.dictItems["menuType"][value];
                        }
                    },
                    { title: '编号', field: 'F_Code', width: 100 },
                    {
                        title: '图标', field: 'F_Icon', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            return '<span style="width:16px;height:16px;display: inline-block;" class="' + value + '"></span>';
                        }
                    },
                    //{ title: '位置', field: 'F_Location', width: 120 },
                    { title: '连接', field: 'F_Url', width: 280 },
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

            //查询和情况按钮的操作
            $('#btnQuery').click(function (event) {
                $gridList.treegrid('reload');
            });

            $('#btnClear').click(function (event) {
                $('#keyword').val("");
            });

            //添加按钮操作
            $('#btnAdd').click(function (event) {
                openFullWindow({
                    id: 'AddFormMenu',
                    title: '添加菜单信息',
                    url: 'WebApp/SysManager/Menu/Form.aspx',
                    wintype: 'add',
                    width: 600,
                    height: 400,
                    close: function (id, frameId) {
                        $gridList.treegrid('reload');
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
                    id: 'EditFormMenu',
                    title: '修改菜单信息',
                    url: 'WebApp/SysManager/Menu/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 600,
                    height: 400,
                    close: function (id, frameId) {
                        $gridList.treegrid('reload');
                    }
                });
            });

            //删除按钮操作
            $('#btnDelete').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行删除项！");
                    return;
                }
                if (selectItem.F_EnableDelete == 0) {
                    alertWarnning("该数据不能被删除！");
                    return;
                }
                confirm("确定要删除选择的项？", function (e) {
                    if (e) {
                        treeGridDelete(selectItem.F_Id);
                    };
                });
            });

            //按钮管理的操作
            $('#btnMenuManage').click(function (event) {
                var selectItem = $gridList.treegrid('getSelected');
                if (!selectItem) {
                    alertWarnning("请选择要进行按钮管理的菜单项！");
                    return;
                }
                openFullWindow({
                    id: 'ManageFormMenuButton',
                    title: '菜单按钮管理',
                    url: 'WebApp/SysManager/MenuButton/Index.aspx',
                    data: {
                        fId: selectItem.F_Id,
                        fLayers: selectItem.F_Layers
                    },
                    width: 800,
                    height: 500
                });
            });

            //获取数据之前对于查询条件进行附加
            function getQueryParam(param) {
                param.keyword = $('#keyword').val();
            }

            function treeGridDelete(fId) {
                doAjax({
                    url: basePath + 'Ashx/SysManager/MenuHandler.ashx',
                    action: "DeleteForm",
                    data: {
                        'fId': fId
                    },
                    success: function (msg) {
                        if (msg == "hasChildren") {
                            alertWarnning("当前数据存在下级数据或使用中数据，不允许删除！");
                            //confirm("当前存在关联数据，是否强制删除？<br />强制删除，将会将关联数据一并删除掉！", function (e) {
                            //    if (e) {
                            //        doAjax({
                            //            url: basePath + 'Ashx/SysManager/MenuHandler.ashx',
                            //            action: "DeleteForm",
                            //            data: {
                            //                'fId': fId,
                            //                'cascade': 'true'
                            //            },
                            //            success: function (msg) {
                            //                alertSuccess(msg);
                            //                $gridList.treegrid('reload');
                            //            }
                            //        });
                            //    }
                            //});
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
                id: 'menuDetailForm',
                title: '菜单详细信息',
                url: 'WebApp/SysManager/Menu/Detail.aspx?fId=' + id,
                width: 600,
                height: 460
            });
        }
    </script>
</body>
</html>
