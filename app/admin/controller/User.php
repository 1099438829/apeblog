<?php

namespace app\admin\controller;

use app\admin\model\Document as aModel;
use app\Request;
use learn\services\UtilService as Util;

/**
 * Class User
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class User extends AuthController
{
    /**
     * 活动列表
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-02-16 13:15
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
            ['status',''],
            ['tel',''],
            ['start_time',''],
            ['end_time',''],
            ['role_id',''],
            ['status',''],
            ['page',1],
            ['limit',20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 用户回收站
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-02-16 13:26
     */
    public function recovery()
    {
        return $this->fetch();
    }
}