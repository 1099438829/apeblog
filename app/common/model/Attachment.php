<?php


namespace app\common\model;


use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class attachment
 * @package app\admin\model\widget
 */
class Attachment extends BaseModel
{
    /**
     * @param int $cid
     * @param string $name
     * @param string $path
     * @param string $type
     * @param string $mime
     * @param float $size
     * @param int $storage
     * @return int|string
     */
    public static function addAttachment(int $cid, string $name, string $path, string $type, string $mime, float $size, int $storage)
    {
        $data = [
            'cid' => $cid,
            'name' => $name,
            'path' => $path,
            'type' => $type,
            'mime' => $mime,
            'size' => $size,
            'storage' => $storage,
        ];
        return self::create($data);
    }

    /**
     * 分页显示
     * @param array $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function pagination(array $where): array
    {
        $model = (new Attachment)->where("type", $where['type']);
        if ($where['cid'] != "") $model = $model->where("cid", $where['cid']);
        $count = (new Attachment)->count();
        $model = $model->order("id desc");
        $model = $model->field("id,path");
        $data = $model->page((int)$where['page'], (int)$where['limit'])->select();
        if ($data) $data = $data->toArray();
        return compact("data", "count");
    }
}