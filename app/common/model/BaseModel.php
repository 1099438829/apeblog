<?php


namespace app\common\model;


use think\db\exception\DbException;
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
     * 错误信息,解决调用无法明确错误的问题
     * @var mixed
     */
    protected $error;

    /**
     * 获取错误信息
     * @access public
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

    //自动时间戳
    protected $autoWriteTimestamp = true;

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
     * 查询一条数据是否存在
     * @param $map
     * @param string $field
     * @return bool 是否存在
     * @throws DbException
     */
    public static function isExist($map, $field = ''): bool
    {
        $model = (new self);
        if (!is_array($map) && empty($field)) $field = $model->getPk();
        $map = !is_array($map) ? [$field => $map] : $map;
        return 0 < $model->where($map)->count();
    }

}