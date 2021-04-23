/**
 * 前端数据缓存的文件
 * @yueye  2017-12-29
 * 对于用户信息、权限信息、字典信息创建缓存对象，缓存对象为全局变量。
 * 提供缓存信息的获取方法。
 * 对于权限信息的验证方法、字典信息的获取方法进行提供。
 **/

var ltcache = (function ($) {
    var cache = {
        userMsg: {
            userId: '0',
            userAccount: '0',
            userName: 'User',
            userPhoto: '',
            isDefaultPwd: false
        },
        getUserId: function () {
            return this.userMsg.userId;
        },
        dictItems: {},
        menuAuths: [],
        btnAuths: []
        //cusCache: {}    //用户自定义缓存存放的位置
    };

    //初始化缓存信息
    cache.init = function () {
        doAjax({
            url: "Ashx/Master.ashx",
            action: "LoadAllCache",
            async: false,
            success: function (e) {
                $.extend(cache.userMsg, e.userMsg);
                cache.dictItems = e.dictItems;
                cache.menuAuths = $.parseJSON(e.menuAuths);
                cache.btnAuths = e.btnAuths;
            }
        });

        $top.ltcache = cache;
    }

    //获取变量信息
    cache.getUserMsg = function () {
        return cache.userMsg;
    }


    /********* start CusCache ************/

    var cusCache = {};  //用户自定义缓存存放的位置
    //在自定义缓存变量中加入缓存数据
    cache.setCache = function (key, value) {
        if (key != undefined) {
            cusCache[key] = value;
        }
    }
    //获取加入的缓存数据
    cache.getCache = function (key) {
        if (key != undefined) {
            return cusCache[key];
        }
        return null;
    }
    //移除缓存数据
    cache.removeCache = function (key) {
        delete cusCache[key];
    }
    //移除所有的缓存
    cache.removeAllCache = function () {
        cusCache = {};
    }

    return cache;
})(jQuery);
