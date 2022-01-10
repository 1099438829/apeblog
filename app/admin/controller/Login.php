<?php


namespace app\admin\controller;

use app\common\model\Admin as adminModel;
use app\admin\extend\Util as Util;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

class Login extends AuthController
{
    /**
     * 无需登录
     * @var array
     */
    protected $noNeedLogin = ['login', 'register', 'forget', 'captcha', 'verify'];

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
        if (!adminModel::login($username, $password)) return app("json")->fail(adminModel::getErrorInfo());
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
     * 忘记密码
     * @return string
     * @throws Exception
     */
    public function forget()
    {
        return $this->fetch();
    }

    /**
     * 退出登陆
     * @return mixed
     * @throws Exception
     */
    public function logout()
    {
        return adminModel::clearLoginInfo() ? $this->successfulNotice("操作成功", "/admin/login/login") : $this->failedNotice("操作失败", "/admin/index/index");
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