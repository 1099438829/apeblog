document.body.oncopy = function () {
	if (set.isusercenter == 1) {
		return;
	}
	var copytext = window.getSelection().toString();
	if (set.reprint.open == 1) {
		if (set.reprint.copylenopen == 1) {
			if (copytext.length > set.reprint.copylen) {
				addarelt('复制内容太长，禁止复制', 'erro');
				event.preventDefault();
				return false;
			} else {
				copyaddurl(copytext);
			}
		} else {
			copyaddurl(copytext);
		}
	}
}

function copyaddurl(content) {
	if (set.reprint.addurl == 0) {
		addarelt(set.reprint.msg, 'succ');
	} else {
		if (content.length > 100) {
			addarelt(set.reprint.msg, 'succ');
			JScopyText(content + '\n 【来源：' + set.reprint.siteurl + '，转载请注明】');
		} else {
			addarelt(set.reprint.msg, 'succ');
		}
	}
}

$(document).scroll(function () {
	var scroH = $(document).scrollTop();  //滚动高度
	var viewH = $(window).height();  //可见高度
	var contentH = $(document).height();  //内容高度
	if (scroH > 100) {  //距离顶部大于100px时
		$('.go-top-plane').addClass('go-top-plane-show')
	} else {
		$('.go-top-plane').removeClass('go-top-plane-show')
	}
	if (contentH - (scroH + viewH) <= 100) {  //距离底部高度小于100px
	}
	if (contentH == (scroH + viewH)) {  //滚动条滑到底部啦
	}
});

function mobile_menuclick(e, ethis) {
	$('.user-menu .sub-menu').css('visibility', 'hidden');
	$('.user-menu .sub-menu').css('opacity', '0');
	if ($(ethis).parent().find('.sub-menu').css('visibility') == 'hidden') {
		$(ethis).parent().find('.sub-menu').css('opacity', '1');
		$(ethis).parent().find('.sub-menu').css('visibility', 'visible');
	} else if ($(ethis).parent().parent().find('.user-sub-menu').css('visibility') == 'hidden') {
		$(ethis).parent().parent().find('.sub-menu').css('opacity', '1');
		$(ethis).parent().parent().find('.sub-menu').css('visibility', 'visible');
	}
	e.stopPropagation();
}

$(document).ready(function () {
	//移动端
	$('.menu-mobile .menu-item-has-children').append('<div class="mobile-m-dropdown"><i class="fa fa-angle-down"></i></div>')
	$('.menu-mobile .mobile-m-dropdown').click(function() {
		$(this).parent().children('.mobile-m-dropdown').children().toggleClass('m-dropdown-show-i')
		$(this).parent().children('.sub-menu').slideToggle()
	})



	$('.go-top-plane').click(function () {
		$('html,body').animate({scrollTop: '0px'}, 500);
	});
	$('.drawer-menu-list').click(function (e) {
		$('.user-menu .sub-menu').css('visibility', 'hidden');
		$('.user-menu .sub-menu').css('opacity', '0');
		$('.user-menu .sub-menu').removeClass('sub-menu-hide');
		$('.user-menu .sub-menu').removeClass('sub-menu-show');
		e.stopPropagation();
	});
	$('.tag-cloud-link').each(function () {
		var colors = ['#67C23A', '#E6A23C', '#F56C6C', '#909399', '#CC9966', '#FF6666', '#99CCFF', '#FF9999', '#CC6633'];
		var backcolor = colors[Math.floor((Math.random() * colors.length))];
		$(this).css('background-color', backcolor);
	});

	if (set.module.imglightbox == 1) {
		if (set.is_page == true || set.is_single == true) {
			var imgarr = $('.post-content-content').find('img').not('.c-downbtn-icon').not('.post-end-tools').not('.link-icon').not('.corepress-url-dh-icon img');
			for (var i = 0; i < imgarr.length; i++) {
				if (set.module.imglazyload == 1) {
					var imgurl = $(imgarr[i]).attr('data-original');
				} else {
					var imgurl = $(imgarr[i]).attr('src');
				}
				var html = imgarr[i].outerHTML;
				if ($(imgarr[i]).parent()[0].tagName != 'A') {
					$(imgarr[i]).replaceWith('<a data-fancybox="gallery" data-type="image" href="' + imgurl + '">' + html + '</a>');
				}
			}
			$.fancybox.defaults.buttons = [
				"close"
			];
			$('a[href*=".jpg"],a[href*=".webp"],a[href*=".ico"],a[href*=".svg"], a[href*=".jpeg"], a[href*=".png"], a[href*=".gif"], a[href*=".bmp"]').fancybox({});
		}
	}


	if (set.is_single == 1 || set.is_page == 1) {
		if (set.corepress_post_meta.catalog == 1) {
			var i = 0;
			//文章目录
			var html = '';
			$(".post-content h2,.post-content h3").each(function () {
				var tagName = $(this)[0].tagName.toLowerCase();
				console.log();
				if ($(this).parent().attr('class') == 'zd-plane-content') {
					return;
				}
				$(this).attr('catalog', 'catalog-' + tagName + '-' + i);
				var clickargs = "go_catalog('catalog-" + tagName + "-" + i + "','" + tagName + "')";
				html = html + '<p catalogtagName="' + tagName + '" catalog="' + 'catalog-' + tagName + '-' + i + '" class="catalog-item" onclick="' + clickargs + '">' + $(this).html() + '</p>';
				i++;
			});
			$('#post-catalog-list').html(html);
			set_catalog_position();
			$('#post-catalog').css('visibility', 'visible');
			$('#post-catalog').css('opacity', '1');
			if ($(".post-content h2").length == 0 && $(".post-content h3").length == 0) {
				$('#post-catalog').css('visibility', 'hidden');
			}
		}
		if (set.has_corepress_video == true) {
			const player = new Plyr('.corepress-video', {
				i18n: {
					restart: '重播',
					play: '播放',
					pause: '暂停',
					speed: '速度',
					normal: '正常',
					quality: '质量',

				}
			});
		}

	}
	//图片延迟加载
	$("img").lazyload({effect: "fadeIn"});
	if (set.module.imglazyload == 1) {
		endloadhtml();
	}

	//顶部加载
	if (set.theme.loadbar == 1) {
		NProgress.done();
	}
	//友链图标
	if (set.is_home == true) {
		if (set.index.linksicon == 1) {

			var links_url_arr = $('.frinds-links-list').children('li');
			for (let i = 0; i < links_url_arr.length; i++) {
				var url = $(links_url_arr[i]).children('a').attr('href') + '/favicon.ico';
				var default_url = set.index.chromeiconurl;
				$(links_url_arr[i]).children('a').prepend(`<img class="frinds-links-icon img-lazyload" src="${default_url}" data-original="${url}" onerror="javascript:this.src='${default_url}'"> `);
			}
			setTimeout(function () {
				endloadhtml();
			}, 1000)
		}
	}
});

