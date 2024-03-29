<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\admin\model\AdminNotify as nModel;
use Exception;

/**
 * 消息提醒
 * Class AdminNotify
 * @package app\admin\controller\admin
 */
class AdminNotify extends AuthController
{
    /**
     * 列表
     * @return mixed
     * @throws Exception
     */
    public function index() : string
    {
        $where = Util::postMore([
            ['title', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['is_read', ''],
            ['uid', $this->adminId],
        ]);
        $this->assign("where", $where);
        $this->assign("list", nModel::systemPage($where));
        return $this->fetch();
    }
}