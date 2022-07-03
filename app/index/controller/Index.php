<?php

namespace app\index\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Document;
use app\common\model\FriendLink as friendLinkModel;
use app\common\model\MessageForm as MessageFormModel;
use app\common\validate\MessageForm as MessageformValidate;
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
     */
    public function index()
    {
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlrecord('网站首页');
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
     * @author 李玉坤
     * @date 2021-10-17 1:03
     */
    public function applylink(Request $request)
    {
        if (request()->isPost()) {
            $data = Util::postMore([
                ['id', ''],
                ['title', ''],
                ['url', ''],
                ['image', ''],
                ['description', ''],

            ]);
            if ($data['title'] == "") $this->error("链接名称不能为空");
            if ($data['url'] == "") $this->error("链接地址不能为空");
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
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-17 1:03
     */
    public function msg(Request $request)
    {
        if (request()->isPost()) {
            $data = Util::postMore([
                ['author', ''],
                ['tel', ''],
                ['email', ''],
                ['content', ''],
            ]);
            $data['create_time'] = time();
            $messageFormValidate = new MessageFormValidate();
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
     * @author 李玉坤
     * @date 2022-06-21 23:48
     */
    public function about(Request $request)
    {
       $id = "about";
        //获取该文章
        $documentModel = new Document();
        $article = $documentModel->where('status', 1)->where('id|alias', $id)->find();
        if (!$article) {
            $this->error('文章不存在或已删除！');
        }
        $article = $article->toArray();
        //根据分类id找分类信息
        $dc = get_document_category($article['category_id']);
        if (!$dc) {
            $this->error('栏目不存在或已删除！');
        }
        //获取该文章内容
        //根据文章类型，加载不同的内容。
        $articleType = $article['type'] ? $article['type'] : 'article';
        $articleExt = $documentModel::name('document_' . $articleType)->where('id', $article['id'])->find();
        if (!$articleExt) {
            $this->error('文章不存在或已删除！');
        }
        $articleExt = $articleExt->toArray();
        $article = array_merge($article, $articleExt);
        //添加当前页面的位置信息
        $article['position'] = tpl_get_position($dc);
        //更新浏览次数
        $documentModel->where('id', $article['id'])->inc('view')->update();
        $templateFile = config('view.view_path') . 'article/' . $articleType . '.html';
        if (!is_file($templateFile)) {
            $this->error('模板文件不存在！');
        }
        $article['category_title'] = $dc['title'];
        //判断SEO 为空则取系统
        $article['keywords'] = $article['keywords'] ?: web_config('keywords');
        $article['description'] = $article['description'] ?: web_config('description');
        //输出文章内容
        $this->assign('apeField', $article);
        $this->assign('id', $id);
        //当前页面所属分类id
        $this->assign('cid', $article['category_id']);
        //缓存当前页面栏目分类树ids
        cache(Data::CURR_CATEGORY_PATENT_ID, $dc['pid'] ? $dc['pid'] . ',' . $article['category_id'] : $article['category_id']);
        //设置文章的url
        $article['link_str'] = make_detail_url($article);
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlrecord($article['title']);
        }
        Log::info('详情页模板路径：' . $templateFile);
        return $this->fetch('article/' . $articleType);
    }
}