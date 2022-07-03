<?php
/**
 * @author 李玉坤
 * @date 2021-11-11 23:57
 */

namespace app\common\constant;


class Data
{
    //缓存数据key
    const DATA_FRIEND_LINK = 'data_friend_link'; //友链
    const DATA_NAV_LIST = 'data_nav_list'; //页面导肮
    const DATA_DOCUMENT_CATEGORY_LIST = 'data_document_category_list'; //文章分类
    const CURR_CATEGORY_PATENT_ID = 'curr_category_patent_id'; //当前分类父级id
    const DATA_SYSTEM_CONFIG = 'data_system_config'; //系统配置
    const DATA_ADVERT = 'data_advert'; //广告
    const DATA_ARCHIVE = "data_archive"; //文章归档

    //广告位
    const ADVERT_NAV_LIST = [
        1 => '主页banner',
        2 => '主页推荐位置',
        3 => '主页右侧广告位',
        4 => '文章banner',
        5 => '文章右侧广告位置',
    ];

    //后台用户sessionKey
    const SESSION_KEY_ADMIN_ID = 'admin_id';
    const SESSION_KEY_ADMIN_INFO = 'admin_info';

    //前台用户session
    const SESSION_KEY_USER_ID = 'user_id';
    const SESSION_KEY_USER_INFO = 'user_info';

    //用户是否是管理员
    const USER_IS_ADMIN_YES = 1;
    const USER_IS_ADMIN_NO = 0;

    //评论key
    const COOKIE_KEY_COMMENT_AUTHOR = 'comment_author';
    const COOKIE_KEY_COMMENT_AUTHOR_EMAIL = 'comment_author_email';
    const COOKIE_KEY_COMMENT_AUTHOR_URL = 'comment_author_url';
    //评论
    const COOKIE_KEY_COMMENT_EXPIRE = 7*24*60*60;

}