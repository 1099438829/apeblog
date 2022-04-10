<?php


namespace app\common\model;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class Document extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:24
     */
    public static function systemPage($where): array
    {
        $model = new self;
        $count = self::counts($model);
        $model = $model->order("sort desc")->order("id desc");
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        $categoryList = DocumentCategory::where('id', 'in', array_column($data, 'category_id'))->column('title', 'id');
        foreach ($data as &$item) {
            if (!empty($categoryList[$item['category_id']])) {
                $item['category_title'] = $categoryList[$item['category_id']];
            } else {
                $item['category_title'] = '';
            }
        }
        return compact('data', 'count');
    }
}