<?php

use app\common\constant\Data;
use app\common\model\Comment;
use app\common\model\Document;
use app\common\model\DocumentCategory;
use app\common\model\Advert;
use app\common\model\FriendLink;
use app\common\model\Tag;
use app\common\model\Nav;
use think\App;
use think\Collection;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\facade\Db;

// 应用公共文件
/**
 * 中文字符截取
 * @param $str
 * @param $len
 * @return string
 */
function cn_substr($str, $len): string
{
    return mb_substr($str, 0, $len, 'utf-8');
}

/**
 * 过滤html标签
 */
function html2text($str): string
{
    return strip_tags($str);
}

/**
 * 获取文章分类
 */
function get_document_category_list()
{
    //缓存文章菜单
    $documentCategory = cache(Data::DATA_DOCUMENT_CATEGORY_LIST);
    if ($documentCategory === null) {
        $documentCategoryList = DocumentCategory::where('status', 1)->order('sort asc')->select()->toArray();
        //转换，让id作为数组的键
        $documentCategory = [];
        foreach ($documentCategoryList as $item) {
            //根据栏目类型，生成栏目url
            $item['url'] = make_category_url($item);
            $documentCategory[$item['id']] = $item;
        }
        cache(Data::DATA_DOCUMENT_CATEGORY_LIST, $documentCategory);
    }
    return $documentCategory;
}

/**
 * 获取一个文章分类
 */
function get_document_category($x, $field = false)
{
    if (!$x) {
        throw new Exception('请指定要获取的栏目分类id！');
    }
    //获取缓存的文章菜单
    $documentCategoryList = get_document_category_list();
    if (!isset($documentCategoryList[$x])) {
        return false;
    }
    if ($field) {
        return $documentCategoryList[$x][$field];
    } else {
        $documentCategoryList[$x]['child'] = implode(",", array_column(getSubs($documentCategoryList, $x), "id"));
        return $documentCategoryList[$x];
    }
}

/**
 * 获取一个文章分类-通个分类标识
 */
function get_document_category_by_name($name, $field = false)
{
    if (!$name) {
        throw new Exception('请指定要获取的栏目分类标识！');
    }
    //获取缓存的文章菜单
    $documentCategoryList = get_document_category_list();
    $documentCategory = false;
    foreach ($documentCategoryList as $item) {
        if ($item['name'] == $name) {
            $documentCategory = $item;
            break;
        }
    }
    if (!$documentCategory) {
        return false;
    }
    if ($field) {
        return $documentCategory[$field];
    } else {
        return $documentCategory;
    }
}


/**
 * 获取一个文章分类
 */
function get_document_category_by($x, $field = false)
{
    if (!$x) {
        throw new Exception('请指定要获取的栏目分类id！');
    }
    //获取缓存的文章菜单
    $documentCategoryList = get_document_category_list();
    if (!isset($documentCategoryList[$x])) {
        return false;
    }
    if ($field) {
        return $documentCategoryList[$x][$field];
    } else {
        $documentCategoryList[$x]['child'] = implode(",", array_column(getSubs($documentCategoryList, $x), "id"));
        return $documentCategoryList[$x];
    }
}

/**
 * 模板-获取文章分类
 * @param $type
 * @param $typeId
 * @param int $row
 * @param string $where
 * @param string $orderby
 * @return DocumentCategory[]|array|bool|Collection
 * @throws Exception
 * @throws DataNotFoundException
 * @throws DbException
 * @throws ModelNotFoundException
 * @author 木子的忧伤
 * @date 2021-11-12 21:48
 */
