<?php


namespace app\common\model;


use think\db\BaseQuery;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\db\Raw;
use think\Model;

trait ModelTrait
{
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