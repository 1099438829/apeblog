<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\DocumentCategory as aModel;
use app\Request;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Article
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Category extends AuthController
{
    /**
     * 分类
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-17 11:40
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 权限列表
     * @param Request $request
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['name', ''],
            ['status', '']
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 保存
     * @param $id
     * @return
     */
    public function save()
    {
        $data = Util::postMore([
            ['id', ''],
            ['title', ''],
            ['alias', ''],
            ['pid', 0],
            ['meta_title', ''],
            ['keywords', ''],
            ['description', ''],
            ['template', ''],
            ['sort', 0],
            ['status', 1]
        ]);
        if ($data['title'] == "") return app("json")->fail("分类名称不能为空");
        if ($data['template'] == "") return app("json")->fail("模板不能为空");
        //判断是否写了别名，没写则需要生成
        if ($data['alias'] == "") $data['alias'] = get_rand_str(8);
        if ($data['id'] == "") {
            $model = new aModel();
            $res = $model->create($data);
        } else {
            $res = aModel::update($data, ['id' => $data['id']]);
        }
        cache(Data::DATA_DOCUMENT_CATEGORY_LIST, null);
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 修改字段
     * @param $id
     * @return aModel
     */
    public function field($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        cache(Data::DATA_DOCUMENT_CATEGORY_LIST, null);
        return aModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 新增页
     * @return string
     * @throws Exception
     */
    public function add($pid = '')
    {
        $templatePath = system_config('web_template');
        $themeInfoFile = public_path('template' . DIRECTORY_SEPARATOR . $templatePath) . 'info.json';
        if (file_exists($themeInfoFile)) {
            $themeInfo = json_decode(file_get_contents($themeInfoFile), true);
            $themeList = $themeInfo['category_list'];
        } else {
            $themeList = [];
        }
        $where = Util::postMore([
            'name' => '',
            'status' => '',
        ]);
        $category = aModel::systemPage($where);
        $category = get_tree_list($category);
        $this->assign("category", $category);
        $this->assign("pid", $pid);
        $this->assign("template_list", $themeList);
        return $this->fetch();
    }

    /**
     * 编辑页
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-20 17:00
     */
    public function edit(Request $request)
    {
        $templatePath = system_config('web_template');
        $themeInfoFile = public_path('template' . DIRECTORY_SEPARATOR . $templatePath) . 'info.json';
        if (file_exists($themeInfoFile)) {
            $themeInfo = json_decode(file_get_contents($themeInfoFile), true);
            $themeList = $themeInfo['category_list'];
        } else {
            $themeList = [];
        }
        $where = Util::postMore([
            'name' => '',
            'status' => '',
        ]);
        $category = aModel::systemPage($where);
        $category = get_tree_list($category);
        $info = aModel::get($request->param(['id']));
        $this->assign("category", $category);
        $this->assign("info", $info);
        $this->assign("template_list", $themeList);
        return $this->fetch();
    }

    /**
     * 删除分类
     * @param Request $request
     * @return mixed|void
     * @author 木子的忧伤
     * @date 2021-04-01 21:56
     */
    public function del(Request $request)
    {
        $where = Util::postMore([
            ['id', ''],
        ]);
        $model = new aModel();
        $res = $model->where('id', $where['id'])->delete();
        cache(Data::DATA_DOCUMENT_CATEGORY_LIST, null);
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}