<?php


namespace app\common\model;

use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class Document extends BaseModel
{
    //文档类型
    const DOCUMENT_TYPE_ARTICLE = "article";
    const DOCUMENT_TYPE_PAGE = "page";
    const DOCUMENT_TYPE_CATEGORY = "product";

    /**
     * 列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @author 李玉坤
     * @date 2021-02-15 23:24
     */
    public static function systemPage($where): array
    {
        $model = new self;
        $model = $model->where("type", "=",$where['type']??self::DOCUMENT_TYPE_ARTICLE);
        if ($where['title'] != '') $model = $model->where("title", "like", "%$where[title]%");
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        if ($where['status'] != '') $model = $model->where("status", $where['status']);
        $model = $model->order("sort desc")->order("id desc");
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $categoryList = DocumentCategory::column('title', 'id');
        $data = $model->select()->each(function ($item) use($categoryList) {
            $item->category_title = $categoryList[$item->category_id]??"";
        });
        return compact('data', 'count');
    }
}