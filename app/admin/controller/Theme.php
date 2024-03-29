<?php

namespace app\admin\controller;

use app\admin\extend\Util as Util;
use app\common\constant\Data;
use app\common\model\SystemConfig as cModel;
use Exception;

/**
 * Class Theme
 * @package app\admin\controller\system
 * @author 木子的忧伤
 * @date 2021-02-15 23:20
 */
class Theme extends AuthController
{
    /**
     * 主题列表
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-17 11:40
     */
    public function index() : string
    {
        $themeList = [];
        // 寻找有多少主题
        $themeDir = public_path('template/');
        $defaultTheme = system_config('web_template');
        if ($dh = opendir($themeDir)) {
            while (($file = readdir($dh)) !== false) {
                if ((is_dir($themeDir . "/" . $file)) && $file != "." && $file != "..") {
                    $themeInfoFile = $themeDir . "/" . $file . '/info.json';
                    if (!file_exists($themeInfoFile)) {
                        //主题信息不存在则跳过
                        continue;
                    }
                    $info = json_decode(file_get_contents($themeInfoFile), true);
                    unset($themeInfoFile);
                    $info['root_dir'] = $themeDir . "/" . $file ;
                    $info['dir_name'] = $file;
                    $info['preview_file'] = file_cdn($themeDir ."/". $file . '/' . $info['preview_file']);
                    $info['is_default'] = $file == $defaultTheme ? 1 : 0;//检查是不是默认主题
                    $themeList[] = $info;
                }
            }
            closedir($dh);
        }
        $this->assign("theme_list", $themeList);
        return $this->fetch();
    }

    /**
     * 更新主题
     * @return string
     * @throws Exception
     * @author 木子的忧伤
     * @date 2021-02-17 11:40
     */
    public function change_theme()
    {
        $data = Util::postMore([
            ['value', ''],
        ]);
        if ($data['value'] == "") return app("json")->fail("主题不能为空");
        $res = cModel::update($data, ['form_name' => 'web_template']);
        cache(Data::DATA_SYSTEM_CONFIG, null);//清除缓存
        return $res ? app("json")->success("操作成功", 'code') : app("json")->fail("操作失败");
    }
}