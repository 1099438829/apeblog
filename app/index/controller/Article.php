<?php

namespace app\index\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Comment as commentModel;
use app\common\model\Document;
use app\common\model\DocumentCategory;
use app\common\model\DocumentCategoryContent;
use app\common\model\Tag as TagModel;
use app\Request;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\facade\Log;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Article extends Base
{
    /**
     * 列表页
     * @return string
     * @throws Exception
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-29 0:17
     */
    public function lists()
    {
        $dc = false;
        //栏目分类id
        $id = input('id/d');
        //栏目分类标识
        $name = input('name');
        if ($id) {
            //获取分类信息
            $dc = get_document_category($id);
        } elseif ($name) {
            //接收name字段,当name不为空的时候，通过name查询分类，一般name会用于伪静态
            $dc = get_document_category_by_name($name);
        }
        if (!$dc) {
            $this->error('栏目不存在或已删除！');
        }
        //赋值分类id，可能是通过栏目分类id获取的栏目分类数据
        $id = $dc['id'];
        $documentCategoryModel = new DocumentCategory();
        //栏目存在  增加访问量
        $documentCategoryModel->where('id|alias', $id)->inc('view')->update();
        //判断后台统计配置是否开启 1 开启
        if (web_config("web_statistics") == 1) {
            //统计url
            $this->urlrecord($dc['title']);
        }
        //读取列表页模板
        if ($dc['type'] == 0) {
            if (empty($dc['template'])) {
                $this->error('请在栏目分类中，指定当前栏目的列表模板！');
            }
        } elseif ($dc['type'] == 1) {
            if (empty($dc['template'])) {
                $this->error('请在栏目分类中，指定当前栏目的单篇模板！');
            }
            //如果是单篇栏目，加载内容
            $contentModel = new DocumentCategoryContent();
            $dcContent = $contentModel->find($id);
            $dc['content'] = $dcContent['content'];
        }
        $listTmp = $dc['template'];
        if (!is_file(config('view.view_path') . 'category/' . $listTmp)) {
            $this->error('模板文件不存在！');
        }
        Log::info('列表页模板路径：' . config('view.view_path') . 'category/' . $listTmp);
        //文章兼容字段
        $dc['category_id'] = $dc['id'];
        //判断seo标题是否存在
        $dc['meta_title'] = $dc['meta_title'] ? $dc['meta_title'] : $dc['title'];
        //判断SEO 为空则取系统
        $article['keywords'] = $dc['keywords'] ?: web_config('keywords');
        $article['description'] = $dc['description'] ?: web_config('description');
        //添加当前页面的位置信息
        $dc['position'] = tpl_get_position($dc);
        //输出文章分类
        $this->assign('apeField', $dc);
        $this->assign('id', $id);
        //当前页面所属分类id
        $this->assign('cid', $id);
        //缓存当前页面栏目分类树ids
        cache(Data::CURR_CATEGORY_PATENT_ID, $dc['pid'] ? $dc['pid'] . ',' . $id : $id);
        //去除后缀
        $listTmp = substr($listTmp, 0, strpos($listTmp, '.'));
        return $this->fetch('category/' . $listTmp);
    }

    /**
     * 详情页
     * @return string
     * @throws Exception
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-29 0:17
     */
    public function detail()
    {
        $id = input('id');
        if (!$id) {
            $this->error('参数错误！');
        }
        //获取该文章
        $documentModel = new Document();
        if (is_int($id)){
            $article = $documentModel->where('status', 1)->where('id', $id)->find();
        }else{
            $article = $documentModel->where('status', 1)->where('alias', $id)->find();
        }
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

    /**
     * 创建评论
     * @param Request $request
     * @return mixed
     * @author 李玉坤
     * @date 2021-10-17 19:13
     */
    public function create_comment(Request $request)
    {
        $data = Util::postMore([
            ['document_id', ''],
            ['pid', ''],
            ['author', ''],
            ['url', ''],
            ['email', ''],
            ['content', ''],
        ]);
        if (!web_config('comment_close')){
            $this->error('非法操作，请检查后重试', null);
        }
        if (web_config('comment_visitor')){
            if ($data['author'] == "") $this->error("昵称不能为空");
            if ($data['email'] == "") $this->error("邮箱不能为空");
            if ($data['url'] == "") $this->error("url不能为空");
        }else{
            $data['author'] = $this->userInfo['nickname']?:$this->userInfo['username'];
            $data['email'] = $this->userInfo['email']?:'';
            $data['url'] = '';
        }
        if ($data['document_id'] == "") $this->error("文章id不能为空");
        if ($data['content'] == "") $this->error("内容能为空");
        $data['status'] = web_config('comment_review') ? 0 : 1;
        $res = commentModel::create($data);
        if ($res) {
            cookie(Data::COOKIE_KEY_COMMENT_AUTHOR,$data['author'],Data::COOKIE_KEY_COMMENT_EXPIRE);
            cookie(Data::COOKIE_KEY_COMMENT_AUTHOR_EMAIL,$data['email'],Data::COOKIE_KEY_COMMENT_EXPIRE);
            cookie(Data::COOKIE_KEY_COMMENT_AUTHOR_URL,$data['url'],Data::COOKIE_KEY_COMMENT_EXPIRE);
            $this->success('提交成功', url('detail', ['id' => $data['document_id']]));
        } else {
            $this->error('提交失败，请联系站长查看', null);
        }
    }

    /**
     * 文章标签页面
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-29 0:19
     */
    public function tag()
    {
        $tag = input('t');
        if (!trim($tag)) {
            $this->error('请输入标签');
        }
        if (!mb_check_encoding($tag, 'utf-8')) {
            $tag = iconv('gbk', 'utf-8', $tag);
        }
        $apeField['id'] = '0';
        $apeField['title'] = $tag;
        $apeField['meta_title'] = $tag;
        $apeField['keywords'] = web_config('keywords');
        $apeField['description'] = web_config('description');
        $apeField['position'] = '<a href="/">首页</a> > <a>' . $tag . '</a>';
        $this->assign('apeField', $apeField);
        $this->assign('tag', $tag);

        //清除可能存在的栏目分类树id
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);
        $templateFile = config('view.view_path') . 'article/tag.html';
        if (!is_file($templateFile)) {
            $this->error('模板文件不存在！');
        }
        return $this->fetch();
    }

    /**
     * 标签列表
     * @return mixed
     * @author 李玉坤
     * @date 2021-11-11 0:27
     */
    public function tagList()
    {
        $where = Util::postMore([
            ['name', ''],
            ['document_id', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 10]
        ]);
        return app("json")->layui(TagModel::getList($where));
    }

    /**
     * 搜索页面
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-29 0:18
     */
    public function search()
    {
        $kw = input('kw');
        if (!trim($kw)) {
            $this->error('请输入搜索关键词');
        }
        if (!mb_check_encoding($kw, 'utf-8')) {
            $kw = iconv('gbk', 'utf-8', $kw);
        }
        $apeField['id'] = '0';
        $apeField['title'] = '搜索';
        $apeField['meta_title'] = '搜索';
        $apeField['keywords'] = web_config('keywords');
        $apeField['description'] = web_config('description');
        $apeField['position'] = '<a href="/">首页</a> > <a>搜索</a>';
        $this->assign('apeField', $apeField);
        $this->assign('kw', $kw);
        //清除可能存在的栏目分类树id
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);
        $templateFile = config('view.view_path') . 'article/search.html';
        if (!is_file($templateFile)) {
            $this->error('模板文件不存在！');
        }
        return $this->fetch();
    }

    /**
     * 用户首页
     * @return string
     * @throws Exception
     * @author 李玉坤
     * @date 2022-01-24 1:23
     */
    public function user()
    {
        $author = input('author');
        if (!trim($author)) {
            $this->error('请输入搜索关键词');
        }
        if (!mb_check_encoding($author, 'utf-8')) {
            $kw = iconv('gbk', 'utf-8', $author);
        }
        $apeField['id'] = '0';
        $apeField['title'] = $author;
        $apeField['meta_title'] = $author;
        $apeField['keywords'] = web_config('keywords');
        $apeField['description'] = web_config('description');
        $apeField['position'] = '<a href="/">首页</a> > <a>' . $author . '</a>';
        $this->assign('apeField', $apeField);
        $this->assign('author', $author);

        //清除可能存在的栏目分类树id
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);
        $templateFile = config('view.view_path') . 'article/user.html';
        if (!is_file($templateFile)) {
            $this->error('模板文件不存在！');
        }
        return $this->fetch();
    }
}