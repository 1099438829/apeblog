<?php


namespace app\index\model;


use think\Model;

/**
 * Class UrlLog
 * @package app\index\model
 * @author 李玉坤
 * @date 2021-05-09 23:04
 */
class UrlLog extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    /**
     * url访问记录
     * @author 李玉坤
     * @date 2021-05-09 23:40
     */
    public function addLog($title){
        $model = new self();
        $date_data = date("Y-m-d");
        //获取url
        $urlInfo = request()->url(true);
        //根据url和date字段判断数据库中是否存在该页面的记录
        $url_data = $model->where('date',$date_data)
            ->where('url',$urlInfo)
            ->field('id')
            ->find();
        if ($url_data) {
            $model->where('id',$url_data['id'])->inc('pv')->update();
        } else {
            $dataUrl = [
                'url' => $urlInfo,
                'pv' => 1,
                'title' => $title,
                'date' => $date_data
            ];
            $model->save($dataUrl);
        }
    }
}