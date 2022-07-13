<?php

namespace app\index\controller;

use app\admin\controller\AuthController;
use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\FriendLink as friendLinkModel;
use app\common\model\MessageForm as MessageFormModel;
use app\common\model\Tag as TagModel;
use app\common\validate\MessageForm as MessageformValidate;
use app\Request;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

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