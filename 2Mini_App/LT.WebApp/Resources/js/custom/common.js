/*
*  公共方法文件  @yueye
*   说明：
*   直接查找 JSsection 对不同模块定位
*   目前模块有：常用方法、easyUI默认值、easyUI方法扩展、jquery方法扩展、javascript原型扩展、通用方法、集成小类库
*/

/********************** JSsection start *************************
*  公共的变量
**/
//iframe的父级对象的jquery，如果本身为最高级，则为本身。
var $parent = self.parent.$;
var $top = top.$;   //iframe时最顶级的对象
//var browserType = getBrowserType();   //存放当前浏览器的信息



/*********************** JSsectin start *************************
*  较常用的封装的方法，输出，打开窗口，添加tab页，按钮权限验证等
*　Dependent on jquery, easyui v1.4.5
**/

//日志输方法
function logger(msg) {
    try {
        console.log(msg);
    } catch (e) { }
}
//提示成功信息
function alertSuccess(msg, title, fn) {
    if (typeof title == 'function') {
        fn = title;
        title = null;
    }
    $top.messager.alert(title || '成功', msg, 'info', fn);
}

//提示失败信息
function alertError(msg, title, fn) {
    if (typeof title == 'function') {
        fn = title;
        title = null;
    }
    $top.messager.alert(title || '失败', msg, 'error', fn);
}

//提示提醒信息
function alertWarnning(msg, title, fn) {
    if (typeof title == 'function') {
        fn = title;
        title = null;
    }
    $top.messager.alert(title || '警告', msg, 'warning', fn);
}

//提示信息，带有确定取消
function confirm(msg, fn, title) {
    $top.messager.confirm(title || '提示', msg, fn);
}


if (!$top.winIndex) { $top.winIndex = 0; }
/** 打开一个窗口（不带有按钮），直接嵌入到主窗体中，可只写body部分的代码
 *  打开的窗口都是基于最顶层文档结构，输入值方便，返回值较为麻烦
 *  该方法，不建议使用，如果使用，对于窗口的ID避免系统中出现重复，并且获取数据以及关闭时，采用手动传值方式。具体参考，修改密码界面
 */
function openWindow(options) {
    var defaults = {
        //TODO 后续考虑解决设置的ID重复问题
        id: 'winContent',   //渲染窗体的标签的ID，建议使用win开头，尽量避免重复
        title: '系统窗口',
        url: '',           //窗口文件路径
        wintype: 'normal',   //窗口状态，值有：normal-正常、add-添加、update-修改、view-查看
        width: 820,
        height: 500,
        data: {},           //要传入窗口的值，在窗口中可以调用getWinData方法来获得
        close: null         //窗口关闭时的事件,事件参数包括窗口的id
    }
    options = $.extend(defaults, options);
    options.href = options.url;
    options.onClose = function () {
        options.close && options.close(options.id);
        var winObj = $top('#' + options.id);
        winObj.removeData();
        winObj.remove();
    };

    var winObj = $top('#' + options.id);
    //如果默认的窗体依托标签不存在时，进行初始化创建
    if (0 === winObj.length) {
        winObj = $top('<div id="' + options.id + '" style="overflow:hidden;"></div>');
        $top(top.document.body).append(winObj);
    }

    winObj.data('data', options.data);
    winObj.data('wintype', options.wintype);

    winObj.window(options);
}
/** 打开一个窗口（不带有按钮,全文档加载），完整的文档加载，存在iframe中
 *  打开的窗口都是基于最顶层文档结构，输入值方便，返回值较为麻烦
 */
function openFullWindow(options) {
    var defaults = {
        id: 'winContent',   //渲染窗体的标签的ID，建议使用win开头, 尽量避免重复
        title: '系统窗口',
        url: '',           //窗口文件路径
        wintype: 'normal',   //窗口状态，值有：normal-正常、add-添加、update-修改、view-查看
        width: 820,
        height: 500,
        data: {},           //要传入窗口的值，在窗口中可以调用getWinData方法来获得
        close: null         //窗口关闭时的事件,事件参数包括窗口的id,iframe元素的Id
    }
    options = $.extend(defaults, options);
    options.id += $top.winIndex++;
    var frameId = 'fullwin' + options.id;
    var otherParam = "wintype=" + options.wintype + "&winid=" + options.id;
    options.url = options.url + (options.url.indexOf("?") < 0 ? "?" : "&") + otherParam; //将窗口的状态以及窗口的id信息通过url传到界面中。然后可以通过winid对于窗口的数据进行获取
    options.content = '<iframe id="' + frameId + '" name="' + frameId + '" src="' + options.url + '" frameBorder="0" border="0" scrolling="no" style="width: 100%; height: 100%;"/>';
    options.onClose = function () {
        options.close && options.close(options.id, frameId);
        var winObj = $top('#' + options.id);
        winObj.removeData();
        winObj.remove();
    };

    var winObj = $top('#' + options.id);
    //如果默认的窗体依托标签不存在时，进行初始化创建
    if (0 === winObj.length) {
        winObj = $top('<div id="' + options.id + '" style="overflow:hidden;"></div>');
        $top(top.document.body).append(winObj);
    }

    winObj.data('data', options.data);
    winObj.data('wintype', options.wintype);

    winObj.window(options);
}

