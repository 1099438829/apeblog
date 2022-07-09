<?php


namespace app\common\model;

use app\common\constant\Data;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Session;

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
            //开始发送激活邮件,激活邮件处理

        }
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
}