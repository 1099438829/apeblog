<?php

namespace app\admin\controller;


use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\model\SystemConfig as cModel;
use app\common\model\SystemConfigTab as tModel;
use app\Request;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

/**
 * 管理员配置
 * Class SystemConfigTab
 * @package app\admin\controller\system
 */
class SystemConfigTab extends AuthController
{
    /**
     * @throws \Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 列表
     * @param Request $request
     * @return Response
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['page', 1],
            ['limit', 20],
            ['name', ''],
            ['status', ''],
        ]);
        return app("json")->layui(tModel::lst($where));
    }

    /**
     * 添加
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     * @throws \Exception
     */
    public function add(Request $request): string
    {
        $form = array();
        $form[] = Elm::input('name', '分类名称')->col(10);
        $form[] = Elm::number('rank', '排序', 0)->col(24);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(24);
        $form = Form::make_post_form($form, url('/admin/system_config_tab/save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改
     * @param string $id
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws FormBuilderException
     * @throws ModelNotFoundException
     */
    public function edit($id = ''): string
    {
        if (!$id) return app("json")->fail("项目id不能为空");
        $info = tModel::find($id);
        if (!$info) return app("json")->fail("没有该项目");
        $form = array();
        $form[] = Elm::input('name', '分类名称', $info['name'])->col(10);
        $form[] = Elm::number('rank', '排序', $info['rank'])->col(24);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(24);
        $form = Form::make_post_form($form, url('/admin/system_config_tab/save', ["id" => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     */
    public function save(string $id = "")
    {
        $data = Util::postMore([
            ['name', ''],
            ['rank', 0],
            ['status', 1]
        ]);
        if ($data['name'] == "") return app("json")->fail("分类名称不能为空");
        if ($id == "") {
            $data['create_user'] = $this->adminId;
            $data['create_time'] = time();
            $res = tModel::create($data);
        } else {
            $data['update_user'] = $this->adminId;
            $data['update_time'] = time();
            $res = tModel::update($data, ['id' => $id]);
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 重写删除
     * @param Request $request
     * @return mixed|void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function del(Request $request)
    {
        $ids = $request->param("id", 0);
        if ($ids == 0) return app("json")->fail("参数有误，Id为空！");
        if (!is_array($ids)) $ids = array_filter(explode(",", $ids));
        if (cModel::where("tab_id", "in", $ids)->count() > 0) return app("json")->fail("该配置项下有配置数据，不能删除！");
        return parent::del($request);
    }
}