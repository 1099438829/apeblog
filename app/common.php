<?php

use app\common\model\SystemConfig;
use app\common\constant\Data;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;

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

if (!function_exists('get_file_type')) {
    /**
     * 获取文件类型
     * @param string $mime
     * @return string
     */
    function get_file_type(string $mime): string
    {
        if (stristr($mime, 'image')) return 'image';
        elseif (stristr($mime, 'video')) return 'video';
        elseif (stristr($mime, 'audio')) return 'audio';
        else return 'file';
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

/**
 * 服务器地址
 * 协议和域名
 *
 * @return string
 */
if (!function_exists('file_cdn')) {
    function server_url(): string
    {
        if (isset($_SERVER['HTTPS']) && ('1' == $_SERVER['HTTPS'] || 'on' == strtolower($_SERVER['HTTPS']))) {
            $http = 'https://';
        } elseif (isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'])) {
            $http = 'https://';
        } else {
            $http = 'http://';
        }

        $host = $_SERVER['HTTP_HOST'];
        $res = $http . $host;

        return $res;
    }
}

if (!function_exists('file_cdn')) {
    /**
     * 文件cdn
     * @param $path
     * @return string
     * @author 木子的忧伤
     * @date 2021-02-17 23:32
     */
    function file_cdn($path): string
    {
        if (empty($path)) {
            return '';
        }

        if (strpos($path, 'http') !== false) {
            return $path;
        }

        $path = str_replace(public_path(), '', $path);

        //转换因为win导致的兼容问题
        if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
            $path = str_replace(DIRECTORY_SEPARATOR, '/', $path);
        }

        if (!(substr($path, 0, 1) == '/')) {
            //统一路径
            $path = '/' . $path;
        }
        return (config("app.cdn_url") ?: $server_url = server_url()) . $path;
    }
}

if (!function_exists('get_rand_str')) {
    /**
     * 生成随机字符串
     * @param $length
     * @return string
     * @author 木子的忧伤
     * @date 2022-04-11 18:26
     */
    function get_rand_str($length): string
    {
        //字符组合
        $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
        $randStr = str_shuffle($str);//打乱字符串
        $randStr = substr($randStr, 0, $length);//substr(string,start,length);返回字符串的一部分
        $randStr = md5($randStr . time());
        return substr($randStr, 5, $length);
    }
}