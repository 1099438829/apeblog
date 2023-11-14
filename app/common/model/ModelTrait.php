<?php


namespace app\common\model;


use think\db\BaseQuery;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\db\Raw;
use think\Model;

trait ModelTrait
{
    /**
     * 错误信息,解决调用无法明确错误的问题
     * @var mixed
     */
    protected $error;

    /**
     * 获取错误信息
     * @access public
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

    /**
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public static function get($where)
    {
        if (!is_array($where)) {
            return (new BaseModel)->find($where);
        } else {
            return (new BaseModel)->where($where)->find();
        }
    }

    /**
     * @throws ModelNotFoundException
     * @throws DataNotFoundException
     * @throws DbException
     */
    public static function all($function)
    {
        $query = (new BaseModel)->newQuery();
        $function($query);
        return $query->select();
    }

    /**
     * 添加多条数据
     * @param $group
     * @param bool $replace
     * @return int
     */
    public static function setAll($group, bool $replace = false)
    {
        return (new BaseModel)->insertAll($group, $replace);
    }

    /**
     * 修改一条数据
     * @param $data
     * @param $id
     * @param $field
     * @return bool $type 返回成功失败
     */
    public static function edit($data, $id, $field = null): bool
    {
        $model = new self;
        if (!$field) $field = $model->getPk();
//        return false !== $model->update($data,[$field=>$id]);
//        return 0 < $model->update($data,[$field=>$id])->result;
        $res = $model->update($data, [$field => $id]);
        if (isset($res->result))
            return 0 < $res->result;
        else if (isset($res['data']['result']))
            return 0 < $res['data']['result'];
        else
            return false !== $res;
    }


    /**
     * 查询一条数据是否存在
     * @param $map
     * @param string $field
     * @return bool 是否存在
     * @throws DbException
     */
    public static function isExist($map, $field = ''): bool
    {
        $model = (new self);
        if (!is_array($map) && empty($field)) $field = $model->getPk();
        $map = !is_array($map) ? [$field => $map] : $map;
        return 0 < $model->where($map)->count();
    }

    /**
     * 删除一条数据
     * @param $id
     * @return bool $type 返回成功失败
     */
    public static function del($id)
    {
        return false !== self::destroy($id);
    }


    /**
     * 分页
     * @param null $model 模型
     * @param null $eachFn 处理结果函数
     * @param array $params 分页参数
     * @param int $limit 分页数
     * @return BaseQuery
     */
    public static function page($model = null, $eachFn = null, $params = [], $limit = 20): BaseQuery|array|null
    {
        if (is_numeric($eachFn) && is_numeric($model)) {
            return parent::page($model, $eachFn);
        }

        if (is_numeric($eachFn)) {
            $limit = $eachFn;
            $eachFn = null;
        } else if (is_array($eachFn)) {
            $params = $eachFn;
            $eachFn = null;
        }

        if (is_callable($model)) {
            $eachFn = $model;
            $model = null;
        } elseif (is_numeric($model)) {
            $limit = $model;
            $model = null;
        } elseif (is_array($model)) {
            $params = $model;
            $model = null;
        }

        if (is_numeric($params)) {
            $limit = $params;
            $params = [];
        }

        $paginate = $model === null ? self::paginate($limit, false, ['query' => $params]) : $model->paginate($limit, false, ['query' => $params]);
        $list = is_callable($eachFn) ? $paginate->each($eachFn) : $paginate;
        $page = $list->render();
        $total = $list->total();
        return compact('list', 'page', 'total');
    }

