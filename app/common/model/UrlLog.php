<?php

namespace app\common\model;
/**
 * {$TABLE.Comment}
 * Class {$TABLE.Name}
 * @package app\common\model
 */
class UrlLog extends BaseModel
{
    //更新url_log
    public function set_url($title, $url)
    {

        $date_data = date("Y-m-d");
        //根据url和date字段判断数据库中是否存在该页面的记录
        $urlWhere[] = ['date', '=', $date_data];
        $urlWhere[] = ['url', '=', $url];
        $url_data = $this->where($urlWhere)->field('id')->find();
        if ($url_data) {
            $this->where($urlWhere)->inc('pv')->update();
        } else {
            $model = new self();
            $model->url = $url;
            $model->pv = 1;
            $model->title = $title;
            $model->date = $date_data;
            $model->save();
        }
    }

}