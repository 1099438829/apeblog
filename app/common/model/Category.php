<?php


namespace app\common\model;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class DocumentCategory
 * @package app\admin\model\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:22
 */
class Category extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
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
}