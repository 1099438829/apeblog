<?php


namespace app\common\model;

use FormBuilder\Factory\Elm;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

/**
 * Class Document
 * @package app\admin\model\system
 * @author 李玉坤
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
     * 获取菜单列表缓存key
     * @param $adminId
     * @return string
     * @author 李玉坤
     * @date 2021-06-09 17:24
     */
    public static function getMenuCacheKey($adminId)
    {
        return 'menu:List:' . $adminId;
    }

    /**
     * @return string
     * @author 李玉坤
     * @date 2021-06-15 11:11
     */
    public static function getAuthCacheKey()
    {
        return 'auth:key:list';
    }

    public static function clearCache($adminId)
    {
        cache(AdminAuth::getMenuCacheKey($adminId), null);
        cache(AdminAuth::getAuthCacheKey(), null);
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
            $list[] = ['value' => $v['id'], 'label' => self::cross($num) . $v['title']];
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
     * 横线
     * @param int $num
     * @return string
     */
    public static function cross(int $num = 0): string
    {
        $str = "";
        if ($num == 1) $str .= "|--";
        elseif ($num > 1) for ($i = 0; $i < $num; $i++)
            if ($i == 0) $str .= "|--";
            else $str .= "--";
        return $str . " ";
    }

    /**
     * 生成treeData
     * @param int $pid
     * @param array $auth
     * @param array $list
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function selectAndBuildTree(int $pid = 0, array $auth = [], array $list = [])
    {
        $model = new self;
        $model = $model->where("pid", $pid);
        if ($auth != []) $model = $model->where("id", 'in', $auth);
        $model = $model->where("status", 1);
        $model = $model->field(['title', 'id']);
        $model = $model->order(["sort desc", "id"]);
        $data = $model->select();
        foreach ($data as $k => $v) {
            $list[] = self::buildTreeData($v['id'], $v['title'], self::selectAndBuildTree($v['id'], $auth));
        }
        return $list;
    }

    /**
     * 获取所有权限id
     * @param array $ids
     * @return array
     */
    public static function getIds(array $ids = []): array
    {
        if (empty($ids)) return self::where("status", 1)->column("id");
        $pids = self::where("id", "in", $ids)->column("pid");
        return array_merge($ids, $pids) ?: [];
    }

    /**
     * 获取操作名
     * @param string $module
     * @param string $controller
     * @param string $action
     * @return string
     */
    public static function getNameByAction(string $module, string $controller, string $action)
    {
        return self::where("module", $module)->where("controller", $controller)->where("action", $action)->value("title") ?: '未知操作';
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