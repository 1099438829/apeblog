<?php

namespace app\api\controller;

use app\admin\controller\AuthController;
use app\common\constant\Data;

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
        return  app("json")->success("获取成功", 'code');
    }
}