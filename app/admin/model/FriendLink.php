<?php


namespace app\admin\model;


use app\admin\model\BaseModel;

/**
 * Class FriendLink
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class FriendLink extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:24
     */
    public static function systemPage($where): array
    {
        $model = new self;
        if ($where['title'] != '') $model = $model->where("title|url","like","%$where[title]%");
        if ($where['start_time'] != '') $model = $model->where("create_time",">",strtotime($where['start_time']." 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time","<", strtotime($where['end_time']." 23:59:59"));
        if ($where['status'] != '') $model = $model->where("status",$where['status']);
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'],(int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data','count');
    }
}