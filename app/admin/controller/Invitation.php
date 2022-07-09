<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\common\model\InvitationCode as aModel;
use app\Request;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Invitation
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Invitation extends AuthController
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
     * 邀请码列表
     * @return string
     * @throws Exception
     * @author 木子的忧伤
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
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-15 23:26
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['code', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-20 14:32
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['code', ''],
            ['status', 0],
        ]);
        if ($data['code'] == "") return app("json")->fail("邀请码不能为空");
        if ($id == "") {
            //判断下用户是否存在
            $info = aModel::where('code', $data['code'])->find();
            if ($info) {
                return app("json")->fail("邀请码已存在");
            }
            $data['user'] = $this->adminId;
            $res = aModel::create($data);
        } else {
            $data['user'] = $this->adminId;
            $res = aModel::update($data, ['id' => $id]);
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 批量添加
     * @param string $id
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-20 14:35
     */
    public function addMultiple($id = "")
    {
        $data = Util::postMore([
            ['name', ''],
            ['number', 1],
        ]);
        if ($data['name'] == "") return app("json")->fail("邀请码前缀不能为空");
        if ($data['number'] == "") return app("json")->fail("数量不是数字或者小于1");
        $count = intval($data['number']);
        for ($i = 0; $i < $count; $i++) {
            $code['code'] = ($data['name'] . substr(time(), -6) . rand(0, 9999));
            $code['status'] = 0;
            $code['user'] = $this->adminId;
            $check = aModel::where('code')->find();
            if ($check == null || $check == false) {
                $res = aModel::create($code);
            } else {
                continue;
            }
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

}