function tpl_get_channel($type, $typeId, $row = 100, $where = '', $orderby = '')
{
    switch ($type) {
        case "all":
            //获取顶级分类
            return get_document_category_all();
            break;
        case 'top':
            //获取顶级分类
            return get_document_category_by_parent(0, $row);
            break;
        case 'son':
            //获取子级分类
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目分类id！');
            }
            return get_document_category_by_parent($typeId, $row);
            break;
        case 'self':
            //获取同级分类
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目分类id！');
            }
            $dc = get_document_category($typeId);
            if (!$dc) {
                return false;
            }
            return get_document_category_by_parent($dc['pid'], $row);
            break;
        case 'find':
            //获取所有子孙分类，此操作读取数据库，非缓存！
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目分类id！');
            }
            $dc = get_document_category($typeId);
            if (!$dc) {
                throw new Exception('分类不存在或已删除！');
            }
            $tempArr = DocumentCategory::where('id', 'in', $dc['child'])->where('status', 1)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        case 'parent':
            //获取父级分类
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目分类id！');
            }
            $dc = get_document_category($typeId);
            $tempArr = array();
            $parent = get_document_category($dc['pid']);
            array_push($tempArr, $parent);
            return $tempArr;
            break;
        case 'root':
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目分类id！');
            }
            $dc = get_document_category($typeId);
            if ($dc['pid'] != 0) {
                //获取根分类，此操作读取数据库，非缓存！
                $dc = DocumentCategory::where('pid', 0)->where('status', 1)
                    ->where("CONCAT(',',child,',') like '%,$typeId,%'")->limit($row);
                $dc = $dc->find();
            }
            //根据栏目类型，生成栏目url
            $dc['url'] = make_category_url($dc);
            $tempArr = [];
            array_push($tempArr, $dc);
            return $tempArr;
            break;
        case 'where':
            //根据自定义条件获取分类（where语句），此操作读取数据库，非缓存！
            $tempArr = DocumentCategory::where('status', 1)->where($where)->order($orderby)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        case 'ids':
            //根据多个栏目id，逗号隔开的那种，获得栏目列表
            $tempArr = DocumentCategory::where('status', 1)->where('id', 'in', $typeId)->order($orderby)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        default:
            $tempArr = [];
            return $tempArr;
            break;
    }
}

/**
 * 根据父级分类id获取子分类
 * $pid=父级id
 * $row=获取多少数目
 */
function get_document_category_by_parent($pid, $row)
{
    $documentCategoryList = get_document_category_list();
    $x = 1;
    $tempArr = array();
    foreach ($documentCategoryList as $item) {
        if ($x > $row) {
            break;
        }
        if ($item['pid'] == $pid) {
            $x = $x + 1;
            array_push($tempArr, $item);
        }
    }
    return $tempArr;
}

/*
 * 获取所有子集元素
 */
function getSubs($categorys, $catId = 0, $level = 1)
{
    $subs = array();
    foreach ($categorys as $item) {
        if ($item['pid'] == $catId) {
            $item['level'] = $level;
            $subs[] = $item;
            $subs = array_merge($subs, getSubs($categorys, $item['id'], $level + 1));
        }
    }
    return $subs;
}

/**
 * @return array
 */
function get_document_category_all(): array
{
    $documentCategoryList = get_document_category_list();
    $tempArr = array();
    foreach ($documentCategoryList as $item) {
        if ($item['pid'] == 0) {
            $tempArr[$item['id']] = $item;
        } else {
            $tempArr[$item['pid']]['child'][] = $item;
        }
    }
    return $tempArr;
}


/**
 * 模板-获取上一篇和下一篇
 * $get=上一篇|下一篇
 * $cid=栏目分类id
 */
function tpl_get_prenext($get, $cid = "",$type ="article")
{
    //文档id
    $id = request()->param('id');
    if (!$get) {
        $get = 'next';
    }
    $document = Document::where('display', 1)->where('status', 1)->where('type',$type);
    $document = $get == 'pre' ? $document->where("id", '<', $id) : $document->where("id", '>', $id);

    $document_tmp = clone $document;
    //如果表明在同一分类下查询
    if ($cid) {
        $document = $document->where("category_id", $cid);
    }
    $document = $document->field('id,title')->order($get == 'pre' ? 'id desc' : 'id asc')->find();
    if ($document) {
        $document['url'] = make_detail_url($document);
    } else {
        //如果执行的cid没有数据则重新请求
        $document = $document_tmp->orderRaw('rand()')->find();
        if ($document) {
            $document['url'] = make_detail_url($document);
        }else{
            $document['id'] = false;
            $document['url'] = 'javascript:void(0)';
            $document['title'] = "暂无";
        }
    }
    return $document;
}

