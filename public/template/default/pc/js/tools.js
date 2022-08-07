function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return false;
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
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
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

function cp_setCookie(e, i, r) {
  r = r || 0;
  var t = "";
  if (r != 0) {
    var o = new Date();
    o.setTime(o.getTime() + r * 24 * 60 * 60 * 1e3);
    t = "; expires=" + o.toGMTString();
  }
  document.cookie = e + "=" + encodeURI(i) + t + "; path=/";
}

function cp_getCookie(e) {
  var i = e + "=";
  var r = document.cookie.split(";");
  for (var t = 0; t < r.length; t++) {
    var o = r[t].trim();
    if (o.indexOf(i) == 0) return o.substring(i.length, o.length);
  }
  return "";
}

function cp_isdark() {
  return window.matchMedia("(prefers-color-scheme: dark)").matches;
}

function cp_user_get_dark() {
    return "" == cp_getCookie("corepress_dark") ? "" : 1 == cp_getCookie("corepress_dark") ? !0 : !1
}

function cp_user_set_dark(a) {
    cp_setCookie("corepress_dark", a)
}

function removedarkcss() {
    $("#darkcss").remove();
    window.isdark = false;
    $("#darkModeicon").removeClass();
    $("#darkModeicon").addClass("fal fa-moon");
    $(".header-logo img").attr("src", set.logourl);
    dark_editor();
}

function removedarkcodecss() {
    $("#darkcodecss").remove();
}

function loaddarkcss() {
    var a = document.createElement("link");
    a.type = "text/css";
    a.rel = "stylesheet";
    a.href = set.darkcss;
    a.id = "darkcss";
    $("body").append(a);
    window.isdark = true;
    $("#darkModeicon").removeClass();
    $("#darkModeicon").addClass("fas fa-sun");
    $(".header-logo img").attr("src", set.darklogourl);
    dark_editor(1);
}

function dark_editor(e) {
  if (e === 1) {
    $("#edit_ifr")
      .contents()
      .find("#tinymce")
      .css("background", "#2a2a2b");
    $("#edit_ifr").contents().find("#tinymce").css("color", "#fff");
  } else if (e === 3) {
    if (cp_user_get_dark()) {
      dark_editor(1);
    }
  } else {
    $("#edit_ifr").contents().find("#tinymce").css("background", "#fff");
    $("#edit_ifr").contents().find("#tinymce").css("color", "#000");
  }
}
function def_dark() {
  if (set.dark == "1") {
    loaddarkcss();
  }
}
function getBrowsericon(e) {
  var i = "";
  if (e.search("Chrome") != -1) {
    i = "chrome.svg";
  } else if (e == "Edge") {
    i = "edge.svg";
  } else if (e == "Firefox") {
    i = "firefox.svg";
  } else if (e.search("Safari") != -1) {
    i = "safari.svg";
  } else {
    i = "defaultbrowser.svg";
  }
  return set.imgurl + "/ua/" + i;
}

function getPhoneicon(e) {
  var i = "";
  if (e == "Apple") {
    i = "iphone.svg";
  } else {
    i = "phone.svg";
  }
  return set.imgurl + "/ua/" + i;
}
function getOsicon(e, i) {
  var r = "";
  if (e == "Windows") {
    if (i == "XP") {
      r = "windowsxp.svg";
    } else if (i == "Vista") {
      r = "windowsxp.svg";
    } else if (i == "7") {
      r = "windows7.svg";
    } else if (i == "8") {
      r = "windows8.svg";
    } else if (i == "8.1") {
      r = "windows8.svg";
    } else if (i == "10") {
      r = "windows10.svg";
    } else if (i == "11") {
      r = "windows11.svg";
    }
  } else if (e.indexOf("Mac") != -1 || e.search("iOS") != -1) {
    r = "mac.svg";
  } else if (e.indexOf("Android") != -1) {
    r = "android.svg";
  } else if (e.search("Linux") != -1) {
    r = "linux.svg";
  } else {
    r = "defaultos.svg";
  }
  return set.imgurl + "/ua/" + r;
}

function close_pop_window() {
    cp_setCookie("cp_popwindow", "1", 1 * set.popwindowtime);
    cp_setCookie("cp_popwindow_md5", set.popwindowmd5, 1 * set.popwindowtime);
    $(".cp-popwindow-window").addClass("animate__bounceOut");
    $(".cp-popwindow").css("background", "none");
    setTimeout(function () {
        $(".cp-popwindow").remove();
    }, 800)
}

function load_popwindow() {
  $("body").append(
    '<div class="cp-popwindow"><div class="cp-popwindow-window animate__animated animate__bounceIn">' +
      BASE64.decode(set.popwindowhtml) +
      "</div></div>"
  );
}

function loadlazyimg() {
  if (set.module.imglazyload == 1) {
    if (set.is_single == 1 || set.is_page == 1) {
      $("img").lazyload({ effect: "fadeIn", container: $("html,body,#app") });
    } else {
      $("img.thumbnail").lazyload({
        effect: "fadeIn",
        skip_invisible: false,
        event: "load",
        container: $("html,body,#app")
      });
      setTimeout(function () {
        $("img.thumbnail").trigger("load");
      }, 1e3);
    }
  }
}

function loadJS(e, i) {
  let r = document.createElement("script");
  r.src = e;
  r.id = i;
  document.head.appendChild(r);
}
