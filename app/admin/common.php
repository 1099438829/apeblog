<?php

use think\facade\Cache;


if (!function_exists('un_camelize')) {
    /**
     * 驼峰法转下划线
     * @param $camelCaps
     * @param string $separator
     * @return string
     */
    function un_camelize($camelCaps, $separator = '_')
    {
        return strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
    }
}

if (!function_exists('auth_is_exit')) {
    /**
     * 判断授权信息是否存在
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    function auth_is_exit(int $adminId): bool
    {
        return Cache::store('redis')->has('store_' . $adminId);
    }
}

if (!function_exists('remove_cache')) {
    /**
     * 判断授权信息是否存在
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    function remove_cache(string $path): bool
    {
        $res = true;
        if (is_dir($path)) {
            if ($handle = opendir($path)) {
                while (false !== ($item = readdir($handle))) {
                    if ($item != '.' && $item != '..') {
                        if (is_dir($path . '/' . $item)) remove_cache($path . '/' . $item);
                        else unlink($path . '/' . $item);
                    }
                }
                closedir($handle);
                if (rmdir($path)) $res = true;
            }
        }
        return $res;
    }
}

if (!function_exists('to_int_array')) {
    /**
     * 字符串数组转int数组
     * @return array
     */
    function to_int_array(array $str): array
    {
        foreach ($str as $k => $v) $str[$k] = (int)$v;
        return $str;
    }
}

if (!function_exists('tag_options')) {
    /**
     * 获取form标签
     * @return array
     */
    function tag_options(): array
    {
        $menus[] = ['value' => "input", 'label' => "input"];
        $menus[] = ['value' => "textarea", 'label' => "textarea"];
        $menus[] = ['value' => "select", 'label' => "select"];
        return $menus;
    }
}

if (!function_exists('type_options')) {
    /**
     * 获取form标签
     * @return array
     */
    function type_options(): array
    {
        $menus[] = ['value' => "text", 'label' => "text"];
        $menus[] = ['value' => "radio", 'label' => "radio"];
        $menus[] = ['value' => "password", 'label' => "password"];
        $menus[] = ['value' => "checkbox", 'label' => "checkbox"];
        $menus[] = ['value' => "number", 'label' => "number"];
        $menus[] = ['value' => "hidden", 'label' => "hidden"];
        $menus[] = ['value' => "email", 'label' => "email"];
        $menus[] = ['value' => "tel", 'label' => "tel"];
        $menus[] = ['value' => "date", 'label' => "date"];
        $menus[] = ['value' => "file", 'label' => "file"];
        return $menus;
    }
}

if (!function_exists('get_dir')) {
    /**
     * 获取文件目录列表,该方法返回数组
     * @param $dir
     * @return mixed
     * @date 2021-02-17 21:27
     */
    function get_dir($dir)
    {
        $dirArray[] = NULL;
        if (false != ($handle = opendir($dir))) {
            $i = 0;
            while (false !== ($file = readdir($handle))) {
                //去掉"“.”、“..”以及带“.xxx”后缀的文件
                if ($file != "." && $file != ".." && !strpos($file, ".")) {
                    $dirArray[$i] = $file;
                    $i++;
                }
            }
            //关闭句柄
            closedir($handle);
        }
        return $dirArray;
    }
}

if (!function_exists('get_tree_list')) {
    /*无限分类*/
    function get_tree_list(&$list, $pid = 0, $level = 0, $html = '|—')
    {
        static $tree = array();
        foreach ($list as $v) {
            if ($v['pid'] == $pid) {
                $v['sort'] = $level;
                $v['html'] = str_repeat($html, $level);
                $tree[] = $v;
                get_tree_list($list, $v['id'], $level + 1);
            }
        }
        return $tree;
    }

}
