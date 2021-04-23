<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Menu.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <title>菜单详细</title>
    <style>
        .formTitle {
            line-height: 40px;
        }
    </style>
</head>
<body>
    <form id="formMenu" class="formCls" method="post" enctype="multipart/form-data">
        <fieldset>
            <table>
                <tr>
                    <th class="formTitle">父级：</th>
                    <td class="formValue">
                        <input id="F_ParentId" name="F_ParentId" class="easyui-combobox" disabled="disabled" />
                    </td>
                    <th class="formTitle">图标：</th>
                    <td class="formValue">
                        <input id="F_Icon" name="F_Icon" class="easyui-textbox" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">编号：</th>
                    <td class="formValue">
                        <input id="F_Code" name="F_Code" class="easyui-textbox" disabled="disabled" />
                    </td>
                    <th class="formTitle">名称：</th>
                    <td class="formValue">
                        <input id="F_Name" name="F_Name" class="easyui-textbox" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">事件：</th>
                    <td class="formValue">
                        <input id="F_Event" name="F_Event" class="easyui-textbox" disabled="disabled" />
                    </td>
                    <th class="formTitle">排序码：</th>
                    <td class="formValue">
                        <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">连接：</th>
                    <td class="formValue" colspan="3">
                        <input id="F_Url" name="F_Url" class="easyui-textbox" style="width: 96%;" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">有效标志：</th>
                    <td class="formValue">
                        <label for='F_EnabledFlag_true'>
                            <input type="radio" id="F_EnabledFlag_true" name="F_EnabledFlag" value="1" checked="checked" disabled="disabled" />是
                        </label>
                        <label for='F_EnabledFlag_false'>
                            <input type="radio" id="F_EnabledFlag_false" name="F_EnabledFlag" value="0" disabled="disabled" />否
                        </label>
                    </td>
                    <th class="formTitle">允许删除：</th>
                    <td class="formValue">
                        <label for='F_EnableDelete_true'>
                            <input type="radio" id="F_EnableDelete_true" name="F_EnableDelete" value="1" checked="checked" disabled="disabled" />是
                        </label>
                        <label for='F_EnableDelete_false'>
                            <input type="radio" id="F_EnableDelete_false" name="F_EnableDelete" value="0" disabled="disabled" />否
                        </label>
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">备注：</th>
                    <td class="formValue" colspan="3">
                        <input id="F_Remark" name="F_Remark" class="easyui-textbox" data-options="multiline:true" style="width: 96%; height: 60px;" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">创建人：</th>
                    <td class="formValue">
                        <input id='F_CreateUserId' name="F_CreateUserId" type="text" class="easyui-textbox" disabled="disabled" />
                    </td>
                    <th class="formTitle">创建时间：</th>
                    <td class="formValue">
                        <input id='F_CreateTime' name="F_CreateTime" type="text" class="easyui-textbox" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th class="formTitle">修改人：</th>
                    <td class="formValue">
                        <input id='F_LastModifyUserId' name="F_LastModifyUserId" type="text" class="easyui-textbox" disabled="disabled" />
                    </td>
                    <th class="formTitle">修改时间：</th>
                    <td class="formValue">
                        <input id='F_LastModifyTime' name="F_LastModifyTime" type="text" class="easyui-textbox" disabled="disabled" />
                    </td>
                </tr>
            </table>
            <input id="F_Type" name="F_Type" type="hidden" data-options="readonly:true" />
            <input id="F_Id" name="F_Id" type="hidden" />
        </fieldset>
    </form>
    <script type="text/javascript">
        var basePath = "../../../";
        var $form = $('#formMenu');

        $(function () {
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段

            //父级选择信息的添加
            $('#F_ParentId').combobox({
                url: basePath + 'Ashx/SysManager/MenuHandler.ashx?action=FindSelectTree',
                required: true,
                loadFilter: function (data) {
                    data.insert(0, { id: '0', text: '(无)' });
                    return data;
                }
            });

            //创建表单
            var nowForm = $form.ltform({
                url: basePath + "Ashx/SysManager/MenuHandler.ashx",
                action: 'SubmitForm',
                success: function (data) {
                    alertSuccess(data, function () {
                        closeWindow(winParam.winid);
                    });
                }
            });

            //获取菜单的详细信息
            doAjax({
                url: basePath + 'Ashx/SysManager/MenuHandler.ashx',
                action: "FindForm",
                data: {
                    'fId': winParam.fId
                },
                success: function (data) {
                    $form.form('load', data);
                }
            });
        });
    </script>
</body>
</html>

