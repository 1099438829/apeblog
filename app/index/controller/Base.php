<?php
declare (strict_types = 1);

namespace app\index\controller;
use app\BaseController;
use think\facade\Config;
use think\facade\Db;
use think\facade\View;
use app\admin\model\SystemConfig;

/**
 * 控制器基础类
 */
class Base extends BaseController
{
    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];
    //系统配置
    protected $systemConfig = [];

    // 初始化
    protected function initialize(){
        parent::initialize();
        /* 读取数据库中的配置 */
        $systemConfig = cache('systemConfig');
        if (empty($systemConfig)){
            $systemConfig = SystemConfig::getSystemConfigValues();
            cache('systemConfig',$systemConfig);
        }
        $this->systemConfig = $systemConfig;
        //判断是否关闭站点。
        if(!$systemConfig['web_close']){
            $this->error('网站暂时关闭！','','stop');
        }
        //判断后台统计配置是否开启  1 开启
        if ($systemConfig["web_statistics"] == 1) {
            //pv表   zz_pv_log  栏目存在 点击进入页面后
            //判断 时间 0-1点 为time=0  H 24小时制
            $date_data = date("Y-m-d");
            $hour = date('H');
            $pvInfo = Db::name('pv_log')
                ->where('date',$date_data)
                ->where('time','=',$hour)
                ->value('id');
            if ($pvInfo) {
                Db::name('pv_log')
                    ->where('id', $pvInfo)
                    ->inc('view')
                    ->update();
            } else {
                $pvData['view'] = 1;
                $pvData['date'] = $date_data;
                $pvData['time'] = $hour;
                $pvData['create_time'] = time();
                Db::name('pv_log')->insert($pvData);
            }
            //uv表
            //获取ip
            $ipData = request()->ip();
            //查询该ip今天是否存在过
            $uvInfo = Db::name('uv_log')
                ->where('date',$date_data)
                ->where('ip',$ipData)
                ->field('id')
                ->find();
            //不存在 添加数据
            if (!$uvInfo) {
                $uvData['ip'] = $ipData;
                $uvData['time'] = $hour;
                $uvData['date'] = $date_data;
                $uvData['create_time'] = time();
                Db::name('uv_log')->insert($uvData);
            }
        }
        //判断是否开启了伪静态
        if ($systemConfig['web_rewrite']) {
            $this->request->setRoot('/');
        } else {
            $this->request->setRoot('/index.php');
        }
    }

    //统计url
    protected function urlrecord($title)
    {
        $date_data = date("Y-m-d");
        //获取url
        $urlInfo = request()->url(true);
        //根据url和date字段判断数据库中是否存在该页面的记录
        $url_data = Db::name('url_log')
            ->where('date',$date_data)
            ->where('url',$urlInfo)
            ->field('id')
            ->find();
        if ($url_data) {
            Db::name('url_log')->where('id',$url_data['id'])->inc('pv')->update();
        } else {
            $dataUrl['url'] = $urlInfo;
            $dataUrl['pv'] = 1;
            $dataUrl['title'] = $title;
            $dataUrl['date'] = $date_data;
            $dataUrl['create_time'] = time();
            Db::name('url_log')->insert($dataUrl);
        }
    }
}