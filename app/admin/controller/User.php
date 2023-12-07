<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\model\User as aModel;
use app\Request;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Route as Url;
use think\Response;

/**
 * 用户管理
 * Class User
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class User extends AuthController
{
    /**
     * 账号列表
     * @return string
     * @throws Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 账号列表
     * @param Request $request
     * @return
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['username', ''],
            ['tel', ''],
            ['is_admin', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['status', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加账号
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     * @throws Exception
     */
    public function add(Request $request): string
    {
        $form = array();
        $form[] = Elm::input('username', '登录账号')->col(10);
        $form[] = Elm::input('nickname', '昵称')->col(10);
        $form[] = Elm::frameImage('avatar', '头像', Url::buildUrl('admin/image/index', array('fodder' => 'avatar', 'limit' => 1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::password('password', '密码')->col(10);
        $form[] = Elm::input('tel', '电话')->col(10);
        $form[] = Elm::email('email', '邮箱')->col(10);
        $form[] = Elm::radio('is_admin', '管理员', 0)->options([['label' => '是', 'value' => 1], ['label' => '否', 'value' => 0]])->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/user/save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改账号
     * @param string $id
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws FormBuilderException
     * @throws ModelNotFoundException
     */
    public function edit($id = ""): string
    {
        if (!$id) return app("json")->fail("账号id不能为空");
        $info = aModel::find($id);
        if (!$info) return app("json")->fail("没有该账号");
        $form = array();
        $form[] = Elm::input('username', '登录账号', $info['username'])->col(10);
        $form[] = Elm::input('nickname', '昵称', $info['nickname'])->col(10);
        $form[] = Elm::frameImage('avatar', '头像', Url::buildUrl('admin/image/index', array('fodder' => 'avatar', 'limit' => 1)), $info['avatar'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::password('password', '密码', $info['password'])->col(10);
        $form[] = Elm::input('tel', '电话', $info['tel'])->col(10);
        $form[] = Elm::email('email', '邮箱', $info['email'])->col(10);
        $form[] = Elm::radio('is_admin', '管理员', $info['is_admin'])->options([['label' => '是', 'value' => 1], ['label' => '否', 'value' => 0]])->col(10);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/user/save', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function save(string $id = "")
    {
        $data = Util::postMore([
            ['username', ''],
            ['nickname', ''],
            ['avatar', ''],
            ['password', ''],
            ['tel', ''],
            ['email', ''],
            ['is_admin', ''],
            ['status', '']
        ]);
        if ($data['username'] == "") return app("json")->fail("登录账号不能为空");
        if ($data['password'] == "") return app("json")->fail("密码不能为空");
        if ($data['tel'] == "") return app("json")->fail("手机号不能为空");
        if ($data['email'] == "") return app("json")->fail("邮箱不能为空");
        if (is_array($data['avatar'])) $data['avatar'] = $data['avatar'][0];
        if ($id == "") {
            //判断下用户是否存在
            $info = aModel::where('username', $data['username'])->find();
            if ($info) {
                return app("json")->fail("用户已存在");
            }
            $data['password'] = md5(md5($data['password']));
            $data['ip'] = $this->request->ip();
            $data['create_user'] = $this->adminId;
            $res = aModel::create($data);
        } else {
            $info = (new \app\common\model\User)->find($id);
            if ($info['password'] != $data['password']) $data['password'] = md5(md5($data['password']));
            $data['update_user'] = $this->adminId;
            $res = aModel::update($data, ['id' => $id]);
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

}