/**
 * 模板-获取文章列表
 * @param $orderBy string 数据排序方式
 * @param $pageSize int 每页显示的数据数目
 * @param $cid int 栏目分类id
 * @param $type string 读取数据的方式（son:'获取栏目下文章以及所有子孙分类文章',self:'获取栏目下文章',search:'获取关键字搜索的文章',where:'根据自定义条件获取文章（where语句）'）
 * @param string $table 文章内容扩展表名，默认article
 * @param bool|array $where 自定义条件
 * @param int $display
 * @return array
 * @throws Exception
 * @throws DataNotFoundException
 * @throws DbException
 * @throws ModelNotFoundException
 */
function tpl_get_list($orderBy, int $pageSize, $cid, $type, $table = 'article', $where, int $display = 1)
{
    $documentListModel = (new Document())
        ->alias('a')
        ->leftJoin(config('database.prefix') . 'document_category b', 'a.category_id=b.id')
        ->leftJoin(config('database.prefix') . "document_$table c", 'a.id=c.id')
        ->where("a.type='$table'")
        ->where('a.status', 1)
        ->where('b.status', 1)
        ->field('a.*,b.title as category_title,c.*');
    if ($display) {
        $documentListModel = $documentListModel->where('a.display', 1);
    }
    //判断当前是否搜索页面
    if (request()->action() == 'search') {
        $type = 'search';
    }
    switch ($type) {
        case 'find':
            //获取栏目下文章以及所有子孙分类文章
            $dc = get_document_category($cid);
            if (!empty($dc['child'])) {
                $child = $dc['child'];
                $documentListModel = $documentListModel->where('a.category_id', 'in', "$cid,$child");
            } else {
                $documentListModel = $documentListModel->where('a.category_id', $cid);
            }
            break;
        case 'son':
            //获取栏目下文章
            $documentListModel = $documentListModel->where('a.category_id', $cid);
            break;
        case 'search':
            //获取关键字搜索的文章
            $kw = request()->param('kw'); //搜索关键词
            $tid = request()->param('cid');//文章分类Id
            if ($kw) {
                $documentListModel = $documentListModel->where('a.title', 'like', "%$kw%");
            }
            if ($tid) {
                $documentListModel = $documentListModel->where('a.category_id', $tid);
            }
            break;
        case 'where':
            //根据自定义条件获取文章（where语句）
            $documentListModel = $documentListModel->where($where);
            break;
        case 'tag':
            //读取指定tag的文章
            $tag = request()->param('t'); //标签
            $tagModel = new Tag();
            $tagList = $tagModel->where('name', $tag)->select()->toArray();
            $documentListModel = $documentListModel->where('a.id', 'in', array_column($tagList, 'document_id'));
            break;
    }
    $documentListModel = $documentListModel->order($orderBy);
    //获取当前请求的请求参数，以确定分页是否要带上这些请求参数
    $query = request()->query();
    if ($query) {
        $documentListModel = $documentListModel->paginate([
            'list_rows' => $pageSize,
            'var_page' => 'page',
            'query' => get_route_query()
        ]);
    } else {
        $documentListModel = $documentListModel->paginate($pageSize);
    }
    $lists = [];
    foreach ($documentListModel as $key => $item) {
        //生成文章url
        $item['url'] = make_detail_url($item);
        $lists[$key] = $item;
    }
    $re = [
        'model' => $documentListModel,
        'lists' => $lists
    ];
    return $re;
}

/**
 * 获得当前路由及参数列表
 * @return mixed
 */
function get_route_query()
{
    $request = request();
    $queryArr = $request->param();
    //$queryArr['s'] = $request->pathinfo();
    return $queryArr;
}

/**
 * 根据栏目类型，生成栏目url
 * @param $item
 * @return mixed|string
 */
function make_category_url($item)
{
    return url('/article/detail', ['id' => $item['alias'] ?: $item['id']])->build();
}

/**
 * 生成文章url
 * @param $item
 * @return mixed|string
 */
function make_detail_url($item)
{
    //根据栏目类型，生成栏目url
    //详情根据是否跳转外链来生成
    if ($item['link_str'] && $item['is_jump']) {
        return $item['link_str'];
    } else {
        return url($item['type'] . '/detail', ['id' => $item['alias'] ?: $item['id']])->build();
    }
}


