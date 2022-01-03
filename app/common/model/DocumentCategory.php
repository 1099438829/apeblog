<?php


namespace app\common\model;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class DocumentCategory
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class DocumentCategory extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-11-08 0:25
     */
    public static function systemPage($where): array
    {
        $model = new self;
        $model = $model->field(['id', 'pid', 'title', 'sort', 'status'])->order('sort asc,id asc');
        if (isset($where['title']) && $where['title'] != '') $model = $model->where("title|id", "like", "%$where[title]%");
        $data = $model->select()->toArray();
        return $data ?: [];
    }

    /**
     * 查询分类选择类型
     * @param int $type
     * @param array $ids
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function selectByType(int $type = 0, array $ids = [])
    {
        $model = new self;
        if (!empty($ids)) $model = $model->where("id", "not in", $ids);
        if ($type != 0) $model = $model->where("type", $type);
        $model = $model->where("status", 1);
        $model = $model->field("id,title");
        $data = $model->select();
        return $data ? $data->toArray() : [];
    }
}