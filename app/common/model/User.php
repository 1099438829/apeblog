<?php


namespace app\common\model;

use app\common\constant\Data;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Request;
use think\facade\Session;
use mailer\Mailer;
use think\Model;

/**
 * 用户管理
 * Class User
 * @package app\admin\model
 * @author 木子的忧伤
 * @date 2021-02-18 15:49
 */
class User extends BaseModel
{
    public static $adminColumn = ["username", "nickname", "password", "avatar", "email", "tel",
        "ip", "status", "remark", "is_admin", "create_time", "update_time"];

    /**
     * 登录
     * @param $username
     * @param $password
     * @return bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function login(string $username, string $password): bool
    {
        $info = self::where("username|email|tel", "=", $username)->find();
        if (!$info) return self::setErrorInfo("登录账号不存在");
        if ($info['password'] != md5(md5($password))) return self::setErrorInfo("密码不正确！");
        if ($info['status'] == 2) return self::setErrorInfo("账号已被冻结！");
        self::setLoginInfo($info);
        return true;
    }

    /**
     * 注册
     * @param string $username
     * @param string $email
     * @param string $password
     * @return bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2022-01-16 1:33
     */
    public static function register(string $username, string $email, string $password): bool
    {
        $info = self::where('username', '=', $username)->whereOr('email', '=', $email)->find();
        if ($info) return self::setErrorInfo("账号已存在,请更换用户名重试");
        $data = [
            'username' => $username,
            'email' => $email,
            'password' => md5(md5($password)),
            'create_time' => time(),
            'update_time' => time(),
            'is_admin' => Data::USER_IS_ADMIN_NO
        ];
        $res = self::insert($data, true);
        if (!$res) {
            return self::setErrorInfo("账号注册失败，请稍后再试");
        } else {
            //生成密码重置key 设置有效时间 过期无效
            $key = md5($info->email . rand(1000, 99999));
            cache($key, $res, 24 * 60 * 60); //缓存1天过后则失效根据用户id设置用户激活
            $host = Request::domain();
            //TODO 这里暂时未完成 设计是 支持模板来配置这里的任务 后台可以编辑模板这样子
            $content = "您已经成功在蓝米云注册会员，请点击以下链接完成账号激活：{$host}/forget?action=rested&key={$key}&id=20
            请在24小时内完成激活，24小时后链接地址失效，如果通过点击以上链接无法访问，请将上面的地址复制到您使用的浏览器地址中进入，如果您并没有访问过蓝米云官网，或没有进行上述操作，请忽略这封邮件！此账号将不会绑定您的邮箱。感谢您的访问，祝您使用愉快！";
            $mailer = new Mailer();
            $mailer->from(system_config('title'))
                ->to($info->email)
                ->subject(system_config('title') . '注册激活邮件')
                ->text($content)
                ->send();
        }
        return false;
    }

    /**
     * 设置登录信息
     * @param $info
     * @return bool
     */
    public static function setLoginInfo($info)
    {
        Session::set(Data::SESSION_KEY_USER_ID, $info['id']);
        Session::set(Data::SESSION_KEY_USER_INFO, $info->toArray());
        return true;
    }

    /**
     * 添加后台用户信息
     * @param $data
     * @return bool|int|string
     * @author 木子的忧伤
     * @date 2022-01-03 3:46
     */
    public static function addAdminUser($data)
    {
        $insertData = [];
        foreach (self::$adminColumn as $key) {
            if (isset($data[$key])) {
                $insertData[$key] = $data[$key];
            }
        }
        if (!empty($insertData)) {
            //标识后台用户
            $insertData['is_admin'] = 1;
            return self::insert($insertData, true);
        }
        return false;
    }

    /**
     * 更新后台用户信息
     * @param $id
     * @param $data
     * @return bool|int|string
     * @author 木子的忧伤
     * @date 2022-01-03 3:48
     */
    public static function updateAdminUser($id, $data)
    {
        $updateData = [];
        foreach (self::$adminColumn as $key) {
            if (isset($data[$key])) {
                $updateData[$key] = $data[$key];
            }
        }
        if (!empty($updateData)) {
            return self::update($updateData, ['id' => $id]);
        }
        return false;
    }

    /**
     * 退出登录
     */
    public static function clearLoginInfo()
    {
        Session::delete(Data::SESSION_KEY_USER_ID);
        Session::delete(Data::SESSION_KEY_USER_INFO);
        Session::clear();
        return true;
    }

    /**
     * 是否登录
     * @return bool
     */
    public static function isActive(): bool
    {
        return Session::has(Data::SESSION_KEY_USER_ID) && Session::has(Data::SESSION_KEY_USER_INFO);
    }

    /**
     * 列表
     * @param array $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function systemPage(array $where): array
    {
        $model = new self;
        if ($where['username'] != '') $model = $model->where("username|nickname", "like", "%$where[name]%");
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        if ($where['tel'] != '') $model = $model->where("tel|email", "like", "%$where[tel]%");
        if ($where['status'] != '') $model = $model->where("status", $where['status']);
        if ($where['is_admin'] != '') $model = $model->where("is_admin", $where['is_admin']);
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        $data = $data ? $data->toArray() : [];
        return compact("data", "count");
    }

    /**
     * 密码重置
     * @param string $userid
     * @param $password
     * @return bool|void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function resetPassword($key, $password)
    {
        $username =  cache($key); //缓存1天过后则失效
        if (empty($username)){
            return self::setErrorInfo("链接已失效或者用户不存在");
        }
        $info = self::where('username|email', '=', $username)->find();
        if (!$info) return self::setErrorInfo("用户不存在");
        $info['password'] = md5(md5($password));
        $info['status'] = 2;
        $info['remark'] = '重置密码成功！';
        $info['update_time'] = time();
        $info['create_time'] = time();
        $info['is_admin'] = Data::USER_IS_ADMIN_NO;
        $info['update_time'] = time();
        $info['is_admin'] = Data::USER_IS_ADMIN_NO;
    }

    /**
     * 丢失密码
     * @param $username
     * @return bool
     * @author 木子的忧伤
     * @date 2022-01-03 3:48
     */
    public static function lostPassword($username)
    {
        $info = self::where('username|email', '=', $username)->find();
        if ($info) return self::setErrorInfo("账号或邮箱不存在,请检查后重试");
        //生成密码重置key 设置有效时间 过期无效
        $key = md5($info->email . rand(1000, 99999));
        cache($key, $username, 24 * 60 * 60); //缓存1天过后则失效
        $host = Request::domain();
        //发送邮件
        $content = "您好，您在本网站进行重置密码操作，请点击如下链接进入重置密码页面。【本链接24小时内容有效，如果不是您的操作，请忽略】
{$host}/forget?action=rested&key={$key}&id=20";
        $mailer = new Mailer();
        $mailer->from(system_config('title'))
            ->to($info->email)
            ->subject(system_config('title') . '重置密码验证')
            ->text($content)
            ->send();
        return true;
    }
}