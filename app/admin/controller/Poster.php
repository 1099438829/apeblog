<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\common\constant\Data;
use app\common\model\Advert as aModel;
use app\Request;
use app\admin\extend\Util as Util;
use FormBuilder\Factory\Elm;
use think\facade\Route as Url;

/**
 * Class Poster
 * @package app\admin\controller
 * @author 李玉坤
 * @date 2021-07-26 17:53
 */
class Poster extends AuthController
{
    /**
     * 构造方法 初始化一些参数
     */
    public function initialize()
    {
        parent::initialize();
        //修正因为修改model名称和原来不能对应导致的model功能异常
        $this->model = new aModel();
    }

    /**
     * 广告管理
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-02-19 11:53
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
            ['title', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['status', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加广告
     * @param Request $request
     * @return string
     * @throws \FormBuilder\Exception\FormBuilderException
     */
    public function add(Request $request)
    {
        $form = array();
        $form[] = Elm::input('title', '广告名称')->col(10);
        $form[] = Elm::input('url', '链接地址')->col(10);
        $form[] = Elm::frameImage('cover_path', '广告图片', Url::buildUrl('admin/images/index', array('fodder' => 'images', 'limit' => 1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort', '排序')->col(10);
        $form[] = Elm::select('position', '位置')->options(function () {
            $options = [];
            foreach (['顶部页签', '右侧广告位', '文章页面'] as $k => $v) {
                $options[] = Elm::option($k, $v);
            }
            return $options;
        })->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改banner
     * @return string
     * @throws \FormBuilder\Exception\FormBuilderException
     */
    public function edit($id = "")
    {
        if (!$id) return app("json")->fail("数据id不能为空");
        $ainfo = aModel::get($id);
        if (!$ainfo) return app("json")->fail("没有该数据");
        $form = array();
        $form[] = Elm::input('title', '广告名称', $ainfo['title'])->col(10);
        $form[] = Elm::input('url', '链接地址', $ainfo['url'])->col(10);
        $form[] = Elm::frameImage('cover_path', '广告图片', Url::buildUrl('admin/images/index', array('fodder' => 'images', 'limit' => 1)), $ainfo['cover_path'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::input('sort', '排序', $ainfo['sort'])->col(10);
        $form[] = Elm::select('position', '位置', $ainfo['position'])->options(function () {
            $options = [];
            foreach (['顶部页签', '右侧广告位', '文章页面'] as $k => $v) {
                $options[] = Elm::option($k, $v);
            }
            return $options;
        })->col(10);
        $form[] = Elm::radio('status', '状态', $ainfo['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('save', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     */
    public function save($id = "")
    {
        $data = Util::postMore([
            ['id', ''],
            ['title', ''],
            ['url', ''],
            ['cover_path', ''],
            ['position', 0],
            ['sort', ''],
            ['status', 1],
        ]);
        if ($data['title'] == "") return app("json")->fail("广告名称不能为空");
        if ($data['url'] == "") return app("json")->fail("链接地址不能为空");
        if (is_array($data['cover_path'])) $data['cover_path'] = $data['cover_path'][0];
        $data['user_id'] = $this->adminId;//默认修改你
        if ($id == "") {
            //判断下用户是否存在
            $info = aModel::where('url', $data['url'])->find();
            if ($info) {
                return app("json")->fail("链接已存在");
            }
            $res = aModel::create($data);
        } else {
            $res = aModel::update($data, ['id' => $id]);
        }
        cache(Data::DATA_ADVERT . '_' . $data['position'], null);//清除缓存
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}