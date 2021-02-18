<?php
// 事件定义文件
return [
    'bind'      => [
    ],

    'listen'    => [
        'AdminLog' => [], // 操作日志记录
    ],

    'subscribe' => [
        \app\admin\subscribes\AdminSubscribe::class, // 操作记录
    ],
];
