<?php
namespace app\index\controller;

use app\admin\service\UtilService as Util;
use app\common\model\FriendLink as friendLinkModel;
use app\common\validate\MessageForm as MessageformValidate;
use app\common\model\MessageForm as MessageFormModel;
use app\Request;
use app\common\constant\Config;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Index extends Base
{
    /**
     * 入口跳转链接
     */
    public function index()
    {
        //判断后台统计配置是否开启 1 开启
        if(web_config("web_statistics") ==1){
        //统计url
            $this->urlrecord('网站首页');
        }
        //清除可能存在的栏目分类树id
        cache(Config::CURR_CATEGORY_PATENT_ID,false);
        //模板兼容性标签
        $this->assign('id',false);
        $this->assign('cid',false);
        return $this->fetch();
    }

    /**
     * 友链申请
     * @param Request $request
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-17 1:03
     */
    public function applylink(Request $request)
    {
        if(request()->isPost()){
            $data = Util::postMore([
                ['id',''],
                ['title',''],
                ['url',''],
                ['image',''],
                ['description',''],

            ]);
            if ($data['title'] == "") $this->error("链接名称不能为空");
            if ($data['url'] == "") $this->error("链接地址不能为空");
            //判断下用户是否存在
            $info = friendLinkModel::where('url',$data['url'])->find();
            if ($info){
                $this->error("记录已存在");
            }
            $data['status']  = 0;
            $res = friendLinkModel::create($data);
            if($res){
                $this->success('申请成功，请耐心等待审核');
            } else {
                $this->error('提交失败，请联系站长查看');
            }
        } else {
            //清除可能存在的栏目分类树id
            cache(Config::CURR_CATEGORY_PATENT_ID,false);
            //模板兼容性标签
            $this->assign('id',false);
            $this->assign('cid',false);
            return $this->fetch();
        }
    }

    /**
     * 友链申请
     * @param Request $request
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-17 1:03
     */
    public function msg(Request $request)
    {
        if(request()->isPost()){
            $data = Util::postMore([
                ['author',''],
                ['tel',''],
                ['email',''],
                ['content',''],
            ]);
            $data['create_time']=time();
            $messageFormValidate=new MessageFormValidate();
            if (!$messageFormValidate->check($data)) {
                $this->error($messageFormValidate->getError());
            }
            $res = MessageFormModel::create($data);
            if($res){
                $this->success('留言成功');
            } else {
                $this->error('留言失败');
            }
        } else {
            //清除可能存在的栏目分类树id
            cache(Config::CURR_CATEGORY_PATENT_ID,false);
            //模板兼容性标签
            $this->assign('id',false);
            $this->assign('cid',false);
            return $this->fetch();
        }
    }
}