function endloadhtml() {
	$("img.frinds-links-icon").lazyload({effect: "fadeIn"});
}

$(window).resize(function () {
	set_catalog_position();
});
$(document).scroll(function () {
	if ($('#post-catalog').css('visibility') != 'visible') {
		return;
	}
	$(".post-content h2[catalog],.post-content h3[catalog]").each(function () {
		var el_y = this.getBoundingClientRect().y;
		if (el_y < 100 && el_y > 0) {
			var name = $(this).attr('catalog');
			set_catalog_css();
			$('p[catalog=' + name + ']').addClass('catalog-hover');
			return;
		}

	});
});

function close_show(type) {
	if (type == 1) {
		$('#post-catalog').removeClass('post-catalog-hide')
		$('#post-catalog-bar').css('visibility', 'hidden')
	} else {
		$('#post-catalog').addClass('post-catalog-hide')
		$('#post-catalog-bar').css('visibility', 'visible')
	}
}

function set_catalog_css() {
	$('p[catalog]').removeClass('catalog-hover');
}

function set_catalog_position() {

	if (set.is_page == true || set.is_single == true) {
		if (set.theme.sidebar_position == 1) {
			if ($('.post-info').length == 0 || $('.post-content-body').length == 0) {
				return;
			}
			var title_x = $('.post-info').offset().left;
			$('#post-catalog').css('left', title_x - 200 + 'px');

			var post_body_x = $('.post-content-body').offset().left;
			$('#post-catalog-bar').css('left', post_body_x - $("#post-catalog-bar").innerWidth() + 'px');
		} else {
			var title_x = $('.post-info').offset().left;
			title_x = title_x + $('.post-info')[0].getBoundingClientRect().width
			$('#post-catalog').css('left', title_x + 40 + 'px');
			var post_body_x = $('.post-content-body').offset().left + $('.post-content-body').innerWidth();
			$('#post-catalog-bar').css('left', post_body_x + 'px');
			$('#post-catalog-bar').removeClass('post-catalog-bar-left-minborder');
			$('#post-catalog-bar').addClass('post-catalog-bar-right-minborder');
		}
	}
}

function go_catalog(catalogname, tagName) {
	var _scrolltop = $(tagName + '[catalog=' + catalogname + ']').offset().top;
	$('html, body').animate({
			scrollTop: _scrolltop - 60
		}, 500
	);
}

function widget_sentence_load(type, el) {
	$.get(set.ajaxurl, {action: 'corepress_get_widget_sentence', type}, function (data) {
		var obj = JSON.parse(data);
		if (obj.code == 200) {
			$(el).html('<p>' + obj.data + '</p>');
		} else {
			$(el).html('<p>句子加载失败</p>');
		}
	})
}