/** 加载带有按钮的窗体，按钮在窗体的下方。按钮只有两个，可后续自己扩展
 * 打开的窗口都是基于最顶层文档结构，输入返回值都较为方便，但是处理需要放在index页面
 */
function openBtnWindow(options) {
    var defaults = {
        id: 'winContent',   //渲染窗体的标签的ID，建议使用win开头，尽量避免重复
        title: '系统窗口',
        url: '',           //窗口文件路径
        wintype: 'normal',  //窗口状态，值有：normal-正常、add-添加、edit-修改、view-查看
        width: 820,
        height: 500,
        btnExt: [],         //窗口封装的默认具有"提交"，"取消"两个按钮，新增可以通过该属性
        data: {},           //要传入窗口的值，在窗口中可以调用getWinData方法来获得
        close: null,        //窗口关闭时的事件,参数包括窗口的id,iframe元素的Id
        callBack: null      //点击提交按钮时的回调事件，参数包括窗口的id,iframe元素的Id
    }
    options = $.extend(defaults, options);
    options.id += $top.winIndex++;
    var frameId = 'btnwin' + options.id;
    var otherParam = "wintype=" + options.wintype + "&winid=" + options.id;
    options.url = options.url + (options.url.indexOf("?") < 0 ? "?" : "&") + otherParam; //将窗口的状态以及窗口的id信息通过url传到界面中。然后可以通过winid对于窗口的数据进行获取
    options.content = '<iframe id="' + frameId + '" name="' + frameId + '" src="' + options.url + '" frameBorder="0" border="0" scrolling="no" style="width: 100%; height: 100%;"/>';
    options.onClose = function () {
        options.close && options.close(options.id, frameId);
        var winObj = $top('#' + options.id);
        winObj.removeData();
        winObj.remove();
    };
    //对于按钮进行处理
    var btns = [
        {
            text: '提交', handler: function () {
                options.callBack && options.callBack(options.id, frameId);
            }
        },
        { text: '关闭', handler: function () { closeWindow(options.id); } }
    ];
    btns = defaults.btnExt.concat(btns);
    options.buttons = btns;

    var winObj = $top('#' + options.id);
    //如果默认的窗体依托标签不存在时，进行初始化创建
    if (0 === winObj.length) {
        winObj = $top('<div id="' + options.id + '" style="overflow:hidden;"></div>');
        $top(top.document.body).append(winObj);
    }

    winObj.data('data', options.data);
    winObj.dialog(options);
}

/**  获取窗口的额外值
 *   参数：id:窗口的id
 */
function getWinData(id) {
    //$top(window.frameElement).parent().data();    //iframe类型的也可以支持
    var winObj = $top('#' + id);
    return winObj.data();
}

/*  函数名：关闭相应的窗口
*   参数：id:要关闭的窗口的id
*/
function closeWindow(id) {
    var winObj = $top('#' + id);
    winObj.window('close');
    winObj.removeData();
    winObj.remove();
}


/* 函数名：添加一个选项卡面板
*  参数：title:选项卡的标题，也是选项卡的标识
*        url：选项卡窗口对应的文件
*        param：data：要传入到选项卡的数据，可以通过getTabData方法来进行获取
*/
function addTabs(title, url, param) {
    if (!$('#allTab').tabs('exists', title)) {
        $('#allTab').tabs('add', {
            title: title,
            iconCls: param.iconCls || 'icon-filter',
            content: '<iframe src="' + url + '" name="' + title + '" frameBorder="0" border="0" scrolling="no" style="width: 100%; height: 100%;"/>',
            closable: true
        });
        $("iframe[name=" + title + "]").data('data', param && param.data);
    } else {
        $('#allTab').tabs('select', title);
    }
}
/* 函数名：刷新当前选项卡面板
*  为了保留住面板传入的参数信息，这里只是针对iframe的内容进行更新即可。
*/
function refreshTabs() {    //该例中不使用该方法实现，因为会数据弄丢
    var tab = $('#allTab').tabs("getSelected");
    var title = tab.panel('options').title;
    if (title === '首页') {
        //var url = $(tab.panel('options')).attr('href');
        //$('#allTab').tabs('update', {
        //    tab: tab,
        //    options: {
        //        href: url
        //    }
        //});
        tab.panel('refresh');
    } else {
        var iframe = $top("iframe[name=" + title + "]");
        iframe.attr('src', iframe.attr('src'));
    }
}

/*  
*   函数名：tab内页面调用获取传入的变量的方法
*   参数：:title:tab的标题值
*/
function getTabData(title) {
    var data = $top("iframe[name=" + title + "]").data('data');
    return data;
}

/*
*  函数名：通过tab的信息，获取当前功能的编码信息。
*/
function getActiveFuncCode() {
    var tab = $top('#allTab').tabs('getSelected');
    var title = tab.panel('options').title;
    var funcCode = getTabData(title);
    return funcCode;
}

