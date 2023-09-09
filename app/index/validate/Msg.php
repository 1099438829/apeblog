<?php

namespace app\index\validate;

use think\Validate;

class Msg extends Validate
{
    protected $rule = [
        'author' => 'require',
        'tel' => 'require|number|max:11',
        'email' => 'require|email',
        'content' => 'require',
    ];


    protected $message = [
        'author.require' => '昵称不能为空',
        'tel.require' => '手机号不能为空',
        'tel.number' => '手机号必须是数字！',
        'tel.max' => '手机号不得超过11位！',
        'email.require' => '邮箱不能为空',
        'email.email' => '邮箱格式错误',
        'content.require' => '内容不能为空',
    ];
}