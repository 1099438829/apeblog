document.body.oncopy=function(){if(1!=set.isusercenter){var a=window.getSelection().toString();if(1==set.reprint.open){if(1==set.reprint.copylenopen&&a.length>set.reprint.copylen)return addarelt("\u590d\u5236\u5185\u5bb9\u592a\u957f\uff0c\u7981\u6b62\u590d\u5236","erro"),event.preventDefault(),!1;copyaddurl(a)}}};function copyaddurl(a){0==set.reprint.addurl?addarelt(set.reprint.msg,"succ"):100<a.length?(addarelt(set.reprint.msg,"succ"),JScopyText(a+"\n \u3010\u6765\u6e90\uff1a"+set.reprint.siteurl+"\uff0c\u8f6c\u8f7d\u8bf7\u6ce8\u660e\u3011")):addarelt(set.reprint.msg,"succ")}$(document).scroll(function(){var a=$(document).scrollTop();$(window).height();$(document).height();100<a?$(".go-top-plane").addClass("go-top-plane-show"):$(".go-top-plane").removeClass("go-top-plane-show")});function mobile_menuclick(a,b){$(".sub-menu").css("visibility","hidden");$(".sub-menu").css("opacity","0");"hidden"==$(b).parent().find(".sub-menu").css("visibility")?($(b).parent().find(".sub-menu").css("opacity","1"),$(b).parent().find(".sub-menu").css("visibility","visible")):"hidden"==$(b).parent().parent().find(".user-sub-menu").css("visibility")&&($(b).parent().parent().find(".sub-menu").css("opacity","1"),$(b).parent().parent().find(".sub-menu").css("visibility","visible"));a.stopPropagation()}$(document).ready(function(){$(".go-top-plane").click(function(){$("html,body").animate({scrollTop:"0px"},500)});$(".drawer-menu-list").click(function(a){$(".sub-menu").css("visibility","hidden");$(".sub-menu").css("opacity","0");$(".sub-menu").removeClass("sub-menu-hide");$(".sub-menu").removeClass("sub-menu-show");a.stopPropagation()});$(".tag-cloud-link").each(function(){var a="#67C23A #E6A23C #F56C6C #909399 #CC9966 #FF6666 #99CCFF #FF9999 #CC6633".split(" "),a=a[Math.floor(Math.random()*a.length)];$(this).css("background-color",a)});if(1==set.module.imglightbox&&(1==set.is_page||1==set.is_single)){for(var a=$(".post-content-content").find("img").not(".c-downbtn-icon").not(".post-end-tools"),b=0;b<a.length;b++){var c=1==set.module.imglazyload?$(a[b]).attr("data-original"):$(a[b]).attr("src"),d=a[b].outerHTML;"A"!=$(a[b]).parent()[0].tagName&&$(a[b]).replaceWith('\x3ca data-fancybox\x3d"gallery" data-type\x3d"image" href\x3d"'+c+'"\x3e'+d+"\x3c/a\x3e")}$.fancybox.defaults.buttons=["close"];$('a[href*\x3d".jpg"],a[href*\x3d".webp"],a[href*\x3d".ico"],a[href*\x3d".svg"], a[href*\x3d".jpeg"], a[href*\x3d".png"], a[href*\x3d".gif"], a[href*\x3d".bmp"]').fancybox({})}$("img").lazyload({effect:"fadeIn"});b=0;d="";$(".post-content h2,.post-content h3").each(function(){var a=$(this)[0].tagName.toLowerCase();console.log();"zd-plane-content"!=$(this).parent().attr("class")&&($(this).attr("catalog","catalog-"+a+"-"+b),d=d+'\x3cp catalogtagName\x3d"'+a+'" catalog\x3d"catalog-'+a+"-"+b+'" class\x3d"catalog-item" onclick\x3d"'+("go_catalog('catalog-"+a+"-"+b+"','"+a+"')")+'"\x3e'+$(this).html()+"\x3c/p\x3e",b++)});$("#post-catalog-list").html(d);set_catalog_position();$("#post-catalog").css("visibility","visible");$("#post-catalog").css("opacity","1");0==$(".post-content h2").length&&0==$(".post-content h3").length&&$("#post-catalog").css("visibility","hidden");1==set.module.imglazyload&&endloadhtml();1==set.theme.loadbar&&NProgress.done();if(1==set.is_home&&1==set.index.linksicon){a=$(".frinds-links-list").children("li");for(c=0;c<a.length;c++){var f=$(a[c]).children("a").attr("href")+"/favicon.ico",e=set.index.chromeiconurl;$(a[c]).children("a").prepend('\x3cimg class\x3d"frinds-links-icon img-lazyload" src\x3d"'+e+'" data-original\x3d"'+f+'" onerror\x3d"javascript:this.src\x3d\''+e+"'\"\x3e ")}setTimeout(function(){endloadhtml()},1E3)}});function endloadhtml(){$("img.frinds-links-icon").lazyload({effect:"fadeIn"})}$(window).resize(function(){set_catalog_position()});$(document).scroll(function(){"visible"==$("#post-catalog").css("visibility")&&$(".post-content h2[catalog],.post-content h3[catalog]").each(function(){var a=this.getBoundingClientRect().y;100>a&&0<a&&(a=$(this).attr("catalog"),set_catalog_css(),$("p[catalog\x3d"+a+"]").addClass("catalog-hover"))})});function close_show(a){1==a?($("#post-catalog").removeClass("post-catalog-hide"),$("#post-catalog-bar").css("visibility","hidden")):($("#post-catalog").addClass("post-catalog-hide"),$("#post-catalog-bar").css("visibility","visible"))}function set_catalog_css(){$("p[catalog]").removeClass("catalog-hover")}function set_catalog_position(){if(1==set.is_page||1==set.is_single)if(1==set.theme.sidebar_position){if(0!=$(".post-info").length){var a=$(".post-info").offset().left;$("#post-catalog").css("left",a-200+"px");a=$(".post-content-body").offset().left;$("#post-catalog-bar").css("left",a-$("#post-catalog-bar").innerWidth()+"px")}}else a=$(".post-info").offset().left,a+=$(".post-info")[0].getBoundingClientRect().width,$("#post-catalog").css("left",a+40+"px"),a=$(".post-content-body").offset().left+$(".post-content-body").innerWidth(),$("#post-catalog-bar").css("left",a+"px"),$("#post-catalog-bar").removeClass("post-catalog-bar-left-minborder"),$("#post-catalog-bar").addClass("post-catalog-bar-right-minborder")}function go_catalog(a,b){var c=$(b+"[catalog\x3d"+a+"]").offset().top;$("html, body").animate({scrollTop:c-60},500)}function widget_sentence_load(a,b){$.get(set.ajaxurl,{action:"corepress_get_widget_sentence",type:a},function(a){a=JSON.parse(a);200==a.code?$(b).html("\x3cp\x3e"+a.data+"\x3c/p\x3e"):$(b).html("\x3cp\x3e\u53e5\u5b50\u52a0\u8f7d\u5931\u8d25\x3c/p\x3e")})};