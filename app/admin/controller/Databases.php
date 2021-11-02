<?php
// +----------------------------------------------------------------------
// | HulaCWMS 呼啦企业网站管理系统
// +----------------------------------------------------------------------
// | Copyright (c) 2021 https://www.kaifashu.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 开发树
// +----------------------------------------------------------------------

namespace app\admin\controller;
use app\Request;
use think\facade\Db;
use app\common\service\Database;
use app\admin\service\UtilService as Util;

/*
 * 数据库备份还原控制器
 */
class Databases extends AuthController
{
    /**
     * 数据库备份/还原列表
     * @param null $type
     * @return string
     * @throws \Exception
     * @author 李玉坤
     * @date 2021-10-30 12:45
     */
    public function index($type = null){
        if (!$type){
            $type = 'export';
        }
        switch ($type) {
            /* 数据还原 */
            case 'import':
                $title = '数据还原';
                break;
            /* 数据备份 */
            case 'export':
                $title = '数据备份';
                break;
            default:
                $this->error('参数错误！');
        }
        $this->assign('mate_title',$title);
        return $this->fetch($type);
    }

    /**
     * 获取列表
     * @param Request $request
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-31 0:12
     */
    public function lst(Request $request)
    {
        $data = Util::postMore([
            ['type','export'],
        ]);

        switch ($data['type']) {
            /* 数据还原 */
            case 'import':
                //列出备份文件列表
                $path = system_config('data_backup_path');
                if(!is_dir($path)){
                    mkdir($path, 0755, true);
                }
                $path = realpath($path);
                $flag = \FilesystemIterator::KEY_AS_FILENAME;
                $glob = new \FilesystemIterator($path,  $flag);

                $list = array();
                foreach ($glob as $name => $file) {
                    if(preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)){
                        $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');

                        $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                        $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                        $part = $name[6];

                        if(isset($list["{$date} {$time}"])){
                            $info = $list["{$date} {$time}"];
                            $info['part'] = max($info['part'], $part);
                            $info['size'] = $info['size'] + $file->getSize();
                        } else {
                            $info['part'] = $part;
                            $info['size'] = $file->getSize();
                        }
                        $extension        = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
                        $info['compress'] = ($extension === 'SQL') ? '-' : $extension;
                        $info['time']     = "{$date} {$time}";
                        $info['key']     = strtotime("{$date} {$time}");
                        $list[] = $info;
                    }
                }
                break;
            /* 数据备份 */
            case 'export':
                $list  = Db::query('SHOW TABLE STATUS');
                $list  = array_map('array_change_key_case', $list);
                break;

            default:
                $this->error('参数错误！');
        }
        $result = [
            "data"  => $list,
            "count" =>  count($list)
        ];
        return app("json")->layui($result);
    }


    /**
     * 优化表
     * @author 李玉坤
     * @date 2021-10-30 12:46
     */
    public function optimize()
    {
        $data = Util::postMore([
            ['ids',''],
        ]);
        if ($data['ids'] == "") return app("json")->fail("请指定要优化的表");
        $ids = $data['ids'];
        if(is_array($ids)){
            $ids = implode('`,`', $ids);
            $list = Db::query("OPTIMIZE TABLE `{$ids}`");
            return $list ? app("json")->success("数据表优化完成",'code') : app("json")->fail("数据表优化出错请重试");
        } else {
            $list = Db::query("OPTIMIZE TABLE `{$ids}`");
            return $list ? app("json")->success("数据表'{$ids}'优化完成",'code') : app("json")->fail("数据表'{$ids}'优化出错请重试");
        }
    }

    /**
     * 修复表
     * @author 李玉坤
     * @date 2021-10-31 0:12
     */
    public function repair()
    {
        $data = Util::postMore([
            ['ids',''],
        ]);
        if ($data['ids'] == "") return app("json")->fail("请指定要优化的表");
        $ids = $data['ids'];
        if(is_array($ids)){
            $ids = implode('`,`', $ids);
            $list = Db::query("REPAIR TABLE `{$ids}`");
            return $list ? app("json")->success("数据表修复完成",'code') : app("json")->fail("数据表修复出错请重试");
        } else {
            $list = Db::query("REPAIR TABLE `{$ids}`");
            return $list ? app("json")->success("数据表'{$ids}'修复完成",'code') : app("json")->fail("数据表'{$ids}'修复出错请重试");
        }
    }

    /**
     * 删除备份文件
     * @return mixed|void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-30 13:31
     */
    public function delOne(){
        $data = Util::postMore([
            ['key',''],
        ]);
        if ($data['key'] == "") return app("json")->fail("参数错误");
        $name  = date('Ymd-His', $data['key']) . '-*.sql*';
        $path  = realpath(system_config('data_backup_path')) . DIRECTORY_SEPARATOR . $name;
        array_map("unlink", glob($path));
        return !count(glob($path)) ? app("json")->success("备份文件删除成功",'code') : app("json")->fail("备份文件删除失败，请检查权限");
    }

    /**
     * 备份数据库
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @author 李玉坤
     * @date 2021-10-31 0:35
     */
    public function export(){
        $data = Util::postMore([
            ['ids',''],
            ['id',''],
            ['start',''],
        ]);
        if(request()->isPost() && !empty($data['ids'])){ //初始化
            if (!is_array($data['ids'])){
                $data['ids'] = explode(',',$data['ids']);
            }
            $path = system_config('data_backup_path');
            if(!is_dir($path)){
                mkdir($path, 0755, true);
            }
            //读取备份配置
            $config = array(
                'path'     => realpath($path) . DIRECTORY_SEPARATOR,
                'part'     => system_config('data_backup_part_size'),
                'compress' => system_config('data_backup_compress'),
                'level'    => system_config('data_backup_compress_level'),
            );
            //检查备份目录是否可写
            if(!is_writeable($config['path']))  return app("json")->fail('备份目录不存在或不可写，请检查后重试');
            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if(is_file($lock)){
                return app("json")->fail('检测到有一个备份任务正在执行，请稍后再试');
            } else {
                //创建锁文件
                file_put_contents($lock, time());
            }
            session('backup_config', $config);
            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His', time()),
                'part' => 1,
            );
            session('backup_file', $file);

            //缓存要备份的表
            session('backup_tables', $data['ids']);

            //创建备份文件
            $Database = new Database($file, $config);
            $res = $Database->create();
            $tab = array('id' => 0, 'start' => 0);
            return $res ? app("json")->success("初始化成功", array('tables' => $data['ids'], 'tab' => $tab)) : app("json")->fail("初始化失败，备份文件创建失败！");
        } elseif (request()->isGet() && is_numeric($data['id']) && is_numeric($data['start'])) { //备份数据
            $data['ids'] = session('backup_tables');
            //备份指定表
            $Database = new Database(session('backup_file'), session('backup_config'));
            $data['start']  = $Database->backup($data['ids'][$data['id']], $data['start']);
            if(false === $data['start']){ //出错
                $this->error('备份出错！');
            } elseif (0 === $data['start']) { //下一表
                if(isset($data['ids'][++$data['id']])){
                    $tab = array('id' => $data['id'], 'start' => 0);
                    return app("json")->success($data['ids'][$data['id']]."备份完成",array('tab' => $tab));
                } else { //备份完成，清空缓存
                    unlink(session('backup_config.path') . 'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
                    return app("json")->success("备份完成");
                }
            } else {
                $tab  = array('id' => $data['id'], 'start' => $data['start'][0]);
                $rate = floor(100 * ($data['start'][0] / $data['start'][1]));
                return app("json")->success("正在备份...({$rate}%)",array('tab' => $tab));
            }

        } else { //出错
            return app("json")->fail("参数错误");
        }
    }

    /**
     * 还原数据库
     * @author 李玉坤
     * @date 2021-10-30 12:46
     */
    public function import(){
        $data = Util::postMore([
            ['key',''],
            ['part',''],
            ['start',''],
        ]);
        if(is_numeric($data['key']) && is_null($data['part']) && is_null($data['start'])){ //初始化
            //获取备份文件信息
            $name  = date('Ymd-His', $data['key']) . '-*.sql*';
            $path  = realpath(system_config('data_backup_path')) . DIRECTORY_SEPARATOR . $name;
            $files = glob($path);
            $list  = array();
            foreach($files as $name){
                $basename = basename($name);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);

            //检测文件正确性
            $last = end($list);
            if(count($list) === $last[0]){
                session('backup_list', $list); //缓存备份列表
                return app("json")->success("初始化完成",'code');
            } else {
                return app("json")->fail("备份文件可能已经损坏，请检查",'code');
            }
        } elseif(is_numeric($data['part']) && is_numeric($data['start'])) {
            $list  = session('backup_list');
            $db = new Database($list[$data['part']], array(
                'path'     => realpath(system_config('data_backup_path')) . DIRECTORY_SEPARATOR,
                'compress' => $list[$data['part']][2]));

            $data['start'] = $db->import($data['start']);

            if(false === $data['start']){
                $this->error('还原数据出错！');
            } elseif(0 === $data['start']) { //下一卷
                if(isset($list[++$data['part']])){
                    return app("json")->success("正在还原...#{$data['part']}",'code');
                } else {
                    session('backup_list', null);
                    return app("json")->success("还原完成",'code');
                }
            } else {
                $data = array('part' => $data['part'], 'start' => $data['start'][0]);
                if($data['start'][1]){
                    $rate = floor(100 * ($data['start'][0] / $data['start'][1]));
                    return app("json")->success("正在还原...#{$data['part']} ({$rate}%)");
                } else {
                    $data['gz'] = 1;
                    return app("json")->success("正在还原...#{$data['part']}");
                }
            }

        } else {
            return app("json")->fail('参数错误！');
        }
    }

}
