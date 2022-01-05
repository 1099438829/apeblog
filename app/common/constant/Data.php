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
    const DATA_DOCUMENT_CATEGORY_LIST = 'data_document_category_list'; //文章分类
    const CURR_CATEGORY_PATENT_ID = 'curr_category_patent_id'; //当前分类腹肌id
    const DATA_SYSTEM_CONFIG = 'data_system_config'; //系统配置
    const DATA_ADVERT = 'data_advert'; //广告

    //后台用户sessionKey
    const SESSION_KEY_ADMIN_ID = 'admin_id';
    const SESSION_KEY_ADMIN_INFO = 'admin_info';

    //前台用户session
    const SESSION_KEY_USER_ID = 'user_id';
    const SESSION_KEY_USER_INFO = 'user_info';
}