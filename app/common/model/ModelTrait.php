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

    /**
     * 分页
     * @param null $model 模型
     * @param null $eachFn 处理结果函数
     * @param array $params 分页参数
     * @param int $limit 分页数
     * @return BaseQuery
     */
    public static function page($model = null, $eachFn = null, $params = [], $limit = 20): BaseQuery|array|null
    {
        if (is_numeric($eachFn) && is_numeric($model)) {
            return parent::page($model, $eachFn);
        }

        if (is_numeric($eachFn)) {
            $limit = $eachFn;
            $eachFn = null;
        } else if (is_array($eachFn)) {
            $params = $eachFn;
            $eachFn = null;
        }

        if (is_callable($model)) {
            $eachFn = $model;
            $model = null;
        } elseif (is_numeric($model)) {
            $limit = $model;
            $model = null;
        } elseif (is_array($model)) {
            $params = $model;
            $model = null;
        }

        if (is_numeric($params)) {
            $limit = $params;
            $params = [];
        }

        $paginate = $model === null ? self::paginate($limit, false, ['query' => $params]) : $model->paginate($limit, false, ['query' => $params]);
        $list = is_callable($eachFn) ? $paginate->each($eachFn) : $paginate;
        $page = $list->render();
        $total = $list->total();
        return compact('list', 'page', 'total');
    }
}