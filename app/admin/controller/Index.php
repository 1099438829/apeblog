<?php

namespace app\admin\controller;

use app\common\model\{AdminAuth, Document, FriendLink, MessageForm, AdminNotify, User};
use Exception;
use think\db\exception\{DataNotFoundException, DbException, ModelNotFoundException};

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
        $this->assign("menu", AdminAuth::getAuthList($this->adminId,$this->auth));
        $this->assign("message", AdminNotify::pageList(5));
        return $this->fetch();
    }

    /**
     * 控制台
     * @return string
     * @throws Exception
     */
    public function main()
    {
        $this->assign("document_count", Document::counts());
        $this->assign("user_count", User::counts(new User()));
        $this->assign("friend_link_count", FriendLink::counts(new FriendLink()));
        $this->assign("message_form_count", MessageForm::counts(new MessageForm()));
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
