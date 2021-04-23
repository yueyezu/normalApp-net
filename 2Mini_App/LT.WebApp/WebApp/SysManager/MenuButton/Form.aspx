<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Menu.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <title>按钮管理表单</title>
</head>
<body class="easyui-layout">
    <div data-options="region:'center'">
        <form id="formMenuButtom" class="formCls" method="post" enctype="multipart/form-data">
            <fieldset>
                <table>
                    <tr>
                        <th class="formTitle">编号：</th>
                        <td class="formValue">
                            <input id="F_Code" name="F_Code" class="easyui-validatebox" data-options="required:true" />
                        </td>
                        <th class="formTitle">名称：</th>
                        <td class="formValue">
                            <input id="F_Name" name="F_Name" class="easyui-validatebox" data-options="required:true" />
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">图标：</th>
                        <td class="formValue">
                            <input id="F_Icon" name="F_Icon" class="easyui-validatebox" />
                        </td>
                        <th class="formTitle">事件：</th>
                        <td class="formValue">
                            <input id="F_Event" name="F_Event" class="easyui-validatebox" />
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">有效标志：</th>
                        <td class="formValue">
                            <label for='F_EnabledFlag_true'>
                                <input type="radio" id="F_EnabledFlag_true" name="F_EnabledFlag" value="1" checked />是
                            </label>
                            <label for='F_EnabledFlag_false'>
                                <input type="radio" id="F_EnabledFlag_false" name="F_EnabledFlag" value="0" />否
                            </label>
                        </td>
                        <th class="formTitle">允许删除：</th>
                        <td class="formValue">
                            <label for='F_EnableDelete_true'>
                                <input type="radio" id="F_EnableDelete_true" name="F_EnableDelete" value="1" checked />是
                            </label>
                            <label for='F_EnableDelete_false'>
                                <input type="radio" id="F_EnableDelete_false" name="F_EnableDelete" value="0" />否
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">排序码：</th>
                        <td class="formValue">
                            <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">备注：</th>
                        <td class="formValue" colspan="3">
                            <input id="F_Remark" name="F_Remark" class="easyui-textbox" data-options="multiline:true" style="width: 92%; height: 60px;" />
                        </td>
                    </tr>
                </table>
                <input id="F_Type" name="F_Type" type="hidden" data-options="readonly:true" />
                <input id="F_Id" name="F_Id" type="hidden" />
            </fieldset>
        </form>
    </div>
    <div data-options="region:'south'" class="formBtnsPanel">
        <a id="btnSubmit" class="easyui-linkbutton"><span class="fa fa-check"></span>提交</a>
        <a id="btnCancel" class="easyui-linkbutton"><span class="fa fa-remove"></span>取消</a>
    </div>
    <script type="text/javascript">
        var basePath = "../../../";
        var $form = $('#formMenuButtom');

        $(function () {
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段
            var winData = getWinData(winParam.winid);   //获取通过封装的data传过来的值

            //创建表单
            var nowForm = $form.ltform({
                url: basePath + "Ashx/SysManager/MenuButtonHandler.ashx",
                action: 'SubmitForm',
                success: function (data) {
                    alertSuccess(data, function () {
                        closeWindow(winParam.winid);
                    });
                }
            });

            //提交按钮的操作
            $('#btnSubmit').click(function () {
                nowForm.submit(function (param) {
                    param.F_ParentId = winData.data["pFid"];
                    param.F_Layers = winData.data["fLayers"];
                });
            });

            //取消按钮的操作
            $('#btnCancel').click(function () {
                closeWindow(winParam.winid);
            });

            //获取按钮的详细信息
            if (winParam.wintype == "edit") {
                doAjax({
                    url: basePath + 'Ashx/SysManager/MenuButtonHandler.ashx',
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
