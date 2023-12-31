<?php

namespace app\api\controller;

use app\admin\extend\Util;
use app\common\constant\Data;
use app\common\model\Document;
use app\Request;
use think\Exception;
use think\facade\Log;
use think\Response;

class Article extends Base
{
    public function list(){
        $where = Util::postMore([
            ['cid',''],
            ['typeId', ''],
            ['orderBy', 'sort asc,create_time desc'],
            ['row', 100],
            ['void', 'field'],
            ['model', "article"],
            ['type', "find"],
            ['where', ""],
            ['display',1],
            ['ids',""],
            ['page',1],
            ['limit',20],
        ]);
        $list = tpl_get_article_list($where['cid'], $where['row'], $where['orderby'], $where['model'], $where['type'], $where['where'], $where['display'], $where['ids']);
        return app("json")->layui($list);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws Exception
     */
    public function detail(Request $request)
    {
        $where = Util::postMore([
            ['id', ''],
        ],$request);
        if (empty($where['id'])){
            return app("json")->fail("参数错误");
        }
        //获取该文章
        $documentModel = new Document();
        $article = $documentModel->getFullInfo($where['id'], Data::DOCUMENT_TYPE_ARTICLE);
        $article['cover_path'] = file_cdn($article['cover_path']);
        if (!$article) {
            return app("json")->fail("文章不存在或已删除");
        }
        return app("json")->success($article,'code');
    }


}
