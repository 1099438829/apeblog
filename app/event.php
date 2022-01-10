<?php
// 事件定义文件
use app\admin\subscribes\AdminSubscribe;

return [
    'bind' => [
    ],

    'listen' => [
        'AppInit' => [],
        'HttpRun' => [],
        'HttpEnd' => [],
        'LogLevel' => [],
        'LogWrite' => [],
    ],

    'subscribe' => [
        AdminSubscribe::class, // 操作记录
    ],
];
