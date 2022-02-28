<?php

namespace app\admin\controller;

use app\common\model\Admin as aModel;
use app\common\model\AdminRole as rModel;
use app\common\model\User as userModel;
use app\Request;
use app\admin\extend\Util as Util;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use app\admin\extend\FormBuilder as Form;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\facade\Db;
use think\facade\Route as Url;
use think\Facade\Log;

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
    public function index()
    {
        $this->assign("auths", rModel::getAuthLst());
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
    public function lst(Request $request)
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
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加账号
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     */
    public function add(Request $request)
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
        $form = Form::make_post_form($form, url('save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改账号
     * @return string
     * @throws FormBuilderException
     */
    public function edit($id = "")
    {
        if (!$id) return app("json")->fail("账号id不能为空");
        $ainfo = aModel::get($id);
        if (!$ainfo) return app("json")->fail("没有该账号");
        $form = array();
        $form[] = Elm::input('username', '登录账号', $ainfo['username'])->col(10);
        $form[] = Elm::input('nickname', '昵称', $ainfo['nickname'])->col(10);
        $form[] = Elm::frameImage('avatar', '头像', Url::buildUrl('admin/image/index', array('fodder' => 'avatar', 'limit' => 1)), $ainfo['avatar'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::password('password', '密码', $ainfo['password'])->col(10);
        $form[] = Elm::input('realname', '真实姓名', $ainfo['realname'])->col(10);
        $form[] = Elm::select('role_id', '角色', $ainfo['role_id'])->options(function () {
            $list = rModel::getAuthLst();
            $menus = [];
            foreach ($list as $menu) {
                $menus[] = ['value' => $menu['id'], 'label' => $menu['name']];//,'disabled'=>$menu['pid']== 0];
            }
            return $menus;
        })->col(10);
        $form[] = Elm::input('tel', '电话', $ainfo['tel'])->col(10);
        $form[] = Elm::email('email', '邮箱', $ainfo['email'])->col(10);
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
                aModel::insert($data);
                //添加前台用户
                $userId = userModel::addAdminUser($data);
                $res = aModel::update(['uid'=>$userId], ['id' => $id]);
            } else {
                $userInfo = aModel::get($id);
                if ($userInfo['password'] != $data['password']) $data['password'] = md5(md5($data['password']));
                $data['update_user'] = $this->adminId;
                $data['update_time'] = time();
                aModel::update($data, ['id' => $id]);
                //同步更新前台用户
                $res = userModel::updateAdminUser($userInfo['uid'],$data);
            }
            // 提交事务
            Db::commit();
        }catch (Exception $exception){
            Log::error('用户添加失败,失败原因'.$exception->getMessage());
            // 回滚事务
            Db::rollback();
            $res = false;
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 修改密码
     * @param Request $request
     * @return string
     * @throws \Exception
     */
    public function pwd(Request $request)
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
        ]);
        if ($data['oldpwd'] == '' || $data['newpwd'] == '') return app("json")->fail("参数有误，新旧密码为空！");
        $adminInfo = aModel::get($this->adminId);
        if ($adminInfo['password'] == md5(md5($data['oldpwd']))) return aModel::update(['password' => md5(md5($data['newpwd']))], ['id' => $this->adminId]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
        return app("json")->fail("密码不正确！");
    }

    /**
     * 个人信息
     * @return string
     * @throws \Exception
     */
    public function profile()
    {
        $this->assign("info", aModel::get($this->adminId));
        return $this->fetch();
    }

    /**
     * 修改密码
     * @param Request $request
     * @return mixed
     */
    public function changProfile(Request $request)
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