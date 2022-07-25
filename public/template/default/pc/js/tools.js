function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return (false);
}


function htmlEncodeByRegExp(str) {
    return $('<div/>').text(str).html();
}

function htmlDecodeByRegExp(str) {
    var text = $('<div/>').html(str).text();
}

function isElementInViewport(el) {
    //获取元素是否在可视区域
    var rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <=
        (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <=
        (window.innerWidth || document.documentElement.clientWidth)
    );
}

function replaceTag(str) {
    //return str;
    return str.replace('&amp;', '')
}

function addarelt(msg, type) {
    var icon = '<i class="fas fa-info-circle" style="color: #515a6e"></i>';
    if (type == 'succ') {
        icon = '<i class="fas fa-check-circle" style="color:#19be6b;"></i>'
    } else if (type == 'erro') {
        icon = '<i class="fas fa-times-circle" style="color:#ed4014;"></i>'
    }
    var msg_id = '';
    $('body').append('<div class="corepress-alert"><div class="corepress-alert-main">' + icon + msg + '</div></div>');
    setTimeout(function () {
        $('.corepress-alert-main').addClass('corepress-alert-main-show');
    }, 20);
    setTimeout(function () {
        $('.corepress-alert-main:first').removeClass('corepress-alert-main-show');
    }, 3000);
    setTimeout(function () {
        $('.corepress-alert:first').remove();
    }, 3500);
}

function JScopyText(str) {
    copynotmsg = 1;
    $("body").append('<div id="tem-copy" style="visibility: hidden"></div>');
    var clipboard = new ClipboardJS('#tem-copy', {
        text: function () {
            return str;
        }
    });
//自动点击
    $("#tem-copy").trigger("click");
//删除
    clipboard.destroy();
    $("#tem-copy").remove();

}

function isChinese(text) {
    var re = /.*[\u4e00-\u9fa5]+.*$/;
    if (re.test(text)) return true;
    return false;
}

function haveNumandLetter(text) {
    var num = /[0-9]/;
    var letter = /[a-z]/i;
    if (num.test(text) && letter.test(text)) return true;
    return false;
}

function isEmail(str) {
    var re = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    if (re.test(str) != true) {
        return false;
    } else {
        return true;
    }
}

function cp_setCookie(a, c, b) {
    b = b || 0;
    var d = "";
    0 != b && (d = new Date,
        d.setTime(d.getTime() + 864E5 * b),
        d = "; expires\x3d" + d.toGMTString());
    document.cookie = a + "\x3d" + encodeURI(c) + d + "; path\x3d/"
}

function cp_getCookie(a) {
    a += "\x3d";
    for (var c = document.cookie.split(";"), b = 0; b < c.length; b++) {
        var d = c[b].trim();
        if (0 == d.indexOf(a))
            return d.substring(a.length, d.length)
    }
    return ""
}

function cp_isdark() {
    return window.matchMedia("(prefers-color-scheme: dark)").matches
}

function cp_user_get_dark() {
    return "" == cp_getCookie("corepress_dark") ? "" : 1 == cp_getCookie("corepress_dark") ? !0 : !1
}

function cp_user_set_dark(a) {
    cp_setCookie("corepress_dark", a)
}

function removedarkcss() {
    $("#darkcss").remove();
    window.isdark = !1;
    $("#darkModeicon").removeClass();
    $("#darkModeicon").addClass("fal fa-moon");
    $(".header-logo img").attr("src", set.logourl)
}

function loaddarkcodecss() {
    var a = document.createElement("link");
    a.type = "text/css";
    a.rel = "stylesheet";
    a.href = set.darkcodecss;
    a.id = "darkcodecss";
    $("body").append(a)
}

function removedarkcodecss() {
    $("#darkcodecss").remove()
}

function loaddarkcss() {
    var a = document.createElement("link");
    a.type = "text/css";
    a.rel = "stylesheet";
    a.href = set.darkcss;
    a.id = "darkcss";
    $("body").append(a);
    window.isdark = !0;
    $("#darkModeicon").removeClass();
    $("#darkModeicon").addClass("fas fa-sun");
    $(".header-logo img").attr("src", set.darklogourl)
}

function def_dark() {
    "1" == set.dark && loaddarkcss()
}

function getBrowsericon(a) {
    a = -1 != a.search("Chrome") ? "chrome.svg" : "Edge" == a ? "edge.svg" : "Firefox" == a ? "firefox.svg" : -1 != a.search("Safari") ? "safari.svg" : "defaultbrowser.svg";
    return set.imgurl + "/ua/" + a
}

function getPhoneicon(a) {
    return set.imgurl + "/ua/" + ("Apple" == a ? "iphone.svg" : "phone.svg")
}

function getOsicon(a, c) {
    var b = "";
    "Windows" == a ? "XP" == c ? b = "windowsxp.svg" : "Vista" == c ? b = "windowsxp.svg" : "7" == c ? b = "windows7.svg" : "8" == c ? b = "windows8.svg" : "8.1" == c ? b = "windows8.svg" : "10" == c ? b = "windows10.svg" : "11" == c && (b = "windows11.svg") : b = -1 != a.indexOf("Mac") || -1 != a.search("iOS") ? "mac.svg" : -1 != a.indexOf("Android") ? "android.svg" : -1 != a.search("Linux") ? "linux.svg" : "defaultos.svg";
    return set.imgurl + "/ua/" + b
}

function close_pop_window() {
    cp_setCookie("cp_popwindow", "1", 1 * set.popwindowtime);
    cp_setCookie("cp_popwindow_md5", set.popwindowmd5, 1 * set.popwindowtime);
    $(".cp-popwindow-window").addClass("animate__bounceOut");
    $(".cp-popwindow").css("background", "none");
    setTimeout(function () {
        $(".cp-popwindow").remove()
    }, 800)
}

function load_popwindow() {
    $("body").append('\x3cdiv class\x3d"cp-popwindow"\x3e\x3cdiv class\x3d"cp-popwindow-window animate__animated animate__bounceIn"\x3e' + BASE64.decode(set.popwindowhtml) + "\x3c/div\x3e\x3c/div\x3e")
}

function loadlazyimg() {
    1 == set.module.imglazyload && (1 == set.is_single || 1 == set.is_page ? $("img").lazyload({
        effect: "fadeIn",
        container: $("html,body,#app")
    }) : ($("img.thumbnail").lazyload({
        effect: "fadeIn",
        skip_invisible: !1,
        event: "load",
        container: $("html,body,#app")
    }),
        setTimeout(function () {
            $("img.thumbnail").trigger("load")
        }, 1E3)))
}
