<?php

namespace app\index\validate;

use think\Validate;
class Comment extends Validate
{
    protected $rule = [
        'document_id'  =>  'require',
        'pid' =>  '',
        'author'=> 'require',
        'url' => 'require',
        'email' => 'require|email',
        'content' => 'require|content',
    ];

    protected $message  =   [
        'author.require' => '昵称不能为空',
        'email.require'     => '邮箱不能为空',
        'url.require'   => 'url不能为空',
        'document_id.require'  => '文章id不能为空',
        'content.require'        => '内容不能为空',
    ];
}