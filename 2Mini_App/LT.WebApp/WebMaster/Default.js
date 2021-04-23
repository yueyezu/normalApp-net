/*  项目开始的文件 主要用于控制主界面，协调各功能与权限 by yueye 2015-06-13  */
$(function () {
    ltcache.init();  //首先加载系统数据信息，该操作耗时较长。非异步操作。
    $("#btnUserMenu").menubutton({ text: $top.ltcache.userMsg.UserName });
    renderMenus($top.ltcache.menuAuths);    //根据获取的权限信息
    // 如果存在其他相关的初始化信息，这里对该初始化信息继续进行操作。根据实际情况.
    $('#ajax-loader').fadeOut();    //该功能以及界面渲染完成后，关闭初始化等待动画。

    //根据缓存信息，验证如果是初始密码，登录给出修改提醒
    if ($top.ltcache.userMsg.isDefaultPwd == "true") {
        confirm("初始密码，请更改。", function (e) {
            if (e) changePwd();
        });
    }

    // 修改密码
    $('#btnChangePwd').click(function (event) {
        changePwd();
    });

    // 个人信息
    $('#btnUserMessage').click(function (event) {
        openFullWindow({
            id: 'userMessageWin',
            width: 540,
            height: 400,
            url: 'WebMaster/UserMessage.aspx',
            title: '用户信息'
        });
    });

    // 注销系统登录
    $('#btnLogout').click(function (event) {
        confirm("确定要注销登录？", function (e) {
            if (e) {
                doAjax({
                    url: 'Ashx/Master.ashx',
                    action: "Logout",
                    success: function (e) {
                        alertSuccess('注销成功！', function () {
                            window.open('WebMaster/Login/Login.aspx', "_self");
                        });
                    }
                });
            }
        });
    });

    //侧边栏收缩展开
    $("#imgCollapse").click(function () {
        $("#shrink img").toggle();
        $("#layout-body").layout('collapse', 'west');
    });
    $("#imgExpand").click(function () {
        $("#shrink img").toggle();
        $("#layout-body").layout('expand', 'west');
    });

    //跳转到首页
    $("#selectHome").click(function () {
        $("#allTab").tabs("select", "首页");
    });

    //刷新当前tab页
    $("#refreshTab").click(function (e) {
        refreshTabs();
    });

    //关闭所有的tab
    $("#closeAllTab").click(function () {
        $('#allTab').tabs('closeAll');
    });

    //关闭当前页之外所有的tab
    $('#closeOtherTab').click(function () {
        $('#allTab').tabs('closeOther');
    });

    //关闭当前的tab
    $('#closeCurrentTab').click(function () {
        $('#allTab').tabs('closeCurrent');
    });

    //切换主题操作方法
    $('#menuTheme div').click(function () {
        var type = $(this).data('type');
        if (type) {
            $("#themeColor").attr("href", "Resources/css/" + type + "/theme.css");
        }
    });

    //监听右键事件，创建右键菜单
    $('#allTab').tabs({
        onContextMenu: function (e, title, index) {
            e.preventDefault();
            if (index > 0) {
                $('#tabs-menu').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                }).data("tabTitle", title);
            }
        }
    });

    //右键菜单click
    $("#tabs-menu").menu({
        onClick: function (item) {
            switch (item.name) {
                case 'closeall': //关闭所有
                    $('#allTab').tabs('closeAll');
                    break;
                case 'closeother':  //关闭其他
                    $('#allTab').tabs('closeOther');
                    break;
                case 'closepresent'://关闭当前
                    $('#allTab').tabs('closeCurrent');
                    break;
                case 'refresh'://刷新当前页
                    $('#allTab').tabs('refreshTabs');
                    break;
                case 'homepage'://跳转到首页
                    $("#allTab").tabs("select", "首页");
                    break;
            }
        }
    });

    // 修改密码
    function changePwd() {
        openFullWindow({
            id: 'changePwdWin',
            width: 360,
            height: 240,
            url: 'WebMaster/ChangePwd.htm',
            title: '修改用户密码',
            wintype: 'add',
        });
    }

    //根据获取的数据，渲染系统模块与系统菜单
    function renderMenus(allMenus) {
        $.each(allMenus, function (i, menu) {
            var treeId = menu.id + "_menutree";
            $('#menuPanel').accordion('add', {
                title: menu.text,
                iconCls: menu.iconCls,
                content: '<div style="margin: 5px 10px;"><div id="' + treeId + '"></div></div>',
                selected: i === 0 //控制只有第一个选中
            });

            //渲染树结构
            $('#' + treeId).tree({
                data: menu.children,
                animate: true,
                onClick: function (e) {
                    addTabs(e.text, e.url, { iconCls: e.iconCls, data: e.id });
                }
            });
        });
    }
});
