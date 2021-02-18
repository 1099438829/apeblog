<?php

namespace app\admin\controller;

use app\admin\model\Document;
use app\admin\model\DocumentArticle;
use app\admin\model\DocumentProduct;
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
     * 账号列表
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
        return app("json")->layui(Document::systemPage($where));
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
            ['isrecommend',0],
            ['istop',0],
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
        return Document::update($saveData,['id'=>$id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
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
        return Document::update([$where['field']=>$where['value']],['id'=>$id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

}