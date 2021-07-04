<?php
declare (strict_types = 1);

namespace app\index\controller;
use app\BaseController;
use app\common\model\PvLog;
use app\common\model\UrlLog;
use app\common\model\SystemConfig;

/**
 * 控制器基础类
 */
class Base extends BaseController
{
    // 初始化
    protected function initialize(){
        parent::initialize();
        //判断是否关闭站点。
        if(!web_config('web_close')){
            $this->error('网站暂时关闭！','','stop');
        }
        //判断后台统计配置是否开启  1 开启
        if (web_config("web_statistics") == 1) {
             //pv表   zz_pv_log  栏目存在 点击进入页面后
            $pvLogModel=new PvLog();
            $pvLogModel->set_view();
        }
        //判断是否开启了伪静态
        if (web_config('web_rewrite')=='0') {
            $this->request->setRoot('/?s=');
        } elseif(web_config('web_rewrite')=='1') {
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
        $urlLogModel=new UrlLog();
        //获取url
        $urlInfo = $this->request->url(true);
        $urlLogModel->set_url($title,$urlInfo);
    }
}