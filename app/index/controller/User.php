<?php
/**
 * @author 木子的忧伤
 * @date 2021-12-31 1:04
 */

namespace app\index\controller;

use app\admin\extend\Util;
use app\common\model\Document;
use app\common\model\User as userModel;
use Exception;
use think\App;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

class User extends Base
{

    /**
     * 构造方法 初始化一些参数
     */
    public function initialize()
    {
        parent::initialize();
        if (!web_config('is_register')) {
            $this->error('登录未启用，请联系管理员！');
        }
    }

    /**
     * 登录
     * @return string
     * @throws Exception
     */
    public function login()
    {
        return $this->fetch();
    }

    /**
     * 验证登录
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function verify()
    {
        list($username, $password, $captcha) = Util::postMore(['username', 'password', 'captcha'], null, true);
        if (empty($username) || empty($password)) return app("json")->fail("账号、密码和验证码不能为空！");
        // 验证码验证
        if (!captcha_check($captcha)) return app("json")->fail("验证码不正确！");
        // 验证登录
        if (!userModel::login($username, $password)) return app("json")->fail(userModel::getErrorInfo());
        return app("json")->success("登录成功！");
    }

    /**
     * 注册
     * @return string
     * @throws Exception
     */
    public function register()
    {
        return $this->fetch();
    }

    /**
     * 验证登录
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function register_verify()
    {
        list($username, $email, $password, $captcha) = Util::postMore(['username', 'email', 'password', 'captcha'], null, true);
        if (empty($username) || empty($email) || empty($password) || empty($captcha)) return app("json")->fail("账号、密码和验证码不能为空！");
        // 验证码验证
        if (!captcha_check($captcha)) return app("json")->fail("验证码不正确！");
        // 验证码验证
        if (!empty(web_config('register_black_list')) && in_array($username, explode(',', web_config('register_black_list')))) {
            return app("json")->fail("账号不合法，请更换后重试");
        }
        // 验证登录
        if (!userModel::register($username, $email, $password)) return app("json")->fail(userModel::getErrorInfo());
        return app("json")->success("注册成功!我们给您邮箱发送了一封激活邮件，请按照邮件提示激活用户");
    }

    /**
     * 忘记密码
     * @return string
     * @throws Exception
     */
    public function forget()
    {
        return $this->fetch();
    }

    /**
     * @throws ModelNotFoundException
     * @throws DbException
     * @throws DataNotFoundException
     */
    public function forget_verify()
    {
        list($action, $username, $key, $password) = Util::postMore(['action', 'username', 'key', 'pwd'], null, true);
        //做验证
        switch ($action) {
            case'rested':
                //重置密码
                if (!userModel::resetPassword($username, $password)) return app("json")->fail(userModel::getErrorInfo());
                return app("json")->success("密码重置成功！");
            case 'LastPass':
                // 验证码验证
                if (!captcha_check($key)) return app("json")->fail("验证码不正确！");
                //丢失密码 发送邮件
                if (!userModel::lostPassword($username)) return app("json")->fail(userModel::getErrorInfo());
                return app("json")->success("发送成功！我们给您邮箱发送了一封激活邮件，请按照邮件提示激活用户");
        }
        return app("json")->fail("非法访问！");
    }

    /**
     * 退出登陆
     * @return mixed
     * @throws Exception
     */
    public function logout()
    {
        return userModel::clearLoginInfo() ? $this->success("操作成功", "/index/index/index") : $this->error("操作失败", "/index/index/index");
    }

    /**
     * 用户中心
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2022-01-16 21:04
     */
    public function profile()
    {
        return $this->fetch();
    }


    /**
     * 验证码
     * @return Response
     */
    public function captcha()
    {
        ob_clean();
        return captcha();
    }
}