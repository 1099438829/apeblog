<?php


namespace app\admin\model;

use think\facade\Cache;
use think\facade\Session;

/**
 * 用户管理
 * Class User
 * @package app\admin\model
 * @author 李玉坤
 * @date 2021-02-18 15:49
 */
class User extends BaseModel
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
    public static function login(string $name,string $pwd): bool
    {
        $info = self::where("username|tel","=", $name)->find();
        if (!$info) return self::setErrorInfo("登录账号不存在");
        if ($info['pwd'] != md5(md5($pwd))) return self::setErrorInfo("密码不正确！");
        if ($info['status'] == 2) return self::setErrorInfo("账号已被冻结！");
        self::setLoginInfo($info);
        return true;
    }

    /**
     * 设置登录信息
     * @param $info
     * @return bool
     */
    public static function setLoginInfo($info)
    {
        Session::set("adminId",$info['id']);
        Session::set("adminInfo",$info->toArray());
        event("AdminLog",[$info->toArray(),"admin","login","login"]);
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
        if ($where['username'] != '') $model = $model->where("username|nickname","like","%$where[name]%");
        if ($where['start_time'] != '') $model = $model->where("create_time",">",strtotime($where['start_time']." 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time","<", strtotime($where['end_time']." 23:59:59"));
        if ($where['tel'] != '') $model = $model->where("tel|email", "like","%$where[tel]%");
        if ($where['status'] != '') $model = $model->where("status",$where['status']);
        if ($where['is_admin'] != '') $model = $model->where("is_admin",$where['is_admin']);
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'],(int)$where['limit']);
        $data = $model->select();
        $data = $data ? $data->toArray() : [];
        return compact("data","count");
    }
}