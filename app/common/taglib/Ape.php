<?php

namespace app\common\taglib;

use think\template\TagLib;

class Ape extends TagLib
{
    /**
     * 定义标签列表
     */
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'channel' => ['attr' => 'type,typeId,row,void,where,orderBy,display', 'close' => 1],
        'arclist' => ['attr' => 'typeId,orderBy,row,void,model,type,where,display,ids,limit', 'close' => 1],
        'type' => ['attr' => 'typeId', 'close' => 1],
        'list' => ['attr' => 'orderBy,pageSize,type,typeId,void,model,where,display', 'close' => 1],
        'prenext' => ['attr' => 'get,cid,void,none', 'close' => 1],
        'flink' => ['attr' => 'type,row,void', 'close' => 1],
        'advert' => ['attr' => 'type,row,void', 'close' => 1],
        'sql' => ['attr' => 'sql', 'close' => 1],
        'article' => ['attr' => 'id,void,model', 'close' => 1],
        'comment' => ['attr' => 'typeId,void,type,pageSize,orderBy', 'close' => 1],
        'relevant' => ['attr' => 'id,model,void,row', 'close' => 1],
        'tags' => ['attr' => 'tags,void', 'close' => 1],
    ];


    /**
     * 栏目列表
     * type,栏目分类数据读取分类
     * typeId,栏目分类，数字，字符串，或者变量
     */
    public function tagChannel($tag, $content)
    {
        $type = isset($tag['type']) ? $tag['type'] : 'son';
        $typeId = isset($tag['typeId']) ? $tag['typeId'] : '$cid';
        $row = isset($tag['row']) ? $tag['row'] : 100;
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $where = isset($tag['where']) ? $tag['where'] : '';
        $orderBy = isset($tag['orderBy']) ? $tag['orderBy'] : 'sort asc';

        $display = isset($tag['display']) ? $tag['display'] : 1;
        $display = $display == 1 ? 1 : 0;
        //3中传参类型
        //1、栏目id，数字类型
        //2、多个栏目id，逗号隔开
        //3、变量
        //只有当多个栏目id时，才需要单引号加持。保证生成的为字符串
        if (strpos($typeId, ',')) {
            $typeId = "'$typeId'";
        }
        $parse = '<?php ';
        $parse .= '$__LIST__ = ' . "tpl_get_channel(\"$type\",$typeId,$row,\"$where\",\"$orderBy\",$display);";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 文章列表
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagArclist($tag, $content)
    {
        $typeId = isset($tag['typeId']) ? $tag['typeId'] : '$cid';
        $orderBy = isset($tag['orderBy']) ? $tag['orderBy'] : 'sort asc,create_time desc';
        $row = isset($tag['row']) ? $tag['row'] : '100';
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $model = isset($tag['model']) ? $tag['model'] : 'article';
        $type = isset($tag['type']) ? $tag['type'] : 'find';
        $where = isset($tag['where']) ? $tag['where'] : '';
        $ids = isset($tag['ids']) ? $tag['ids'] : '';
        //limit参数优先于row
        if (isset($tag['limit'])) {
            $row = $tag['limit'];
        }

        $display = isset($tag['display']) ? $tag['display'] : 1;
        $display = $display == 1 ? 1 : 0;

        //3中传参类型
        //1、栏目id，数字类型
        //2、多个栏目id，逗号隔开
        //3、变量
        //只有当多个栏目id时，才需要单引号加持。保证生成的为字符串
        if (strpos($typeId, ',')) {
            $typeId = "'$typeId'";
        }

        $parse = '<?php ';
        $parse .= '$__LIST__ = ' . "tpl_get_article_list($typeId,\"$row\",\"$orderBy\",\"$model\",\"$type\",\"$where\",$display,\"$ids\");";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 栏目分类-单个
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagType($tag, $content)
    {
        if (!isset($tag['typeId'])) {
            return '';
        }
        $typeId = $tag['typeId'];

        $parse = '<?php ';
        $parse .= '$__LIST__ =[];array_push($__LIST__,get_document_category(' . $typeId . '));';
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="field"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }


    /**
     * 列表分页
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagList($tag, $content)
    {
        $orderBy = isset($tag['orderBy']) ? $tag['orderBy'] : 'sort asc,create_time desc';
        $pageSize = isset($tag['pageSize']) ? $tag['pageSize'] : 15;
        $type = isset($tag['type']) ? $tag['type'] : 'find';
        $typeId = isset($tag['typeId']) ? $tag['typeId'] : '$cid';
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $model = isset($tag['model']) ? $tag['model'] : 'article';
        $where = isset($tag['where']) ? $tag['where'] : '';
        $display = isset($tag['display']) ? $tag['display'] : 1;
        $display = $display == 1 ? 1 : 0;
        $parse = '<?php ';
        $parse .= '$__FUN__ =' . "tpl_get_list(\"$orderBy\",$pageSize,\"$typeId\",\"$type\",\"$model\",\"$where\",$display);";
        $parse .= '$__LIST__ = $__FUN__["lists"];$pager = $__FUN__["model"]->render();';
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '" key="i"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 详情页 上一篇 下一篇
     * get=pre|next获取上一篇还是下一篇
     * cid=栏目分类id，获取当前分类下的上一篇下一篇
     */
    public function tagPrenext($tag, $content)
    {
        $get = isset($tag['get']) ? $tag['get'] : 'pre';
        $cid = isset($tag['cid']) ? $tag['cid'] : '$cid';
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $none = isset($tag['none']) ? $tag['none'] : '没有了';

        $parse = '<?php ';
        $parse .= '$__LIST__ =[];array_push($__LIST__,' . "tpl_get_prenext(\"$get\",$cid,\"$none\"));";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 友情链接
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagFlink($tag, $content)
    {
        $type = isset($tag['type']) ? $tag['type'] : 'text';
        $type = $type == 'text' ? 0 : 1;
        $row = isset($tag['row']) ? $tag['row'] : 100;
        $void = isset($tag['void']) ? $tag['void'] : 'field';

        $parse = '<?php ';
        $parse .= '$__LIST__ =' . "tpl_get_friend_link($type,$row);";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * tagAdvert 广告
     * @param $tag
     * @param $content
     * @return string
     * @author 李玉坤
     * @date 2021-07-26 23:22
     */
    public function tagAdvert($tag, $content)
    {
        $type = isset($tag['type']) ? $tag['type'] : 1;
        $row = isset($tag['row']) ? $tag['row'] : 5;
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $parse = '<?php ';
        $parse .= '$__LIST__ =' . "tpl_get_advert($type,$row);";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 获取单篇文章
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagArticle($tag, $content)
    {
        if (!isset($tag['id'])) {
            return '';
        }
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $model = isset($tag['model']) ? $tag['model'] : 'article';
        $id = $tag['id'];
        $parse = '<?php ';
        $parse .= '$__LIST__ =[];array_push($__LIST__,' . "tpl_get_article($id,'$model'));";
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 文章标签
     * @param $tag
     * @param $content
     * @return bool|string
     */
    public function tagTags($tag, $content)
    {
        if (!isset($tag['tags'])) {
            return false;
        }
        $tags = $tag['tags'];
        $void = isset($tag['void']) ? $tag['void'] : 'field';

        $parse = '<?php ';
        $parse .= '$__TAG_LIST__ =' . "tpl_get_tags_list($tags);";
        $parse .= ' ?>';
        $parse .= '{volist name="$__TAG_LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 文章回复列表
     * @param $tag
     * @param $content
     * @return bool|string
     * @author 李玉坤
     * @date 2021-11-27 23:44
     */
    public function tagComment($tag, $content)
    {
        $pageSize = isset($tag['pageSize']) ? $tag['pageSize'] : 10;
        $type = isset($tag['type']) ? $tag['type'] : 'top';
        $typeId = isset($tag['typeId']) ? $tag['typeId'] : 0;
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $orderBy = isset($tag['orderBy']) ? $tag['orderBy'] : 'id asc';
        $parse = '<?php ';
        $parse .= '$__FUN__ =' . "tpl_get_comment_list($typeId,\"$type\",$pageSize,\"$orderBy\");";
        if ($type == 'top') {
            $parse .= '$__LIST__ = $__FUN__["lists"];$pager = $__FUN__["model"]->render();';
        } else {
            $parse .= '$__LIST__ = $__FUN__["lists"];';
        }
        $parse .= ' ?>';
        $parse .= '{volist name="__LIST__" id="' . $void . '" key="i"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }

    /**
     * 文章推荐列表
     * @param $tag
     * @param $content
     * @return string
     * @author 李玉坤
     * @date 2021-11-28 0:52
     */
    public function tagRelevant($tag, $content)
    {
        if (!isset($tag['id'])) {
            return '';
        }
        $documentId = $tag['id'];
        $void = isset($tag['void']) ? $tag['void'] : 'field';
        $row = isset($tag['row']) ? $tag['row'] : 100;
        $model = isset($tag['model']) ? $tag['model'] : 'article';
        $parse = '<?php ';
        $parse .= '$__LIST__ =' . "tpl_get_relevant_list($documentId,$row,'$model');";
        $parse .= ' ?>';
        $parse .= '{volist name="$__LIST__" id="' . $void . '"}';
        $parse .= $content;
        $parse .= '{/volist}';
        return $parse;
    }
}