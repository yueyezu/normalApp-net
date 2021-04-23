<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LT.WebApp._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mini轻量系统框架</title>
    <!-- jquery -->
    <script src="Resources/js/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- easyUI -->
    <link href="Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="Resources/js/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="Resources/js/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/easyuiExt.css" rel="stylesheet" type="text/css" />
    <script src="Resources/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="Resources/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <!-- commonJs -->
    <link href="Resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script src="Resources/js/custom/common.js" type="text/javascript"></script>

    <!-- 前台缓存 -->
    <script src="Resources/js/custom/clientcache.js" type="text/javascript"></script>

    <!-- customer css -->
    <link id="themeColor" href="Resources/css/default/theme.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #menuPanel .tree-file, #menuPanel .tree-folder, #menuPanel .tree-folder-open {
            background: none;
        }
    </style>
</head>
<body class="easyui-layout" id="layout-body">
    <div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
        <img src="Resources/img/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" alt="加载中。。。" />
    </div>
    <!--头部标题部分-->
    <div data-options="region:'north'" class="lt-header">
        <div class="float-left" style="margin: 5px 0">
            <img src="Resources/img/logo.png" style="vertical-align: middle;" />
            <span id="shrink" style="cursor: pointer; vertical-align: middle; display: inline-block;">
                <img id="imgCollapse" src="Resources/img/switch_left.png" />
                <img id="imgExpand" src="Resources/img/switch_right.png" style="display: none;" />
            </span>
        </div>
        <div class="float-right" style="margin: 13px 0">
            <ul class="lt-header-menu">
                <li>
                    <a id="btnLogout" class="easyui-menubutton" href="javascript:void(0);" data-options="iconCls:'icon-menu-logout',hasDownArrow:false">退出</a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#menuTheme',iconCls:'icon-menu-theme'">主题</a>
                    <div id="menuTheme" class="easyui-menu" style="width: 80px;">
                        <div data-type="default" data-options="iconCls:'icon-theme-light-blue'">浅蓝色</div>
                        <div data-type="green" data-options="iconCls:'icon-theme-light-green'">浅绿色</div>
                        <div data-type="black" data-options="iconCls:'icon-theme-gray-black'">黑色</div>
                        <div data-type="purple" data-options="iconCls:'icon-theme-purple'">紫色</div>
                    </div>
                </li>
                <li>
                    <a id="btnUserMenu" href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#menuUser',iconCls:'icon-menu-user'">user</a>
                    <div id="menuUser" class="easyui-menu" style="width: 80px;">
                        <div id="btnUserMessage" data-options="iconCls:'icon-personal-information'">个人信息</div>
                        <div id="btnChangePwd" data-options="iconCls:'icon-pswMod'">修改密码</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>

    <!--功能列表部分-->
    <div id="menuBody" data-options="region:'west',split:true" style="width: 220px; border-width: 1px">
        <div id="menuPanel" class="easyui-accordion" data-options="fit:true">
        </div>
    </div>

    <!--中央主功能区-->
    <div data-options="region:'center'">
        <div id="tab-tools">
            <a id="selectHome" href="javascript:void(0)" style="margin-top: 4px" title="首页" class="easyui-linkbutton" plain="true"><span class="fa fa-home" style="padding: 3px 2px; margin: 0"></span></a>
            <a id="refreshTab" href="javascript:void(0)" style="margin-top: 4px" title="刷新" class="easyui-linkbutton" plain="true"><span class="fa fa-refresh" style="padding: 3px 2px; margin: 0; font-size: 14px!important;"></span></a>
            <a href="javascript:void(0)" style="margin-top: 4px" class="easyui-menubutton" data-options="menu:'#menuCloseTab',hasDownArrow:false"><span class="fa fa-ellipsis-h" style="padding: 3px 2px; margin: 0"></span></a>
            <div id="menuCloseTab" class="easyui-menu" style="width: 40px;">
                <div id="closeAllTab">关闭全部</div>
                <div id="closeOtherTab">关闭其他</div>
                <div id="closeCurrentTab">关闭当前</div>
            </div>
        </div>
        <div id="allTab" class="easyui-tabs" data-options="fit:true,tools:'#tab-tools'">
            <div title="首页" data-options="href:'WebApp/HomePage.htm',closable:false,selected:true,fit:true,iconCls:'fa fa-home'">
            </div>
            <div id="tabs-menu" class="easyui-menu" style="width: 100px; display: none">
                <div data-options="name:'homepage'">首页</div>
                <div data-options="name:'refresh'">刷新</div>
                <div data-options="name:'closeall'">全部关闭</div>
                <div data-options="name:'closeother'">关闭其他</div>
                <div data-options="name:'closepresent'">关闭当前</div>
            </div>
        </div>
    </div>
    <div data-options="region:'south'" style="height: 32px; line-height: 30px; background: #f7f7f7; border-top-width: 1px;">
        <span style="float: left; padding-left: 1%; width: 30%; text-align: left;">当前用户：uesr</span>
        <span style="float: left; width: 38%; text-align: center;">版权所有 © 2014-2017 励图高科信息技术有限公司</span>
        <span style="float: right; padding-right: 1%; width: 30%; text-align: right;">版本：v2.2.4</span>
    </div>
</body>
<script src="WebMaster/Default.js" type="text/javascript"></script>
</html>
