<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\admin\model\Admin as aModel;
use app\admin\model\AdminRole as rModel;
use app\common\model\User as userModel;
use app\Request;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\facade\Db;
use think\Facade\Log;
use think\facade\Route as Url;
use think\Response;

/**
 * 账号管理
 * Class Admin
 * @package app\admin\controller\admin
 */
class Admin extends AuthController
{
    /**
     * 账号列表
     * @return string
     * @throws \Exception
     */
    public function index(): string
    {
        $this->assign("auths", rModel::getAuthLst());
        return $this->fetch();
    }

    /**
     * 账号列表
     * @param Request $request
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['username', ''],
            ['tel', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['role_id', ''],
            ['status', ''],
            ['page', 1],
            ['limit', 20],
        ],$request);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加账号
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws FormBuilderException
     * @throws ModelNotFoundException
     * @throws \Exception
     */
    public function add(): string
    {
        $form = array();
        $form[] = Elm::input('username', '登录账号')->col(10);
        $form[] = Elm::input('nickname', '昵称')->col(10);
        $form[] = Elm::frameImage('avatar', '头像', Url::buildUrl('admin/image/index', array('fodder' => 'avatar', 'limit' => 1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::password('password', '密码')->col(10);
        $form[] = Elm::input('realname', '真实姓名')->col(10);
        $form[] = Elm::select('role_id', '角色')->options(function () {
            $list = rModel::getAuthLst();
            $menus = [];
            foreach ($list as $menu) {
                $menus[] = ['value' => $menu['id'], 'label' => $menu['name']];//,'disabled'=>$menu['pid']== 0];
            }
            return $menus;
        })->col(10);
        $form[] = Elm::input('tel', '电话')->col(10);
        $form[] = Elm::email('email', '邮箱')->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/admin/save')->build());
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
     * @throws \Exception
     */
    public function edit(string $id = ""): string
    {
        if (!$id) return app("json")->fail("账号id不能为空");
        $info = (new \app\admin\model\Admin)->find($id);
        if (!$info) return app("json")->fail("没有该账号");
        $form = array();
        $form[] = Elm::input('username', '登录账号', $info['username'])->col(10);
        $form[] = Elm::input('nickname', '昵称', $info['nickname'])->col(10);
        $form[] = Elm::frameImage('avatar', '头像', Url::buildUrl('admin/image/index', array('fodder' => 'avatar', 'limit' => 1)), $info['avatar'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::password('password', '密码', $info['password'])->col(10);
        $form[] = Elm::input('realname', '真实姓名', $info['realname'])->col(10);
        $form[] = Elm::select('role_id', '角色', $info['role_id'])->options(function () {
            $list = rModel::getAuthLst();
            $menus = [];
            foreach ($list as $menu) {
                $menus[] = ['value' => $menu['id'], 'label' => $menu['name']];//,'disabled'=>$menu['pid']== 0];
            }
            return $menus;
        })->col(10);
        $form[] = Elm::input('tel', '电话', $info['tel'])->col(10);
        $form[] = Elm::email('email', '邮箱', $info['email'])->col(10);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/admin/save', ['id' => $id])->build());
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
            ['username', ''],
            ['nickname', ''],
            ['avatar', ''],
            ['password', ''],
            ['realname', ''],
            ['role_id', ''],
            ['tel', ''],
            ['email', ''],
            ['status', '']
        ]);
        if ($data['username'] == "") return app("json")->fail("登录账号不能为空");
        if ($data['password'] == "") return app("json")->fail("密码不能为空");
        if ($data['tel'] == "") return app("json")->fail("手机号不能为空");
        if ($data['email'] == "") return app("json")->fail("邮箱不能为空");
        if (is_array($data['avatar'])) $data['avatar'] = $data['avatar'][0];
        // 启动事务
        Db::startTrans();
        try {
            if ($id == "") {
                //判断下用户是否存在
                $info = aModel::where('username', $data['username'])->find();
                if ($info) {
                    return app("json")->fail("用户已存在");
                }
                $data['password'] = md5(md5($data['password']));
                $data['ip'] = $this->request->ip();
                $data['create_user'] = $this->adminId;
                $data['create_time'] = time();
                $data['update_time'] = time();
                aModel::create($data);
                //添加前台用户
                $userId = userModel::addAdminUser($data);
                $res = aModel::update(['uid' => $userId], ['id' => $id]);
            } else {
                $userInfo = aModel::find($id);
                if ($userInfo['password'] != $data['password']) $data['password'] = md5(md5($data['password']));
                $data['update_user'] = $this->adminId;
                $data['update_time'] = time();
                aModel::update($data, ['id' => $id]);
                //同步更新前台用户
                $res = userModel::updateAdminUser($userInfo['uid'], $data);
            }
            // 提交事务
            Db::commit();
        } catch (Exception $exception) {
            Log::error('用户添加失败,失败原因' . $exception->getMessage());
            // 回滚事务
            Db::rollback();
            $res = false;
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 修改密码
     * @return string
     * @throws \Exception
     */
    public function pwd(): string
    {
        return $this->fetch();
    }

    /**
     * 修改密码
     * @param Request $request
     * @return mixed
     */
    public function changePwd(Request $request)
    {
        $data = Util::postMore([
            ['oldpwd', ''],
            ['newpwd', '']
        ],$request);
        if ($data['oldpwd'] == '' || $data['newpwd'] == '') return app("json")->fail("参数有误，新旧密码为空！");
        $adminInfo = (new \app\admin\model\Admin)->find($this->adminId);
        if ($adminInfo['password'] == md5(md5($data['oldpwd']))) return aModel::update(['password' => md5(md5($data['newpwd']))], ['id' => $this->adminId]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
        return app("json")->fail("密码不正确！");
    }

    /**
     * 个人信息
     * @return string
     * @throws \Exception
     */
    public function profile(): string
    {
        $this->assign("info", aModel::find($this->adminId));
        return $this->fetch();
    }

    /**
     * 修改密码
     * @param Request $request
     * @return mixed
     */
    public function changProfile(Request $request): Response
    {
        $data = Util::postMore([
            ['nickname', ''],
            ['avatar', ''],
            ['tel', ''],
            ['email', ''],
            ['remark', '']
        ]);
        if ($data['nickname'] == '' || $data['avatar'] == '' || $data['tel'] == '' || $data['email'] == '') return app("json")->fail("必选项不能为空！");
        return aModel::update(['nickname' => $data['nickname'], 'avatar' => $data['avatar'], 'tel' => $data['tel'], 'email' => $data['email'], 'remark' => $data['remark']], ['id' => $this->adminId]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }
}