/*
*  函数名：根据功能的编码，对于功能界面内的所有按钮进行权限的判定
*  参数：funcCode 当前功能的编码
*/
function checkBtnAuthsByCode(funcCode) {
    var funcBtns = $top.ltcache.btnAuths[funcCode];
    var allBtns = $('a[btnauth=true]');
    allBtns.attr('btnauth', 'off');
    if (funcBtns) {
        $.each(funcBtns, function (i, el) {
            allBtns.filter('#' + el.F_Code).attr('btnauth', 'true');
        });
    }
    allBtns.filter('[btnauth=off]').remove();

    //var removeIds = [];
    //$('a[btnauth=true]').each(function (index, dom) {
    //    var btnId = $(dom).attr("id");
    //    var result = false;
    //    if (funcBtns) {
    //        $.each(funcBtns, function (i, o) {
    //            if (o.F_Code == btnId) {
    //                result = true;
    //                return false;
    //            }
    //        });
    //    }
    //    if (!result) {
    //        removeIds.push(btnId);
    //    }
    //});
    //$.each(removeIds, function (i, id) {
    //    $('#' + id).remove();
    //});
}

/*
*  函数名：根据按钮的ID判断该按钮是否具有权限
*  参数：funcCode 按钮所在功能的编码，btnId：要验证按钮的ID
*/
function checkBtnAuthByBtn(funcCode, btnId) {
    var funcBtns = $top.ltcache.btnAuths[funcCode];
    if (funcBtns) {
        var result = false;
        $.each(funcBtns, function (i, o) {
            if (o.F_Code == btnId) {
                result = true;
                return false;
            }
        });
        if (!result) {
            $('#' + btnId).remove();
        }
    }
}

/*********************** JSsection start *************************
*   扩展easyui中的控件方法或修改其默认属性
*   Dependent on easyUI v1.4.5
**/

(function expEasyUI() {
    //window窗体默认属性
    if ($.fn.window) {
        $.fn.window.defaults.resizable = false;
        $.fn.window.defaults.collapsible = false;
        $.fn.window.defaults.minimizable = false;
        $.fn.window.defaults.maximizable = false;
        $.fn.window.defaults.shadow = false;
        $.fn.window.defaults.modal = true;
        $.fn.window.defaults.loadingMessage = '正在加载...';
    }

    //datagrid的默认值进行修改
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.striped = true;
        $.fn.datagrid.defaults.fit = true;
        $.fn.datagrid.defaults.loadMsg = '正在加载...';
        $.fn.datagrid.defaults.rownumbers = true;
        $.fn.datagrid.defaults.singleSelect = true;
        $.fn.datagrid.defaults.pageSize = 15;
        $.fn.datagrid.defaults.pageList = [15, 25, 50];
        $.fn.datagrid.defaults.remoteSort = false;
        $.fn.datagrid.defaults.scrollbarSize = 10;
        $.fn.datagrid.defaults.loadFilter = function (data) {
            if (data.result) {
                if (data.id === "redirect") {
                    top.location.href = data.result;
                }
            }
            if (data.error) {
                alertError(data.error.message);
                return [];
            }
            return data;
        };
    }

    if ($.fn.treegrid) {
        $.fn.treegrid.defaults.fit = true;
        $.fn.treegrid.defaults.loadMsg = '正在加载...';
        $.fn.treegrid.defaults.rownumbers = true;
        $.fn.treegrid.defaults.singleSelect = true;
        $.fn.treegrid.defaults.remoteSort = false;
        $.fn.treegrid.defaults.scrollbarSize = 10;
        $.fn.treegrid.defaults.loadFilter = function (data) {
            if (data.result) {
                if (data.id === "redirect") {
                    top.location.href = data.result;
                }
            }
            if (data.error) {
                alertError(data.error.message);
                return [];
            }
            return data;
        };
    }

    //重写按钮的样式
    if ($.fn.linkbutton) {
        $.fn.linkbutton.defaults.plain = true;
    }

    //对于使用combox如果通过远程获取数据时
    //如果采用的是jsonrpc 2.0协议传输的可以直接进行解析
    //if ($.fn.combobox) {
    //    $.fn.combobox.defaults.loadFilter = function (data) {
    //        if (data.result) { //如果result存在说明是执行正确的反馈
    //            return $.parseJSON(data.result);
    //        } else if (data.error) {
    //            //alertWarnning(data.error.message);
    //            return [];
    //        } else {
    //            return data;
    //        }
    //    };
    //}
})();






/*********************** JSsection start *************************
*  EasyUI控件方法扩展
*  Dependent on easyUI V1.4.5
*/

