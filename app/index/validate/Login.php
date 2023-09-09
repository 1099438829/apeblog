<?php

namespace app\index\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule =   [
        'username'  => 'require|max:25',
        'password'   => 'number|between:1,120',
        'captcha' => 'require',
    ];

    protected $message  =   [
        'name.require' => '名称不能为空',
        'name.max'     => '名称最多不能超过25个字符',
        'password'        => '密码不能为空',
        'captcha' => '验证码不能为空'
    ];
}