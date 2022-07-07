<?php


namespace app\common\model;


use app\common\model\Document as aModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class DocumentPage
 * @package app\admin\model\system
 * @author 李玉坤
 * @date 2021-02-15 23:22
 */
class DocumentPage extends BaseModel
{
    public function getInfo($id)
    {
        if (empty($id)){
            return [];
        }
        $info = aModel::alias('a')
            ->leftJoin('document_page p','a.id = p.id')
            ->where("a.id",$id)
            ->where("a.type",Document::DOCUMENT_TYPE_PAGE)
            ->find();
        if (!$info){
            return [];
        }
        return $info->toArray();
    }

}