/*
*  validatebox 扩展文本框验证规则
*/
$.extend($.fn.validatebox.defaults.rules, {
    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
    },
    phone: {
        validator: function (value) {
            var mobileRule = /^(13[0-9]|14[57]|15[0-9]|18[0-9]|17[678])\d{8}$/;
            var telephoneRule = /^\d{3,4}-\d{7,8}$/;
            return mobileRule.test(value) || telephoneRule.test(value);
        },
        message: '请输入手机号码或区号-座机号码'
    }
});
/**
* linkbutton方法扩展  @param {Object} jq
*/
$.extend($.fn.linkbutton.methods, {
    /**
    * 激活选项（覆盖重写）
    * @param {Object} jq
    */
    enable: function (jq) {
        return jq.each(function () {
            var state = $.data(this, 'linkbutton');
            if ($(this).hasClass('l-btn-disabled')) {
                var itemData = state._eventsStore;
                //恢复超链接
                if (itemData.href) {
                    $(this).attr("href", itemData.href);
                }
                //回复点击事件
                if (itemData.onclicks) {
                    for (var j = 0; j < itemData.onclicks.length; j++) {
                        $(this).bind('click', itemData.onclicks[j]);
                    }
                }
                //设置target为null，清空存储的事件处理程序
                itemData.target = null;
                itemData.onclicks = [];
                $(this).removeClass('l-btn-disabled');
            }
        });
    },
    /**
    * 禁用选项（覆盖重写） @param {Object} jq
    */
    disable: function (jq) {
        return jq.each(function () {
            var state = $.data(this, 'linkbutton');
            if (!state._eventsStore)
                state._eventsStore = {};
            if (!$(this).hasClass('l-btn-disabled')) {
                var eventsStore = {};
                eventsStore.target = this;
                eventsStore.onclicks = [];
                //处理超链接
                var strHref = $(this).attr("href");
                if (strHref) {
                    eventsStore.href = strHref;
                    $(this).attr("href", "javascript:void(0)");
                }
                //处理直接耦合绑定到onclick属性上的事件
                var onclickStr = $(this).attr("onclick");
                if (onclickStr && onclickStr != "") {
                    eventsStore.onclicks[eventsStore.onclicks.length] = new Function(onclickStr);
                    $(this).attr("onclick", "");
                }
                //处理使用jquery绑定的事件
                var eventDatas = $(this).data("events") || $._data(this, 'events');
                if (eventDatas["click"]) {
                    var eventData = eventDatas["click"];
                    for (var i = 0; i < eventData.length; i++) {
                        if (eventData[i].namespace != "menu") {
                            eventsStore.onclicks[eventsStore.onclicks.length] = eventData[i]["handler"];
                            $(this).unbind('click', eventData[i]["handler"]);
                            i--;
                        }
                    }
                }
                state._eventsStore = eventsStore;
                $(this).addClass('l-btn-disabled');
            }
        });
    }
});
/*
*  validatebox 验证方法扩展，使用如下：
*  $('#id').validatebox('remove'); //删除验证
*  $('#id').validatebox('reduce'); //恢复验证
*/
$.extend($.fn.validatebox.methods, {
    remove: function (jq, newposition) {
        return jq.each(function () {
            $(this).removeClass("easyui-validatebox validatebox-text validatebox-invalid").unbind('focus').unbind('blur');
        });
    },
    reduce: function (jq, newposition) {
        return jq.each(function () {
            var opt = $(this).data().validatebox.options;
            $(this).addClass("validatebox-text").validatebox(opt);
        });
    }
});
/*
*  datagrid 获取正在编辑状态的行，使用如下：
*  $('#id').datagrid('getEditingRowIndexs'); //获取当前datagrid中在编辑状态的行编号列表
*/
$.extend($.fn.datagrid.methods, {
    getEditingRowIndexs: function (jq) {
        var rows = $.data(jq[0], "datagrid").panel.find('.datagrid-row-editing');
        var indexs = [];
        rows.each(function (i, row) {
            var index = row.sectionRowIndex;
            if (indexs.indexOf(index) == -1) {
                indexs.push(index);
            }
        });
        return indexs;
    }
});
//$.extend($.fn.datagrid.defaults.editors, {
//    datetimebox: {// datetimebox就是你要自定义editor的名称
//        init: function (container, options) {
//            var input = $('<input class="easyuidatetimebox">').appendTo(container);
//            return input.datetimebox({
//                formatter: function (date) {
//                    return new Date(date).format("yyyy-MM-dd hh:mm:ss");
//                }
//            });
//        },
//        getValue: function (target) {
//            return $(target).parent().find('input.combo-value').val();
//        },
//        setValue: function (target, value) {
//            $(target).datetimebox("setValue", value);
//        },
//        resize: function (target, width) {
//            var input = $(target);
//            if ($.boxModel == true) {
//                input.width(width - (input.outerWidth() - input.width()));
//            } else {
//                input.width(width);
//            }
//        }
//    }
//});
/*
*  tabs 控件方法扩展，使用如下：
*  $('#id').tabs('refreshTabs'); //刷新当前tab页
*  $('#id').tabs('allTabs');    //获取当前tabs的所有页
*  $('#id').tabs('closeCurrent'); //关闭当前打开的tab页
*  $('#id').tabs('closeAll');    //关闭所有的tab页，设置了close属性的
*  $('#id').tabs('closeOther'); //关闭除去打开之外所有的tab页
*  $('#id').tabs('closeRight'); //关闭所有右边的tab页
*  $('#id').tabs('closeLeft');  //关闭所有左边的tab页
*/
$.extend($.fn.tabs.methods, {
    refreshTabs: function (jq) {    //该例中不使用该方法实现，因为会数据弄丢
        var tab = $(jq).tabs("getSelected");
        var url = $(tab.panel('options')).attr('href');
        $(jq).tabs('update', {
            tab: tab,
            options: {
                href: url
            }
        });
        tab.panel('refresh');
    },
    allTabs: function (jq) {
        var tabs = $(jq).tabs('tabs');
        var all = [];
        all = $.map(tabs, function (n, i) {
            return $(n).panel('options');
        });
        return all;
    },
    closeCurrent: function (jq) { // 关闭当前
        var currentTab = $(jq).tabs('getSelected'),
            currentTabIndex = $(jq).tabs('getTabIndex', currentTab);
        if (currentTabIndex != 0) {
            $(jq).tabs('close', currentTabIndex);
        }
    },
    closeAll: function (jq) { //关闭全部
        var tabs = $(jq).tabs('allTabs');
        $.each(tabs, function (i, n) {
            if (i != 0) {
                $(jq).tabs('close', n.title);
            }
        });
    },
    closeOther: function (jq) { //关闭除当前标签页外的tab页
        var tabs = $(jq).tabs('allTabs');
        var currentTab = $(jq).tabs('getSelected'),
            currentTabIndex = $(jq).tabs('getTabIndex', currentTab);

        $.each(tabs, function (i, n) {
            if (currentTabIndex != i && i != 0) {
                $(jq).tabs('close', n.title);
            } else {
                $(jq).tabs('select', n.title);
            }
        });
    },
    closeLeft: function (jq) { // 关闭当前页左侧tab页
        var tabs = $(jq).tabs('allTabs');
        var currentTab = $(jq).tabs('getSelected'),
            currentTabIndex = $(jq).tabs('getTabIndex', currentTab);
        var i = currentTabIndex - 1;

        while (i > -1) {
            $(jq).tabs('close', tabs[i].title);
            i--;
        }
    },
    closeRight: function (jq) { // 关闭当前页右侧tab页
        var tabs = $(jq).tabs('allTabs');
        var currentTab = $(jq).tabs('getSelected'),
            currentTabIndex = $(jq).tabs('getTabIndex', currentTab);
        var i = currentTabIndex + 1, len = tabs.length;
        while (i < len) {
            $(jq).tabs('close', tabs[i].title);
            i++;
        }
    }
});
/**
* 给datebox控件扩展一个清空的按钮
*/
$.fn.datebox.defaults.cleanText = '清空';
var buttons = $.extend([], $.fn.datebox.defaults.buttons);
buttons.splice(1, 0, {
    text: function (target) {
        return $(target).datebox("options").cleanText;
    },
    handler: function (target) {
        $(target).datebox("setValue", "");
        $(target).datebox("hidePanel");
    }
});
$.extend($.fn.datebox.defaults, {
    buttons: buttons
});

