<?php

namespace app\api\controller;

use app\admin\controller\AuthController;
use app\common\constant\Data;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends AuthController
{
    /**
     * 入口跳转链接
     */
    public function index()
    {
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlrecord('网站首页');
        }
        //清除可能存在的栏目分类树id
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);
        return $this->fetch();
    }
}