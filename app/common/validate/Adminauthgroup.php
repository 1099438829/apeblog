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
 * 后台菜单验证器
 */
class AdminAuthGroup extends Validate
{

    protected $rule = [
        'title' => 'require|max:20',
        'description' => 'max:80',
    ];

    protected $message = [
        'title.require' => '请输入用户组名称!',
        'title.max' => '用户组名称最多输入20个字符',
        'remark.max' => '描述信息最多输入80个字符',
    ];

}
