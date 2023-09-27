<?php
declare (strict_types=1);

namespace app\api\controller;

use app\BaseController;
use app\common\constant\Data;
use app\common\model\PvLog;
use app\common\model\UrlLog;
use think\facade\Session;

/**
 * 控制器基础类
 */
class Base extends BaseController
{
    /**
     * 当前登陆用户信息
     * @var
     */
    protected $userInfo;

    /**
     * 当前登陆用户ID
     * @var int
     */
    protected $userId;

    // 初始化
    protected function initialize()
    {
        parent::initialize();
    }
}