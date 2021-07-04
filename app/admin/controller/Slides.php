<?php

namespace app\admin\controller;

use app\common\model\Slides as aModel;
use app\admin\service\FormBuilderService as Form;
use app\Request;
use app\admin\service\UtilService as Util;
use FormBuilder\Factory\Elm;
use think\facade\Route as Url;

/**
 * Class Slides
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class Slides extends AuthController
{
    /**
     * 幻灯片管理
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-02-16 13:15
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 文章列表
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:26
     */
    public function lst(Request $request)
    {
        $where = Util::postMore([
            ['title',''],
            ['start_time',''],
            ['end_time',''],
            ['status',''],
            ['page',1],
            ['limit',20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加账号
     * @param Request $request
     * @return string
     * @throws \FormBuilder\Exception\FormBuilderException
     */
    public function add(Request $request)
    {
        $form = array();
        $form[] = Elm::input('title','幻灯片名称')->col(10);
        $form[] = Elm::input('url','链接地址')->col(10);
        $form[] = Elm::frameImage('image','幻灯片图片',Url::buildUrl('admin/images/index',array('fodder'=>'image','limit'=>1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort','排序')->col(10);
        $form[] = Elm::radio('status','状态',1)->options([['label'=>'启用','value'=>1],['label'=>'冻结','value'=>0]])->col(10);
        $form = Form::make_post_form($form, url('save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改账号
     * @return string
     * @throws \FormBuilder\Exception\FormBuilderException
     */
    public function edit($id="")
    {
        if (!$id) return app("json")->fail("数据id不能为空");
        $ainfo = aModel::get($id);
        if (!$ainfo) return app("json")->fail("没有该数据");
        $form = array();
        $form[] = Elm::input('title','幻灯片名称',$ainfo['title'])->col(10);
        $form[] = Elm::input('url','链接地址',$ainfo['url'])->col(10);
        $form[] = Elm::frameImage('image','幻灯片图片',Url::buildUrl('admin/images/index',array('fodder'=>'image','limit'=>1)),$ainfo['image'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort','排序',$ainfo['sort'])->col(10);
        $form[] = Elm::radio('status','状态',$ainfo['status'])->options([['label'=>'启用','value'=>1],['label'=>'冻结','value'=>0]])->col(10);
        $form = Form::make_post_form($form, url('save',['id'=>$id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     */
    public function save($id="")
    {
        $data = Util::postMore([
            ['id',''],
            ['title',''],
            ['url',''],
            ['image',''],
            ['sort',''],
            ['status',1],
        ]);
        if ($data['title'] == "") return app("json")->fail("幻灯片名称不能为空");
        if ($data['url'] == "") return app("json")->fail("链接地址不能为空");
        if (is_array($data['image'])) $data['image'] = $data['avatar'][0];
        if ($id=="") {
            //判断下用户是否存在
            $info = aModel::where('url',$data['url'])->find();
            if ($info){
                return app("json")->fail("链接已存在");
            }
            $res = aModel::create($data);
        }else {
            $res = aModel::update($data,['id'=>$id]);
        }
        return $res ? app("json")->success("操作成功",'code') : app("json")->fail("操作失败");
    }
}