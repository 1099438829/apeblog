<?php


namespace app\common\model;

use app\common\constant\Data;
use app\common\model\Tag as TagModel;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\facade\Db;
use think\facade\Log;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:22
 */
class Document extends BaseModel
{
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
        $model = $model->where("type", "=", $where['type'] ?? Data::DOCUMENT_TYPE_ARTICLE);
        if ($where['title'] != '') $model = $model->where("title", "like", "%$where[title]%");
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        if ($where['status'] != '') $model = $model->where("status", $where['status']);
        $model = $model->order("sort desc")->order("id desc");
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $categoryList = DocumentCategory::column('title', 'id');
        $data = $model->select()->each(function ($item) use ($categoryList) {
            $item->category_title = $categoryList[$item->category_id] ?? "";
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
    public function getInfo($id, string $type = Data::DOCUMENT_TYPE_ARTICLE, $status = 1): array
    {
        if (empty($id)) {
            return [];
        }
        $model = self::alias('a')->field("a.*,p.content");
        if (is_numeric($id)) {
            $model->where("a.id", $id);
        } else {
            $model->where("a.alias", $id);
        }
        if ($type !== '') $model->where("a.type", $type);
        if ($status !== '') $model->where("a.status", $status);
        switch ($type) {
            case Data::DOCUMENT_TYPE_ARTICLE:
                $model->leftJoin('document_article p', 'a.id = p.id');
                break;
            case Data::DOCUMENT_TYPE_PAGE:
                $model->leftJoin('document_page p', 'a.id = p.id');
                break;
            case Data::DOCUMENT_TYPE_PRODUCT:
                $model->leftJoin('document_product p', 'a.id = p.id');
                break;
        }
        $info = $model->find();
        if (!$info) {
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
    /**
     * 更新文件信息
     * @param $dat
     * @param string $type
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function updateInfo($data, string $type = Data::DOCUMENT_TYPE_ARTICLE)
    {
        try {
            $content = !empty($data['content']) ? $data['content'] : '';
            //判断摘要是否为空，为空则从内容摘取
            $data['abstract'] = $data['abstract'] ?: mb_substr(strip_tags($content), 0, 100);
            //判断是否写了别名，没写则需要生成
            if ($data['alias'] == "") $data['alias'] = get_rand_str(6);
            unset($data['content']);
            if ($data['is_recommend']) $data['is_recommend'] = 1;
            if ($data['is_hot']) $data['is_hot'] = 1;
            if ($data['display']) $data['display'] = 1;
            if ($data['is_top']) $data['is_top'] = 1;
            if ($data['is_jump']) $data['is_jump'] = 1;
            //判断是否主键冲突
            $info = $this->where("alias", $data['alias'])->find();
            if ($info && (!empty($data['id']) && $info->id != $data['id'])) {
                self::setErrorInfo("别名已存在,请修改后重试");
                return false;
            }
            switch ($type) {
                case Data::DOCUMENT_TYPE_ARTICLE:
                    $contentData = [
                        'id' => $data['id'],
                        'content' => $content
                    ];
                    $model = new DocumentArticle();
                    break;
                case Data::DOCUMENT_TYPE_PAGE:
                    $contentData = [
                        'id' => $data['id'],
                        'content' => $content
                    ];
                    $model = new DocumentPage();
                    break;
                case Data::DOCUMENT_TYPE_PRODUCT;
                    $model = new DocumentProduct();
                    $contentData = [
                        'id' => $data['id'],
                        'content' => $content
                    ];
                    break;
                default:
                    //默认暂时不处理
                    break;
            }
            // 启动事务
            Db::startTrans();
            if (empty($data['id'])) {
                $data['create_date'] = date("Y-m-d");
                $data['create_time'] = time();
                $data['update_time'] = time();
                $id = Document::insertGetId($data);
                if (!empty($content)) {
                    //更改默认id
                    $contentData["id"] = $id;
                    $model::insert($contentData);
                }
                if (!empty($data['tags'])) {
                    $tagModel = new TagModel();
                    $tagModel->createTags($data['tags'], $id, $data['uid']);
                }
            } else {
                $ainfo = Document::get($data['id']);
                if (!$ainfo) return app("json")->fail("数据不存在");
                Document::where('id', $data['id'])->update($data);
                if (!empty($content)) {
                    $info = $model->find($data['id']);
                    if (!$info) {
                        $model->insert($contentData);
                    } else {
                        $model->update($contentData);
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