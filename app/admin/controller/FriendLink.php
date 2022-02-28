<?php

namespace app\admin\controller;

use app\common\constant\Data;
use app\common\model\FriendLink as aModel;
use app\admin\extend\FormBuilder as Form;
use app\Request;
use app\admin\extend\Util as Util;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Route as Url;

/**
 * Class Message
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class FriendLink extends AuthController
{
    /**
     * 账号列表
     * @return string
     * @throws Exception
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 文章列表
     * @param Request $request
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:26
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['title', ''],
            ['status', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加友链
     * @return string
     * @throws FormBuilderException
     */
    public function add()
    {
        $form = array();
        $form[] = Elm::input('title', '链接名称')->col(10);
        $form[] = Elm::input('url', '链接地址')->col(10);
        $form[] = Elm::frameImage('image', '网站图标', Url::buildUrl('admin/image/index', array('fodder' => 'image', 'limit' => 1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort', '排序')->col(10);
        $form[] = Elm::textarea('description', '描述')->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改友链
     * @return string
     * @throws FormBuilderException
     */
    public function edit($id = "")
    {
        if (!$id) return app("json")->fail("数据id不能为空");
        $ainfo = aModel::get($id);
        if (!$ainfo) return app("json")->fail("没有该数据");
        $form = array();
        $form[] = Elm::input('title', '链接名称', $ainfo['title'])->col(10);
        $form[] = Elm::input('url', '链接地址', $ainfo['url'])->col(10);
        $form[] = Elm::frameImage('image', '网站图标', Url::buildUrl('admin/image/index', array('fodder' => 'image', 'limit' => 1)), $ainfo['image'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort', '排序', $ainfo['sort'])->col(10);
        $form[] = Elm::textarea('description', '描述', $ainfo['description'])->col(10);
        $form[] = Elm::radio('status', '状态', $ainfo['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('save', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['id', ''],
            ['title', ''],
            ['url', ''],
            ['image', ''],
            ['description', ''],
            ['sort', ''],
            ['status', 1],
        ]);
        if ($data['title'] == "") return app("json")->fail("链接名称不能为空");
        if ($data['url'] == "") return app("json")->fail("链接地址不能为空");
        if (is_array($data['image'])) $data['image'] = $data['avatar'][0];
        if ($id == "") {
            //判断下用户是否存在
            $info = aModel::where('url', $data['url'])->find();
            if ($info) {
                return app("json")->fail("链接已存在");
            }
            $data['uid'] = $this->adminId;
            $res = aModel::create($data);
        } else {
            $data['uid'] = $this->adminId;
            $res = aModel::update($data, ['id' => $id]);
        }
        cache(Data::DATA_FRIEND_LINK, null);//清除缓存
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
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
        cache(Data::DATA_FRIEND_LINK, null);//清除缓存
        return aModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }
}