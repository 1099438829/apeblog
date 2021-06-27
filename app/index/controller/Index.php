<?php
// +----------------------------------------------------------------------
// | HulaCWMS 呼啦企业网站管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2019 http://www.zhuopro.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 灼灼文化
// +----------------------------------------------------------------------

namespace app\index\controller;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends Base
{
    /**
     * 入口跳转链接
     */
    public function index()
    {
        //判断后台统计配置是否开启 1 开启
        if(system_config("web_statistics") ==1){
        //统计url
            $this->urlrecord('网站首页');
        }
        //清除可能存在的栏目分类树id
        cache('curr_category_patent_id',false);
        //模板兼容性标签
        $this->assign('id',false);
        $this->assign('cid',false);
        return $this->fetch();
    }
}