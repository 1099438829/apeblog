<?php

namespace app\admin\controller;

use   app\admin\model\MessageForm as aModel;
use app\Request;
use learn\services\UtilService as Util;

/**
 * Class Message
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class Message extends AuthController
{
    /**
     * 账号列表
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 文章列表
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:26
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['name',''],
            ['tel',''],
            ['email',''],
            ['start_time',''],
            ['end_time',''],
            ['page',1],
            ['limit',20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }
}