<?php

namespace app\admin\controller;

use app\common\model\Document as aModel;
use app\common\model\DocumentCategory as cModel;
use app\common\model\DocumentPage;
use app\common\model\Tag as TagModel;
use app\common\model\DocumentArticle;
use app\common\model\Comment as CommentModel;
use app\Request;
use app\admin\extend\Util as Util;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\facade\Log;

/**
 * Class Page
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class Page extends AuthController
{
    /**
     * 文章管理主页
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 文章列表
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:26
     */
    public function lst()
    {
        $where = Util::postMore([
            ['title', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['status', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        $where["type"] = aModel::DOCUMENT_TYPE_PAGE;
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 保存
     * @param string $id
     * @return mixed
     * @author 李玉坤
     * @date 2021-02-28 22:43
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['id', ''],
            ['author', ''],
            ['title', ''],
            ['alias', ''],
            ['category_id', ''],
            ['type', 'page'],
            ['abstract', ''],
            ['keywords', ''],
            ['content', ''],
            ['description', ''],
            ['is_recommend', 0],
            ['is_top', 0],
            ['is_hot', 0],
            ['link_str', ''],
            ['cover_path', ''],
            ['display', 1],
            ['tags', ''],
            ['sort', ''],
            ['status', 1],
        ]);

        if ($data['title'] == "") return app("json")->fail("文章名称不能为空");
        if ($data['category_id'] == "") return app("json")->fail("栏目分类不能为空");
        if ($data['cover_path'] == "") return app("json")->fail("主图不能为空");
        $error = "";
        try {
            $data['author'] = $data['author'] ?: $this->adminInfo['nickname'];
            $data['uid'] = $this->adminId;
            $content = '';
            if (!empty($data['content'])) {
                $content = $data['content'];
            }
            //判断摘要是否为空，为空则从内容摘取
            $data['abstract'] = $data['abstract'] ?: mb_substr(strip_tags($content), 0, 100);
            //判断是否写了别名，没写则需要生成
            if ($data['alias'] == "") $data['alias'] = get_rand_str(6);
            unset($data['content']);
            if ($data['is_recommend']) $data['is_recommend'] = 1;
            if ($data['is_hot']) $data['is_hot'] = 1;
            if ($data['display']) $data['display'] = 1;
            if ($data['is_top']) $data['is_top'] = 1;
            if ($id == "") {
                $data['uid'] = $this->adminInfo['uid'];
                $data['author'] = $data['author'] ?: $this->adminInfo['nickname'];
                $data['create_date'] = date("Y-m-d");
                $data['create_time'] = time();
                $data['update_time'] = time();
                $id = aModel::insertGetId($data);
                if (!empty($content)) {
                    $updateData = [
                        'id' => $id,
                        'content' => $content
                    ];
                    DocumentArticle::insert($updateData);
                }
                if (!empty($data['tags'])) {
                    $tagModel = new TagModel();
                    $tagModel->createTags($data['tags'], $id, $this->adminId);
                }
            } else {
                $ainfo = aModel::get($id);
                if (!$ainfo) return app("json")->fail("数据不存在");
                aModel::where('id', $id)->save($data);
                if (!empty($content)) {
                    $contentInfo = DocumentArticle::where('id', $id)->find();
                    if (!$contentInfo) {
                        $updateData = [
                            'id' => $id,
                            'content' => $content
                        ];
                        DocumentArticle::insert($updateData);
                    } else {
                        //更新文档
                        DocumentArticle::where('id', $id)->save(['content' => $content]);
                    }
                }
                if (!empty($data['tags'])) {
                    $tagModel = new TagModel();
                    $tagModel->createTags($data['tags'], $id, $this->adminId);
                }
            }
            $res = true;
        } catch (Exception $e) {
            Log::error('文章修改失败：失败原因：' . $e->getMessage());
            $error = $e->getMessage();
            $res = false;
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败,错误原因：".$error);
    }


    /**
     * 修改字段
     * @param $id
     * @return mixed
     * @author 李玉坤
     * @date 2021-02-16 23:12
     */
    public function field($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        return aModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 新增文章
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-03-10 14:46
     */
    public function add()
    {
        // 获取页面模板列表
        $themeList = [];
        $themeDir =  public_path('template').system_config('web_template').'/pc/page';
        if ($dh = opendir($themeDir)) {
            while (($file = readdir($dh)) !== false) {

                if ( $file != "." && $file != "..") {
                    $themeList[] = $file;
                }
            }
            closedir($dh);
        }
        $this->assign("themeList", $themeList);
        return $this->fetch();
    }

    /**
     * 编辑页
     * @return string|void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function edit()
    {
        $where = Util::postMore([
            ['id', '']
        ]);
        if ($where['id'] == '') {
            $this->error('数据不存在');
        }
        $info = (new DocumentPage())->getInfo($where["id"]);
        if (empty($info)) {
            $this->error('数据不存在');
        }
        // 获取页面模板列表
        $themeList = [];
        $themeDir = public_path('template/');
        $defaultTheme = system_config('web_template');
        if ($dh = opendir($themeDir.'/'.$defaultTheme.'/pc/page')) {
            if ((is_dir($themeDir . "/" . $file)) && $file != "." && $file != "..") {
                while (($file = readdir($dh)) !== false) {
                    $pageList[] = $file;
                }
            }

            closedir($dh);
        }
        $this->assign("themeList", $themeList);
        $this->assign("info", $info);
        return $this->fetch();
    }

    /**
     * 文章管理主页
     * @return string
     * @throws \Exception
     */
    public function comment()
    {
        return $this->fetch();
    }

    /**
     * 文章评论列表
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-11-03 23:28
     */
    public function commentList()
    {
        $where = Util::postMore([
            ['document_id', ''],
            ['name', ''],
            ['tel', ''],
            ['email', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        if ($where['document_id'] == "") return app("json")->fail("参数错误");
        return app("json")->layui(CommentModel::systemPage($where));
    }


    /**
     * 修改字段
     * @param $id
     * @return mixed
     * @author 李玉坤
     * @date 2021-02-16 23:12
     */
    public function commentField($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        return CommentModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

}