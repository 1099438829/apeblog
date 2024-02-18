<?php

namespace app\index\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Document;
use app\common\model\Document as DocumentModel;
use app\common\model\DocumentCategory as DocumentCategoryModel;
use app\common\model\FriendLink as friendLinkModel;
use app\common\model\MessageForm as MessageFormModel;
use app\common\model\Tag as TagModel;
use app\index\validate\Msg as MsgValidate;
use app\index\validate\FriendLink as FriendLinkValidate;
use app\Request;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Log;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends Base
{
    /**
     * 入口跳转链接
     * @throws \Exception
     */
    public function index(): string
    {
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlRecord('网站首页');
        }
        //清除可能存在的栏目分类树id
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);
        return $this->fetch();
    }

    /**
     * 友链申请
     * @param Request $request
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws \Exception
     * @author 木子的忧伤
     * @date 2021-10-17 1:03
     */
    public function applyLink(Request $request): string
    {
        if (request()->isPost()) {
            $data = Util::postMore([
                ['id', ''],
                ['title', ''],
                ['url', ''],
                ['image', ''],
                ['description', ''],

            ]);
            $friendLinkValidate = new FriendLinkValidate();
            if (!$friendLinkValidate->check($data)) {
                $this->error($friendLinkValidate->getError());
            }
            //判断下用户是否存在
            $info = friendLinkModel::where('url', $data['url'])->find();
            if ($info) {
                $this->error("记录已存在");
            }
            $data['status'] = 0;
            $res = friendLinkModel::create($data);
            if ($res) {
                $this->success('申请成功，请耐心等待审核');
            } else {
                $this->error('提交失败，请联系站长查看');
            }
        } else {
            //清除可能存在的栏目分类树id
            cache(Data::CURR_CATEGORY_PATENT_ID, false);
            //模板兼容性标签
            $this->assign('id', false);
            $this->assign('cid', false);
            return $this->fetch();
        }
    }

    /**
     * 留言页面
     * @param Request $request
     * @return string
     * @throws \Exception
     * @author 木子的忧伤
     * @date 2021-10-17 1:03
     */
    public function msg(Request $request): string
    {
        if (request()->isPost()) {
            $data = Util::postMore([
                ['captcha',''],
                ['author', ''],
                ['tel', ''],
                ['email', ''],
                ['content', ''],
            ]);
            //开始判断留言是否显示验证码,显示则需要判断验证码
            if ($data['captcha'] != "" && !captcha_check($data['captcha'])){
                // 验证码验证
                $this->error('验证码不正确', null);
            }
            $data['create_time'] = time();
            $data['reply_content'] = '';
            $messageFormValidate = new MsgValidate();
            if (!$messageFormValidate->check($data)) {
                $this->error($messageFormValidate->getError());
            }
            $res = MessageFormModel::create($data);
            if ($res) {
                $this->success('留言成功');
            } else {
                $this->error('留言失败');
            }
        } else {
            //清除可能存在的栏目分类树id
            cache(Data::CURR_CATEGORY_PATENT_ID, false);
            //模板兼容性标签
            $this->assign('id', false);
            $this->assign('cid', false);
            return $this->fetch();
        }
    }

    /**
     * 关于页面
     * @param Request $request
     * @return string
     * @throws \Exception
     * @author 木子的忧伤
     * @date 2022-06-21 23:48
     */
    public function about(Request $request): string
    {
        $id = "about";
        //获取该文章
        $documentModel = new Document();
        $article = $documentModel->getInfo($id, Data::DOCUMENT_TYPE_PAGE);
        if (!$article) {
            $this->error('文章不存在或已删除！');
        }
        //添加当前页面的位置信息

        $article['position'] = '<a href="/">首页</a><span>&gt;</span>';
        //更新浏览次数
        $documentModel->where('id', $article['id'])->inc('view')->update();
        $template = Data::DOCUMENT_TYPE_PAGE . '/' . ($article['template'] ?: 'index.html');
        $templateFile = config('view.view_path') . $template;
        if (!is_file($templateFile)) {
            //配置的模版文件不存在则走默认模版
            $template =  Data::DOCUMENT_TYPE_PAGE . '/' . 'index.html';
            $templateFile = config('view.view_path') . $template;
            if (!is_file($templateFile)){
                $this->error('模板文件不存在！');
            }
        }
        $article['category_title'] = "单页";
        //判断SEO 为空则取系统
        $article['meta_title'] = $article['title'];
        $article['keywords'] = $article['keywords'] ?: web_config('keywords');
        $article['description'] = $article['description'] ?: web_config('description');
        //输出文章内容
        $this->assign('apeField', $article);
        $this->assign('id', $id);
        //当前页面所属分类id
        $this->assign('cid', $article['category_id']);
        //设置文章的url
        $article['link_str'] = make_detail_url($article);
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlRecord($article['title']);
        }
        Log::info('详情页模板路径：' . $templateFile);
        //去除后缀
        $template = substr($template, 0, strpos($template, '.'));
        return $this->fetch($template);
    }

    /**
     * 标签列表
     * @return mixed
     * @author 木子的忧伤
     * @date 2021-11-11 0:27
     */
    public function tagList()
    {
        $where = Util::postMore([
            ['name', ''],
            ['page', 1],
            ['limit', 10]
        ]);
        return app("json")->layui(TagModel::getList($where));
    }

    /**
     * 生成sitemap.xml
     * @return \think\Response
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function sitemap(): \think\Response
    {
        //获取域名
        $domain = request()->domain();
        $cache_key = "sitemap.xml";
        //先获取缓存是否存在
        if ($content = cache($cache_key)){
            return response($content)->header(['Content-Type'=>'application/xml']);
        }
        // 通过输出缓冲区内容，生成XML
        $str = '<?xml version="1.0" encoding="UTF-8"?>';
        $str.= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">';
        //首页
        $str .= '<url>';
        $str .= '<loc>' . $domain . '</loc>';
        $str .= '<lastmod>' . date("Y-m-d\TH:i:s+00:00",time()). '</lastmod>';
        $str .= '<changefreq>daily</changefreq>';
        $str .= '<priority>1.0</priority>';
        $str .= '</url>';
        //获取文章分类url
        $documentCategoryModel = new DocumentCategoryModel();
        $categoryInfo = $documentCategoryModel->field('id,alias,title,create_time')
            ->where('status', 1)
            ->order('id desc')->select();
        foreach ($categoryInfo as $v) {
            $str .= '<url>';
            $str .= '<loc>' . url('index/article/lists',["id"=>$v['id']],".html",$domain) . '</loc>';
            $str .= '<lastmod>' . date("Y-m-d\TH:i:s+00:00",strtotime($v['create_time'])) . '</lastmod>';
            $str .= '<changefreq>always</changefreq>';
            $str .= '<priority>0.8</priority>';
            $str .= '</url>';
        }
        //获取文章URL
        $documentModel = new DocumentModel();
        $documentInfo = $documentModel->field('id,alias,create_time')
            ->where('display', 1)
            ->order('id desc')->select();

        foreach ($documentInfo as $v) {
            $str .= '<url>';
            $str .= '<loc>' . url('/article/detail',["id"=>$v["alias"]?:$v['id']],".html",$domain) . '</loc>';
            $str .= '<lastmod>'.date("Y-m-d\TH:i:s+00:00",strtotime($v['create_time'])) .'</lastmod>';
            $str .= '<changefreq>monthly</changefreq>';
            $str .= '<priority>0.6</priority>';
            $str .= '</url>';
        }

        //获取文章标签页url
        $documentModel = new TagModel();
        $documentInfo = $documentModel->field('name,create_time')
            ->group('name')
            ->order('name desc')->select();

        foreach ($documentInfo as $v) {
            $str .= '<url>';
            $str .= '<loc>' . url('/article/tag',["t"=>$v["name"]],".html",$domain) . '</loc>';
            $str .= '<lastmod>'.date("Y-m-d\TH:i:s+00:00",strtotime($v['create_time'])) .'</lastmod>';
            $str .= '<changefreq>monthly</changefreq>';
            $str .= '<priority>0.6</priority>';
            $str .= '</url>';
        }
        $str .= '</urlset>';
        cache($cache_key,$str,24*60*60);//每日更新
        // 将内容输出到浏览器
        return  response($str)->header(['Content-Type'=>'application/xml']);
    }
}