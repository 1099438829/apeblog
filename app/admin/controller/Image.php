<?php

namespace app\admin\controller;


use app\admin\extend\FormBuilder as Form;
use app\admin\extend\Util as Util;
use app\common\model\Attachment;
use app\common\model\AttachmentCategory;
use Exception;
use FormBuilder\Exception\FormBuilderException;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Images
 * @package app\admin\controller\widget
 */
class Image extends AuthController
{
    /**
     * 附件类型
     * @var string
     */
    private $type = "image";

    /**
     * @throws Exception
     */
    public function index() : string
    {
        return $this->fetch();
    }

    /**
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function category()
    {
        return app("json")->success(AttachmentCategory::buildNodes($this->type, 0, $this->request->param("title", "")));
    }

    /**
     * 添加目录
     * @param int $id
     * @param int $pid
     * @return string
     * @throws FormBuilderException
     * @throws Exception
     */
    public function addCategory($id = 0, $pid = 0): string
    {
        $form = array();
        $form[] = Elm::select('pid', '上级分类', (int)$pid ?: (int)$id)->options(function () {
            $menu = [];
            $menu[] = ['label' => "顶级分类", "value" => 0];
            $list = AttachmentCategory::getCategoryLst();
            foreach ($list as $value) $menu[] = ['label' => $value['name'], "value" => $value['id']];
            return $menu;
        })->col(18);
        $form[] = Elm::input('name', '分类名称')->col(18);
        $form[] = Elm::hidden('type', $this->type)->col(18);
        $form = Form::make_post_form($form, url('/admin/image/saveCategory')->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 目录的修改
     * @param int $id
     * @param int $pid
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws FormBuilderException
     * @throws ModelNotFoundException
     * @throws Exception
     */
    public function editCategory(int $id = 0, int $pid = 0): string
    {
        if ($id == 0) return app("json")->fail("没有选中分类");
        $form = array();
        $form[] = Elm::select('pid', '上级分类', (int)$pid)->options(function () {
            $menu = [];
            $menu[] = ['label' => "顶级分类", "value" => 0];
            $list = AttachmentCategory::getCategoryLst();
            foreach ($list as $value) $menu[] = ['label' => $value['name'], "value" => $value['id']];
            return $menu;
        })->col(18);
        $form[] = Elm::input('name', '分类名称', AttachmentCategory::getNameById($id))->col(18);
        $form[] = Elm::hidden('type', $this->type)->col(18);
        $form = Form::make_post_form($form, Url('/admin/image/saveCategory', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 保存目录
     * @param string $id
     * @return mixed
     */
    public function saveCategory(string $id = "")
    {
        $data = Util::postMore([
            ['pid', 0],
            ['type', $this->type],
            ['name', '']
        ]);
        if ($data['name'] == '') return app("json")->fail("分类名称不能为空");
        if ($id == "") {
            $data['create_user'] = $this->adminId;
            $res = AttachmentCategory::create($data);
        } else {
            $data['update_user'] = $this->adminId;
            $res = AttachmentCategory::update($data, ['id' => $id]);
        }
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }

    /**
     * 删除目录
     * @param $id
     * @return mixed
     * @throws DbException
     */
    public function delCategory($id)
    {
        if ($id == 0) return app("json")->fail("未选择分类");
        if (Attachment::isExist($id, "cid")) return app("json")->fail("该分类下有图片不能删除");
        if (AttachmentCategory::isExist($id, "pid")) return app("json")->fail("该分类下有子分类不能删除");
        return AttachmentCategory::delete($id) ? app("json")->success("删除成功") : app("json")->fail("删除失败");
    }

    /**
     * @return mixed
     */
    public function getImageList()
    {
        $where = Util::postMore([
            ['cid', ''],
            ['type', $this->type],
            ['page', 1],
            ['limit', 12]
        ]);
        return app("json")->layui(Attachment::pagination($where));
    }

    /**
     * @param $id
     * @return string
     * @throws FormBuilderException
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function editImage($id): string
    {
        if ($id == 0) return app("json")->fail("没有选中图片");
        $image = Attachment::find($id);
        $form = array();
        $form[] = Elm::select('cid', '选中分类', (int)$image['cid'])->options(AttachmentCategory::returnOptions())->col(18);
        $form[] = Elm::hidden('type', $this->type)->col(18);
        $form = Form::make_post_form($form, Url('saveImage', ['id' => $id])->build());
        $this->assign(compact('form'));
        return $this->fetch("public/form-builder");
    }

    /**
     * 修改图片分类
     * @param $id
     * @return mixed
     */
    public function saveImage($id)
    {
        return Attachment::update(['cid' => $this->request->param('cid')], ['id' => $id]) ? app("json")->success("修改成功", 'code') : app("json")->fail("修改失败");
    }

    /**
     * 删除图片
     * @param $id
     * @return mixed
     */
    public function delImage($id)
    {
        if ($id == 0) return app("json")->fail("未选择图片");
        $image = Attachment::find($id);
        try {
            switch ($image['storage']) {
                case 1:
                    $filePath = app()->getRootPath() . 'public' . $image['path'];
                    if (file_exists($filePath)) {
                        unlink(app()->getRootPath() . 'public' . $image['path']);
                    }
                    break;
                case 2:
                    QcloudCoService::del(str_replace(system_config("storage_domain"), "", $image['path']));
                    break;
            }
            return Attachment::delete($id) ? app("json")->success("删除成功") : app("json")->fail("删除失败");
        } catch (Exception $e) {
            return app("json")->fail("删除失败" . $e);
        }
    }
}