/**
 * 模板-根据指定的文章id获取文章内容
 */
function tpl_get_article($id, $table)
{
    $documentModel = Document::alias('a')
        ->leftJoin(config('database.prefix') . 'document_category b', 'a.category_id=b.id')
        ->leftJoin(config('database.prefix') . "document_$table c", 'a.id=c.id')
        ->where('a.status', 1)->where('a.id', $id)->where("a.type='$table'")
        ->field('a.*,b.title as category_title,c.*');

    $doc = $documentModel->find();

    if (!$doc) {
        return false;
    }

    $doc['url'] = make_detail_url($doc);

    return $doc;
}


/**
 * 模板-根据指定的栏目id获取文章列表
 * $cid=栏目分类id
 * $row=读取数据数目
 * $orderby=排序方式
 * $table=文章内容扩展表名，默认article
 * $type=读取数据的方式（son:'获取栏目下文章以及所有子孙分类文章',self:'获取栏目下文章',search:'获取关键字搜索的文章',where:'根据自定义条件获取文章（where语句）'）
 * $where=自定义条件
 */
function tpl_get_article_list($cid, $row, $orderby, $table = 'article', $type = 'son', $where = false, $display = 1, $ids = '')
{
    $documentListModel = Document::alias('a')
        ->join(config('database.prefix') . 'document_category b', 'a.category_id=b.id', 'LEFT')
        ->join(config('database.prefix') . "document_$table c", 'a.id=c.id', 'RIGHT')
        ->where("a.type='$table'")->where('a.status', 1)->where('b.status', 1)
        ->limit($row)
        ->field('a.*,b.title as category_title,c.*');

    if ($display) {
        $documentListModel = $documentListModel->where('a.display', 1);
    }

    switch ($type) {
        case 'find':
            //获取栏目下文章以及所有子孙分类文章
            $dc = get_document_category($cid);
            if (!empty($dc['child'])) {
                $child = $dc['child'];
                $documentListModel = $documentListModel->where('a.category_id', 'in', "$cid,$child");
            } else {
                $documentListModel = $documentListModel->where('a.category_id', $cid);
            }
            break;
        case 'son':
            //获取栏目下文章
            $documentListModel = $documentListModel->where('a.category_id', $cid);
            break;
        case 'where':
            //根据自定义条件获取文章（where语句）
            $documentListModel = $documentListModel->where($where);
            break;
        case 'ids':
            //读取指定id的文章
            $documentListModel = $documentListModel->where('a.id', 'in', $ids);
            break;
        case 'tag':
            //读取指定tag的文章
            $documentListModel = $documentListModel->where('a.keywords', 'like', "$where%");
            break;
    }

    $documentListModel = $documentListModel->order($orderby)->select();
    $lists = [];
    foreach ($documentListModel as $key => $item) {
        //生成文章url
        $item['url'] = make_detail_url($item);
        $lists[$key] = $item;
    }
    return $lists;
}

/**
 * 模板-根据指定的栏目id获取产品列表
 * $cid=栏目分类id
 * $row=读取数据数目
 * $orderby=排序方式
 * $table=文章内容扩展表名，默认article
 * $type=读取数据的方式（son:'获取栏目下文章以及所有子孙分类文章',self:'获取栏目下文章',search:'获取关键字搜索的文章',where:'根据自定义条件获取文章（where语句）'）
 * $where=自定义条件
 */
function tpl_get_product_list($cid, $row, $orderby, $table = 'article', $type = 'son', $where = false, $display = 1)
{
    return tpl_get_article_list($cid, $row, $orderby, 'product', $type, $where, $display);
}

/**
 * 模板-友情链接
 */
function tpl_get_friend_link($type, $row)
{
    $flinkList = cache(Data::DATA_FRIEND_LINK);
    if ($flinkList === null) {
        $flinkList = FriendLink::where('status', 1)->order('sort asc')->limit($row)->select();
        cache(Data::DATA_FRIEND_LINK, $flinkList);
    }
    if ($type === 0) {
        return $flinkList;
    }
    $flinkListTemp = [];
    foreach ($flinkList as $key => $item) {
        if ($item['image']) {
            array_push($flinkListTemp, $item);
        }
    }
    return $flinkListTemp;
}

