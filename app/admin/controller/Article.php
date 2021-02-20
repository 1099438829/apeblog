<?php

namespace app\admin\controller;

use app\admin\model\Document as aModel;
use app\admin\model\DocumentCategory as cModel;
use app\Request;
use app\admin\services\UtilService as Util;

/**
 * Class Article
 * @package app\admin\controller\system
 * @author 李玉坤
 * @date 2021-02-15 23:20
 */
class Article extends AuthController
{
    /**
     * 文章管理主页
     * @return string
     * @throws \Exception
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
            ['name',''],
            ['start_time',''],
            ['end_time',''],
            ['status',''],
            ['page',1],
            ['limit',20],
        ]);
        return app("json")->layui(aModel::systemPage($where));
    }

    /**
     * 更新
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-16 21:15
     */
    public function update(Request $request)
    {
        $data = Util::postMore([
            ['id',''],
            ['title',''],
            ['category_id',''],
            ['keywords',''],
            ['description',''],
            ['type','article'],
            ['is_recommend',0],
            ['is_top',0],
            ['link_str',''],
            ['cover_path',''],
            ['display',1],
            ['sort',''],
            ['status',1],
        ]);
        if ($data['id'] == '') return app("json")->fail("参数有误，Id为空！");
        $id = $data['id'];
        unset($data['id']);
        $saveData = [];
        foreach ($data as $key=>$value){
            if ($value !== ''){
                $saveData[$key] = $value;
            }
        }
        return aModel::update($saveData,['id'=>$id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 修改字段
     * @param $id
     * @return mixed
     * @author 李玉坤
     * @date 2021-02-16 23:12
     */
    public function field($id)
    {
        if (!$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field',''],['value','']]);
        if ($where['field'] == '' || $where['value'] =='') return app("json")->fail("参数有误！");
        return aModel::update([$where['field']=>$where['value']],['id'=>$id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 新增页
     * @return string
     * @throws \Exception
     */
    public function add()
    {
        $this->assign("category",cModel::selectByType(2));
        return $this->fetch();
    }

    /**
     * 编辑页
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-02-20 17:00
     */
    public function edit(Request $request)
    {
        $this->assign("category",CModel::selectByType(2));
        $this->assign("info",aModel::get($request->param(['id'])));
        return $this->fetch();

    }

}