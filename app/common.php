<?php

use app\common\model\SystemConfig;
use app\common\constant\Data;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

// 应用公共文件
if (!function_exists('system_config_more')) {
    /**
     * 获取系统配置值
     * @param array $formNames
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    function system_config_more(array $formNames): array
    {
        $systemConfig = cache(Data::DATA_SYSTEM_CONFIG);
        if (empty($systemConfig)) {
            $systemConfig = SystemConfig::getSystemConfigValues();
            cache(Data::DATA_SYSTEM_CONFIG, $systemConfig);
        }
        $data = [];
        foreach ($formNames as $v) {
            $data[$v] = $systemConfig[$v] ?? '';
        }
        return $data;
    }
}

if (!function_exists('param_to_array')) {
    /**
     * 参数分割成数组
     * @param string $param
     * @param string $delimiter
     * @return array
     */
    function param_to_array(string $param, string $delimiter = "&"): array
    {
        $arr = [];
        foreach (explode($delimiter, $param) as $value) {
            $tmp = explode("=", $value);
            $arr[$tmp[0]] = $tmp[1];
        }
        return $arr;
    }
}

if (!function_exists('get_File_type')) {
    /**
     * 获取文件类型
     * @param string $mime
     * @return string
     */
    function get_File_type(string $mime): string
    {
        if (stristr($mime, 'image')) return 'image';
        elseif (stristr($mime, 'video')) return 'video';
        elseif (stristr($mime, 'audio')) return 'audio';
    }
}

if (!function_exists('system_config')) {
    /**
     * 获取系统配置值
     * @param string $formName
     * @return string
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    function system_config(string $formName): string
    {
        $systemConfig = cache(Data::DATA_SYSTEM_CONFIG);
        if (empty($systemConfig)) {
            $systemConfig = SystemConfig::getSystemConfigValues();
            cache(Data::DATA_SYSTEM_CONFIG, $systemConfig);
        }
        return $systemConfig[$formName] ?? '';
    }
}

if (!function_exists('create_order_id')) {
    /**
     * 创建订单id
     * @return string
     */
    function create_order_id(): string
    {
        return "O" . date("YmdHis") . rand(1000, 9999);
    }
}

if (!function_exists('unicode_encode')) {
    /**
     * 中文转unicode
     * @param $str
     * @return string
     */
    function unicode_encode($str)
    {
        $strArr = preg_split('/(?<!^)(?!$)/u', $str);
        $resUnicode = '';
        foreach ($strArr as $str) {
            $bin_str = '';
            $arr = is_array($str) ? $str : str_split($str);
            foreach ($arr as $value) $bin_str .= decbin(ord($value));
            $bin_str = preg_replace('/^.{4}(.{4}).{2}(.{6}).{2}(.{6})$/', '$1$2$3', $bin_str);
            $unicode = dechex(bindec($bin_str));
            $_sup = '';
            for ($i = 0; $i < 4 - strlen($unicode); $i++) $_sup .= '0';
            $str = '\\u' . $_sup . $unicode;
            $resUnicode .= $str;
        }
        return $resUnicode;
    }
}

if (!function_exists('unicode_decode')) {
    /**
     * unicode转中文
     * @param $unicode_str
     * @return string
     */
    function unicode_decode($unicode_str)
    {
        $json = '{"str":"' . $unicode_str . '"}';
        $arr = json_decode($json, true);
        if (empty($arr)) return '';
        return $arr['str'];
    }
}

if (!function_exists('file_cdn')) {
    /**
     * 文件cdn
     * @param $path
     * @return string
     * @author 李玉坤
     * @date 2021-02-17 23:32
     */
    function file_cdn($path)
    {
        if (empty($path)) {
            return $path;
        }
        if (strpos($path, 'http') !== false) {
            //是网址开头的不处理
            return $path;
        }
        $path = str_replace(public_path(), '', $path);
        if (!(substr($path, 0, 1) == '/')) {
            //统一路径
            $path = '/' . $path;
        }
        //转换因为win导致的兼容问题
        if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
            $path = str_replace( DIRECTORY_SEPARATOR, '/',$path);
        }
        return config("app.cdn_url") . $path;
    }
}
