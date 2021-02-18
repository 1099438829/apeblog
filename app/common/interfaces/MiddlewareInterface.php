<?php


namespace app\common\interfaces;


use app\Request;

/**
 * Interface MiddlewareInterface
 * @package app\common\interfaces
 */
interface MiddlewareInterface
{
    public function handle(Request $request, \Closure $next);
}