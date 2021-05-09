<?php


namespace app\index\model;


use think\Model;

/**
 * Class PvLog
 * @package app\index\model
 * @author 李玉坤
 * @date 2021-05-09 23:28
 */
class PvLog extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    /**
     * 增加pv信息
     * @author 李玉坤
     * @date 2021-05-09 23:31
     */
    public function addLog(){
        //pv表  栏目存在 点击进入页面后
        //判断 时间 0-1点 为time=0  H 24小时制
        $model = new self();
        $date_data = date("Y-m-d");
        $hour = date('H');
        $pvInfo = $model->where('date',$date_data)
            ->where('time','=',$hour)
            ->value('id');
        if ($pvInfo) {
          $model->where('id', $pvInfo)
                ->inc('view')
                ->update();
        } else {
            $pvData = [
                'view' => 1,
                'time' => $hour,
                'date' => $date_data
            ];
            $model->save($pvData);
        }
    }
}