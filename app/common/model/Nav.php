<?php


namespace app\common\model;

use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:22
 */
class Nav extends BaseModel
{
    /**
     * 权限列表
     * @param $where
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function systemPage($where): array
    {
        $model = new self;
        if (isset($where['status']) && $where['status'] != '') $model = $model->where("status", $where['status']);
        if (isset($where['title']) && $where['title'] != '') $model = $model->where("name|id", "like", "%$where[name]%");
        $model = $model->field(['id', 'title', 'icon', 'pid', 'params', 'url', 'sort', 'status']);
        $model = $model->order(["sort desc", "id"]);
        $data = $model->select();
        return $data->toArray() ?: [];
    }

    /**
     * 获取选择数据
     * @param int $pid
     * @param array $auth
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function lst(int $pid = 0, array $auth = []): array
    {
        $model = new self;
        $model = $model->where("pid", $pid);
        if ($auth != []) $model = $model->where("id", 'in', $auth);
        $model = $model->field(['title', 'id']);
        $model = $model->order(["sort desc", "id"]);
        $data = $model->select()->each(function ($item) use ($auth) {
            $item['children'] = self::lst($item['id'], $auth);
        });
        return $data->toArray() ?: [];
    }

    /**
     * 遍历选择项
     * @param array $data
     * @param $list
     * @param int $num
     * @param bool $clear
     */
    public static function myOptions(array $data, &$list, $num = 0, $clear = true)
    {
        foreach ($data as $k => $v) {
            $list[] = ['value' => $v['id'], 'label' => cross($num) . $v['title']];
            if (is_array($v['children']) && !empty($v['children'])) {
                self::myOptions($v['children'], $list, $num + 1, false);
            }
        }
    }

    /**
     * 返回选择项
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function returnOptions(): array
    {
        $list = [];
        $list[] = ['value' => 0, 'label' => '总后台'];
        self::myOptions(self::lst(), $list, 1, true);
        return $list;
    }

    /**
     * 生成单个节点
     * @param $id
     * @param $title
     * @return array
     */
    public static function buildTreeData($id, $title, $children = []): array
    {
        $tree = Elm::TreeData($id, $title);
        if (!empty($children)) $tree = $tree->children($children);
        return $tree->getOption();
    }
}