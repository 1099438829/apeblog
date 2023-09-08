<?php


namespace app\common\model;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Advert
 * @package app\common\model
 * @author 木子的忧伤
 * @date 2021-07-26 18:38
 */
class Advert extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-15 23:24
     */
    public static function systemPage($where): array
    {
        $model = new self;
        if ($where['title'] != '') $model = $model->where("title|alias", "like", "%$where[title]%");
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        if ($where['status'] != '') $model = $model->where("status", $where['status']);
        $count = self::count();
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select()->each(function ($item) {
            if (!empty($item->pic)) {
                $item->pic = file_cdn($item->pic);
            }
        });
        if ($data) $data = $data->toArray();
        return compact('data', 'count');
    }
}