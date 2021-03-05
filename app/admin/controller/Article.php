<?php

namespace app\admin\controller;

use app\admin\model\Document as aModel;
use app\admin\model\DocumentCategory as cModel;
use app\admin\model\DocumentArticle;
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
     * 保存
     * @param string $id
     * @return mixed
     * @author 李玉坤
     * @date 2021-02-28 22:43
     */
    public function save($id="")
    {
        $data = Util::postMore([
            ['id',''],
            ['author',''],
            ['title',''],
            ['category_id',''],
            ['type','article'],
            ['abstract',''],
            ['keywords',''],
            ['content',''],
            ['description',''],
            ['is_recommend',0],
            ['is_top',0],
            ['is_hot',0],
            ['link_str',''],
            ['cover_path',''],
            ['display',1],
            ['tags',''],
            ['sort',''],
            ['status',1],
        ]);

        if ($data['title'] == "") return app("json")->fail("文章名称不能为空");
        if ($data['category_id'] == "") return app("json")->fail("栏目分类不能为空");
        if ($data['cover_path'] == "") return app("json")->fail("主图不能为空");
        $data['author'] =  $data['author']?:$this->adminInfo['nickname'];
        $data['uid'] = $this->adminId;
        if (!empty($data['content'])){
            $content = $data['content'];
            unset($data['content']);
        }
        if ($data['is_recommend']) $data['is_recommend'] = 1;
        if ($data['is_hot']) $data['is_hot'] = 1;
        if ($data['display']) $data['display'] = 1;
        if ($data['is_top']) $data['is_top'] = 1;
        if ($id=="")
        {
            $data['author'] =  $data['author']?:$this->adminInfo['nickname'];
            $data['create_time'] = time();
            $data['update_time'] = time();
            $id = aModel::insertGetId($data);
            if (!empty($content)){
                $updateData = [
                    'id' => $id,
                    'content' => $content
                ];
                $res = DocumentArticle::insert($updateData);
            }
        }else
        {
            $ainfo = aModel::get($id);
            if (!$ainfo)return app("json")->fail("数据不存在");
            $res = aModel::where('id',$id)->save($data);
            if (!empty($content)){
                //更新文档
                $res = DocumentArticle::where('id',$id)->save(['content'=>$content]);
            }
        }
        return $res ? app("json")->success("操作成功",'code') : app("json")->fail("操作失败");
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
        $where = [
            'name' => '',
            'status' => ''
        ];
        $category = cModel::systemPage($where);
        $category = get_tree_list($category);
        $this->assign("category",$category);
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
        $where = [
            'name' => '',
            'status' => ''
        ];
        $category = cModel::systemPage($where);
        $category = get_tree_list($category);
        $this->assign("category",$category);
        $this->assign("info",aModel::get($request->param(['id'])));
        return $this->fetch();

    }
}