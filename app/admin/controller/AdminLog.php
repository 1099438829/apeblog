<?php

namespace app\admin\controller;

use app\admin\model\AdminLog as lModel;
use app\Request;
use learn\services\UtilService as Util;

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
     * @throws \Exception
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 权限列表
     * @param Request $request
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['name',''],
            ['ip',''],
            ['start_time',''],
            ['end_time',''],
            ['page',1],
            ['limit',20],
        ]);
        return app("json")->layui(lModel::systemPage($where));
    }

    /**
     * 清空日志
     * @param Request $request
     * @throws \Exception
     */
    public function empty(Request $request)
    {
        $res = lModel::where("1=1")->delete();
        return $res ? app("json")->success("操作成功",'code') : app("json")->fail("操作失败");
    }
}