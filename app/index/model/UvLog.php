<?php


namespace app\index\model;


use think\facade\Db;
use think\Model;

/**
 * Class UvLog
 * @package app\index\model
 * @author 李玉坤
 * @date 2021-05-09 23:27
 */
class UvLog extends Model
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
        $model = new self();
        //uv表
        //获取ip
        $date_data = date("Y-m-d");
        $hour = date('H');
        $ipData = request()->ip();
        //查询该ip今天是否存在过
        $uvInfo = $model->where('date',$date_data)
            ->where('ip',$ipData)
            ->field('id')
            ->find();
        //不存在 添加数据
        if (!$uvInfo) {
            $uvData = [
                'ip' => $ipData,
                'time' => $hour,
                'date' => $date_data
            ];
            $model->save($uvData);
        }
    }
}