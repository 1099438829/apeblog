<?php

namespace app\admin\controller;


/**
 * Class Icon
 * @package app\admin\controller\widget
 */
class Icon extends AuthController
{
    /**
     * @throws \Exception
     */
    public function index(): string
    {
        return $this->fetch();
    }
}