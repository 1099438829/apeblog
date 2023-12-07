<?php

if (!function_exists('un_camelize')) {
    /**
     * 驼峰法转下划线
     * @param $camelCaps
     * @param string $separator
     * @return string
     */
    function un_camelize($camelCaps, string $separator = '_'): string
    {
        return strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
    }
}

if (!function_exists('auth_is_exit')) {
    /**
     * 判断授权信息是否存在
     * @param int $adminId
     * @return bool
     */
    function auth_is_exit(int $adminId): bool
    {
        return cache('store_' . $adminId);
    }
}

if (!function_exists('remove_cache')) {
    /**
     * 删除缓存文件
     * @param string $path
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    function remove_cache(string $path): bool
    {
        $res = false;
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
     * @param array $str
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
     * 获取form type类型
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
        if (($handle = opendir($dir))) {
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
    /**
     * 无限分类
     * @param $list
     * @param $pid
     * @param $level
     * @param $html
     * @return array
     */
    function get_tree_list(&$list, $pid = 0, $level = 0, $html = '|—'): array
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

if (!function_exists('get_theme_list')) {
    function get_theme_list($type = ''): array
    {
        $themeList = [];
        $themeDir = public_path('template') . system_config('web_template') . '/pc/' . $type;
        if ($dh = opendir($themeDir)) {
            while (($file = readdir($dh)) !== false) {

                if ($file != "." && $file != "..") {
                    $themeList[] = $file;
                }
            }
            closedir($dh);
        }
        return $themeList;
    }
}


/**
 * 获取去除html去除空格去除软回车,软换行,转换过后的字符串
 * @param string $str
 * @return string
 */
if (!function_exists('html2mb_str')) {
    function html2mb_str($str): string
    {
        return trim(strip_tags(str_replace(["\n", "\t", "\r", " ", "&nbsp;"], '', htmlspecialchars_decode($str))));
    }
}

/**
 * 获取本季度 time
 * @param int|string $time
 * @param string $ceil
 * @return array
 */
if (!function_exists('get_quarter')) {
    function get_quarter($time = '', $ceil = 0): array
    {
        if ($ceil != 0)
            $season = ceil(date('n') / 3) - $ceil;
        else
            $season = ceil(date('n') / 3);
        $firstDay = date('Y-m-01', mktime(0, 0, 0, ($season - 1) * 3 + 1, 1, date('Y')));
        $lastDay = date('Y-m-t', mktime(0, 0, 0, $season * 3, 1, date('Y')));
        return array($firstDay, $lastDay);
    }
}

/**
 * 横线
 * @param int $num
 * @return string
 */
if (!function_exists('cross')) {
    function cross(int $num = 0): string
    {
        $str = "";
        if ($num == 1) $str .= "|--";
        elseif ($num > 1) for ($i = 0; $i < $num; $i++)
            if ($i == 0) $str .= "|--";
            else $str .= "--";
        return $str . " ";
    }
}