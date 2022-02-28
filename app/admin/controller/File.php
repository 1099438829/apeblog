<?php

namespace app\admin\controller;


use app\common\model\Attachment;
use app\admin\extend\storage\QcloudCoService;
use app\admin\extend\Util as Util;
use think\db\exception\DataNotFoundException;
use think\db\exception\DbException;
use think\db\exception\ModelNotFoundException;
use think\exception\ValidateException;
use think\facade\Filesystem;
use think\Request;

class File extends AuthController
{
    /**
     * 单个图片上传
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function image()
    {
        $file = $this->request->file("file");
        $fileType = "image";
        $storage_type = system_config("storage_type") ?: 1;//默认未本地存储
        switch ($storage_type) {
            case 1:
                $saveName = Filesystem::putFile($fileType, $file);
                $filePath = Filesystem::url($saveName);
                //转换因为win导致的兼容问题
                if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
                    $filePath = str_replace( DIRECTORY_SEPARATOR, '/',$filePath);
                }
                break;
            case 2:
                $saveName = Filesystem::putFile('image', $file);
                $ext = $file->getOriginalExtension();
                $key = '/image/' . date('Ymd') . "/" . substr(md5($file->getRealPath()), 0, 5) . date('YmdHis') . rand(0, 9999) . '.' . $ext;
                $filePath = QcloudCoService::put($key, $file->getRealPath());
                break;
        }
        return Attachment::addAttachment($this->request->param("cid", 0), $saveName, $filePath, 'image', $file->getMime(), $file->getSize(), $storage_type) ? app("json")->code()->success("上传成功", ['filePath' => $filePath, "name" => $saveName]) : app("json")->fail("上传失败");
    }

    /**
     * base64转image
     * @return mixed
     */
    public function baseToImage()
    {
        $data = Util::postMore([
            ['image', '']
        ]);
        if ($data['image'] == '') return app("json")->fail("上传失败,没有文件");
        $path = "upload/image/" . date("Ymd") . '/';
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $data['image'], $result)) {
            $type = $result[2];
            if (!file_exists($path)) mkdir($path, 0755, true);
            $saveName = $path . md5(time()) . ".{$type}";
            //转换因为win导致的兼容问题
            if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
                $saveName = str_replace( DIRECTORY_SEPARATOR, '/',$saveName);
            }
            if (file_put_contents($saveName, base64_decode(str_replace($result[1], '', $data['image'])))) return app("json")->success("上传成功", ['src' => "/" . $saveName]);
            else return app("json")->fail("上传失败，写入文件失败！");
        } else return app("json")->fail("上传失败,图片格式有误！");
    }


    /**
     * @单文件上传
     * @param string $type 类型  files image documents banners
     * @return mixed
     */
    public function upload(Request $request)
    {
        if ($request->isPost()) {
            // 获取表单上传文件 例如上传了001.jpg
            $file = $this->request->file('file');//根据表单name替换imgFile
            $fileType = $this->request->post("type")?:'file';
            switch ($fileType) {
                case 'file':
                    $fileSize = 10 * 1024 * 1024;
                    $fileExt = 'pdf,doc,docx,png,jpeg,jpg,text,mp4';
                    break;
                case 'slide':
                    $fileSize = 10 * 1024 * 1024;
                    $fileExt = 'png,jpeg,jpg';
                    break;
                case 'document':
                    $fileSize = 5 * 1024 * 1024;
                    $fileExt = 'pdf,doc,docx';
                    break;
                case 'image':
                    $fileSize = 5 * 1024 * 1024;
                    $fileExt = 'png,jpeg,jpg';
                    break;
                case 'avatar':
                    $fileSize = 4 * 1024 * 1024;
                    $fileExt = 'png,jpeg,jpg';
                    break;
                default:
                    $fileSize = 10 * 1024 * 1024;
                    $fileExt = 'pdf,doc,docx';
                    break;
            }
            try {
                // 使用验证器验证上传的文件
                validate(['file' => [
                    // 限制文件大小(单位b)，这里限制为5M
                    'fileSize' => $fileSize,
                    // 限制文件后缀，多个后缀以英文逗号分割
                    'fileExt' => $fileExt
                    // 更多规则请看“上传验证”的规则，文档地址https://www.kancloud.cn/manual/thinkphp6_0/1037629#_444
                ]])->check(['file' => $file]);
                $saveName = Filesystem::putFile($fileType, $file);
                $filePath = Filesystem::url($saveName);
                //转换因为win导致的兼容问题
                if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
                    $filePath = str_replace( DIRECTORY_SEPARATOR, '/',$filePath);
                }
                return $saveName ? app("json")->code()->success("上传成功", ['filePath' => $filePath, "name" => basename($saveName)]) : app("json")->fail("上传失败");
            } catch (ValidateException $e) {
                return app("json")->fail($e->getMessage());
            }
        } else {
            return app("json")->fail('上传失败');
        }
    }
}