<?php


namespace app\common\model;


class SystemConfigTab extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2022-02-28 9:19
     */
    public static function lst($where)
    {
        $model = new self;
        if ($where['status'] != "") $model = $model->where("status", $where['status']);
        if (!empty($where['name'])) $model = $model->where("name", "like", "%$where[name]%");
        $count = self::counts($model);
        if (isset($where['page']) && isset($where['limit'])) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data', 'count');
    }
}