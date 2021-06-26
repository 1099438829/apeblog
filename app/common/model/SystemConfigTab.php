<?php


namespace app\common\model;


use app\admin\model\BaseModel;

class SystemConfigTab extends BaseModel
{
    /**
     * 列表
     * @param $where
     * @return array
     */
    public static function lst($where)
    {
        $model = new self;
        if ($where['status'] != "") $model=$model->where("status",$where['status']);
        if ($where['name'] != "") $model=$model->where("name","like","%$where[name]%");
        $count = self::counts($model);
        $model = $model->page((int)$where['page'],(int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact("data","count");
    }
}