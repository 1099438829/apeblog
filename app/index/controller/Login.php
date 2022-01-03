<?php
/**
 * @author 李玉坤
 * @date 2021-12-31 1:04
 */

namespace app\index\controller;

use app\admin\extend\Util;
use app\common\model\User as userModel;
use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Response;

class Login extends Base
{
    /**
     * 登录
     * @return string
     * @throws Exception
     */
    public function login()
    {
        $this->assign('cid', false);
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
        list($account, $pwd, $verify) = Util::postMore(['account', 'password', 'verify'], null, true);
        if (empty($account) || empty($pwd)) return app("json")->fail("账号、密码和验证码不能为空！");
        // 验证码验证
        if (!captcha_check($verify)) return app("json")->fail("验证码不正确！");
        // 验证登录
        if (!userModel::login($account, $pwd)) return app("json")->fail("登录失败！");
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
        $res = userModel::clearLoginInfo();

        if ($res) {
            $this->success('留言成功');
        } else {
            $this->error('留言失败');
        }
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