<?php

namespace app\api\controller;

use app\admin\controller\AuthController;
use app\common\constant\Data;
use app\common\model\SystemConfig;

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
    public function index() : string
    {
        return  app("json")->success("获取成功", 'code');
    }

    public  function config(){
        $systemConfig = cache(Data::DATA_SYSTEM_CONFIG);
        if (empty($systemConfig)) {
            $systemConfig = SystemConfig::getSystemConfigValues();
            cache(Data::DATA_SYSTEM_CONFIG, $systemConfig);
        }
        return app("json")->success($systemConfig,"code");
    }
}