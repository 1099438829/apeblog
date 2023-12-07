<?php

namespace app\admin\controller;

use app\admin\model\AdminAuth;
use app\admin\model\AdminNotify;
use app\common\model\{Document, FriendLink, MessageForm, User};
use Exception;
use think\db\exception\{DataNotFoundException, DbException, ModelNotFoundException};

class Index extends AuthController
{
    /**
     * 后台首页
     * @return string
     * @throws Exception
     */
    public function index(): string
    {
        $this->assign("adminInfo", $this->adminInfo);
        $this->assign("menu", AdminAuth::getAuthList($this->adminId,$this->auth));
        $this->assign("message", AdminNotify::pageList(5));
        return $this->fetch();
    }

    /**
     * 控制台
     * @return string
     * @throws Exception
     */
    public function main(): string
    {
        $this->assign("document_count", (new Document)->count());
        $this->assign("user_count", (new User())->count());
        $this->assign("friend_link_count",(new FriendLink())->count());
        $this->assign("message_form_count", (new MessageForm())->count());
        $this->assign("article_list", Document::systemPage(["page"=> 0 ,"limit" => 5])['data']);
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
        return app("json")->success(AdminAuth::getAuthList($this->adminId,$this->auth));
    }
}