/**
* 对于EasyUI的表单进行再一次的封装，对协议进行了处理。
* 这里只是对简单的情形进行了处理，如果具有特殊要求，直接采用easyUI原生的方法即可。
*/
$.fn.ltform = function (options) {
    var $element = $(this);
    var thisform = {};
    var defaults = {
        url: '',
        action: '',
        onSubmit: null,
        success: '',
        error: ''
    };
    var submitFunc = null; //提交时设置的方法
    var opt = $.extend(defaults, options);
    opt.url = opt.url;
    $element.form({
        url: opt.url,
        onSubmit: function (param) {
            var isValid = $element.form('validate');
            if (!isValid) {
                $top.messager.progress('close');
                alertWarnning("信息输入有误！");
                return false;
            }
            param.action = opt.action;
            submitFunc && submitFunc(param);
            opt.onSubmit && opt.onSubmit(param);
            return isValid; // 返回false终止表单提交
        },
        success: function (data) {
            //data格式为：
            //  success：{ jsonrpc = "2.0", id = "", result = jsonResult }
            //  error: { jsonrpc = 2.0, error = new { code = 102, message = "上传失败", data = exp.Message }, id = "" }
            $top.messager.progress('close'); // 如果提交成功则隐藏进度条
            var dataObj = $.parseJSON(data);
            if (dataObj.result) {  //如果result存在说明是执行正确的反馈
                if (dataObj.id == "redirect") { //定义特例，如果返回的id为redirect时，认为是跳转的方法，直接执行跳转即可。
                    top.location.href = dataObj.result;
                } else {
                    if (opt.success) {  //判断是否有成功的回调函数，如果有则调用，如果没有则直接输出成功信息
                        opt.success(dataObj.result);
                    } else {
                        alertSuccess(dataObj.result);
                    }
                }
            } else {
                if (dataObj.error && dataObj.error.message) {
                    alertError(dataObj.error.message);
                } else {
                    alertError("提交失败。", "提示");
                }
                opt.error && opt.error();
            }
        }
    });

    thisform.submit = function (submitfun) {
        $top.messager.progress({
            text: '正在提交。。。'
        });
        submitFunc = submitfun;
        $element.submit();
    }
    return thisform;
}





