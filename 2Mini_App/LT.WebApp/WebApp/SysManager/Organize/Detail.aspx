<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="LT.WebApp.WebApp.SysManager.Organize.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>组织架构详细</title>
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
<body>
    <form id="formOrganize" class="formCls" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th class="formTitle">父级：</th>
                <td class="formValue">
                    <input id="F_ParentId" name="F_ParentId" class="easyui-combobox" data-options="required:true" disabled="disabled" />
                </td>
                <th class="formTitle">编号：</th>
                <td class="formValue">
                    <input id="F_Code" name="F_Code" class="easyui-textbox" data-options="required:true" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">名称：</th>
                <td class="formValue">
                    <input id="F_Name" name="F_Name" class="easyui-textbox" data-options="required:true" disabled="disabled" />
                </td>
                <th class="formTitle">简称：</th>
                <td class="formValue">
                    <input id="F_ShortName" name="F_ShortName" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">组织类型：</th>
                <td class="formValue">
                    <input id="F_Type" name="F_Type" disabled="disabled" />
                </td>
                <th class="formTitle">负责人：</th>
                <td class="formValue">
                    <input id="F_ManagerId" name="F_ManagerId" class="easyui-textbox" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">电话：</th>
                <td class="formValue">
                    <input id="F_Phone" name="F_Phone" class="easyui-textbox" data-options="validType:'mobile'" disabled="disabled" />
                </td>
                <th class="formTitle">联系地址：</th>
                <td class="formValue">
                    <input id="F_Address" name="F_Address" class="easyui-textbox" disabled="disabled" />
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
                <th class="formTitle">排序码：</th>
                <td class="formValue">
                    <input id="F_SortNum" name="F_SortNum" class="easyui-numberspinner" data-options="required:true,min:0" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">备注：</th>
                <td class="formValue" colspan="3">
                    <input id="F_Description" name="F_Description" class="easyui-textbox" data-options="multiline:true" style="width: 460px; height: 60px;" disabled="disabled" />
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
        <input id="F_Id" name="F_Id" type="hidden" />
    </form>
    <script type="text/javascript">
        var basePath = "../../../";
        var $form = $('#formOrganize');

        $(function () {
            var winParam = requestParam();  //获取url传过来的值，必须有：wintype,winid字段
            var winData = getWinData(winParam.winid);   //获取通过封装的data传过来的值

            //获取表单中所需要的基础数据
            $('#F_Type').combobox({
                url: basePath + 'Ashx/Common.ashx?action=GetDictItems&dictCode=organizeType',
                panelHeight: 60,
                required: true
            });

            //父级选择信息的添加
            $('#F_ParentId').combobox({
                url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx?action=FindSelectTree',
                required: true,
                loadFilter: function (data) {
                    data.insert(0, { id: '0', text: '(无)' });
                    return data;
                }
            });

            //创建表单
            var nowForm = $form.ltform({
                url: basePath + "Ashx/SysManager/OrganizeHandler.ashx",
                action: 'SubmitForm',
                success: function (data) {
                    alertSuccess(data, function () {
                        closeWindow(winParam.winid);
                    });
                }
            });


            //获取组织的详细信息
            doAjax({
                url: basePath + 'Ashx/SysManager/OrganizeHandler.ashx',
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

