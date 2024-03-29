init_dark();
function init_dark() {
    if (cp_user_get_dark() === true) {
        loaddarkcss()
    } else if (cp_user_get_dark() === "") {
        if (set.autodark == 1) {
            if (cp_isdark()) {
                loaddarkcss()
            } else {
                def_dark()
            }
        } else {
            def_dark()
        }
    } else {
        removedarkcss()
    }
}
function openMenu() {
    $("body").css("overflow", "hidden");
    $(".drawer-menu-plane").addClass("drawer-menu-plane-show");
    $(".menu-plane").appendTo($(".drawer-menu-list"));
    $(".user-menu-plane").appendTo($(".drawer-menu-list"));
    $(".user-menu-main").not(".user-menu-main-notlogin").append('<div class="m-dropdown" onclick="mobile_menuclick(event,this)"><i class="fal fa-angle-down"></i></div>');
    $(".phone-tabs").css("display", "none")
}
function closeMenu() {
    $("body").css("overflow", "auto");
    $(".drawer-menu-plane").removeClass("drawer-menu-plane-show");
    $(".user-menu-plane").prependTo($(".header-menu"));
    $(".menu-plane").prependTo($(".header-menu"));
    $(".m-dropdown").remove();
    $(".phone-tabs").css("display", "block")
}
function openSearch() {
    $(".dialog-search-plane").addClass("dialog-search-plane-show")
}
function closeSearch() {
    $(".dialog-search-plane").removeClass("dialog-search-plane-show")
}
function darkMode() {
    if (window.isdark == true) {
        removedarkcss();
        cp_user_set_dark("0")
    } else {
        loaddarkcss();
        cp_user_set_dark("1")
    }
}
function copyaddurl(t) {
    if (set.reprint.addurl == 0) {
        addarelt(set.reprint.msg, "succ")
    } else {
        if (t.length > 100) {
            addarelt(set.reprint.msg, "succ");
            window.closeCopyLimit = 1;
            JScopyText(t + "\n 【来源：" + set.reprint.siteurl + "，转载请注明】")
        } else {
            addarelt(set.reprint.msg, "succ")
        }
    }
}
function mobile_menuclick(t, e) {
    $(".user-menu .sub-menu").css("visibility", "hidden");
    $(".user-menu .sub-menu").css("opacity", "0");
    if ($(e).parent().find(".sub-menu").css("visibility") == "hidden") {
        $(e).parent().find(".sub-menu").css("opacity", "1");
        $(e).parent().find(".sub-menu").css("visibility", "visible")
    } else if ($(e).parent().parent().find(".user-sub-menu").css("visibility") == "hidden") {
        $(e).parent().parent().find(".sub-menu").css("opacity", "1");
        $(e).parent().parent().find(".sub-menu").css("visibility", "visible")
    }
    $(".user-menu-main .fa-angle-down").toggleClass("m-dropdown-show-i");
    t.stopPropagation()
}
$(document).ready(function() {
    $("#app").addClass("app-show");
    $(".html-loading").addClass("html-loading-hide");
    if ($(".cp-pop-window-title>div").css("background-color") != "rgb(255, 255, 255)") {
        $(".cp-pop-close").css("color", "#fff")
    }
    $("#app").scroll(()=>directoryScroll());
    copyDeal();
    mobileDeal();
    if (set.theme.loadbar == 1) {
        NProgress.done()
    }
    if (set.is_home == 1) {
        loadSwiper()
    }
    loadlazyimg();
    if (set.is_single == 1 || set.is_page == 1) {
        loadUAparse();
        tableBeautify();
        loadCorePressVideo();
        loadDirectory();
        directoryDeal()
    }
    //loadPopWindow();
    loadPoster();
    homeBeautify();
    tagCloud()
});
function directoryDeal() {
    if ($(".cp-widget-directory").length === 0) {
        $(".sidebar-box-list").css("position", "sticky");
        $(".sidebar-box-list").css("top", "65px");
        $(".sidebar-box-list").css("height", "auto")
    }
}
function homeBeautify() {
    if (set.is_home == 1) {
        $(".sidebar-box-list").css("position", "sticky");
        $(".sidebar-box-list").css("top", "65px");
        $(".sidebar-box-list").css("height", "auto")
    }
}
function tagCloud() {
    $(".tag-cloud-link").each(function() {
        var t = ["#67C23A", "#E6A23C", "#F56C6C", "#909399", "#CC9966", "#FF6666", "#99CCFF", "#FF9999", "#CC6633"];
        var e = t[Math.floor(Math.random() * t.length)];
        $(this).css("background-color", e)
    })
}
function mobileDeal() {
    $(".menu-mobile .menu-item-has-children").append('<div class="mobile-m-dropdown"><i class="fal fa-angle-down"></i></div>');
    $(".menu-mobile .menu-item-has-children>a").css("display", " inline-block");
    $(".menu-mobile .menu-item-has-children").click(function() {
        let t = $(this).children(".mobile-m-dropdown");
        t.children().toggleClass("m-dropdown-show-i");
        $(this).children(".sub-menu").slideToggle();
        return false
    });
    $(".menu-mobile a").click(function() {
        window.location.href = $(this).attr("href");
        return false
    });
    $(".go-top-plane").click(function() {
        $("#app").animate({
            scrollTop: "0px"
        }, 500)
    });
    $(".drawer-menu-list").click(function(t) {
        $(".user-menu .sub-menu").css("visibility", "hidden");
        $(".user-menu .sub-menu").css("opacity", "0");
        $(".user-menu .sub-menu").removeClass("sub-menu-hide");
        $(".user-menu .sub-menu").removeClass("sub-menu-show");
        t.stopPropagation()
    })
}
function copyDeal() {
    jQuery(document).on("copy", t=>{
            var e = window.getSelection().toString();
            if (window.closeCopyLimit == 1) {
                window.closeCopyLimit = 0;
                return true
            }
            if (set.reprint.open == 1) {
                if (set.reprint.copylenopen == 1) {
                    if (e.length > set.reprint.copylen) {
                        addarelt("复制内容太长，禁止复制", "erro");
                        t.preventDefault();
                        return false
                    } else {
                        copyaddurl(e);
                        return true
                    }
                } else {
                    copyaddurl(e)
                }
            }
            return true
        }
    )
}
function loadCorePressVideo() {
    if (set.has_corepress_video == true) {
        const t = new Plyr(".corepress-video",{
            i18n: {
                restart: "重播",
                play: "播放",
                pause: "暂停",
                speed: "速度",
                normal: "正常",
                quality: "质量"
            }
        })
    }
}
function tableBeautify() {
    $("table").each(function() {
        $(this)[0].outerHTML = '<div class="cp-table">' + $(this)[0].outerHTML + "</div>"
    });
    $("table").each(function() {
        if ($(this).find("thead").length == 0) {
            $(this).find("tr:first-child td").css("color", "var(--Maincolor)");
            $(this).find("tr:first-child td").css("border-bottom", "2px solid var(--Maincolor)")
        }
    })
}
function loadPopWindow() {
    if (set.popwindow == 1) {
        if (cp_getCookie("cp_popwindow") != "1") {
            load_popwindow()
        } else if (cp_getCookie("cp_popwindow_md5") != set.popwindowmd5) {
            load_popwindow()
        }
    }
}
function loadPoster() {
    $(".cp-dialog").appendTo("body");
    $(".cp-dialog").click(function() {
        if ($(this).attr("click-close") == "true") {
            $(this).css("display", "none")
        }
    });
    $(".cp-poster-plane-main").click(()=>{
            return false
        }
    );
    $("#cp-close-poster").click(()=>{
            $("#cp-poster-dialog").css("display", "none")
        }
    );
    $("#cp-poster-img").attr("src", set.poster_img)
}
function loadUAparse() {
    if ($("#comments").length > 0) {
        if (navigator.userAgentData != undefined) {
            if (navigator.userAgentData.getHighEntropyValues != undefined) {
                navigator.userAgentData.getHighEntropyValues(["platformVersion"]).then(t=>{
                        if (navigator.userAgentData.platform === "Windows") {
                            const e = parseInt(t.platformVersion.split(".")[0]);
                            if (e >= 13) {
                                document.getElementById("osversion").value = 13
                            } else {}
                        }
                    }
                )
            }
        }
        $(".corepress-commentinfo").each(function() {
            $.ua.set($(this).text());
            var t = $.ua.browser.name;
            var e = $.ua.browser.major;
            var o = $.ua.cpu.architecture;
            var i = $.ua.os.name;
            var s = $.ua.os.version;
            var a = $.ua.device.vendor;
            var n = "";
            if (o == "amd64") {
                n = " 64Bit"
            } else if (o == "ia32") {
                n = " 32Bit"
            }
            if (t != undefined) {
                if (e != undefined) {
                    var c = '<span class="corepress-commentinfo-browser"><img src="' + getBrowsericon(t) + '">' + t + " " + e + "</span>"
                } else {
                    var c = '<span class="corepress-commentinfo-browser"><img src="' + getBrowsericon(t) + '">' + t + "</span>"
                }
            }
            if (i != undefined) {
                c = c + '<span class="corepress-commentinfo-os"><img src="' + getOsicon(i, s) + '">' + i + " " + s + n + "</span>"
            }
            if (a != undefined) {
                c = c + '<span class="corepress-commentinfo-devicename"><img src="' + getPhoneicon(a) + '">' + a + "</span>"
            }
            $.ua.set($(this).html(c));
            $(this).css("display", "block")
        })
    }
}
function directoryScroll() {
    var t = $("#app").scrollTop();
    var e = $(window).height();
    var o = $("#app").height();
    if (t > 100) {
        $(".go-top-plane").addClass("go-top-plane-show")
    } else {
        $(".go-top-plane").removeClass("go-top-plane-show")
    }
    if (set.is_single == 1 || set.is_page == 1) {
        if ($("#post-catalog").css("visibility") != "visible") {}
        $(".post-content h2[catalog],.post-content h3[catalog],.post-content h4[catalog]").each(function() {
            var t = this.getBoundingClientRect().y;
            if (t < 256 && t > 0) {
                var e = $(this).attr("catalog");
                set_catalog_css();
                $("#post-catalog-list p[catalog=" + e + "]").addClass("catalog-hover");
                return
            }
        });
        let t = "";
        let e = $(".directory-widget").attr("index");
        if (e == "h2") {
            t = ".post-content h2[catalog]"
        } else if (e == "h3") {
            t = ".post-content h2[catalog],.post-content h3[catalog]"
        } else {
            t = ".post-content h2[catalog],.post-content h3[catalog],.post-content h4[catalog]"
        }
        $(t).each(function() {
            var t = this.getBoundingClientRect().y;
            if (t < 256 && t > 0) {
                var e = $(this).attr("catalog");
                $(".directory-widget p[catalog]").removeClass("catalog-hover");
                $(".directory-widget p[catalog=" + e + "]").addClass("catalog-hover");
                return
            }
        });
        if ($(".cp-widget-directory .catalog-hover").length > 0) {
            var i = $(".cp-widget-directory .catalog-hover").position().top;
            var s = $(".directory-widget").height();
            var a = $(".directory-widget").scrollTop();
            if (i >= a && i <= a + s + 34) {} else {
                let t = $(".catalog-item").index($(".catalog-hover"));
                $(".directory-widget").scrollTop(t * 34)
            }
        }
        if (window.set_cp_widget_directory != 1) {
            let t = $(".aside-box:last-child");
            if (t.length > 0) {
                if (t.hasClass("cp-widget-directory")) {
                    if ($(".scroll-notice").length > 0) {
                        $(".cp-widget-directory").css("top", "90px")
                    }
                    $(".cp-widget-directory").css("position", "sticky");
                    window.set_cp_widget_directory == 1
                } else if (Math.abs($(".aside-box:last-child").offset().top) - $(".aside-box:last-child").outerHeight() + 62 > 0) {
                    if ($(".scroll-notice").length > 0) {
                        $(".cp-widget-directory").css("top", "90px")
                    }
                    $(".cp-widget-directory").css("position", "sticky")
                } else {
                    $(".cp-widget-directory").css("position", "static")
                }
            }
        }
    }
}
function loadDirectory() {
    if (set.corepress_post_meta.catalog == 1) {
        var o = 0;
        var i = "";
        $(".post-content h2,.post-content h3").each(function() {
            var t = $(this)[0].tagName.toLowerCase();
            if ($(this).parent().attr("class") == "zd-plane-content") {
                return
            }
            $(this).attr("catalog", "catalog-" + t + "-" + o);
            var e = "go_catalog('catalog-" + t + "-" + o + "','" + t + "')";
            i = i + '<p catalogtagName="' + t + '" catalog="' + "catalog-" + t + "-" + o + '" class="catalog-item" onclick="' + e + '">' + $(this).html() + "</p>";
            o++
        });
        $("#post-catalog-list").html(i);
        set_catalog_position();
        $("#post-catalog").css("visibility", "visible");
        $("#post-catalog").css("opacity", "1");
        if ($(".post-content h2").length == 0 && $(".post-content h3").length == 0) {
            $("#post-catalog").css("visibility", "hidden")
        }
    }
    if ($(".cp-widget-directory").length > 0) {
        addTagToTitle();
        let t = getDirectoryArray();
        if (t.length == 0) {
            $(".cp-widget-directory").css("display", "none");
            return
        }
        let s = $(".directory-widget").attr("index");
        t.forEach((t,e)=>{
                let o = document.createElement("p");
                o.setAttribute("catalogtagName", t.tag_name);
                o.setAttribute("catalog", t.catalog);
                o.setAttribute("class", "catalog-item");
                var i = "go_catalog('" + t.catalog + "','" + t.tag_name + "')";
                o.setAttribute("onclick", i);
                o.innerHTML = t.title;
                if (s == "h2") {
                    if (t.tag_name == "h2") {
                        $(".directory-widget").append(o)
                    }
                } else if (s == "h3") {
                    if (t.tag_name == "h2" || t.tag_name == "h3") {
                        $(".directory-widget").append(o)
                    }
                } else {
                    $(".directory-widget").append(o)
                }
            }
        )
    }
}
function getDirectoryArray() {
    let o = [];
    $(".post-content h2[catalog],.post-content h3[catalog],.post-content h4[catalog]").each(function() {
        var t = $(this).attr("catalog");
        var e = $(this)[0].tagName.toLowerCase();
        o.push({
            tag_name: e,
            title: $(this).html(),
            catalog: t
        })
    });
    return o
}
function addTagToTitle() {
    var o = 0;
    $(".post-content h2,.post-content h3,.post-content h4").each(function() {
        var t = $(this)[0].tagName.toLowerCase();
        if ($(this).parent().attr("class") == "zd-plane-content") {
            return
        }
        var e = "catalog-" + t + "-" + o;
        $(this).attr("id", e);
        $(this).attr("catalog", "catalog-" + t + "-" + o);
        o++
    })
}
function loadSwiper() {
    let t = $(".swiper-slide").length;
    let e = {
        loop: t > 1,
        autoplay: true,
        delay: 3e3,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
        }
    };
    if (t > 1) {
        e.pagination = {
            el: ".swiper-pagination"
        }
    }
    new Swiper(".swiper-container",e)
}
function createPoster() {
    if (window.poster_data != undefined) {
        $("#cp-poster-dialog").css("display", "block")
    } else {
        $("#cp-poster-dialog").css("display", "block");
        setTimeout(function() {
            html2canvas($("#poster-screenshot")[0]).then(t=>{
                    window.poster_data = t;
                    $("#poster-screenshot").css("display", "none");
                    $("#poster-created").css("display", "block");
                    $(".poster-loading").css("display", "none");
                    $("#poster-created").append('<img src="' + t.toDataURL("image/png") + '">')
                }
            )
        }, 500)
    }
}
$(window).resize(function() {
    set_catalog_position()
});
function close_show(t) {
    if (t == 1) {
        $("#post-catalog").removeClass("post-catalog-hide");
        $("#post-catalog-bar").css("visibility", "hidden")
    } else {
        $("#post-catalog").addClass("post-catalog-hide");
        $("#post-catalog-bar").css("visibility", "visible")
    }
}
function set_catalog_css() {
    $("#post-catalog-list p[catalog]").removeClass("catalog-hover")
}
function set_catalog_position() {
    if (set.is_page == true || set.is_single == true) {
        if (set.theme.sidebar_position == 1) {
            if ($(".post-title").length == 0 || $(".post-content-body").length == 0) {
                return
            }
            var t = $(".post-title").offset().left;
            $("#post-catalog").css("left", t - 200 + "px");
            var e = $(".post-content-body").offset().left;
            $("#post-catalog-bar").css("left", e - $("#post-catalog-bar").innerWidth() + "px")
        } else {
            var t = $(".post-title").offset().left;
            t = t + $(".post-title")[0].getBoundingClientRect().width;
            $("#post-catalog").css("left", t + 40 + "px");
            var e = $(".post-content-body").offset().left + $(".post-content-body").innerWidth();
            $("#post-catalog-bar").css("left", e + "px");
            $("#post-catalog-bar").removeClass("post-catalog-bar-left-minborder");
            $("#post-catalog-bar").addClass("post-catalog-bar-right-minborder")
        }
    }
}
function go_catalog(t, e) {
    var o = $(e + "[catalog=" + t + "]").position().top;
    $("#app").scrollTop(o)
}
function widget_sentence_load(t, o) {
    $.get(set.ajaxurl, {
        action: "corepress_get_widget_sentence",
        type: t
    }, function(t) {
        var e = JSON.parse(t);
        if (e.code == 200) {
            $(o).html("<p>" + e.data + "</p>")
        } else {
            $(o).html("<p>句子加载失败</p>")
        }
    })
}
