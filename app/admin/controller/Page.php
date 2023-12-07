<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\common\model\Comment as CommentModel;
use app\common\model\Document;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use app\common\constant\Data;

/**
 * Class Page
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Page extends AuthController
{

    /**
     * 构造方法 初始化一些参数
     */
    public function initialize(): void
    {
        parent::initialize();
        //修正因为修改model名称和原来不能对应导致的model功能异常
        $this->model = new Document();
    }

    /**
     * 文章管理主页
     * @return string
     * @throws \Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 文章列表
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
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
        $where["type"] = Data::DOCUMENT_TYPE_PAGE;
        return app("json")->layui(Document::systemPage($where));
    }

    /**
     * 保存
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-28 22:43
     */
    public function save()
    {
        $data = Util::postMore([
            ['id', ''],
            ['author', ''],
            ['title', ''],
            ['alias', ''],
            ['type', 'page'],
            ['abstract', ''],
            ['keywords', ''],
            ['category_id', 0],
            ['content', ''],
            ['description', ''],
            ['is_recommend', 0],
            ['is_top', 0],
            ['is_hot', 0],
            ['theme', ''],
            ['link_str', ''],
            ['cover_path', ''],
            ['display', 1],
            ['tags', ''],
            ['sort', ''],
            ['status', 1],
            ['author', $this->adminInfo['nickname']],
            ['uid', $this->adminId],
        ]);
        if ($data['title'] == "") return app("json")->fail("文章名称不能为空");
        if ($data['theme'] == "") return app("json")->fail("文章模板不能为空");
        if ($data['cover_path'] == "") return app("json")->fail("主图不能为空");
        $model = new Document();
        $res = $model->updateInfo($data, Data::DOCUMENT_TYPE_PAGE);
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败,错误原因：" . $model->getError());
    }


    /**
     * 修改字段
     * @param $id
     * @return mixed
     * @author 木子的忧伤
     * @date 2021-02-16 23:12
     */
    public function field($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        return Document::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 新增文章
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException|\Exception
     * @author 木子的忧伤
     * @date 2021-03-10 14:46
     */
    public function add()
    {
        // 获取页面模板列表
        $this->getThemeList();
        $themeList = get_theme_list(Data::DOCUMENT_TYPE_PAGE);
        $this->assign("theme_list", $themeList);
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
        $info = (new Document())->getInfo($where["id"], Data::DOCUMENT_TYPE_PAGE);
        if (empty($info)) {
            $this->error('数据不存在');
        }
        // 获取页面模板列表
        $themeList = get_theme_list(Data::DOCUMENT_TYPE_PAGE);
        $this->assign("theme_list", $themeList);
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
     * @author 木子的忧伤
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
     * @author 木子的忧伤
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