/**
 * 广告
 * @param $type
 * @param int $row
 * @return array|mixed|object|App|Collection|Db[]
 * @throws DataNotFoundException
 * @throws DbException
 * @throws ModelNotFoundException
 * @author 木子的忧伤
 * @date 2021-07-26 23:24
 */
function tpl_get_advert($type, int $row = 5)
{
    $advertList = cache(Data::DATA_ADVERT . '_' . $type);
    if ($advertList === null) {
        $advertList = (new Advert())->alias("a")
            ->leftJoin("advert_info i", 'a.id = i.advert_id')
            ->field("i.*")
            ->where('a.alias', $type)
            ->where('a.status', 1)
            ->where('i.status', 1)
            ->order('sort desc')
            ->select()
            ->toArray();
        //处理文件cdn信息
        foreach ($advertList as $key => &$item) {
            if (empty($item['cover_path'])) {
                unset($advertList[$key]);
            }
            $item['cover_path'] = file_cdn($item['cover_path']);
        }
        unset($item);
        if (!empty($advertList)) {
            cache(Data::DATA_ADVERT . '_' . $type, $advertList);
        }
    }
    //如果获取行数为空则取默认值
    if (!$row) {
        $row = 5;
    }
    return !empty($advertList) ? array_slice($advertList, 0, $row) : $advertList;
}

/**
 * 文档归档
 * @ 格式  tpl_get_archive_list("month","Y-m")  tpl_get_archive_list("month","Y年-m月")....
 * @param $type
 * @param $format
 * @return mixed
 * @author 木子的忧伤
 * @date 2022-06-01 10:06
 */
function tpl_get_archive_list($type, $format)
{
    $list = cache(Data::DATA_ARCHIVE . '_' . $type);
    $list = null;
    if ($list === null) {
        switch ($type) {
            case "month":
                $dateFormat = "LEFT(create_date,7)";
                break;
            case "year":
                $dateFormat = "LEFT(create_date,4)";
                break;
            default:
                $dateFormat = "create_date";
                break;
        }
        $list = (new Document())->group($dateFormat)->column("count(*) as count,create_date");
        foreach ($list as $key => &$item) {
            $item['create_date'] = date($format, strtotime($item['create_date']));
        }
        cache(Data::DATA_ADVERT . '_' . $type, $list);
    }
    return $list;
}

if (!function_exists('web_config')) {
    /**
     * 获取系统配置值
     * @param string $formName
     * @return string
     * @author 木子的忧伤
     * @date 2021-11-12 0:34
     */
    function web_config(string $formName): string
    {
        $webConfig = cache(Data::DATA_SYSTEM_CONFIG);
        if (empty($webConfig)) {
            $webConfig = Db::name('system_config')->where("status", 1)->column('value', 'form_name');
            cache(Data::DATA_SYSTEM_CONFIG, $webConfig);
        }
        return $webConfig[$formName] ?? '';
    }
}

/**
 * 模板-文章标签
 * @param $tags
 * @return array|bool
 * @author 木子的忧伤
 * @date 2021-11-12 0:34
 */
if (!function_exists('tpl_get_tags_list')) {
    function tpl_get_tags_list($tags)
    {
        if (!$tags) {
            return false;
        }
        $tagArr = explode(',', $tags);
        $tagTemp = [];
        foreach ($tagArr as $item) {
            $data['title'] = $item;
            $data['url'] = url('/article/tag', ["t" => $item])->build();
            array_push($tagTemp, $data);
        }
        return $tagTemp;
    }
}

/**
 * 模板-获取页面的面包屑导航
 * @param $dc
 * @param array $positionList
 * @return string
 * @throws Exception
 * @author 木子的忧伤
 * @date 2021-12-05 22:40
 */
function tpl_get_position($dc, $positionList = array())
{
    array_push($positionList, $dc);
    if ($dc['pid'] == 0) {
        $htmlStr = '<a href="/">首页</a>';
        $positionListCount = count($positionList);
        for ($x = $positionListCount - 1; $x >= 0; $x--) {
            $htmlStr = $htmlStr . '<span>&gt;</span><a href="' . $positionList[$x]['url'] . '">' . $positionList[$x]['title'] . '</a>';
        }
        return $htmlStr;
    }
    //获取父级栏目分类
    $parentDc = get_document_category($dc['pid']);
    return tpl_get_position($parentDc, $positionList);
}

