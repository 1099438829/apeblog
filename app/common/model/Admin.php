<?php


namespace app\common\model;

use app\common\model\BaseModel;
use think\facade\Cache;
use think\facade\Session;

/**
 * 管理员管理
 * Class Admin
 * @package app\admin\model
 */
class Admin extends BaseModel
{
    /**
     * 登录
     * @param $name
     * @param $pwd
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function login(string $name, string $pwd): bool
    {
        $info = self::where("name|tel", "=", $name)->find();
        if (!$info) return self::setErrorInfo("登录账号不存在");
        if ($info['pwd'] != md5(md5($pwd))) return self::setErrorInfo("密码不正确！");
        if ($info['status'] != 1) return self::setErrorInfo("账号已被冻结！");
        self::setLoginInfo($info);
        return true;
    }

    /**
     * 微信扫码登录后台
     * @param array $message
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public static function wechatLogin(array $message)
    {
        $param = param_to_array(str_replace("qrscene_", "", $message['EventKey']));
        // 查找用户uid
        $uid = WechatUser::getUidByOpenId($message['FromUserName']);
        if (!$uid) return ['status' => 101];
        $adminInfo = self::where("uid", $uid)->find();
        if (!$adminInfo) return ['status' => 102];
        Cache::store('redis')->set("info_" . $param['token'], $adminInfo, 60);
        return ['status' => 100];
    }

    /**
     * 设置登录信息
     * @param $info
     * @return bool
     */
    public static function setLoginInfo($info)
    {
        unset($info->pwd);//去除密码字段
        $info->role_auth = AdminRole::getAuth($info['role_id'] ?? 0);//提前缓存auth字段避免频繁查询
        Session::set("adminId", $info['id']);
        Session::set("adminInfo", $info->toArray());
        event("AdminLog", [$info->toArray(), "admin", "login", "login"]);
        return true;
    }

    /**
     * 退出登录
     */
    public static function clearLoginInfo()
    {
        Session::delete("adminId");
        Session::delete("adminInfo");
        Session::clear();
        return true;
    }

    /**
     * 是否登录
     * @return bool
     */
    public static function isActive(): bool
    {
        return Session::has('adminId') && Session::has('adminInfo');
    }

    /**
     * 列表
     * @param array $where
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function systemPage(array $where): array
    {
        $model = new self;
        if ($where['name'] != '') $model = $model->where("name|id|nickname", "like", "%$where[name]%");
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        if ($where['tel'] != '') $model = $model->where("tel|mail", "like", "%$where[tel]%");
        if ($where['status'] != '') $model = $model->where("status", $where['status']);
        if ($where['role_id'] != '') $model = $model->where("role_id", $where['role_id']);
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select()->each(function ($item) {
            unset($item['pwd']);
            // 用户信息
            $info = self::getAdminInfoById((int)$item['create_user']);
            $item['create_user'] = $info ? $info['nickname'] : $item['create_user'];
            $item['role_id'] = AdminRole::getAuthNameById((int)$item['role_id']);
        });
        $data = $data ? $data->toArray() : [];
        return compact("data", "count");
    }

    /**
     * 获取账号信息
     * @param int $id
     * @param string $field
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function getAdminInfoById(int $id, string $field = '*'): array
    {
        $model = new self;
        $model = $model->where("id", $id);
        $model = $model->field($field);
        $info = $model->find();
        unset($info->pwd);
        return $info ? $info->toArray() : [];
    }

    /**
     * 人员列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function lst()
    {
        $model = new self;
        $model = $model->where("status", 1);
        $model = $model->field("id,realname");
        $data = $model->select();
        return $data ? $data->toArray() : [];
    }
}