<?php
// +----------------------------------------------------------------------
// | hulacwms 3.0 呼啦企业网站管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2021 https://www.kaifashu.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 开发树
// +----------------------------------------------------------------------

namespace app\common\validate;

use think\Validate;

/**
 * 管理员验证器
 */
class AdminMember extends Validate
{

    protected $rule = [
        'username' => 'require|max:16',
        'nickname' => 'max:10',
        'password' => 'require|min:4|max:30',
    ];

    protected $message = [
        'username.require' => '请输入用户名',
        'username.max' => '用户名最多不能超过16个字符',
        'nickname.max' => '用户名最多不能超过10个字符',
        'password.require' => '请填写密码',
        'password.min' => '密码最少不能低于4个字符',
        'password.max' => '密码最多不能超过30个字符',
    ];
    protected $scene = [
        'editpwd' => ['password']//修改密码
    ];

}
