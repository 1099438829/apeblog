<?php
declare (strict_types=1);

namespace app\index\controller;

use app\BaseController;
use app\common\constant\Data;
use app\common\model\PvLog;
use app\common\model\UrlLog;
use think\facade\Session;

/**
 * 控制器基础类
 */
class Base extends BaseController
{
    /**
     * 当前登陆用户信息
     * @var
     */
    protected $userInfo;

    /**
     * 当前登陆用户ID
     * @var int
     */
    protected $userId;

    // 初始化
    protected function initialize()
    {
        parent::initialize();

        $this->userInfo = Session::get(Data::SESSION_KEY_USER_INFO);
        $this->userId = Session::get(Data::SESSION_KEY_USER_ID);

        if ($this->userId){
            //模板兼容性标签
            $this->assign('user_info', $this->userInfo);
            $this->assign('user_id',  $this->userId);
        }
        //判断是否关闭站点。
        if (web_config('web_close')) {
            $this->error('网站暂时关闭！', '', 'stop');
        }
        //判断后台统计配置是否开启  1 开启
        if (web_config("web_statistics") == 1) {
            //pv表   zz_pv_log  栏目存在 点击进入页面后
            $pvLogModel = new PvLog();
            $pvLogModel->set_view();
        }
        cache(Data::CURR_CATEGORY_PATENT_ID, false);
        //模板兼容性标签
        $this->assign('id', false);
        $this->assign('cid', false);

        //获取根域名
        //判断是否开启了伪静态
//        if (web_config('web_rewrite')=='0') {
//            $this->request->setRoot('/?s=');
//        } elseif(web_config('web_rewrite')=='1') {
//            $this->request->setRoot('/');
//        } else {
//            $this->request->setRoot('/index.php');
//        }
    }

    /**
     * url 统计
     * @param $title
     * @author 木子的忧伤
     * @date 2021-05-09 23:44
     */
    protected function urlrecord($title)
    {
        $urlLogModel = new UrlLog();
        //获取url
        $urlInfo = $this->request->url(true);
        $urlLogModel->set_url($title, $urlInfo);
    }
}