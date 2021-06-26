<?php

namespace app\common\validate;

use think\Validate;

/**
 * 文章内容验证器
 */
class Document extends Validate
{

    protected $rule = [
        'writer|作者' => [
            'require',
            'max' => 50,
        ],
        'title|标题' => [
            'require',
            'max' => 500,
        ],
        'category_id|所属分类' => [
            'require',
            'number',
        ],
        'keywords|网站关键词' => [
            'max' => 500,
        ],
        'description|网站描述' => [
            'max' => 65535,
        ],
        'isrecommend|是否推荐' => [
            'require',
            'number'
        ],
        'istop|是否置顶' => [
            'require',
            'number',
        ],
        'link_str|外链' => [
            'max' => 500,
        ],
        'cover_path|封面' => [
            'max' => 500,
        ],
        'display|是否显示' => [
            'require',
            'number',
        ],
        'view|浏览量' => [
            'number',
        ],
        'sort|排序' => [
            'require',
            'number',
        ],
        'content|文章内容' => [
            'max' => 65535,
        ],
    ];
    //更新排序
    protected $scene = [
        'sort' => ['sort']
    ];
}
