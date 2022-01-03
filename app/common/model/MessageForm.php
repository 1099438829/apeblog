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
class MessageForm extends BaseModel
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
        $model = $model->order('create_time', 'desc');
        if (isset($where['author']) && $where['author'] !== '') $model->where('author', "like", "%$where[name]%");
        if (isset($where['email']) && $where['email'] !== '') $model->where('email', "like", "%$where[email]%");
        if (isset($where['tel']) && $where['tel'] !== '') $model->where('tel', "like", "%$where[tel]%");
        if (isset($where['start_time']) && $where['start_time'] != '') $model = $model->where("m.created_at", ">", strtotime($where['start_time'] . " 00:00:00"));
        if (isset($where['end_time']) && $where['end_time'] != '') $model = $model->where("m.created_at", "<", strtotime($where['end_time'] . " 23:59:59"));
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data', 'count');
    }
}