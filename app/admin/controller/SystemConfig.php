<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\SystemConfig as cModel;
use app\common\model\SystemConfigTab as tModel;
use app\Request;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use Psr\SimpleCache\InvalidArgumentException;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Cache;
use think\Response;

/**
 * 系统配置
 * Class SystemConfig
 * @package app\admin\controller\system
 */
class SystemConfig extends AuthController
{
    /**
     * 基础配置
     * @param int $tab_id
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function base($tab_id = 1): string
    {
        $system = cModel::getLstByTabId($tab_id);
        //特殊处理主题信息,这里不允许修改主题信息
        if ($tab_id == 1) {
            foreach ($system as $key => &$form) {
                if ($form['form_name'] == 'web_template') {
                    unset($system[$key]);
                }
            }
        }
        $where = [
            'status' => 1
        ];
        $tabList = tModel::lst($where);
        $this->assign("tab_id", $tab_id);
        $this->assign("tab_list", $tabList['data']);
        $this->assign("system", $system);
        return $this->fetch();
    }

    /**
     * @param Request $request
     * @return string
     * @throws InvalidArgumentException
     * @throws Exception
     */
    public function clearCache(Request $request)
    {
        if ($request->isPost()) {
            $adminPath = config("cache.runtime") . "/admin/temp";
            $commonPath = config("cache.runtime") . "/cache/";
            $indexPath = config("cache.runtime") . "/index/temp";
            $apiPath = config("cache.runtime") . "/api/temp";
            Cache::clear();
            remove_cache($adminPath);
            remove_cache($indexPath);
            remove_cache($apiPath);
            remove_cache($commonPath);
            return app("json")->success("操作成功");
        }
        return $this->fetch();
    }

    /**
     * 列表
     * @param Request $request
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['page', 1],
            ['limit', 20],
            ['tab_id', 0]
        ],$request);
        return app("json")->layui(cModel::lst($where));
    }

    /**
     * 列表
     * @param int $tab_id
     * @return string
     * @throws Exception
     */
    public function index(int $tab_id = 0): string
    {
        $this->assign("tab", tModel::find($tab_id));
        return $this->fetch("list");
    }

    /**
     * 添加
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     */
    public function add(Request $request): string
    {
        $form = array();
        $form[] = Elm::hidden('tab_id', $request->param("tab_id"))->col(10);
        $form[] = Elm::select('tag_type', '标签类型')->options(tag_options())->col(10);
        $form[] = Elm::select('form_type', '表单类型')->options(type_options())->col(10);
        $form[] = Elm::input('name', '标题名称')->col(10);
        $form[] = Elm::input('form_name', '表单名称')->col(10);
        $form[] = Elm::input('value', '内容')->col(10);
        $form[] = Elm::number('rank', '排序', 0)->col(10);
        $form[] = Elm::textarea('param', '参数')->col(20);
        $form[] = Elm::textarea('remark', '字段备注')->col(20);
        $form[] = Elm::radio('is_show', '是否显示', 1)->options([['label' => '隐藏', 'value' => 0], ['label' => '显示', 'value' => 1]])->col(10);
        $form[] = Elm::radio('upload_type', '上传配置', 0)->options([['label' => '单选', 'value' => 0], ['label' => '多选', 'value' => 1]])->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(10);
        $form = Form::make_post_form($form, url('/admin/system_config/save')->build());
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
    public function edit(string $id = ''): string
    {
        if (!$id) return app("json")->fail("项目id不能为空");
        $info = (new \app\common\model\SystemConfig)->find($id);
        if (!$info) return app("json")->fail("没有该项目");
        $form = array();
        $form[] = Elm::hidden('tab_id', $info['tab_id'])->col(10);
        $form[] = Elm::select('tag_type', '标签类型', $info['tag_type'])->options(tag_options())->col(10);
        $form[] = Elm::select('form_type', '表单类型', $info['form_type'])->options(type_options())->col(10);
        $form[] = Elm::input('name', '标题名称', $info['name'])->col(10);
        $form[] = Elm::input('form_name', '表单名称', $info['form_name'])->col(10);
        $form[] = Elm::input('value', '内容', $info['value'])->col(10);
        $form[] = Elm::number('rank', '排序', $info['rank'])->col(10);
        $form[] = Elm::textarea('param', '参数', $info['param'])->col(20);
        $form[] = Elm::textarea('remark', '字段备注', $info['remark'])->col(20);
        $form[] = Elm::radio('is_show', '是否显示', $info['is_show'])->options([['label' => '隐藏', 'value' => 0], ['label' => '显示', 'value' => 1]])->col(10);
        $form[] = Elm::radio('upload_type', '上传配置', $info['upload_type'])->options([['label' => '单选', 'value' => 0], ['label' => '多选', 'value' => 1]])->col(10);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(10);
        $form = Form::make_post_form($form, url('/admin/system_config/save', ["id" => $id])->build());
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
            ['tab_id', 0],
            ['tag_type', ''],
            ['form_type', ''],
            ['form_name', ''],
            ['value', ''],
            ['rank', 1],
            ['remark', ''],
            ['param', ''],
            ['is_show', 1],
            ['upload_type', 0],
            ['status', 1]
        ]);
        if ($data['name'] == "") return app("json")->fail("标题名称不能为空");
        if ($data['tag_type'] == "") return app("json")->fail("标签类型不能为空");
        if ($data['form_type'] == "") return app("json")->fail("表单类型不能为空");
        if ($data['form_name'] == "") return app("json")->fail("表单名称不能为空");
        if ($id == "") {
            $data['create_user'] = $this->adminId;
            $data['create_time'] = time();
            $res = cModel::create($data);
        } else {
            $data['update_user'] = $this->adminId;
            $data['update_time'] = time();
            $res = cModel::update($data, ['id' => $id]);
        }
        //修改完需要更新缓存
        cache(Data::DATA_SYSTEM_CONFIG, null);//清除缓存
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 提交修改
     * @param Request $request
     * @return mixed
     */
    public function ajaxSave(Request $request)
    {
        try {
            foreach ($request->param() as $k => $v) cModel::editValueByFormName($k, $v);
            cache(Data::DATA_SYSTEM_CONFIG, null);//清除缓存
            return app("json")->success("操作成功");
        } catch (Exception $e) {
            return app("json")->fail("操作失败");
        }

    }
}