/********************** JSsection start *************************
*  javascript对象原型方法扩展
*/

/******* string扩展  (经测试，在IE下可能不好使，未进行测试) *******/
//去掉前导字符
if (!String.prototype.trimStart) {
    String.prototype.trimStart = function (trimStr) {
        if (!trimStr) { return this; }
        var temp = this;
        while (true) {
            if (temp.substr(0, trimStr.length) != trimStr) {
                break;
            }
            temp = temp.substr(trimStr.length);
        }
        return temp;
    };
}
//去掉末尾字符
if (!String.prototype.trimEnd) {
    String.prototype.trimEnd = function (trimStr) {
        if (!trimStr) {
            return this;
        }
        var temp = this;
        while (true) {
            if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
                break;
            }
            temp = temp.substr(0, temp.length - trimStr.length);
        }
        return temp;
    };
}
//去掉两端字符
if (!String.prototype.trim) {
    String.prototype.trim = function (trimStr) {
        var temp = trimStr;
        if (!trimStr) {
            temp = " ";
        }
        return this.trimStart(temp).trimEnd(temp);
    };
}
/* 扩展startWith方法 
*   检测字符串是否以某字符串开头，是则返回true，否则返回false
*/
if (!String.prototype.startWith) {
    String.prototype.startWith = function (str) {
        if (str == null || str == "" || this.length == 0 || str.length > this.length)
            return false;
        if (this.substr(0, str.length) == str)
            return true;
        else
            return false;
        return true;
    };
}
/* 扩展全部替换方法 
*  对于字符串中共同的字符进行整体替换。
*/
if (!String.prototype.startWith) {
    String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
        if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
            return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
        } else {
            return this.replace(reallyDo, replaceWith);
        }
    }
}
/***********  Array扩展  ************/

/* 查找指定向的下表
*  解决IE８数组不支持indexOf方法的问题, 
*/
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (elt /*, from*/) {
        var len = this.length >>> 0;
        var from = Number(arguments[1]) || 0;
        from = (from < 0)
         ? Math.ceil(from)
         : Math.floor(from);
        if (from < 0)
            from += len;
        for (; from < len; from++) {
            if (from in this &&
          this[from] === elt)
                return from;
        }
        return -1;
    };
}
/** 
* Array对象扩展contains方法，查找数组中项
*/
if (!Array.prototype.contains) {
    Array.prototype.contains = function (item) {
        return RegExp("\\b" + item + "\\b").test(this);
    };
}
/** 
* Array对象扩展insert方法，在指定位置插入项
*/
if (!Array.prototype.insert) {
    Array.prototype.insert = function (index, item) {
        this.splice(index, 0, item);
    };
}



/************  Date扩展  ************/
//格式化日期格式
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
        "S": this.getMilliseconds() // millisecond
    };
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
};

Date.prototype.addDays = function (d) {
    this.setDate(this.getDate() + d);
};
Date.prototype.addWeeks = function (w) {
    this.addDays(w * 7);
};
Date.prototype.addMonths = function (m) {
    var d = this.getDate();
    this.setMonth(this.getMonth() + m);

    if (this.getDate() < d)
        this.setDate(0);
};
Date.prototype.addYears = function (y) {
    var m = this.getMonth();
    this.setFullYear(this.getFullYear() + y);

    if (m < this.getMonth()) {
        this.setDate(0);
    }
};
/**
* 格式化日期
*/
function fmtDate(value) {
    if (!value) {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        value = value.replace(/-/g, "/");   //防止部分IE浏览器下无法转换的问题
        dt = new Date(value);
    }

    return dt.format("yyyy-MM-dd"); //扩展的Date的format方法
};









/********************** JSsection start *************************
*   通用的方法，一些为了简化操作，封装的公共方法
*   Dependent jquery、easyUI
*/

/** 执行一个异步请求,采用json传值方式 by yueye
 *  自己扩展了两个属性：
 *  action: 操作方式，即后台需要调用的方法
 *  progress: 是否显示等待进度条，或者进度条的文本，默认为不显示进度条
 */
