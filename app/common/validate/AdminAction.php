<?php

namespace app\common\validate;

use think\Validate;

/**
 * 后台菜单验证器
 */
class AdminAction extends Validate
{

    protected $rule = [
        'name' => 'require|max:30',
        'title' => 'require|max:80',
        'remark' => 'max:140',


    ];
    protected $message = [
        'name.require' => '请输入行为标识!',
        'title.require' => '请输入行为名称!',
        'title.max' => '行为名称最多输入80个字符',
        'name.max' => '行为标识最多输入30个字符',
        'remark.max' => '行为描述最多输入140个字符',

    ];

}
