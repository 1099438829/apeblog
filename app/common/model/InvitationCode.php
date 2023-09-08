<?php


namespace app\common\model;


use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class InvitationCode
 * @package app\admin\model\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:22
 */
class InvitationCode extends BaseModel
{
    /**
     * 邀请码列表
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
        $model = $model->order('id', 'desc');
        if (isset($where['code']) && $where['code'] !== '') $model->where('code', "like", "%$where[code]%");
        $count = self::count();
        if ($where['page'] && $where['limit']) $model = $model->page((int)$where['page'], (int)$where['limit']);
        $data = $model->select();
        if ($data) $data = $data->toArray();
        return compact('data', 'count');
    }
}