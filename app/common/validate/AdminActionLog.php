<?php

namespace app\common\validate;

use think\Validate;

/**
 * 后台菜单验证器
 */
class AdminActionLog extends Validate
{

    protected $rule = [
        'remark' => 'max:255',
        'action_id' => 'number',
        'status' => 'number',
    ];
    protected $message = [
        'remark.max' => '日志备注最多输入255个字符',
        'action_id.number' => '行为id只能为数字',
        'status.number' => '行为状态只能为数字',
    ];

}
