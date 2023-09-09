<?php

namespace app\index\validate;

use think\Validate;

/**
 * 后台菜单验证器
 */
class FriendLink extends Validate
{

    protected $rule = [
        'title' => 'require|max:255',
        'url' => 'require|max:255',
        'sort' => 'require|number',
    ];
    protected $message = [
        'title.require' => '请输入链接名称!',
        'url.require' => '请输入链接地址!',
        'sort' => '请输入排序序号',
        'sort.number' => '排序序号只能是数字',
        'title.max' => '链接名称最多输入255个字符',
        'url.max' => '链接地址最多输入255个字符',
    ];

    //更新排序
    protected $scene = [
        'sort' => ['sort']
    ];
}
