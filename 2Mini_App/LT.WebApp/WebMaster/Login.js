$(function () {
    //对于授权文件验证信息的提示，如果授权一切正常，则不进行提醒
    if (licenceMsg != "true") {
        alertWarnning(licenceMsg);
    }

    //切换验证码操作。 其中支持一个切换验证码的按钮，ID指定为：btnChangeVerifyCode
    $('#btnChangeVerifyCode,#verifyCodeImg').click(function (event) {
        $('#verifyCodeImg').attr('src', '../../Ashx/Master.ashx?action=GetVerifyCode&key=' + Math.random());
    });

    //登录按钮的操作
    $("#btnLogin").click(function (event) {
        loginCheck();
    });

    //录入框的回车按钮的事件，直接登录系统
    $("#account,#password,#verifyCode").keyup(function (event) {
        if (event.keyCode == 13) {
            loginCheck();
        }
    });

    //登录验证的方法，在进行强制登录时，需要通过data来传输标志值
    function loginCheck(data) {
        //录入信息验证
        var account = $('#account').val();
        var password = $('#password').val();
        var verifyCode = $('#verifyCode').val();
        if ($.trim(account) == '' || $.trim(password) == '' || $.trim(verifyCode) == '') {
            alertError("输入内容不完整！");
            return false;
        }

        //开始提交
        $top.messager.progress({ text: '正在提交。。。' });
        var param = $('#loginForm').serializeJson();
        $.extend(param, data);
        param.password = $.md5(param.password); //对于录入的密码进行md5加密后在进行传输
        doAjax({
            url: '../../Ashx/Master.ashx',
            action: 'CheckLogin',
            data: param,
            success: function (data) {
                if (data == "hasLogin") {
                    confirm("当前账户已登录，是否强制登录？", function (e) {
                        if (e) {
                            loginCheck({ forceLogin: "true" });
                        }
                    });
                } else if (data == "true") {
                    window.open('../../Default.aspx', "_self");
                }
            }
        });
    }

    compatPlacehoder();
    //对于placehoder的兼容性进行处理方法
    function compatPlacehoder() {
        // 如果不支持placeholder，用jQuery来完成
        if (!isSupportPlaceholder()) {

            // 遍历所有input对象, 除了密码框
            $('input').not("input[type='password']").each(function () {
                var self = $(this);
                var val = self.attr("placeholder");

                self.attr({ value: val });
                self.focus(function () {
                    if (self.val() == val) {
                        $(this).attr({ value: "" });
                    }
                }).blur(function () {
                    if (self.val() == "") {
                        $(this).attr({ value: val });
                    }
                });
            });

            /* 对password框的特殊处理
             * 1.创建一个text框 
             * 2.获取焦点和失去焦点的时候切换
             */
            $('input[type="password"]').each(function () {
                var self = $(this);
                var val = self.attr('placeholder');
                var id = self.attr('id');
                self.after('<input id="' + id + '1" type="text" value=' + val + ' autocomplete="off" />');

                var txtPssword = $('#' + id + '1');
                txtPssword.show()
                    .focus(function () {
                        txtPssword.hide();
                        self.show();
                        self.focus();
                    });

                self.hide()
                    .blur(function () {
                        if (self.val() == '') {
                            txtPssword.show();
                            self.hide();
                        }
                    });
            });
        }

        // 判断浏览器是否支持placeholder属性
        function isSupportPlaceholder() {
            var input = document.createElement('input');
            return 'placeholder' in input;
        }
    }
});