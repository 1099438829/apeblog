<?php


namespace app\admin\model;


use app\admin\model\BaseModel;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class MessageForm extends BaseModel
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
        $model = $model->order('create_time','desc');
        if (isset($where['name']) && $where['name'] !== '') $model->where('name', "like", "%$where[name]%");
        if (isset($where['email']) && $where['email'] !== '') $model->where('email', "like", "%$where[email]%");
        if (isset($where['tel']) && $where['tel'] !== '') $model->where('tel', "like", "%$where[tel]%");
        if (isset($where['start_time']) && $where['start_time'] != '') $model = $model->where("m.created_at", ">", strtotime($where['start_time'] . " 00:00:00"));
        if (isset($where['end_time']) && $where['end_time'] != '') $model = $model->where("m.created_at", "<", strtotime($where['end_time'] . " 23:59:59"));
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'],(int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data','count');
    }
}