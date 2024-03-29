<?php


namespace app\admin\model;


use app\common\model\BaseModel;
use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * 操作角色
 * Class AdminRole
 * @package app\admin\model\admin
 */
class AdminRole extends BaseModel
{
    /**
     * 获取权限
     * @param int $id
     * @return string
     */
    public static function getAuth(int $id): string
    {
        return (new AdminRole)->where("id", $id)->value("auth") ?: '';
    }

    /**
     * 获取所有角色ids
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function getAuthLst(): array
    {
        $data = (new AdminRole)->where("status", 1)->field("id,name")->select();
        return $data ? $data->toArray() : [];
    }

    /**
     * 获取角色名称
     * @param int $id
     * @return string
     */
    public static function getAuthNameById(int $id): string
    {
        return (new AdminRole)->where("id", $id)->value("name") ?: (string)$id;
    }

    /**
     * 角色列表
     * @param int $pid
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function systemPage(int $pid = -1): array
    {
        $model = new self;
        if ($pid != -1) $model = $model->where("pid", $pid);
        $model = $model->field(['id', 'name', 'pid', 'auth', 'rank', 'status']);
        $model = $model->order(["rank desc", "id"]);
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
        $model = $model->field(['name', 'id']);
        $model = $model->order(["rank desc", "id"]);
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
    public static function myOptions(array $data, &$list, int $num = 0, bool $clear = true): void
    {
        foreach ($data as $v) {
            $list[] = ['value' => $v['id'], 'label' => cross($num) . $v['name']];
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
        $list[] = ['label' => '总后台', 'value' => 0];
        self::myOptions(self::lst(), $list, 1, true);
        return $list;
    }

    /**
     * 生成单个节点
     * @param $id
     * @param $title
     * @param array $children
     * @return array
     */
    public static function buildTreeData($id, $title, array $children = []): array
    {
        $tree = Elm::TreeData($id, $title);
        if (!empty($children)) $tree = $tree->children($children);
        return $tree->getOption();
    }
}