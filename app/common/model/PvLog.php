<?php
namespace app\common\model;
use app\common\model\UrlLog as UrlLogModel;
use app\common\model\UvLog as UvLogModel;

/**
 * {$TABLE.Comment}
 * Class {$TABLE.Name}
 * @package app\common\model
 */
class PvLog extends BaseModel {
    
    //自动时间戳
    protected $autoWriteTimestamp = true;

    public function del_data()
    {
        //获取七天前日期
        $dateinfo = date('Y-m-d', strtotime('-7 days'));
        //转换为时间戳
        $shijianchuo = strtotime($dateinfo);
        //删除pv
        $this->where('create_time','<',$shijianchuo)->delete();
        //删除url
        $urlLogModel=new UrlLogModel();
        $urlLogModel->where('create_time','<',$shijianchuo)->delete();
        //删除uv
        $uvLogModel=new UvLogModel();
        $uvLogModel->where('create_time','<',$shijianchuo)->delete();
    }

    public function set_view(){
        //判断 时间 0-1点 为time=0  H 24小时制
        $date_data = date("Y-m-d");
        $hour = date('H');
        $pvWhere[] =['date','=',$date_data];
        $pvWhere[] =['time','=',$hour];

        $pvInfo =$this->where($pvWhere)->field('id')->find();
        if ($pvInfo) {
            $this->where($pvWhere)->inc('view')->update();
        } else {
            $pvData['view'] = 1;
            $pvData['date'] = $date_data;
            $pvData['time'] = $hour;
            $this->save($pvData);
        }
        //uv表
        $uvLogModel=new UvLogModel();

        //获取ip
        $ipData = request()->ip();
        //查询该ip今天是否存在过
        $uvWhere[] =['date','=',$date_data];
        $uvWhere[] =['ip','=',$ipData];

        $uvInfo = $uvLogModel->where($uvWhere)->field('id')->find();
        //不存在 添加数据
        if (!$uvInfo) {
            $uvData['ip'] = $ipData;
            $uvData['time'] = $hour;
            $uvData['date'] = $date_data;
            $uvLogModel->save($uvData);
        }
    }


}