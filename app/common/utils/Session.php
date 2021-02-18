<?php


namespace app\common\utils;

use think\facade\Session as systemSession;

class Session
{
    /**
     * 设置sessionId
     * @param string $sessionId
     */
    public static function setId(string $sessionId)
    {
        systemSession::setId($sessionId);
        systemSession::init();
        systemSession::save();
    }
}