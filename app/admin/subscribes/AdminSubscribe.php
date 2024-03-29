<?php


namespace app\admin\subscribes;

use app\admin\model\AdminLog;

/**
 * 操作员日志记录
 * Class AdminSubscribe
 * @package app\common\subscribes
 */
class AdminSubscribe
{
    /**
     * 记录操作日志
     * @param $event
     */
    public function onAdminLog($event): void
    {
        list($adminInfo, $module, $controller, $action) = $event;
        AdminLog::saveLog($adminInfo, $module, $controller, $action);
    }
}