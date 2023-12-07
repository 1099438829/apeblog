<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\admin\model\AdminLog as lModel;
use app\Request;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

/**
 * 日志
 * Class AdminLog
 * @package app\admin\controller\admin
 */
class AdminLog extends AuthController
{
    protected $noNeedLogin = ['index'];

    /**
     * 主页
     * @return string
     * @throws Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 权限列表
     * @param Request $request
     * @return Response
     * @throws DbException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['name', ''],
            ['ip', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 20],
        ],$request);
        return app("json")->layui(lModel::systemPage($where));
    }

    /**
     * 清空日志
     * @throws Exception
     */
    public function empty()
    {
        $res = (new \app\admin\model\AdminLog)->where("1=1")->delete();
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}