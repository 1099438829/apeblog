<?php

namespace app\common\validate;

use think\Validate;

/**
 * 文章分类验证器
 */
class DocumentCategory extends Validate
{
    protected $rule = [
        'title|标题' => [
            'require',
            'max' => 50,
        ],
        'pid|上级分类ID' => [
            'require',
            'number',
        ],
        'sort|排序' => [
            'require',
            'number',
        ],
        'meta_title|标题' => [
            'max' => 500,
        ],
        'keywords|网页关键字' => [
            'max' => 500,
        ],
        'link_str|外链' => [
            'max' => 500,
        ],
        'icon|分类图标' => [
            'max' => 500,
        ],
    ];
    //更新排序
    protected $scene = [
        'sort' => ['sort']
    ];
}
