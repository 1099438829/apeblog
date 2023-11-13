<?php

namespace app\index\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Comment as commentModel;
use app\common\model\Document;
use app\index\validate\Comment;
use app\Request;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\ValidateException;
use think\facade\Log;

/**
 * 应用入口
 * Class Page
 * @package app\index\controller
 */
class Page extends Base
{
    /**
     * 详情页
     * @return string
     * @throws Exception
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-10-29 0:17
     */
    public function index()
    {
        $id = input('id');
        if (!$id) {
            $this->error('参数错误！');
        }
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
        $template = Data::DOCUMENT_TYPE_PAGE . '/' . ($article['theme'] ?: 'index.html');
        $templateFile = config('view.view_path') . $template;
        if (!is_file($templateFile)) {
            $this->error('模板文件不存在！');
        }
        $article['category_title'] = "单页";
        //判断SEO 为空则取系统
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
     * 创建评论
     * @param Request $request
     * @return mixed
     * @author 木子的忧伤
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
            try {
                validate(Comment::class)->check($data);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                $this->error($e->getError(), null);
            }
        }elseif(web_config('is_register')){
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

}