function get_comment_children($parentIds)
{
    $list = $commentModel = Comment::where('status', 1)->where('pid', 'in', $parentIds)->select()->toArray();
    if (empty($list)) {
        return $list;
    }
    foreach ($list as &$item) {
        $item['reply_url'] = url('/article/create_comment', ["pid" => $item['id']])->build();
    }
    unset($item);
    return array_merge($list, get_comment_children(array_column($list, 'id')));
}

/**
 * 获取文章评论列表
 * @param $id
 * @param $type
 * @param int $pageSize
 * @param string $orderBy
 * @return array
 * @throws DbException
 * @author 木子的忧伤
 * @date 2021-12-05 23:54
 */
function tpl_get_comment_list($id, $type, $pageSize, $orderBy)
{
    $commentModel = Comment::where('status', 1)->order($orderBy);
    switch ($type) {
        case 'top':
            //获取所有的一级评论
            $commentModel = $commentModel->where('document_id', $id)->where('pid', 0);
            break;
        case 'son':
            //获取栏目下文章
            return [
                'model' => $commentModel,
                'lists' => get_comment_children([$id])
            ];
            break;
    }
    //获取当前请求的请求参数，以确定分页是否要带上这些请求参数
    $query = request()->query();
    if ($query) {
        $commentModel = $commentModel->paginate($pageSize, false);
    } else {
        $commentModel = $commentModel->paginate($pageSize);
    }
    $lists = [];
    foreach ($commentModel as $key => $item) {
        $item['reply_url'] = url('/article/create_comment', ["id" => $item['id']])->build();
        $lists[$key] = $item;
    }
    return [
        'model' => $commentModel,
        'lists' => $lists
    ];
}

/**
 * 获取评论数量
 * @param $documentId
 * @param string $type
 * @return int
 * @author 木子的忧伤
 * @date 2021-12-05 23:16
 */
function get_comment_count($documentId, $type = 'top')
{
    $commentModel = Comment::where('status', 1);
    switch ($type) {
        case 'top':
            //获取所有的一级评论
            $commentModel = $commentModel->where('document_id', $documentId)->where('pid', 0);
            break;
        case 'son':
            //获取栏目下文章
            $commentModel = $commentModel->where('pid', $documentId);
            break;
    }
    return $commentModel->count();
}


/**
 * 获取文章相关文章
 * @param $documentId
 * @param $row
 * @param string $table
 * @return Document[]|array|Collection
 * @throws DataNotFoundException
 * @throws DbException
 * @throws ModelNotFoundException
 * @author 木子的忧伤
 * @date 2021-11-28 1:02
 */
function tpl_get_relevant_list($documentId, $row, $table = 'article')
{
    $count = Document::where('type', $table)->where('status', 1)->count();    //获取总记录数
    $id = (new Document())->getPK();
    $min = Document::where('type', $table)->where('status', 1)->min($id);    //统计某个字段最小数据
    if ($count < $row) {
        $row = $count;
    }
    $i = 1;
    $flag = 0;
    $ary = array();
    while ($i <= $row) {
        $rundnum = rand($min, $count);//抽取随机数
        if ($flag != $rundnum) {
            //过滤重复
            if (!in_array($rundnum, $ary)) {
                $ary[] = $rundnum;
                $flag = $rundnum;
            } else {
                $i--;
            }
        }
        $i++;
    }
    $relevantList = Document::where('type', $table)
        ->where('status', 1)
        ->where($id, '<>', $documentId)
        ->where($id, 'in', $ary)
        ->limit($row)->select();
    $lists = [];
    foreach ($relevantList as $key => $item) {
        //生成文章url
        $item['url'] = make_detail_url($item);
        $lists[$key] = $item;
    }
    return $relevantList;
}

//获取顶级栏目名
function GetTopTypename($id = false)
{
    $id = $id ?: request()->param('id');
    $dc = get_document_category($id);
    if ((int)$dc['pid'] === 0) {
        return $dc['title'];
    }

    return GetTopTypename($dc['pid']);
}

