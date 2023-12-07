<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Nav as aModel;
use app\Request;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

/**
 * Class Nav
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Nav extends AuthController
{
    /**
     * @throws Exception
     */
    public function index() : string
    {
        return $this->fetch();
    }

    /**
     * 导航列表
     * @param Request $request
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['title', ''],
            ['status', '']
        ]);
        return app("json")->layui(\app\common\model\Nav::systemPage($where));
    }

    /**
     * 添加
     * @param int $pid
     * @return string
     * @throws FormBuilderException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public function add(int $pid = 0)
    {
        $form = array();
        $form[] = Elm::select('pid', '上级导航', (int)$pid)->options(aModel::returnOptions())->col(10);
        $form[] = Elm::input('title', '导航名称')->col(10);
        // $form[] = Elm::frameInput('icon', '图标', Url::buildUrl('admin/icon/index', array('fodder' => 'icon')))->icon("ios-ionic")->width('96%')->height('390px')->col(10);
        $form[] = Elm::input('url', '链接地址')->col(10);
        $form[] = Elm::input('params', '参数')->placeholder("php数组,不懂不要填写")->col(10);
        $form[] = Elm::number('sort', '排序')->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/nav/save')->build());
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
    public function edit(int $id = 0)
    {
        if (!$id) return app("json")->fail("导航id不能为空");
        $info = aModel::find($id);
        if (!$info) return app("json")->fail("没有该导航");
        $form = array();
        $form[] = Elm::select('pid', '上级导航', $info['pid'])->options(aModel::returnOptions())->col(10);
        $form[] = Elm::input('title', '导航名称', $info['title'])->col(10);
        //$form[] = Elm::frameInput('icon', '图标', Url::buildUrl('admin/widget.icon/index', array('fodder' => 'icon')), $ainfo['icon'])->icon("ios-ionic")->width('96%')->height('390px')->col(10);
        $form[] = Elm::input('url', '链接地址', $info['url'])->col(10);
        $form[] = Elm::input('params', '参数', $info['params'])->placeholder("php数组,不懂不要填写")->col(10);
        $form[] = Elm::number('sort', '排序', $info['sort'])->col(10);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/nav/save', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存
     * @param $id
     * @return
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['title', ''],
            ['pid', 0],
            ['icon', ''],
            ['url', ''],
            ['params', ''],
            ['sort', 0],
            ['status', 1]
        ]);
        if ($data['title'] == "") return app("json")->fail("导航名称不能为空");
        if ($data['pid'] == "") return app("json")->fail("上级归属不能为空");
        if ($data['url'] == "") return app("json")->fail("链接不能为空");
        if ($id == "") {
            $data['create_time'] = time();
            $res = aModel::create($data);
        } else {
            $data['update_time'] = time();
            $res = aModel::update($data, ['id' => $id]);
        }
        //清理缓存
        cache(Data::DATA_NAV_LIST, null);
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
        //清理缓存
        cache(Data::DATA_NAV_LIST, null);
        return aModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }
}