<?php
namespace app\index\controller;
use app\common\validate\Messageform as MessageformValidate;
use think\facade\Db;


class Messageform extends Base
{
    /**
     * 新增留言
     */
    public function addMessageform(){
        if(request()->isPost()){
            $data=$_POST;
        $model=new MessageFormModel();
        $postData=$this->request->param();
        //验证器
        $messageFormValidate=new MessageFormValidate();
        if (!$messageFormValidate->check($postData)) {
            $this->error($messageFormValidate->getError());
        }
        $msgData['name']=isset($postData['name'])?$postData['name']:'';
        $msgData['tel']=isset($postData['tel'])?$postData['tel']:'';
        $msgData['email']=isset($postData['email'])?$postData['email']:'';
        $msgData['content']=$postData['content'];
        $msgData['create_time']=time();
        $re=$model->add($msgData);
            if($re){
                $this->success('留言成功');
            } else {
                $this->error('留言失败');
            }
        } else {
            return $this->fetch();
        }
    }

}
