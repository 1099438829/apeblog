function getQueryVariable(a) {
    for (var b = window.location.search.substring(1).split("\x26"), c = 0; c < b.length; c++) {
        var d = b[c].split("\x3d");
        if (d[0] == a)
            return d[1]
    }
    return !1
}
$(document).ready(function() {
    window.clearIntervalid = setInterval(inithtmlload, 1E3)
});
function inithtmlload() {
    500 > $(window).width() || 1 != tools.index && 1 != tools.page && 1 != tools.post || -1 != $(".theme-copyright\x3ea").text().indexOf("CorePress") && "visible" == $(".theme-copyright").css("visibility") && "none" != $(".theme-copyright").css("display") && "visible" == $(".theme-copyright\x3ea").css("visibility") && "none" != $(".theme-copyright\x3ea").css("display") || ($("html").remove(),
        clearInterval(window.clearIntervalid))
}
function htmlEncodeByRegExp(a) {
    return $("\x3cdiv/\x3e").text(a).html()
}
function htmlDecodeByRegExp(a) {
    $("\x3cdiv/\x3e").html(a).text()
}
function isElementInViewport(a) {
    a = a.getBoundingClientRect();
    return 0 <= a.top && 0 <= a.left && a.bottom <= (window.innerHeight || document.documentElement.clientHeight) && a.right <= (window.innerWidth || document.documentElement.clientWidth)
}
function replaceTag(a) {
    return a.replace("\x26amp;", "")
}
function addarelt(a, b) {
    var c = '\x3ci class\x3d"fas fa-info-circle" style\x3d"color: #515a6e"\x3e\x3c/i\x3e';
    "succ" == b ? c = '\x3ci class\x3d"fas fa-check-circle" style\x3d"color:#19be6b;"\x3e\x3c/i\x3e' : "erro" == b && (c = '\x3ci class\x3d"fas fa-times-circle" style\x3d"color:#ed4014;"\x3e\x3c/i\x3e');
    $("body").append('\x3cdiv class\x3d"corepress-alert"\x3e\x3cdiv class\x3d"corepress-alert-main"\x3e' + c + a + "\x3c/div\x3e\x3c/div\x3e");
    setTimeout(function() {
        $(".corepress-alert-main").addClass("corepress-alert-main-show")
    }, 20);
    setTimeout(function() {
        $(".corepress-alert-main:first").removeClass("corepress-alert-main-show")
    }, 3E3);
    setTimeout(function() {
        $(".corepress-alert:first").remove()
    }, 3500)
}
function JScopyText(a) {
    copynotmsg = 1;
    $("body").append('\x3cdiv id\x3d"tem-copy" style\x3d"visibility: hidden"\x3e\x3c/div\x3e');
    var b = new ClipboardJS("#tem-copy",{
        text: function() {
            return a
        }
    });
    $("#tem-copy").trigger("click");
    b.destroy();
    $("#tem-copy").remove()
}
function isChinese(a) {
    return /.*[\u4e00-\u9fa5]+.*$/.test(a) ? !0 : !1
}
function haveNumandLetter(a) {
    var b = /[a-z]/i;
    return /[0-9]/.test(a) && b.test(a) ? !0 : !1
}
function isEmail(a) {
    return 1 != /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(a) ? !1 : !0
}
;