<?php

namespace app\admin\controller;

use app\common\model\AdminAuth;
use app\common\model\AdminNotify;
use app\Request;
use app\admin\services\UtilService as Util;

class Index extends AuthController
{
    // 无需登录的
    protected $noNeedLogin = ['test','accessauth','pddlogin'];
    /**
     * 后台首页
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $this->assign("adminInfo",$this->adminInfo);
        $menuList = cache(AdminAuth::getMenuCacheKey($this->adminId));
        if($menuList === null){
            $menuList = AdminAuth::getMenu(0,$this->auth);
            cache(AdminAuth::getMenuCacheKey($this->adminId),$menuList,1*60*60);
        }
        $this->assign("menu",$menuList);
        $message = ['data'=>[],'count'=>0];
        $this->assign("message",$message);
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
        $menuList = cache(AdminAuth::getMenuCacheKey($this->adminId));
        if($menuList === null){
            $menuList = AdminAuth::getMenu(0,$this->auth);
            cache(AdminAuth::getMenuCacheKey($this->adminId),$menuList,1*60*60);
        }
        return app("json")->success($menuList);
    }
}