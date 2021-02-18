<?php

namespace app\admin\controller;

use app\admin\model\AdminAuth;
use app\admin\model\AdminNotify;
use app\Request;
use learn\services\UtilService as Util;

class Index extends AuthController
{
    // 无需登录的
    protected $noNeedLogin = ['test','accessauth','pddlogin'];
    // 无需权限的
    protected $noNeedRight = [''];

    /**
     * 后台首页
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $this->assign("adminInfo",$this->adminInfo);
        $this->assign("menu",AdminAuth::getMenu(0,$this->auth));
        $this->assign("message",AdminNotify::pageList(5));
        return $this->fetch();
    }

    /**
     * 控制台
     * @return string
     * @throws \Exception
     */
    public function main()
    {
        return $this->fetch();
    }

    /**
     * 菜单
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function menu()
    {
        return app("json")->success(AdminAuth::getMenu(0,$this->auth));
    }
}