<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\Request;

/**
 * Trait TemplateTrait
 * @package app\admin\controller
 */
trait TemplateTrait
{
    /**
     * @throws \Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }

    /**
     * 删除操作
     * @param Request $request
     * @return mixed
     */
    public function del(Request $request)
    {
        $ids = $request->param("id", 0);
        if (empty($ids) || !$ids) return app("json")->fail("参数有误，Id为空！");
        if (!is_array($ids)) $ids = explode(",", $ids);
        if (in_array(1, $ids)) return app("json")->fail("参数有误，初始ID不允许操作！");
        return $this->model->where($this->model->getPk(), "in", $ids)->delete() ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 启用
     * @param Request $request
     * @return mixed
     */
    public function enabled(Request $request)
    {
        $ids = $request->param("id", 0);
        if (empty($ids) || !$ids) return app("json")->fail("参数有误，Id为空！");
        if (!is_array($ids)) $ids = explode(",", $ids);
        if (in_array(1, $ids)) return app("json")->fail("参数有误，初始ID不允许操作！");
        return $this->model->where($this->model->getPk(), "in", $ids)->update(['status' => 1]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 禁用
     * @param Request $request
     * @return mixed
     */
    public function disabled(Request $request)
    {
        $ids = $request->param("id", 0);
        if (empty($ids) || !$ids) return app("json")->fail("参数有误，Id为空！");
        if (!is_array($ids)) $ids = explode(",", $ids);
        if (in_array(1, $ids)) return app("json")->fail("参数有误，初始ID不允许操作！");
        return $this->model->where($this->model->getPk(), "in", $ids)->update(['status' => 0]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }

    /**
     * 修改字段
     * @param $id
     * @return mixed
     */
    public function field($id)
    {
        if (empty($id) || !$id) return app("json")->fail("参数有误，Id为空！");
        $where = Util::postMore([['field', ''], ['value', '']]);
        if ($where['field'] == '' || $where['value'] == '') return app("json")->fail("参数有误！");
        return $this->model::update([$where['field'] => $where['value']], [$this->model->getPk() => $id]) ? app("json")->success("操作成功") : app("json")->fail("操作失败");
    }
}