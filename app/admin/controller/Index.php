<?php

namespace app\admin\controller;

use app\common\model\AdminAuth;
use app\common\model\AdminNotify;
use app\Request;
use app\admin\extend\Util as Util;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

class Index extends AuthController
{
    /**
     * 后台首页
     * @return string
     * @throws Exception
     */
    public function index()
    {
        $this->assign("adminInfo", $this->adminInfo);
        $menuList = cache(AdminAuth::getMenuCacheKey($this->adminId));
        if ($menuList === null) {
            $menuList = AdminAuth::getMenu(0, $this->auth);
            cache(AdminAuth::getMenuCacheKey($this->adminId), $menuList, 1 * 60 * 60);
        }
        $this->assign("menu", $menuList);
        $messageList = ['data' => [], 'count' => 0];
        $this->assign("message", $messageList);
        return $this->fetch();
    }

    /**
     * 控制台
     * @return string
     * @throws Exception
     */
    public function main()
    {
        return $this->fetch();
    }

    /**
     * 菜单
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function menu()
    {
        $menuList = cache(AdminAuth::getMenuCacheKey($this->adminId));
        if ($menuList === null) {
            $menuList = AdminAuth::getMenu(0, $this->auth);
            cache(AdminAuth::getMenuCacheKey($this->adminId), $menuList, 1 * 60 * 60);
        }
        return app("json")->success($menuList);
    }
}