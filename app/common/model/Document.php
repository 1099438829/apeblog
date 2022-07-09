<?php


namespace app\common\model;

use app\common\model\Tag as TagModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;
use think\facade\Log;
use think\Model;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 木子的忧伤
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
     * @author 木子的忧伤
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

    /**
     * 获取文章信息
     * @param $id
     * @param string $type
     * @param string $status
     * @return array
     */
    public function getInfo($id,$type= self::DOCUMENT_TYPE_ARTICLE,$status = ''): array
    {
        if (empty($id)){
            return [];
        }
        $model = self::alias('a')
            ->leftJoin('document_article p','a.id = p.id')
            ->where("a.type",Document::DOCUMENT_TYPE_PAGE);
        if (is_numeric($id)){
            $model->where("a.id",$id);
        }else{
            $model->where("a.alias",$id);
        }
        if ($type !=='')  $model->where("a.type",$type);
        if ($status !=='')$model->where("a.status",$status);
        $info = $model->find();
        if (!$info){
            return [];
        }
        return $info->toArray();
    }

    /**
     * 更新文件信息
     * @param $dat
     * @param string $type
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function updateInfo($data, string $type=self::DOCUMENT_TYPE_ARTICLE)
    {
        try {
            $content = !empty($data['content'])?$data['content']:'';
            //判断摘要是否为空，为空则从内容摘取
            $data['abstract'] = $data['abstract'] ?: mb_substr(strip_tags($content), 0, 100);
            //判断是否写了别名，没写则需要生成
            if ($data['alias'] == "") $data['alias'] = get_rand_str(6);
            unset($data['content']);
            if ($data['is_recommend']) $data['is_recommend'] = 1;
            if ($data['is_hot']) $data['is_hot'] = 1;
            if ($data['display']) $data['display'] = 1;
            if ($data['is_top']) $data['is_top'] = 1;
            // 启动事务
            Db::startTrans();
            if (empty($data['id'])) {
                $data['create_date'] = date("Y-m-d");
                $data['create_time'] = time();
                $data['update_time'] = time();
                $id = Document::insertGetId($data);
                if (!empty($content)) {
                    $updateData = [
                        'id' => $id,
                        'content' => $content
                    ];
                    DocumentPage::insert($updateData);
                }
                if (!empty($data['tags'])) {
                    $tagModel = new TagModel();
                    $tagModel->createTags($data['tags'], $id,  $data['uid']);
                }
            } else {
                $ainfo = Document::get($data['id']);
                if (!$ainfo) return app("json")->fail("数据不存在");
                Document::where('id', $data['id'])->save($data);
                if (!empty($content)) {
                    switch ($type) {
                        case self::DOCUMENT_TYPE_ARTICLE:
                            $updateData = [
                                'id' => $data['id'],
                                'content' => $content
                            ];
                            $model = new DocumentArticle();
                            $model->save($updateData);
                            break;
                        case self::DOCUMENT_TYPE_PAGE:
                            $updateData = [
                                'id' => $data['id'],
                                'content' => $content
                            ];
                            $model = new DocumentPage();
                            $model->save($updateData);
                            break;
                        case self::DOCUMENT_TYPE_CATEGORY;
                            break;
                        default:
                            //默认暂时不处理
                            break;
                    }
                }
                if (!empty($data['tags'])) {
                    $tagModel = new TagModel();
                    $tagModel->createTags($data['tags'], $data['id'], $data['uid']);
                }
            }
            // 提交事务
            Db::commit();
            $res = true;
        } catch (\Exception $e) {
            Log::error('文章修改失败：失败原因：' . $e->getMessage());
            $res = false;
            self::setErrorInfo($e->getMessage());
            // 回滚事务
            Db::rollback();
        }
        return $res;
    }
}