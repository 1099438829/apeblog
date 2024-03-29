<?php


namespace app\common\model;


use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Paginator;

/**
 * 消息通知
 * Class AdminNotify
 * @package app\admin\model\admin
 */
class Message extends BaseModel
{
    /**
     * 系统分页
     * @param array $where
     * @return Paginator
     * @throws DbException
     */
    public static function systemPage(array $where)
    {
        $model = new self;
        if ($where['start_time'] != "" && $where['end_time'] != "") {
            $model = $model->where("create_time", "between", [strtotime($where['start_time'] . " 00:00:00"), strtotime($where['end_time'] . " 23:59:59")]);
        }
        if ($where['title'] != '') $model = $model->where("title|content", "like", "%$where[title]%");
        if ($where['is_read'] != '') $model = $model->where("is_read", $where['is_read']);
        if ($where['uid'] != '') $model = $model->where("aid", $where['aid']);
        $model = $model->order("is_read");
        $model = $model->order("create_time desc");
        return $model->paginate(10)->appends($where);
    }

    /**
     * 添加记录
     * @param array $data
     * @return int|string
     */
    public static function addLog(array $data): bool
    {
        if (self::create($data)){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 后台首页获取通知信息
     * @param int $num
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function pageList(int $num): array
    {
        $model = new self;
        $model = $model->where("is_read", 0);
        $count = self::count();
        $model = $model->order("create_time desc");
        $model = $model->page(1, $num);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact("data", "count");
    }
}