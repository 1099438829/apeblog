<?php
// +----------------------------------------------------------------------
// | HulaCWMS 呼啦企业网站管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2019 http://www.zhuopro.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 灼灼文化
// +----------------------------------------------------------------------

namespace app\index\controller;
use app\common\model\Document;
use think\facade\Db;
use think\facade\Log;

/**
 * 应用入口
 * Class Index
 * @package app\index\controller
 */
class Article extends Base
{
    public function lists()
    {
        $dc=false;
        //栏目分类id
        $id=input('id/d');
        //栏目分类标识
        $name=input('name');

        if($id){
            //获取分类信息
            $dc=get_document_category($id);
        }
        elseif($name){
            //接收name字段,当name不为空的时候，通过name查询分类，一般name会用于伪静态
            $dc=get_document_category_by_name($name);
        }
        if(!$dc){
            $this->error('栏目不存在或已删除！');
        }
        //赋值分类id，可能是通过栏目分类id获取的栏目分类数据
        $id=$dc['id'];
		
		//栏目存在  增加访问量
		Db::name('document_category')->where('id',$id)->inc('view')->update();
        //判断后台统计配置是否开启 1 开启
        if($this->systemConfig["web_statistics"] ==1){
            //统计url
            $this->urlrecord($dc['title']);
        }
        //读取列表页模板
        $listTmp='';
        if($dc['type']==0){
            $listTmp=$dc['template_lists'];
			if(!$listTmp){
	            $this->error('请在栏目分类中，指定当前栏目的列表模板！');
	        }
        }
        elseif($dc['type']==1){
            $listTmp=$dc['template_index'];
			if(!$listTmp){
	            $this->error('请在栏目分类中，指定当前栏目的单篇模板！');
	        }
            //如果是单篇栏目，加载内容
            $dcContent= Db::name('document_category_content')->find($id);
            $dc['content']=$dcContent['content'];
        }
		if(!is_file(TPL.$listTmp)){
			$this->error('模板文件不存在！');
		}
        trace('列表页模板路径：'.TPL.$listTmp,'debug');
        //文章兼容字段
        $dc['category_id']=$dc['id'];
        //判断seo标题是否存在
        $dc['meta_title']=$dc['meta_title']?$dc['meta_title']:$dc['title'];
        //添加当前页面的位置信息
        $dc['position']=tpl_get_position($dc);
        //输出文章分类
        $this->assign('zzField',$dc);
        $this->assign('id',$id);
        //当前页面所属分类id
        $this->assign('cid',$id);
        //缓存当前页面栏目分类树ids
        cache('curr_category_patent_id',$dc['parent_id']?$dc['parent_id'].','.$id:$id);
        return $this->fetch($listTmp);
    }

    public function detail()
    {
    	$id=input('id/d');

        if(!$id){
            $this->error('参数错误！');
        }
        //获取该文章
        $article = (new Document())->where('status',1)->where('id',$id)->find();
        if(!$article){
            $this->error('文章不存在或已删除！');
        }
        $article = $article->toArray();
        //根据分类id找分类信息
        $dc = get_document_category($article['category_id']);
        if(!$dc){
            $this->error('栏目不存在或已删除！');
        }
        //获取该文章内容
        //根据文章类型，加载不同的内容。
        $articleType= $article['type']?$article['type']:'article';
        $articleExt= Db::name('document_'.$articleType)->where('id',$id)->find();
        if(!$articleExt){
            $this->error('文章不存在或已删除！');
        }
        $article=array_merge($article,$articleExt);
        //添加当前页面的位置信息
        $article['position']=tpl_get_position($dc);
        //更新浏览次数
        (new Document())->where('id', $article['id'])->inc('view')->update();
        //读取详情页模板
        $detailTmp=$dc['template'];
        if(!$detailTmp){
			$this->error('请在栏目分类中，指定当前栏目的详情模板！');
        }
		if(!is_file(config('view.view_path').'article/'.$detailTmp)){
			$this->error('模板文件不存在！');
		}
        $article['category_title']=$dc['title'];
        //输出文章内容
        $this->assign('zzField',$article);
        $this->assign('id',$id);
        //当前页面所属分类id
        $this->assign('cid',$article['category_id']);
        //缓存当前页面栏目分类树ids
        cache('curr_category_patent_id',$dc['pid']?$dc['pid'].','.$article['category_id']:$article['category_id']);
        //设置文章的url
        $article['link_str']=aurl($article);
        //判断后台统计配置是否开启 1 开启
        if(system_config("web_statistics") ==1){
                //统计url
            $this->urlrecord($article['title']);
        }
        Log::info('详情页模板路径：'.config('view.view_path').'article/'.$detailTmp);
        //去除后缀
        $detailTmp = substr($detailTmp,0,strpos($detailTmp,'.'));
        return $this->fetch('article/'.$detailTmp);
    }

    //自定义页面，可通过参数指定模板文件。完成完全自定义的文件输出。
    //可以输出html片段，甚至可以输出JSON
    //参数指定的模板文件必须位于模板文件夹下，且以content_开头，以.htm拓展名结尾
    public function content()
    {
        $zzField=input();
        if(!isset($zzField['tpl'])){
            $this->error('没有指定模板文件！');
        }
        //将参数传递到模板页面
        $this->assign('zzField',$zzField);
        //模板兼容性标签
        $this->assign('id',false);
        $this->assign('cid',false);
        //读取模板配置，获得模板后缀名
        $view_suffix=config('view.view_suffix');
        Log::info('详情页模板路径：'.TPL.'content_'.$zzField['tpl'].'.'.$view_suffix);
        cache('curr_category_patent_id',false);
        return $this->fetch(TPL.'content_'.$zzField['tpl'].'.'.$view_suffix);
    }

    //文章标签页面
    public function tag()
    {
        $tag=input('t');
        if(!trim($tag)){
            $this->error('请输入标签');
        }
        if(!mb_check_encoding($tag,'utf-8')){
            $tag=iconv('gbk', 'utf-8', $tag);
        }
        $zzField['id']='0';
        $zzField['title'] = $tag;
        $zzField['meta_title'] = $tag;
        $zzField['keywords'] = $this->systemConfig['keywords'];
        $zzField['description'] = $this->systemConfig['description'];
        $zzField['position'] ='<a href="/">首页</a> > <a>'.$tag.'</a>';
        $this->assign('zzField',$zzField);
        $this->assign('tag',$tag);

        //清除可能存在的栏目分类树id
        cache('curr_category_patent_id',false);
        //模板兼容性标签
        $this->assign('id',false);
        $this->assign('cid',false);
        return $this->fetch();
    }

    //搜索页面
    public function search()
    {
        $kw=input('kw');
        if(!trim($kw)){
            $this->error('请输入搜索关键词');
        }
        if(!mb_check_encoding($kw,'utf-8')){
            $kw=iconv('gbk', 'utf-8', $kw);
        }
        $zzField['id'] = '0';
        $zzField['title'] = '搜索';
        $zzField['meta_title'] = '搜索';
        $zzField['keywords'] = $this->systemConfig['keywords'];
        $zzField['description'] = $this->systemConfig['description'];
        $zzField['position'] = '<a href="/">首页</a> > <a>搜索</a>';
        $this->assign('zzField',$zzField);
        $this->assign('kw',$kw);
        //清除可能存在的栏目分类树id
        cache('curr_category_patent_id',false);
        //模板兼容性标签
        $this->assign('id',false);
        $this->assign('cid',false);
        return $this->fetch();
    }
}