//获取顶级id
function GetToptypeId($id = false)
{
    $id = $id ?: request()->param('id');
    $dc = get_document_category($id);
    if ((int)$dc['pid'] === 0) {
        return $dc['id'];
    }

    return GetToptypeId($dc['pid']);
}

//获取顶级栏目图片
function GetTopTypeimg($id = false)
{
    $id = $id ?: request()->param('id');
    $dc = get_document_category($id);
    if ((int)$dc['pid'] === 0) {
        return $dc['icon'];
    }
    return GetTopTypeimg($dc['pid']);
}

//获取顶级栏目描述
function GetTopDescription($id = false)
{
    $id = $id ?: request()->param('id');
    $dc = get_document_category($id);
    if ((int)$dc['pid'] === 0) {
        return $dc['description'];
    }

    return GetTopDescription($dc['pid']);
}

//获取顶级英文名称
function GetTopTypenameen($id = false)
{
    $id = $id ?: request()->param('id');
    $dc = get_document_category($id);
    if ((int)$dc['pid'] === 0) {
        return $dc['name'];
    }

    return GetTopTypenameen($dc['pid']);
}

/**
 * 判断当前页面是否在此栏目下
 * 主要用于菜单高亮
 * $cid=栏目id,首页可不填此参数
 * $curr_id=当前页面栏目id,首页可不填此参数
 */
function is_active_nav($currCid = false, $cid = false)
{
    if (in_array(request()->action(),['search','tag','about']) ) {
        return false;
    }
    //首页
    if (!$currCid && !$cid) {
        return true;
    }
    //一般在首页中，要比对的栏目id会为false
    if ($cid == false) {
        return false;
    }

    //如果分类id相等，是在同一页面中
    if ($cid == $currCid) {
        return true;
    }

    //判断是否在同一栏目树下。
    $parentId = cache(Data::CURR_CATEGORY_PATENT_ID);

    $parentId = explode(',', $parentId);

    if (in_array($cid, $parentId)) {
        return true;
    }

    return false;
}

