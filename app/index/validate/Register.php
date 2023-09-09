<?php

namespace app\index\validate;

use think\Validate;

class Register extends Validate
{
    protected $rule =   [
        'username' => 'require|max:25',
        'email' => 'require|email',
        'password' => 'required',
        'captcha' => 'require',
    ];

    protected $message  =   [
        'name.require' => '名称不能为空',
        'name.max'     => '名称最多不能超过25个字符',
        'email.require'   => '邮箱不能为空',
        'email.email'  => '邮箱格式错误',
        'password'        => '密码不能为空',
        'captcha' => '验证码不能为空'
    ];
}