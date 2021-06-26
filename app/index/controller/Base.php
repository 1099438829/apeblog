<?php
declare (strict_types = 1);

namespace app\index\controller;
use app\BaseController;
use app\index\model\PvLog;
use app\index\model\UrlLog;
use app\index\model\UvLog;
use think\facade\Config;
use think\facade\Db;
use think\facade\View;
use app\admin\model\SystemConfig;

/**
 * 控制器基础类
 */
class Base extends BaseController
{
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
            //增加pv信息
            (new PvLog())->addLog();
            //增加uv信息
            (new UvLog())->addLog();
        }
        //判断是否开启了伪静态
        if ($systemConfig['web_rewrite']) {
            $this->request->setRoot('/?s=');
        } elseif(web_config('WEB_REWRITE')=='1') {
            $this->request->setRoot('/');
        } else {
            $this->request->setRoot('/index.php');
        }
    }

    /**
     * url 统计
     * @param $title
     * @author 李玉坤
     * @date 2021-05-09 23:44
     */
    protected function urlrecord($title)
    {
        (new UrlLog())->addLog($title);
    }
}