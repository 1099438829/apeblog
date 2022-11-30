<?php

namespace app\admin\controller;

use app\common\model\AdminAuth;
use app\common\model\Document;
use app\common\model\Document as DocumentModel;
use app\common\model\DocumentCategory;
use app\common\model\DocumentCategory as DocumentCategoryModel;
use app\common\model\FriendLink;
use app\common\model\MessageForm;
use app\common\model\AdminNotify;
use app\common\model\User;
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

    /**
     * 生成sitemap.xml
     */
    public function sitemap()
    {
        //获取协议
        $protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') || $_SERVER['SERVER_PORT'] == 443) ?
            "https://" : "http://";
        //获取域名
        $domain = $protocol . $_SERVER['HTTP_HOST'];
        //获取页码
        $page = input('page/d');
        if (!$page) {
            $page = 1;
        }
        $str = '';
        if ($page == 1) {
            if (file_exists('sitemap.xml'))
                unlink('sitemap.xml');
            $str .= '<?xml version="1.0"  encoding="utf-8"?>';
            $str .= '<urlset>';
            //首页
            $str .= '<url>';
            $str .= '<loc>' . $domain . '</loc>';
            $str .= '<lastmod>' . date('Y-m-d', time()) . '</lastmod>';
            $str .= '<changefreq>daily</changefreq>';
            $str .= '<priority>1.0</priority>';
            $str .= '</url>';
        }
        $pagesize = 100;

        //获取文章分类url
        $documentCategoryModel = new DocumentCategoryModel();
        $categoryInfo = $documentCategoryModel->field('id,title,create_time')
            ->where('display', 1)->where('status', 1)
            ->page($page, $pagesize)
            ->order('id desc')->select();

        foreach ($categoryInfo as $v) {
            $str .= '<url>';
            $str .= '<loc>' . $domain . url('article/lists?id=' . $v['id']) . '</loc>';
            $str .= '<lastmod>' . $v['create_time'] . '</lastmod>';
            $str .= '<changefreq>always</changefreq>';
            $str .= '<priority>0.8</priority>';
            $str .= '</url>';
        }
        //获取详细页分类url
        $documentModel = new DocumentModel();
        $documentInfo = $documentModel->field('id,create_time')
            ->where('status', 1)
            ->page($page, $pagesize)
            ->order('id desc')->select();

        foreach ($documentInfo as $v) {
            $str .= '<url>';
            $str .= '<loc>' . $domain . url('article/detail?id=' . $v['id']) . $v['id'] . '</loc>';
            $str .= '<lastmod>' . $v['create_time'] . '</lastmod>';
            $str .= '<changefreq>monthly</changefreq>';
            $str .= '<priority>0.6</priority>';
            $str .= '</url>';
        }
        if (count($categoryInfo) < $pagesize && count($documentInfo) < $pagesize) {
            $str .= '</urlset>';
            if (!(file_put_contents('sitemap.xml', $str, FILE_APPEND | LOCK_EX))) {
                $this->error('站点地图更新失败！');
            } else {
                $this->success('站点地图全部更新完成！', null, 'stop');
            }
        }
        //写入
        if (!(file_put_contents('sitemap.xml', $str, FILE_APPEND | LOCK_EX))) {
            $this->error('站点地图更新失败！');
        } else {
            $this->success('站点地图正在生成，请稍后（' . $page . '）...', 'sitemap?page=' . ($page + 1));
        }
    }
}