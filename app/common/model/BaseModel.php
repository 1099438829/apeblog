<?php


namespace app\common\model;


use think\facade\Db;
use think\Model;

class BaseModel extends Model
{
    use ModelTrait;

    const DEFAULT_ERROR_MSG = '操作失败,请稍候再试!';
    private static $errorMsg;
    private static $transaction = 0;
    private static $DbInstance = [];

    /**
     * 获取错误信息
     * @param string $defaultMsg
     * @return string
     */
    public static function getErrorInfo($defaultMsg = self::DEFAULT_ERROR_MSG)
    {
        return !empty(self::$errorMsg) ? self::$errorMsg : $defaultMsg;
    }

    /**
     * 开启事务
     */
    public static function beginTrans()
    {
        Db::startTrans();
    }

    /**
     * 根据结果提交滚回事务
     * @param $res
     */
    public static function checkTrans($res)
    {
        if ($res) {
            self::commitTrans();
        } else {
            self::rollbackTrans();
        }
    }

    /**
     * 提交事务
     */
    public static function commitTrans()
    {
        Db::commit();
    }

    /**
     * 设置错误信息
     * @param string $errorMsg
     * @return bool
     */
    protected static function setErrorInfo($errorMsg = self::DEFAULT_ERROR_MSG, $rollback = false)
    {
        if ($rollback) self::rollbackTrans();
        self::$errorMsg = $errorMsg;
        return false;
    }

    /**
     * 关闭事务
     */
    public static function rollbackTrans()
    {
        Db::rollback();
    }

}