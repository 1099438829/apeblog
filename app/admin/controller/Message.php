<?php

namespace app\admin\controller;

use app\common\model\MessageForm as aModel;
use app\Request;
use app\admin\extend\Util as Util;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Message
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Message extends AuthController
{
    /**
     * 构造方法 初始化一些参数
     */
    public function initialize()
    {
        parent::initialize();
        //修正因为修改model名称和原来不能对应导致的model功能异常
        $this->model = new aModel();
    }

    /**
     * 留言管理
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-19 11:53
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 留言列表
     * @param Request $request
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-19 11:54
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['author', ''],
            ['tel', ''],
            ['email', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }
}