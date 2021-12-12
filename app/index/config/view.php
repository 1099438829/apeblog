<?php
// +----------------------------------------------------------------------
// | 模板设置
// +----------------------------------------------------------------------
//第一步判断选择的模板
$theme = system_config('web_template');
//检查主题目录是否存在，不存在则更新为默认目录
if (file_exists(public_path("template/{$theme}"))) {
    $theme = 'default';
}
//检查是否切换模板
if (is_mobile() == "wap" && file_exists(public_path("template/{$theme}/mobile"))) {
    $mode = "mobile";
} else {
    $mode = "pc";
}
return [
    // 模板路径
    'taglib_pre_load' => 'app\common\taglib\Ape',
    // 模板路径
    'view_path' => './template/' . $theme . '/' . $mode . '/',
    // 视图输出字符串内容替换
    'tpl_replace_string' => [
        '__STATIC__' => '/static',
        '__LIB__' => '/template/' . $theme . '/' . $mode . '/lib',
        '__IMG__' => '/template/' . $theme . '/' . $mode . '/img',
        '__CSS__' => '/template/' . $theme . '/' . $mode . '/css',
        '__JS__' => '/template/' . $theme . '/' . $mode . '/js'
    ],
];