// 查看是否为手机端的方法
//判断是手机登录还是电脑登录
function is_mobile()
{
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
        return true;

    //此条摘自TPM智能切换模板引擎，适合TPM开发
    if (isset ($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT'])
        return true;
    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
        //找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
    //判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array(
            'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile'
        );
        //从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    //协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}

/**
 * 加载svg
 * @param $path
 * @author 木子的忧伤
 * @date 2021-12-05 21:35
 */
function file_echo_svg($path)
{
    $svg = file_get_contents(public_path() . $path);
    print_r($svg);
}

/**
 * 加载表情
 * @param $path
 * @return string|null
 * @author 木子的忧伤
 * @date 2021-12-05 21:36
 */
function file_load_face($path)
{
    $files = scandir(public_path() . $path);
    $html = '';
    foreach ($files as $v) {
        /* if(is_file($v)){
             $fileItem[] = $v;
         }*/
        if (pathinfo($v, PATHINFO_EXTENSION) == 'gif') {
            $html = '<img class="img-pace" src="' . $path . $v . '" width="30" facename="' . basename($v, ".gif") . '">' . $html;
        }

    }
    return $html;
}


function comment_face($incoming_comment, $path)
{
    $pattern = '/\[f=(.*?)\]/';
    $isMatched = preg_match_all($pattern, $incoming_comment, $match);
    if ($isMatched == 0) {
        return $incoming_comment;
    }
    foreach ($match[1] as $facename) {
        if (file_exists(public_path() . $path . $facename . '.gif')) {
            $incoming_comment = str_replace("[f={$facename}]", '<img src="' . $path . $facename . '.gif" width="24">', $incoming_comment);
        }
    }
    return $incoming_comment;
}


/**
 * 模板-获取导航
 * @param $type
 * @param $typeId
 * @param int $row
 * @param string $where
 * @param string $orderby
 * @return DocumentCategory[]|array|bool|Collection
 * @throws Exception
 * @throws DataNotFoundException
 * @throws DbException
 * @throws ModelNotFoundException
 * @author 木子的忧伤
 * @date 2021-11-12 21:48
 */
function tpl_get_nav($type, $typeId, $row = 100, $where = '', $orderby = '')
{
    switch ($type) {
        case "all":
            //获取顶级导航
            return get_nav_all();
            break;
        case 'top':
            //获取顶级导航
            return get_nav_by_parent(0, $row);
            break;
        case 'son':
            //获取子级导航
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目导航id！');
            }
            return get_nav_by_parent($typeId, $row);
            break;
        case 'self':
            //获取同级导航
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目导航id！');
            }
            $dc = get_nav($typeId);
            if (!$dc) {
                return false;
            }
            return get_nav_by_parent($dc['pid'], $row);
            break;
        case 'find':
            //获取所有子孙导航，此操作读取数据库，非缓存！
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目导航id！');
            }
            $dc = get_nav($typeId);
            if (!$dc) {
                throw new Exception('导航不存在或已删除！');
            }
            $tempArr = Nav::where('id', 'in', $dc['child'])->where('status', 1)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        case 'parent':
            //获取父级导航
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目导航id！');
            }
            $dc = get_nav($typeId);
            $tempArr = array();
            $parent = get_nav($dc['pid']);
            array_push($tempArr, $parent);
            return $tempArr;
            break;
        case 'root':
            if (!$typeId) {
                throw new Exception('请指定要获取的栏目导航id！');
            }
            $dc = get_nav($typeId);
            if ($dc['pid'] != 0) {
                //获取根导航，此操作读取数据库，非缓存！
                $dc = Nav::where('pid', 0)->where('status', 1)
                    ->where("CONCAT(',',child,',') like '%,$typeId,%'")->limit($row);
                $dc = $dc->find();
            }
            //根据栏目类型，生成栏目url
            $dc['url'] = make_category_url($dc);
            $tempArr = [];
            array_push($tempArr, $dc);
            return $tempArr;
            break;
        case 'where':
            //根据自定义条件获取导航（where语句），此操作读取数据库，非缓存！
            $tempArr = Nav::where('status', 1)->where($where)->order($orderby)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        case 'ids':
            //根据多个栏目id，逗号隔开的那种，获得栏目列表
            $tempArr = Nav::where('status', 1)->where('id', 'in', $typeId)->order($orderby)->limit($row);
            $tempArr = $tempArr->select();
            foreach ($tempArr as $key => $item) {
                //根据栏目类型，生成栏目url
                $item['url'] = make_category_url($item);
                $tempArr[$key] = $item;
            }
            return $tempArr;
            break;
        default:
            $tempArr = [];
            return $tempArr;
            break;
    }
}


/**
 * 获取一个文章导航
 */
function get_nav($x, $field = false)
{
    if (!$x) {
        return false;
    }
    //获取缓存的文章菜单
    $list = get_nav_list();
    if (!isset($list[$x])) {
        return false;
    }
    if ($field) {
        return $list[$x][$field];
    } else {
        return $list[$x];
    }
}

/**
 * 获取导航列表
 */
function get_nav_list()
{
    //缓存文章菜单
    $navList = cache(Data::DATA_NAV_LIST);
    if ($navList === null) {
        $list = Nav::where('status', 1)->order('sort desc')->select()->toArray();
        //转换，让id作为数组的键
        $navList = [];
        foreach ($list as $item) {
            $navList[$item['id']] = $item;
        }
        cache(Data::DATA_NAV_LIST, $navList);
    }
    return $navList;
}

function get_nav_all(): array
{
    $list = get_nav_list();
    $tempArr = array();
    foreach ($list as $item) {
        if ($item['pid'] == 0) {
            $tempArr[$item['id']] = $item;
        } else {
            $tempArr[$item['pid']]['child'][] = $item;
        }
    }
    return $tempArr;
}

/**
 * 根据父级导航id获取子导航
 * $pid=父级id
 * $row=获取多少数目
 */
function get_nav_by_parent($pid, $row): array
{
    $list = get_nav_list();
    $x = 1;
    $tempArr = array();
    foreach ($list as $item) {
        if ($x > $row) {
            break;
        }
        if ($item['pid'] == $pid) {
            $x = $x + 1;
            array_push($tempArr, $item);
        }
    }
    return $tempArr;
}