function doAjax(options) {
    //这里如果不是使用的mvc之类的结构时，可以考虑进行改变
    var defaluts = {
        url: '',            // 请求路径(require)
        action: '',         // 执行请求的类型(require)
        progress: false,    // 是否显示进度条,默认不显示,也可以直接录入进度条需要显示的文本
        dataType: 'json',
        data: {},           // 参数
        success: null,      // 成功的回调
        error: null         // 可以为失败的提示信息，也可以是失败的回调方法（可为null）
    };
    var opt = $.extend(defaluts, options);
    opt.url = opt.url + (opt.action ? ("?action=" + opt.action) : '');
    var tempSccess = opt.success;
    opt.success = function (data) {
        //data格式为：
        //  success：{ jsonrpc = "2.0", id = "", result = jsonResult }
        //  error: { jsonrpc = 2.0, error = new { code = 102, message = "上传失败", data = exp.Message }, id = "" }
        $top.messager.progress('close'); // 如果提交成功则隐藏进度条
        if (data.result) {  //如果result存在说明是执行正确的反馈
            if (data.id == "redirect") { //定义特例，如果返回的id为redirect时，认为是跳转的方法，直接执行跳转即可。
                top.location.href = data.result;
            } else {
                if (tempSccess) {  //判断是否有成功的回调函数，如果有则调用，如果没有则直接输出成功信息
                    tempSccess(data.result);
                } else {
                    alertSuccess(data.result);
                }
            }
        } else {
            if (data.error && data.error.message) {
                alertError(data.error.message);
            } else {
                alertError("请求失败。", "提示");
            }
        }
    }
    var tempError = opt.error;
    opt.error = function () {
        $top.messager.progress('close'); // 如果提交成功则隐藏进度条
        if (tempError) {
            if (typeof tempError == "string") {
                alertError(tempError);
            } else {
                tempError && tempError(request);
            }
        } else {
            alertError("请求失败。");
        }
    }

    // 显示进度条
    if (opt.progress) {
        $top.messager.progress({
            text: opt.progress == true ? '正在提交。。。' : opt.progress
        });
    }

    $.ajax(opt);
}

/** 函数名：获取元素剩余空间的高度   by yueye
*   参数：jqel：元素的jquery对象
*/
function getSpaceHeight(jqel) {
    var hasfill = 0;
    jqel.children().each(function (index, el) {
        hasfill += $(el).height();
    });

    return jqel.height() - hasfill;
}
/*  函数名：对日期大小进行比较   by yueye
*   参数：开始日期，结束日期，日期字符串的分隔符
*   返回大小比较的结果，1:startdate > enddate; 0:startdate = enddate;-1:startdate < enddate;
*/
function dateCompare(startdate, enddate, splitor) {
    var arr = startdate.split(splitor);
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = enddate.split(splitor);
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes > lktimes) {
        return 1;
    } else if (starttimes == lktimes) {
        return 0;
    } else {
        return -1;
    }

}
/*  判断浏览器类型
*   返回相应浏览器的字符串：ie6\ie7\chrome目前就做了三种，其他需求自己修改扩展
*/
function getBrowserType() {
    var browser = navigator.appName;
    var b_version = navigator.appVersion;
    var version = b_version.split(";");
    var trim_Version = version[1].replace(/[ ]/g, "");
    if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0") {
        return "ie6";
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
        return "ie7";
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE8.0") {
        return "ie8";
    }
    else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE9.0") {
        return "ie9";
    }
    else if (navigator.userAgent.indexOf("Chrome") > -1)
        return "chrome";
}
/*  函数：这里用于获取url参数
*   返回：请求字符串中的参数组成的对象
*/
function requestParam() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        var strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = strs[i].split("=")[1];
        }
    }
    return theRequest;
}
/* 函数：预览图片,可以在选择图片文件后直接将图片展示在相应的img标签内
*  参数：文件选择控件的对象，图像查看的img标签id，图像查看的面板的Id
*/
function previewImage(fileObj, imgPreviewId, divPreviewId) {
    var allowExtention = ".jpg,.bmp,.gif,.png"; // 允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
    var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
    var browserVersion = window.navigator.userAgent.toUpperCase();
    if (allowExtention.indexOf(extention) > -1) {
        if (fileObj.files) {// HTML5实现预览，兼容chrome、火狐7+等
            if (window.FileReader) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
                };
                reader.readAsDataURL(fileObj.files[0]);
            } else if (browserVersion.indexOf("SAFARI") > -1) {
                alert("不支持Safari6.0以下浏览器的图片预览!");
            }
        } else if (browserVersion.indexOf("MSIE") > -1) {
            if (browserVersion.indexOf("MSIE 6") > -1) {// ie6
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
            } else {// ie[7-9]
                fileObj.select();
                if (browserVersion.indexOf("MSIE 9") > -1)
                    // fileObj.blur();
                    // //不加上document.selection.createRange().text在ie9会拒绝访问
                    window.parent.document.body.focus(); // 这里解决了在iframe中document.selection.createRange().text会取到空值的问题
                var newPreview = document.getElementById(divPreviewId + "New");
                if (newPreview == null) {
                    newPreview = document.createElement("div");
                    newPreview.setAttribute("id", divPreviewId + "New");
                    newPreview.style.width = document.getElementById(imgPreviewId).width + "px";
                    newPreview.style.height = document.getElementById(imgPreviewId).height + "px";
                    newPreview.style.border = "solid 1px #d2e2e2";
                }

                newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                var tempDivPreview = document.getElementById(divPreviewId);
                tempDivPreview.parentNode.insertBefore(newPreview, tempDivPreview);
                tempDivPreview.style.display = "none";
            }
        } else if (browserVersion.indexOf("FIREFOX") > -1) {// firefox
            var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
            if (firefoxVersion < 7) {// firefox7以下版本
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());
            } else {// firefox7.0+
                document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));
            }
        } else {
            document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
        }
    } else {
        alert("仅支持" + allowExtention + "为后缀名的文件!");
        fileObj.value = ""; // 清空选中文件
        if (browserVersion.indexOf("MSIE") > -1) {
            fileObj.select();
            document.selection.clear();
        }
        fileObj.outerHTML = fileObj.outerHTML;
    }
}
/* 函数名：获取图片的原始的尺寸，此方法可以继续进行扩展
*  参数：img标签
*/
function getImgMsg(img) {
    var obj = {};
    var image = new Image();
    image.src = img.src;
    obj.width = image.width;
    obj.height = image.height;
    return obj;
}
/* 函数名：图片规范性检查
*  参数：图片的html标签
*/
function imgCheck(img, rate) {
    var imgMsg = getImgMsg(img);
    var height = Math.round(imgMsg.height / 100) * 100;
    var width = Math.round(imgMsg.width / 100) * 100;
    return (width / height) == rate;
}


