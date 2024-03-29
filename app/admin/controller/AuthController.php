<?php

namespace app\admin\controller;

use app\admin\model\AdminAuth;
use app\common\constant\Data;
use think\facade\App;
use think\facade\Lang;
use think\facade\Session;

/**
 * 控制器基础类
 */
abstract class AuthController extends SystemBasic
{
    /**
     * model
     * @var
     */
    protected $model = null;

    /**
     * 当前登陆管理员信息
     * @var
     */
    protected $adminInfo;

    /**
     * 当前登陆管理员ID
     * @var int
     */
    protected $adminId;

    /**
     * 当前管理员权限
     * @var array
     */
    protected $auth = [];

    /**
     * 当前权限id
     * @var int
     */
    protected $nowAuthId = 0;

    /**
     * 无需登录的方法,同时也就不需要鉴权了
     * @var array
     */
    protected $noNeedLogin = [];

    /**
     * 无需记录日志
     * @var array
     */
    protected $noNeedLog = [];

    /**
     * 当前模块
     * @var string
     */
    private $module = "";

    /**
     * 当前控制器
     * @var string
     */
    private $controller = "";

    /**
     * 当前方法名
     * @var string
     */
    private $action = "";

    /**
     * Trait
     */
    use TemplateTrait;

    /**
     * 初始化
     */
    protected function initialize(): void
    {
        parent::initialize();
        $this->adminInfo = Session::get(Data::SESSION_KEY_ADMIN_INFO);
        $this->adminId = Session::get(Data::SESSION_KEY_ADMIN_ID);
        $this->module = App::getInstance()->http->getName();
        $this->controller = un_camelize($this->request->controller());
        $this->action = $this->request->action();
        $this->auth = explode(",", $this->adminInfo['role_auth'] ?? '');
        $this->nowAuthId = AdminAuth::getAuthId($this->module, $this->controller, $this->action);
        $this->model = $this->buildModel();
        // 鉴权
        $this->checkAuth();
        // 多语言
        $this->loadLang();
        // 日志
        $this->createLog();
    }

    /**
     * 检验权限
     */
    protected function checkAuth()
    {
        // 不需要登录
        if (in_array($this->action, $this->noNeedLogin) || $this->noNeedLogin == ['*'] || $this->noNeedLogin == "*") return true;
        // 验证登录
        if (!self::isActive()) exit($this->failedNotice(lang("未登录"), "/admin/login/login"));
        // 权限验证
        if ($this->nowAuthId == -1 || in_array($this->nowAuthId, $this->auth)) return true;
        exit($this->failed(lang('没有权限访问!')));
    }

    /**
     * 加载语言文件
     */
    protected function loadLang(): void
    {
        Lang::load(App::getRootPath() . 'app/' . $this->module . '/lang/' . Lang::getLangSet() . '/' . $this->controller . '.php');
    }

    /**
     * 验证登录
     * @return bool
     */
    protected static function isActive(): bool
    {
        return Session::has(Data::SESSION_KEY_ADMIN_ID) && Session::has(Data::SESSION_KEY_ADMIN_INFO);
    }

    /**
     * 记录日志
     * @return bool
     */
    protected function createLog(): bool
    {
        // 不需要登录不能记录日志
        if (in_array($this->action, $this->noNeedLogin) || $this->noNeedLogin == ['*'] || $this->noNeedLogin == "*") return true;
        // 无需记录日志
        if (in_array($this->action, $this->noNeedLog) || $this->noNeedLog == ['*'] || $this->noNeedLog == "*") return true;
        // 有操作权限，记录日志
        if (in_array($this->nowAuthId, $this->auth)) event("AdminLog", [$this->adminInfo, $this->module, $this->controller, $this->action]);
        return false;
    }

    /**
     * 生成model路径
     * @return object|\think\App|null
     */
    protected function buildModel()
    {
        $path = explode(".", $this->request->controller());
        $modelPath = "app\\common\\model"; //全部为common
        foreach ($path as $v) {
            if (substr($v,0,5) == "Admin"){
                //后台用户相关的需要特殊处理
                $modelPath = "app\\admin\\model"; //全部为common
            }
            $modelPath .= "\\" . $v;
        }
        if (class_exists($modelPath)) return app($modelPath);
        return null;
    }
}