    /**
     * 获取分页 生成where 条件和 whereOr 支持多表查询生成条件
     * @param object $model 模型对象
     * @param array $where 需要检索的数组
     * @param array $field where字段名
     * @param array $fieldOr whereOr字段名
     * @param array $fun 闭包函数
     * @param string $like 模糊查找 关键字
     * @return array
     */
    public static function setWherePage($model = null, $where = [], $field = [], $fieldOr = [], $fun = null, $like = 'LIKE')
    {
        if (!is_array($where) || !is_array($field)) return false;
        if ($model === null) $model = new self();
        //处理等于行查询
        foreach ($field as $key => $item) {
            if (($count = strpos($item, '.')) === false) {
                if (isset($where[$item]) && $where[$item] != '') {
                    $model = $model->where($item, $where[$item]);
                }
            } else {
                $item_l = substr($item, $count + 1);
                if (isset($where[$item_l]) && $where[$item_l] != '') {
                    $model = $model->where($item, $where[$item_l]);
                }
            }
        }
        //回收变量
        unset($count, $key, $item, $item_l);
        //处理模糊查询
        if (!empty($fieldOr) && is_array($fieldOr) && isset($fieldOr[0])) {
            if (($count = strpos($fieldOr[0], '.')) === false) {
                if (isset($where[$fieldOr[0]]) && $where[$fieldOr[0]] != '') {
                    $model = $model->where(self::getField($fieldOr), $like, "%" . $where[$fieldOr[0]] . "%");
                }
            } else {
                $item_l = substr($fieldOr[0], $count + 1);
                if (isset($where[$item_l]) && $where[$item_l] != '') {
                    $model = $model->where(self::getField($fieldOr), $like, "%" . $where[$item_l] . "%");
                }
            }
        }
        unset($count, $key, $item, $item_l);
        return $model;
    }

    /**
     * 字符串拼接
     * @param int|array $id
     * @param string $str
     * @return string
     */
    private static function getField($id, $str = '|')
    {
        if (is_array($id)) {
            $sql = "";
            $i = 0;
            foreach ($id as $val) {
                $i++;
                if ($i < count($id)) {
                    $sql .= $val . $str;
                } else {
                    $sql .= $val;
                }
            }
            return $sql;
        } else {
            return $id;
        }
    }

    /**
     * 条件切割
     * @param string $order
     * @param string $file
     * @return string
     */
    public static function setOrder($order, $file = '-')
    {
        if (empty($order)) return '';
        return str_replace($file, ' ', $order);
    }

    /**
     * 获取时间段之间的model
     * @param int|string $time
     * @param string $ceil
     * @return array
     */
    public static function getModelTime($where, $model = null, $prefix = 'add_time', $data = 'data', $field = ' - ')
    {
        if ($model == null) $model = new self;
        if (!isset($where[$data])) return $model;
        switch ($where[$data]) {
            case 'today':
            case 'week':
            case 'month':
            case 'year':
            case 'yesterday':
                $model = $model->whereTime($prefix, $where[$data]);
                break;
            case 'quarter':
                list($startTime, $endTime) = self::getMonth();
                $model = $model->where($prefix, '>', strtotime($startTime));
                $model = $model->where($prefix, '<', strtotime($endTime));
                break;
            case 'lately7':
                $model = $model->where($prefix, 'between', [strtotime("-7 day"), time()]);
                break;
            case 'lately30':
                $model = $model->where($prefix, 'between', [strtotime("-30 day"), time()]);
                break;
            default:
                if (strstr($where[$data], $field) !== false) {
                    list($startTime, $endTime) = explode($field, $where[$data]);
                    $model = $model->where($prefix, '>', strtotime($startTime));
                    $model = $model->where($prefix, '<', strtotime($endTime));
                }
                break;
        }
        return $model;
    }

    /**
     * 获取去除html去除空格去除软回车,软换行,转换过后的字符串
     * @param string $str
     * @return string
     */
    public static function HtmlToMbStr($str)
    {
        return trim(strip_tags(str_replace(["\n", "\t", "\r", " ", "&nbsp;"], '', htmlspecialchars_decode($str))));
    }

    /**
     * 截取中文指定字节
     * @param string $str
     * @param int $utf8len
     * @param string $charset
     * @param string $file
     * @return string
     */
    public static function getSubstrUTf8($str, int $utf8len = 100, string $charset = 'UTF-8', string $file = '....'): string
    {
        if (mb_strlen($str, $charset) > $utf8len) {
            $str = mb_substr($str, 0, $utf8len, $charset) . $file;
        }
        return $str;
    }

    /**
     * 获取本季度 time
     * @param int|string $time
     * @param string $ceil
     * @return array
     */
    public static function getMonth($time = '', $ceil = 0): array
    {
        if ($ceil != 0)
            $season = ceil(date('n') / 3) - $ceil;
        else
            $season = ceil(date('n') / 3);
        $firstday = date('Y-m-01', mktime(0, 0, 0, ($season - 1) * 3 + 1, 1, date('Y')));
        $lastday = date('Y-m-t', mktime(0, 0, 0, $season * 3, 1, date('Y')));
        return array($firstday, $lastday);
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
}