/********************** JSsection start *************************
*   集成的一些其他类库,以及Jquery方法的扩展
*/

//对于jquery对象的方法进行扩展，每个都有该方法所适用的标签说明，内部做不标签验证。
$.fn.extend({
    /**
    *  datagrid宽度高度自动调整的函数;easyUI相关
    **/
    resizeDataGrid: function (heightMargin, widthMargin, minHeight, minWidth) {
        var height = $(document.body).height() - heightMargin;
        var width = $(document.body).width() - widthMargin;
        height = height < minHeight ? minHeight : height;
        width = width < minWidth ? minWidth : width;
        $(this).datagrid('resize', {
            height: height,
            width: width
        });
    },
    /**
     * 表单序列化，将表单内容序列化为json字符串。
     */
    serializeJson: function () {
        var serializeObj = {};
        var array = this.serializeArray();
        var str = this.serialize();
        $(array).each(
            function () {
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name])) {
                        serializeObj[this.name].push(this.value);
                    } else {
                        serializeObj[this.name] = [serializeObj[this.name], this.value];
                    }
                } else {
                    serializeObj[this.name] = this.value;
                }
            });
        return serializeObj;
    },
    /**
     * 公告栏滚动，文本滚动的实现类
     */
    textSlider: function (options) {
        var defaults = {
            line: 1,            // 一次滚动的行数
            speed: 'normal',    //滚动速度，值有：slow,normal,fast 或者滚动时长的毫秒数
            timer: 2000,        //每次滚动的间隔，毫秒
            minLiNum: 5         //需要滚动的最小列数
        };
        var opts = $.extend(defaults, options);
        this.each(function () {
            var timerId;
            var obj = $(this);
            var $ul = obj.children("ul");
            var $height = $ul.find("li").height();
            var $Upheight = 0 - opts.line * $height;
            obj.hover(function () {
                clearInterval(timerId);
            }, function () {
                timerId = setInterval(moveUp, opts.timer);
            });

            function moveUp() {
                if ($ul.find("li").length > opts.minLiNum) {
                    $ul.animate({ "margin-top": $Upheight }, opts.speed, function () {
                        for (i = 0; i < opts.line; i++) { //只有for循环了才可以设置一次滚动的行数
                            $ul.find("li:first").appendTo($ul);
                        }
                        $ul.css("margin-top", 0);
                    });
                }
            };

            timerId = setInterval(moveUp, opts.timer);
        });
    }
});

//对于jquery的方法进行扩展，这里方法只是依托于jquery下，与jquery并无直接关系
$.extend({
    /** 扩展的等待实例对象
    * 开启: $.loadmask.mask(); $.loadmask.mask('其它提示文字...');
    * 关闭: $.loadmask.unmask();
    */
    loadmask: (function () {
        var $mask, $maskMsg;
        var defMsg = '正在处理，请稍待。。。';
        function init() {
            if (!$mask) {
                $mask = $('<div class="datagrid-mask mymask" style="z-index:9002;" ></div>').appendTo("body");
            }
            if (!$maskMsg) {
                $maskMsg = $('<div class="datagrid-mask-msg mymask" style="z-index:9002;">' + defMsg + '</div>')
                    .appendTo("body").css({ 'font-size': '12px' });
            }

            $mask.css({ width: "100%", height: $(document).height() });
            var scrollTop = $(document.body).scrollTop();
            $maskMsg.css({
                left: ($(document.body).outerWidth(true) - 190) / 2
                , top: (($(window).height() - 45) / 2) + scrollTop
            });
        }
        return {
            mask: function (msg) {
                init();
                $mask.show();
                $maskMsg.html(msg || defMsg).show();
            },
            unmask: function () {
                $mask && $mask.remove();
                $maskMsg && $maskMsg.remove();
            }
        };
    }())
});

