<style type="text/css">
    .queryContent {
        margin: 10px;
    }

        .queryContent input {
            width: 120px;
        }

        .queryContent .textbox {
            margin: 5px;
            margin-right: 20px;
        }
</style>

<div class="queryContent">
    <table>
        <tr>
            <td>
                <span class="span-width">关&nbsp;&nbsp;键&nbsp;词：</span>
                <input class="easyui-textbox">
            </td>
            <td>
                <span class="span-width">用户角色：</span>
                <input class="easyui-combobox">
            </td>
        </tr>
        <tr>
            <td>
                <span class="span-width">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</span>
                <input class="easyui-combobox">
            </td>
            <td>
                <span class="span-width">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</span>
                <input class="easyui-combobox">
            </td>
        </tr>
    </table>
</div>
<div class="btnsPanel">
    <a id="btnQuery" class="easyui-linkbutton btn-color-orange" data-options="iconCls:'icon-advanced-query'">查询</a>
    <a id="btnCancel" class="easyui-linkbutton lastBtn" data-options="iconCls:'icon-close-window'">关闭</a>
</div>
<script>
    $("#btnQuery").click(function () {
        alert(1)
    })
    $('#btnCancel').click(function () {
        closeWindow();
    });
</script>
