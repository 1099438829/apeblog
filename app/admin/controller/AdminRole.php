<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\admin\model\AdminAuth as aModel;
use app\admin\model\AdminRole as rModel;
use app\Request;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

class AdminRole extends AuthController
{
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 角色列表
     * @param Request $request
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        return app("json")->layui(rModel::systemPage());
    }

    /**
     * 添加
     * @param int $pid
     * @return string
     * @throws FormBuilderException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function add($pid = 0)
    {
        $form = array();
        $form[] = Elm::select('pid', '所属上级', (int)$pid)->options(rModel::returnOptions())->filterable(true)->col(18);
        $form[] = Elm::input('name', '角色名称')->col(18);
        $form[] = Elm::treeChecked('tree_data', '选择权限')->data(aModel::selectAndBuildTree(0, $pid != 0 ? explode(",", rModel::find($pid)['auth']) : ($this->adminId == 1 ? aModel::getIds() : $this->auth)))->col(18);
        $form[] = Elm::number('rank', '排序')->col(18);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(18);
        $form = Form::make_post_form($form, url('/admin/admin_role/save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 添加
     * @param int $id
     * @return string
     * @throws FormBuilderException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function edit($id = 0)
    {
        if (!$id) return app("json")->fail("权限id不能为空");
        $rinfo = rModel::find($id);
        if (!$rinfo) return app("json")->fail("没有该权限");
        $form = array();
        $form[] = Elm::select('pid', '所属上级', $rinfo['pid'])->options(rModel::returnOptions())->filterable(true)->col(18);
        $form[] = Elm::input('name', '角色名称', $rinfo['name'])->col(18);
        $form[] = Elm::treeChecked('tree_data', '选择权限', to_int_array(explode(",", $rinfo['tree_data'])))->data(aModel::selectAndBuildTree(0, $rinfo['pid'] == 0 ? aModel::getIds() : explode(",", rModel::find($rinfo['pid'])['auth'])))->col(18);
        $form[] = Elm::number('rank', '排序', $rinfo['rank'])->col(18);
        $form[] = Elm::radio('status', '状态', $rinfo['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(18);
        $form = Form::make_post_form($form, url('/admin/admin_role/save', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存
     * @param string $id
     * @return mixed
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['name', ''],
            ['pid', 0],
            ['tree_data', ''],
            ['rank', 0],
            ['status', 1]
        ]);
        if ($data['name'] == "") return app("json")->fail("角色名称不能为空");
        if ($data['pid'] == "") return app("json")->fail("上级归属不能为空");
        if ($data['tree_data'] == "") return app("json")->fail("权限不能为空");
        $data['auth'] = aModel::getIds($data['tree_data']);
        $data['auth'] = implode(",", array_diff(array_unique($data['auth']), [0]));
        $data['tree_data'] = implode(",", $data['tree_data']);
        if ($id == "") {
            $data['create_user'] = $this->adminId;
            $data['create_time'] = time();
            $res = rModel::create($data);
        } else {
            $data['update_user'] = $this->adminId;
            $data['update_time'] = time();
            $res = rModel::update($data, ['id' => $id]);
        }
        //清理缓存
        aModel::clearCache($this->adminId);
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}