<?php

namespace app\admin\controller;

use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\Advert as aModel;
use app\common\model\AdvertInfo as tModel;
use app\Request;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Route as Url;
use think\Response;

/**
 * Class Advert
 * @package app\admin\controller
 * @author 木子的忧伤
 * @date 2021-07-26 17:53
 */
class Advert extends AuthController
{

    public function index() : string
    {
        return $this->fetch();
    }

    /**
     * 列表
     * @param Request $request
     * @return Response
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function lst(Request $request): Response
    {
        $where = Util::postMore([
            ['title', ''],
            ['status', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['page', 1],
            ['limit', 20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 添加
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     * @throws Exception
     */
    public function add(Request $request)
    {
        $form = array();
        $form[] = Elm::input('title', '轮播组名称')->col(10);
        $form[] = Elm::input('alias', '标识')->col(10);
        $form[] = Elm::input('description', '描述')->col(20);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(24);
        $form = Form::make_post_form($form, url('/admin/advert/save')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     */
    public function edit($id = '')
    {
        if (!$id) return app("json")->fail("项目id不能为空");
        $info = (new \app\common\model\Advert)->find($id);
        if (!$info) return app("json")->fail("轮播组不存在");
        $form = array();
        $form[] = Elm::input('title', '轮播组名称', $info['title'])->col(10);
        $form[] = Elm::input('alias', '标识', $info['alias'])->col(10);
        $form[] = Elm::input('description', '描述', $info['description'])->col(20);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '禁用', 'value' => 0], ['label' => '启用', 'value' => 1]])->col(24);
        $form = Form::make_post_form($form, url('/admin/advert/save', ["id" => $id])->build());
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
            ['title', ''],
            ['alias', ''],
            ['description', ''],
            ['status', 1]
        ]);
        if ($data['title'] == "") return app("json")->fail("轮播名称不能为空");
        if ($data['alias'] == "") return app("json")->fail("标识不能为空");
        if ($id == "") {
            //需要验证轮播组标识是否存在
            $info = aModel::where("alias",$data['alias'])->find($id);
            if ($info) return app("json")->fail("标识已存在，请修改后重试");
            $data['create_time'] = time();
            $res = aModel::create($data);
        } else {
            $data['update_time'] = time();
            $res = aModel::update($data, ['id' => $id]);
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }


    /**
     * 修改字段
     * @param $id
     * @return mixed
     * @author 木子的忧伤
     * @date 2021-02-16 23:12
     */
    public function field($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        return aModel::update([$where['field'] => $where['value']], ['id' => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 重写删除
     * @param Request $request
     * @return mixed|void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function del(Request $request)
    {
        $ids = $request->param("id", 0);
        if ($ids == 0) return app("json")->fail("参数有误，Id为空！");
        if (!is_array($ids)) $ids = array_filter(explode(",", $ids));
        if ((new \app\common\model\AdvertInfo)->where("tab_id", "in", $ids)->count() > 0) return app("json")->fail("该配置项下有配置数据，不能删除！");
        return parent::del($request);
    }

    /**
     * 广告管理
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-19 11:53
     */
    public function info($id = ''): string
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        return $this->fetch();
    }

    /**
     * 广告列表
     * @param Request $request
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 木子的忧伤
     * @date 2021-02-15 23:26
     */
    public function infoList(Request $request)
    {
        $where = Util::postMore([
            ['id', ''],
            ['title', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['status', ''],
            ['page', 1],
            ['limit', 20],
        ],$request);
        return app("json")->layui(tModel::systemPage($where));
    }

    /**
     * 添加广告
     * @param Request $request
     * @return string
     * @throws FormBuilderException
     */
    public function addAdvert(Request $request): string
    {
        $form = array();
        $form[] = Elm::input('title', '广告名称')->col(10);
        $form[] = Elm::input('url', '链接地址')->col(10);
        $form[] = Elm::frameImage('cover_path', '广告图片', Url::buildUrl('/admin/image/index', array('fodder' => 'cover_path', 'limit' => 1)))->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::number('sort', '排序')->col(10);
        $form[] = Elm::select('advert_id', '位置')->options(function () {
            $options = [];
            $advertList = aModel::where("status",1)->column("title","id");
            foreach ($advertList as $k => $v) {
                $options[] = Elm::option($k, $v);
            }
            return $options;
        })->col(10);
        $form[] = Elm::radio('status', '状态', 1)->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/advert/saveAdvert')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改banner
     * @param string $id
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws FormBuilderException
     * @throws ModelNotFoundException
     */
    public function editAdvert($id = ""): string
    {
        if (!$id) return app("json")->fail("数据id不能为空");
        $info = (new \app\common\model\AdvertInfo)->find($id);
        if (!$info) return app("json")->fail("没有该数据");
        $form = array();
        $form[] = Elm::input('title', '广告名称', $info['title'])->col(10);
        $form[] = Elm::input('url', '链接地址', $info['url'])->col(10);
        $form[] = Elm::frameImage('cover_path', '广告图片', Url::buildUrl('/admin/image/index', array('fodder' => 'cover_path', 'limit' => 1)), $info['cover_path'])->icon("ios-image")->width('96%')->height('440px')->col(10);
        $form[] = Elm::number('sort', '排序', $info['sort'])->col(10);
        $form[] = Elm::select('advert_id', '位置', $info['advert_id'])->options(function () {
            $options = [];
            $advertList = aModel::where("status",1)->column("title","id");
            foreach ($advertList as $k => $v) {
                $options[] = Elm::option($k, $v);
            }
            return $options;
        })->col(10);
        $form[] = Elm::radio('status', '状态', $info['status'])->options([['label' => '启用', 'value' => 1], ['label' => '冻结', 'value' => 0]])->col(10);
        $form = Form::make_post_form($form, url('/admin/advert/saveAdvert', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存修改
     * @param string $id
     * @return mixed
     */
    public function saveAdvert($id = "")
    {
        $data = Util::postMore([
            ['id', ''],
            ['title', ''],
            ['url', ''],
            ['cover_path', ''],
            ['advert_id', 1],
            ['sort', ''],
            ['status', 1],
        ]);
        if ($data['title'] == "") return app("json")->fail("广告名称不能为空");
        if ($data['url'] == "") return app("json")->fail("链接地址不能为空");
        if (is_array($data['cover_path'])) $data['cover_path'] = $data['cover_path'][0];
        $data['user_id'] = $this->adminId;//默认修改你
        if (filter_var($data['url'], FILTER_VALIDATE_URL) === false) return app("json")->fail("链接地址不合法");
        $info = aModel::find($data['advert_id']);
        if (!$info){
            return app("json")->fail("广告组id错误");
        }
        if ($id == "") {
            $res = tModel::create($data);
        } else {
            $res = tModel::update($data, ['id' => $id]);
        }
        cache(Data::DATA_ADVERT . '_' . $info['alias'], null);//清除缓存
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}