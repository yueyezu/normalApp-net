<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Organize.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组织架构</title>
    <script src="../../../Resources/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <link href="../../../Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/easyuiExt.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../../Resources/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <link href="../../../Resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="../../../Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="../../../Resources/js/custom/common.js" type="text/javascript"></script>
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
        <div id="gridOrganize-tb">
            <a id="btnAdd" btnauth="true" class="easyui-linkbutton"><span class="fa fa-plus"></span>添加</a>
            <a id="btnEdit" btnauth="true" class="easyui-linkbutton"><span class="fa fa-pencil"></span>修改</a>
            <a id="btnDelete" btnauth="true" class="easyui-linkbutton"><span class="fa fa-remove"></span>删除</a>
        </div>
        <table id="gridOrganize" style="table-layout: fixed;"></table>
    </div>

    <script type="text/javascript">
        var basePath = "../../../";
        var $gridList = $('#gridOrganize');

        $(function () {
            //控制按钮的权限
            var funcCode = getActiveFuncCode();
            checkBtnAuthsByCode(funcCode);

            $gridList.treegrid({
                striped: true,
                idField: 'F_Id', treeField: 'F_Name',
                fitColumns: true, toolbar: '#gridOrganize-tb',
                url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx?action=FindGridTree',
                columns: [[
                    { title: '父级', field: 'F_ParentId', width: 55, hidden: true },
                    { title: '名称', field: 'F_Name', width: 120 },
                    { title: '编号', field: 'F_Code', width: 100 },
                    { title: '简称', field: 'F_ShortName', width: 120 },
                    {
                        title: '类型', field: 'F_Type', width: 80,
                        formatter: function (value, row, index) {
                            return $top.ltcache.dictItems["organizeType"][value];
                        }
                    },
                    { title: '负责人', field: 'F_ManagerId', width: 120 },
                    { title: '电话', field: 'F_Phone', width: 120 },
                    { title: '联系地址', field: 'F_Address', width: 120 },
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
                $('#keyword').setValue("");
            });

            //添加按钮操作
            $('#btnAdd').click(function (event) {
                openFullWindow({
                    id: 'AddFormOrganize',
                    title: '添加组织信息',
                    url: 'WebApp/SysManager/Organize/Form.aspx',
                    wintype: 'add',
                    width: 600,
                    height: 438,
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
                    id: 'EditFormOrganize',
                    title: '修改组织信息',
                    url: 'WebApp/SysManager/Organize/Form.aspx?fId=' + selectItem.F_Id,
                    wintype: 'edit',
                    width: 600,
                    height: 438,
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

            //获取数据之前对于查询条件进行附加
            function getQueryParam(param) {
                param.keyword = $('#keyword').val();
            }

            function treeGridDelete(fId) {
                doAjax({
                    url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx',
                    action: "DeleteForm",
                    data: {
                        'fId': fId
                    },
                    success: function (msg) {
                        if (msg == "hasChildren") {
                            confirm("当前存在关联数据，是否强制删除？<br />强制删除，将会将关联数据一并删除掉！", function (e) {
                                if (e) {
                                    doAjax({
                                        url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx',
                                        action: "DeleteForm",
                                        data: {
                                            'fId': fId,
                                            'cascade': 'true'
                                        },
                                        success: function (msg) {
                                            alertSuccess(msg);
                                            $gridList.treegrid('reload');
                                        }
                                    });
                                }
                            });
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
                id: 'organizeDetailForm',
                title: '组织详细信息',
                url: 'WebApp/SysManager/Organize/Detail.aspx?fId=' + id,
                width: 600,
                height: 480
            });
        }
    </script>
</body>
</html>
