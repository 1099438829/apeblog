<?php


namespace app\admin\model;


use app\admin\model\BaseModel;

/**
 * Class DocumentCategory
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class DocumentCategory extends BaseModel
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';

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
        $model = $model->where('status','>',-1)
            ->field('id,pid,title,sort,display')
            ->order('sort asc,id asc');
        if (isset($where['status']) && $where['status'] != '') $model = $model->where("status",$where['status']);
        if (isset($where['name']) && $where['name'] != '') $model = $model->where("name|id","like","%$where[name]%");
        $data = $model->select();
        return $data->toArray() ?: [];
    }
}