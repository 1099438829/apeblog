<?php

namespace app\admin\controller;

use app\common\model\AdminAuth;
use app\common\model\Document;
use app\common\model\Document as DocumentModel;
use app\common\model\Tag as TagModel;
use app\common\model\DocumentCategory;
use app\common\model\DocumentCategory as DocumentCategoryModel;
use app\common\model\FriendLink;
use app\common\model\MessageForm;
use app\common\model\AdminNotify;
use app\common\model\Tag;
use app\common\model\User;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Request;

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
        $messageList = AdminNotify::pageList(5);
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
        $documentCount = Document::counts(new Document());
        $this->assign("document_count", $documentCount);
        $userCount = User::counts(new User());
        $this->assign("user_count", $userCount);
        $FriendLinkCount = FriendLink::counts(new FriendLink());
        $this->assign("friend_link_count", $FriendLinkCount);
        $messageFormCount = MessageForm::counts(new MessageForm());
        $this->assign("message_form_count", $messageFormCount);
        $data =[
            "page"=> 0 ,
            "limit" => 5
        ];
        $articleList = Document::systemPage($data)['data'];
        $this->assign("article_list", $articleList);
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