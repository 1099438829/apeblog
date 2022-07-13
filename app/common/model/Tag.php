<?php


namespace app\common\model;

use Exception;
use think\Collection;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Tag
 * @package app\common\model
 * @author 木子的忧伤
 * @date 2021-11-08 0:11
 */
class Tag extends BaseModel
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
        if ($where['name'] != '') $model = $model->where("title|url", "like", "%$where[name]%");
        if ($where['document_id'] != '') $model = $model->where("document_id", $where['document_id']);
        if ($where['start_time'] != '') $model = $model->where("create_time", ">", strtotime($where['start_time'] . " 00:00:00"));
        if ($where['end_time'] != '') $model = $model->where("create_time", "<", strtotime($where['end_time'] . " 23:59:59"));
        $count = self::counts($model);
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data', 'count');
    }

    /**
     * 创建标签
     * @param $tags
     * @param $document_id
     * @param $user_id
     * @return Collection
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-11-08 0:53
     */
    public function createTags($tags, $document_id, $user_id)
    {
        if (!is_array($tags)) {
            $tags = explode(',', $tags);
        }
        $saveAll = [];
        foreach ($tags as $tag) {
            //先删除原有的数据
            $this->where('document_id', $document_id)->delete();
            $saveAll[] = [
                'name' => $tag,
                'document_id' => $document_id,
                'user_id' => $user_id,
            ];
        }
        return $this->saveAll($saveAll);
    }


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
    public static function getList($where): array
    {
        $list = cache('index:tagList');
        $list = false;
        if ($list) {
            return json_decode($list, true);
        } else {
            $model = new self();
            if ($where['name'] != '') $model = $model->where("title|url", "like", "%$where[name]%");
            $model = $model->field('distinct name,count(1) as num')->order("num DESC")->group("name");
            if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
            $list = $model->select()->each(function (&$tag) {
                $tag->text = $tag['name'];
                $tag->href = url("/index/article/tag?t=" . $tag['name'])->build();
            })->toArray();
            if ($list) {
                cache('index:tagList', json_encode($list), 24 * 60 * 60);
            }
        }
        return $list;
    }
}