-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-03-13 20:38:17
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `apeblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `ape_admin`
--

CREATE TABLE `ape_admin` (
  `id` int(10) NOT NULL COMMENT 'ID',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '前台用户ID',
  `name` varchar(32) NOT NULL COMMENT '用户名',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `pwd` varchar(64) NOT NULL COMMENT '密码',
  `realname` varchar(32) NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT '0' COMMENT '角色id',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(1) NOT NULL COMMENT '状态1:正常0冻结',
  `ip` varchar(20) DEFAULT NULL COMMENT '注册ip',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台人员列表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_admin`
--

INSERT INTO `ape_admin` (`id`, `uid`, `name`, `nickname`, `pwd`, `realname`, `avatar`, `role_id`, `tel`, `mail`, `remark`, `status`, `ip`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, 1, 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '', '/uploads/images/20210313\\7249b2aad5236470e17cdef275650abd.jpg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, NULL, '1', '1', 1580031132, 1615607665);

-- --------------------------------------------------------

--
-- 表的结构 `ape_admin_auth`
--

CREATE TABLE `ape_admin_auth` (
  `id` int(4) NOT NULL COMMENT '权限id',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '父id',
  `module` varchar(32) NOT NULL COMMENT '模块名',
  `controller` varchar(32) NOT NULL COMMENT '控制器名称',
  `action` varchar(32) NOT NULL COMMENT '方法名名称',
  `params` varchar(128) DEFAULT NULL COMMENT '参数',
  `font_family` varchar(20) DEFAULT NULL COMMENT '字体',
  `spreed` tinyint(1) DEFAULT '0' COMMENT 'spreed',
  `is_check` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否菜单',
  `path` varchar(64) NOT NULL COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1可用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_admin_auth`
--

INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1581664102),
(2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, NULL, '1', 1582093161, 1590466572),
(4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627431),
(5, '用户管理', '', 4, 'admin', 'admin', 'index', '', NULL, 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627443),
(6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', NULL, 0, 0, 1, '/admin/admin_auth/index', 0, 1, NULL, '2', 1582093161, 1613627454),
(7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', NULL, 0, 0, 1, '/admin/admin_role/index', 0, 1, NULL, '1', 1582093161, 1582263652),
(8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1582093161),
(9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', NULL, 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', NULL, 1582093161, 1582093161),
(10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', NULL, 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914),
(11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', NULL, 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624),
(12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', NULL, 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680),
(13, '后台登录', '', 8, 'admin', 'login', 'login', '', NULL, 0, 0, 0, '/admin/login/login', 0, 1, '1', NULL, 1582707133, 1582093161),
(14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', NULL, 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', NULL, 1582781658, 1582781667),
(15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', NULL, 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', NULL, 1582781757, 1582781796),
(16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', NULL, 0, 0, 0, '/admin/system_config/email', 0, 1, '1', NULL, 1582781787, 1582093161),
(17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', NULL, 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986),
(18, '文章列表', '', 17, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778),
(19, '栏目分类', '', 17, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827),
(21, '留言管理', '', 27, 'admin', 'message', 'index', '', NULL, 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203),
(23, '分类管理', '', 22, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', NULL, 1613390173, 1582093161),
(24, '幻灯片管理', '', 27, 'admin', 'slides', 'index', '', NULL, 0, 0, 1, '/admin/slides/index', 0, 1, '1', '1', 1613390220, 1613449217),
(25, '文章管理', '', 22, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', NULL, 1613390289, 1582093161),
(26, '文章回收站', '', 22, 'admin', 'article', 'recovery', '', NULL, 0, 0, 1, '/admin/article/recovery', 0, 1, '1', NULL, 1613390366, 1582093161),
(27, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', NULL, 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194),
(28, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400082, 1582093161),
(29, '会员管理', '', 28, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400129, 1582093161),
(31, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400314, 1615603440),
(32, '主题管理', '', 31, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400349, 1582093161),
(33, '主题商店', '', 31, 'admin', 'theme', 'store', '', NULL, 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404),
(34, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400510, 1582093161),
(35, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400539, 1582093161),
(37, '邀请码管理', '', 27, 'admin', 'invitation', 'index', '', NULL, 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);

-- --------------------------------------------------------

--
-- 表的结构 `ape_admin_log`
--

CREATE TABLE `ape_admin_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '编号',
  `admin_id` int(10) NOT NULL COMMENT '操作人id',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '操作人名字',
  `module` varchar(50) NOT NULL COMMENT '模块名',
  `controller` varchar(50) NOT NULL COMMENT '控制器名',
  `action` varchar(50) NOT NULL COMMENT '方法名',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_admin_log`
--

INSERT INTO `ape_admin_log` (`id`, `admin_id`, `admin_name`, `module`, `controller`, `action`, `ip`, `user_agent`, `create_time`) VALUES
(31, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808197),
(32, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808197),
(33, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808199),
(34, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808201),
(35, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808219),
(36, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808226),
(37, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810485),
(38, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810488),
(39, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810721),
(40, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810896),
(41, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810917),
(42, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613811090),
(43, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613812960),
(44, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813362),
(45, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813399),
(46, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813434),
(47, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813459),
(48, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813478),
(49, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813495),
(50, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813645),
(51, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813731),
(52, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813810),
(53, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813840),
(54, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813927),
(55, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813945),
(56, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813970),
(57, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814006),
(58, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814164),
(59, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814275),
(60, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613829768),
(61, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831394),
(62, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831394),
(63, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831397),
(64, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831398),
(65, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831478),
(66, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831515),
(67, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831525),
(68, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884635),
(69, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884635),
(70, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884638),
(71, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918290),
(72, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918290),
(73, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918316),
(74, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918317),
(75, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918320),
(76, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613921578),
(77, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613922266),
(78, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613957708),
(79, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613957709),
(80, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967075),
(81, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967077),
(82, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967079),
(83, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613968454),
(84, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414840),
(85, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414850),
(86, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414851),
(87, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414853),
(88, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414855),
(89, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414972),
(90, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476434),
(91, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476434),
(92, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476440),
(93, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476441),
(94, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614520232),
(95, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614526663),
(96, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614526663),
(97, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530365),
(98, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530367),
(99, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530451),
(100, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530455),
(101, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048336),
(102, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048350),
(103, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048350),
(104, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048358),
(105, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048359),
(106, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048682),
(107, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048688),
(108, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048715),
(109, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048786),
(110, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111007),
(111, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111007),
(112, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111010),
(113, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111016),
(114, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111143),
(115, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111517),
(116, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111532),
(117, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111551),
(118, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615113603),
(119, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615113692),
(120, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128112),
(121, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128118),
(122, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128120),
(123, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615132814),
(124, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615133417),
(125, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340075),
(126, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340076),
(127, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340086),
(128, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340094),
(129, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340097),
(130, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615340153),
(131, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615340420),
(132, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341349),
(133, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341659),
(134, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341820),
(135, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341828),
(136, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341832),
(137, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341937),
(138, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341943),
(139, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341944),
(140, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341947),
(141, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341983),
(142, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341986),
(143, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341997),
(144, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342002),
(145, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342058),
(146, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342082),
(147, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342217),
(148, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342269),
(149, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342285),
(150, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342329),
(151, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342330),
(152, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342334),
(153, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342351),
(154, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342445),
(155, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342472),
(156, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342475),
(157, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342547),
(158, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342707),
(159, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711),
(160, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711),
(161, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711),
(162, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711),
(163, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712),
(164, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712),
(165, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712),
(166, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712),
(167, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712),
(168, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(169, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(170, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(171, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(172, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(173, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713),
(174, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342714),
(175, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342714),
(176, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343588),
(177, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343589),
(178, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343590),
(179, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343590),
(180, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343658),
(181, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343686),
(182, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343689),
(183, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343833),
(184, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343850),
(185, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344075),
(186, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344077),
(187, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344077),
(188, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344092),
(189, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344103),
(190, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344114),
(191, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344128),
(192, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344184),
(193, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344223),
(194, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344267),
(195, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347035),
(196, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347036),
(197, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347036),
(198, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348194),
(199, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195),
(200, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195),
(201, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195),
(202, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196),
(203, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196),
(204, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196),
(205, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196),
(206, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196),
(207, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197),
(208, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197),
(209, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197),
(210, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197),
(211, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348198),
(212, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348208),
(213, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348278),
(214, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348299),
(215, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348301),
(216, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348305),
(217, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348412),
(218, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615349994),
(219, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350016),
(220, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350019),
(221, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350023),
(222, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350040),
(223, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350042),
(224, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350052),
(225, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350095),
(226, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350097),
(227, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350098),
(228, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350162),
(229, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350190),
(230, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350192),
(231, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350224),
(232, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350268),
(233, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350323),
(234, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350324),
(235, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350325),
(236, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350325),
(237, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326),
(238, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326),
(239, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326),
(240, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350327),
(241, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350356),
(242, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350393),
(243, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350395),
(244, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350534),
(245, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350583),
(246, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351068),
(247, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351076),
(248, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351119),
(249, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351442),
(250, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351499),
(251, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351506),
(252, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351529),
(253, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351657),
(254, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351673),
(255, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351686),
(256, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351702),
(257, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351710),
(258, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351749),
(259, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351751),
(260, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615353187),
(261, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615353629),
(262, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354011),
(263, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354642),
(264, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354776),
(265, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354901),
(266, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354903),
(267, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355024),
(268, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355053),
(269, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355097),
(270, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355140),
(271, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355143),
(272, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355254),
(273, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355325),
(274, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389539),
(275, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389555),
(276, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389592),
(277, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389592),
(278, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389602),
(279, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389649),
(280, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389759),
(281, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389763),
(282, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389765),
(283, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615389923),
(284, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615554885),
(285, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615554902),
(286, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615554903),
(287, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615555041),
(288, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557569),
(289, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557569);
INSERT INTO `ape_admin_log` (`id`, `admin_id`, `admin_name`, `module`, `controller`, `action`, `ip`, `user_agent`, `create_time`) VALUES
(290, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557594),
(291, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557598),
(292, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557603),
(293, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557607),
(294, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557621),
(295, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557625),
(296, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557670),
(297, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557671),
(298, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557672),
(299, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557675),
(300, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557676),
(301, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557679),
(302, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557681),
(303, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557689),
(304, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557696),
(305, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615557698),
(306, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558109),
(307, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558110),
(308, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558111),
(309, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558114),
(310, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558116),
(311, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558119),
(312, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558121),
(313, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558254),
(314, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558307),
(315, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558345),
(316, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558460),
(317, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615558493),
(318, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559197),
(319, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559257),
(320, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559265),
(321, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559460),
(322, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559701),
(323, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559837),
(324, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559851),
(325, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559860),
(326, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559865),
(327, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559871),
(328, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559879),
(329, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559885),
(330, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559889),
(331, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559891),
(332, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559892),
(333, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615559893),
(334, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615560218),
(335, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615560227),
(336, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561145),
(337, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561147),
(338, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561149),
(339, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561150),
(340, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561157),
(341, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561158),
(342, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615561159),
(343, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615602995),
(344, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603008),
(345, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603017),
(346, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603018),
(347, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603083),
(348, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603085),
(349, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603086),
(350, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603408),
(351, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603451),
(352, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615603583),
(353, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615604409),
(354, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607537),
(355, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607546),
(356, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607547),
(357, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607667),
(358, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607708),
(359, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607714),
(360, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607800),
(361, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607824),
(362, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607848),
(363, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607865),
(364, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607874),
(365, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607892),
(366, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607918),
(367, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607950),
(368, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607977),
(369, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615607995),
(370, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608026),
(371, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608040),
(372, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608052),
(373, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608073),
(374, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608097),
(375, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608149),
(376, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608207),
(377, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608263),
(378, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608287),
(379, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608331),
(380, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608336),
(381, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615608349),
(382, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615610754),
(383, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615610943),
(384, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615610958),
(385, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615616922),
(386, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615616939),
(387, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615616949),
(388, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615632836),
(389, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634353),
(390, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634376),
(391, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634450),
(392, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634452),
(393, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634470),
(394, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634569),
(395, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634682),
(396, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634687),
(397, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634695),
(398, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634720),
(399, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634753),
(400, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634762),
(401, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634771),
(402, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615634791),
(403, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615635133),
(404, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615635144),
(405, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638045),
(406, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638691),
(407, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638734),
(408, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638804),
(409, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638833),
(410, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638917),
(411, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615638926),
(412, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615639013),
(413, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615639018),
(414, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615639022);

-- --------------------------------------------------------

--
-- 表的结构 `ape_admin_notify`
--

CREATE TABLE `ape_admin_notify` (
  `id` int(10) NOT NULL COMMENT '消息ID',
  `aid` int(10) NOT NULL COMMENT '管理员ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(10) DEFAULT NULL COMMENT '消息来源 谁发的',
  `type` varchar(10) NOT NULL COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台信息表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_admin_role`
--

CREATE TABLE `ape_admin_role` (
  `id` int(4) NOT NULL COMMENT '角色状态',
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `auth` text NOT NULL COMMENT '权限',
  `tree_data` text COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台角色表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_admin_role`
--

INSERT INTO `ape_admin_role` (`id`, `pid`, `name`, `auth`, `tree_data`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,24,28,29,30,31,32,33,34,35,36,37', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,24,28,29,30,31,32,33,34,35,36,37', 0, 1, '1', '1', 1580031132, 1613400886);

-- --------------------------------------------------------

--
-- 表的结构 `ape_attachment`
--

CREATE TABLE `ape_attachment` (
  `id` int(11) NOT NULL COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) NOT NULL COMMENT '附件名称',
  `path` varchar(255) NOT NULL COMMENT '附件地址',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `mime` varchar(20) DEFAULT NULL COMMENT 'mime',
  `size` varchar(20) DEFAULT NULL COMMENT '大小',
  `storage` int(2) DEFAULT NULL COMMENT '存储方式1本地2腾讯云',
  `create_time` int(10) NOT NULL COMMENT '上传时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_attachment`
--

INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES
(1, 1, '7249b2aad5236470e17cdef275650abd.jpg', '/uploads/images/20210313\\7249b2aad5236470e17cdef275650abd.jpg', 'images', 'image/jpeg', '51118', 1, 1615607636, 1615607636);

-- --------------------------------------------------------

--
-- 表的结构 `ape_attachment_category`
--

CREATE TABLE `ape_attachment_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(255) NOT NULL COMMENT '目录名称',
  `type` varchar(10) NOT NULL COMMENT '所属附件类型',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件分类' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_attachment_category`
--

INSERT INTO `ape_attachment_category` (`id`, `pid`, `name`, `type`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, 0, '头像', 'images', '1', NULL, 1615607571, 1615607571);

-- --------------------------------------------------------

--
-- 表的结构 `ape_document`
--

CREATE TABLE `ape_document` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `author` varchar(50) NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `abstract` varchar(255) DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `type` varchar(50) NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_hot` tinyint(4) DEFAULT '0' COMMENT '是否热门',
  `link_str` varchar(255) NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_path` varchar(255) NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见性',
  `view` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `tags` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_document_article`
--

CREATE TABLE `ape_document_article` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档ID',
  `content` text COMMENT '文章内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_document_category`
--

CREATE TABLE `ape_document_category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `en_title` varchar(30) NOT NULL COMMENT '标志',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类类别：0列表，1单篇，2链接',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `link_str` varchar(255) NOT NULL DEFAULT '0' COMMENT '外链',
  `view` int(10) NOT NULL DEFAULT '0' COMMENT '访问数',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见性',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_document_category`
--

INSERT INTO `ape_document_category` (`id`, `title`, `en_title`, `type`, `pid`, `sort`, `meta_title`, `keywords`, `description`, `template`, `link_str`, `view`, `display`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, '首页', 'index', 0, 0, 99, '', '', '', '', '', 0, 1, 1615559194, 1615559704, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ape_document_category_content`
--

CREATE TABLE `ape_document_category_content` (
  `id` int(11) NOT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_document_product`
--

CREATE TABLE `ape_document_product` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档ID',
  `piclist` text COMMENT '产品图片集',
  `content` text COMMENT '文章内容',
  `price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `market_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_friend_link`
--

CREATE TABLE `ape_friend_link` (
  `id` int(10) NOT NULL COMMENT 'id',
  `uid` int(10) NOT NULL DEFAULT '1' COMMENT '添加者',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '链接网站名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片连接的图片',
  `description` text COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态 0禁用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_invitation_code`
--

CREATE TABLE `ape_invitation_code` (
  `id` int(11) NOT NULL,
  `code` varchar(30) NOT NULL COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0未使用 1 使用',
  `user` varchar(40) DEFAULT NULL COMMENT '使用用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请码' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ape_invitation_code`
--

INSERT INTO `ape_invitation_code` (`id`, `code`, `status`, `user`, `create_time`, `update_time`) VALUES
(14, 'demo8038224376', 0, '1', 1613803822, 1613803822),
(15, 'demo8038227462', 0, '1', 1613803822, 1613803822),
(16, 'demo8038226823', 0, '1', 1613803822, 1613803822),
(17, 'demo8038229091', 0, '1', 1613803822, 1613803822),
(18, 'demo8038224412', 0, '1', 1613803822, 1613803822),
(19, 'demo8038226410', 0, '1', 1613803822, 1613803822),
(20, 'demo8038225806', 0, '1', 1613803822, 1613803822),
(21, 'demo8038224342', 0, '1', 1613803822, 1613803822),
(22, 'demo8038227448', 0, '1', 1613803822, 1613803822),
(23, 'demo8038223733', 0, '1', 1613803822, 1613803822),
(24, 'demo8038227281', 0, '1', 1613803822, 1613803822),
(25, 'demo8038227782', 0, '1', 1613803822, 1613803822);

-- --------------------------------------------------------

--
-- 表的结构 `ape_message_form`
--

CREATE TABLE `ape_message_form` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) NOT NULL COMMENT '手机',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text NOT NULL COMMENT '留言内容',
  `is_reply` int(10) DEFAULT '0' COMMENT '回复状态 0未回复',
  `reply_uid` int(10) DEFAULT NULL COMMENT '回复人',
  `reply_content` text COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT '1',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '留言时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ape_pv_log`
--

CREATE TABLE `ape_pv_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '时间段',
  `view` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_pv_log`
--

INSERT INTO `ape_pv_log` (`id`, `time`, `view`, `date`, `create_time`) VALUES
(1, 15, 14, '2021-02-20', 1613805123),
(2, 16, 31, '2021-02-20', 1613809117),
(3, 16, 1, '2021-02-27', 1614414821),
(4, 9, 5, '2021-03-05', 1614908125),
(5, 0, 1, '2021-03-07', 1615048315),
(6, 9, 1, '2021-03-10', 1615340063),
(7, 23, 3, '2021-03-10', 1615389212);

-- --------------------------------------------------------

--
-- 表的结构 `ape_slides`
--

CREATE TABLE `ape_slides` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `url` varchar(100) NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ape_system_config`
--

CREATE TABLE `ape_system_config` (
  `id` int(8) UNSIGNED NOT NULL COMMENT 'id',
  `tab_id` int(8) DEFAULT NULL COMMENT '分组id',
  `name` varchar(32) NOT NULL COMMENT '标题名称',
  `form_name` varchar(32) DEFAULT NULL COMMENT '表单名称',
  `form_type` varchar(16) NOT NULL COMMENT '表单类型',
  `tag_type` varchar(16) NOT NULL COMMENT '标签类型',
  `upload_type` tinyint(1) DEFAULT NULL COMMENT '上传配置',
  `param` varchar(255) DEFAULT NULL COMMENT '参数',
  `value` text COMMENT '内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_system_config`
--

INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', 'systemConfig(\"title\")', 90, 1, 1, '1', '1', 1582792265, 1583855342),
(2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/898b720200509204528197.jpg', '', 89, 1, 1, '1', NULL, 1582793160, 1582792265),
(3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '派后台管理系统', '', 88, 1, 1, '1', NULL, 1582793221, 1582792265),
(4, 1, '站点描述', 'description', 'text', 'input', 0, '', '派后台管理系统', '', 87, 1, 1, '1', NULL, 1582793248, 1582792265),
(5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265),
(6, 1, '后台LOGO', 'admin_logo', 'file', 'input', 0, '', '/upload/image/20200228/c42005f7fafb58106c33e58279b2f396.png', '', 85, 1, 1, '1', '1', 1582793393, 1582793700),
(7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Power by LEARY.', '', 84, 1, 1, '1', '1', 1582793470, 1582793495),
(8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', 'xxx', '', 83, 1, 1, '1', '1', 1582793563, 1583375542),
(9, 3, '短信平台', 'sms_type', 'radio', 'input', 0, '1=>腾讯云\n2=>阿里云', '1', '', 99, 1, 1, '1', NULL, 1583126643, 1582792265),
(10, 3, 'AppID', 'sms_appid', 'text', 'input', 0, '', '1400323535', '', 98, 1, 1, '1', '1', 1583126757, 1583126769),
(11, 3, 'App Key', 'sms_appkey', 'text', 'input', 0, '', '0777dd251be53632c95da276738b9fd0', '', 97, 1, 1, '1', '1', 1583126826, 1583131539),
(12, 3, '短信登录模板ID', 'sms_login', 'number', 'input', 0, '', '545149', '', 0, 0, 1, '1', NULL, 1583137085, 1582792265),
(13, 3, '短信签名', 'sms_sign', 'text', 'input', 0, '', '里派LEAPY', '', 0, 1, 1, '1', '1', 1583137174, 1583140447),
(14, 3, '找回密码', 'sms_retrieve', 'number', 'input', 0, '', ' 545151', '', 0, 0, 1, '1', NULL, 1583138408, 1582792265),
(15, 3, '注册', 'sms_register', 'number', 'input', 0, '', '545150', '', 0, 0, 1, '1', NULL, 1583138507, 1582792265),
(17, 13, '公众号名称', 'wechat_app_name', 'text', 'input', 0, '', '里派社区', '', 99, 1, 1, '1', '1', 1583221905, 1583222192),
(18, 13, '微信号', 'wechat_app_number', 'text', 'input', 0, '', 'LEAPY_CN', '', 98, 1, 1, '1', '1', 1583221970, 1583222198),
(19, 13, '原始ID', 'wechat_app_origin_id', 'text', 'input', 0, '', 'gh_f9e2116bdc11', '', 97, 1, 1, '1', NULL, 1583222185, 1582792265),
(20, 13, 'AppID', 'wechat_appid', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 96, 1, 1, '1', NULL, 1583222266, 1582792265),
(21, 13, 'AppSecret', 'wechat_appsecret', 'text', 'input', 0, '', '2575cab179dff5b22f3c9285d4c565b7', '', 95, 1, 1, '1', '1', 1583222345, 1583222356),
(22, 13, '微信验证TOKEN', 'wechat_token', 'text', 'input', 0, '', 'learn', '', 94, 1, 1, '1', NULL, 1583222439, 1582792265),
(23, 13, '消息加解密方式', 'wechat_encry', 'radio', 'input', 0, '1=>明文模式\n2=>兼容模式\n3=>安全模式', '1', '', 93, 1, 1, '1', '1', 1583222535, 1583223241),
(24, 13, 'EncodingAESKey', 'wechat_aeskey', 'text', 'input', 0, '', 'EnRXjvDAHlqKbxaaSeQE3pnNBkNHMLmqL5QuB4KsNYt', '', 92, 1, 1, '1', '1', 1583223110, 1583223252),
(25, 13, '公众号类型', 'wechat_type', 'radio', 'input', 0, '1=>服务号\n2=>订阅号', '2', '', 91, 1, 1, '1', '1', 1583223219, 1583223257),
(26, 13, '接口地址', 'wechat_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/wechat/serve', '', 90, 1, 1, '1', NULL, 1583223343, 1582792265),
(29, 14, '小程序APPID', 'miniprogram_appid', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 99, 1, 1, '1', '1', 1587732068, 1587967147),
(30, 14, '小程序密钥', 'miniprogram_appsecret', 'text', 'input', 0, '', '144ddbf99b8cf58b644410c36666865d', '', 98, 1, 1, '1', '1', 1587732178, 1587967175),
(31, 14, '小程序LOGO', 'miniprogram_logo', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/29a4a202005092052147675.jpg', '', 0, 1, 1, '1', '1', 1588201532, 1589028469),
(32, 14, '小程序名称', 'miniprogram_name', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', NULL, 1588202282, 1582792265),
(33, 2, '存储方式', 'storage_type', 'radio', 'input', 0, '1=>本地储存\n2=>腾讯云COS', '1', '', 0, 1, 1, '1', NULL, 1588819285, 1582792265),
(34, 2, 'CDN域名', 'storage_domain', 'text', 'input', 0, '', 'http://file.cos.leapy.cn', '', 0, 1, 1, '1', '1', 1588819651, 1588828871),
(35, 2, 'SecretId', 'storage_secretid', 'text', 'input', 0, '', 'AKIDBFBzd7aUNEvVv9F7sphOwKWuAuY3qVwI', '', 0, 1, 1, '1', '1', 1588820386, 1588828877),
(36, 2, 'SecretKey', 'storage_secretkey', 'text', 'input', 0, '', 'fGgw0sY4TiyfFdoqhQyKUTFqJcYM2YxE', '', 0, 1, 1, '1', '1', 1588820426, 1588828883),
(37, 2, '存储位置', 'storage_region', 'text', 'input', 0, '', 'ap-chengdu', '腾讯云COS填写', 0, 1, 1, '1', '1', 1588821134, 1588828897),
(38, 2, '存储桶名称', 'storage_bucket', 'text', 'input', 0, '', 'pipasheng-1252563008', '', 0, 1, 1, '1', '1', 1588821538, 1588828889),
(39, 4, 'SMTP服务器', 'mail_host', 'text', 'input', 0, '', 'http://bt.leapy.cn:618/mail_sys/send_mail_http.json', '', 0, 1, 1, '1', NULL, 1588835717, 1582792265),
(40, 4, '邮箱用户名', 'mail_username', 'text', 'input', 0, '', 'mail@leapy.cn', '', 0, 1, 1, '1', '1', 1588835775, 1588836096),
(41, 4, '授权码', 'mail_password', 'text', 'input', 0, '', '52Xia666', '', 0, 1, 1, '1', NULL, 1588835807, 1582792265),
(42, 4, '服务器端口', 'mail_port', 'text', 'input', 0, '', '25', '', 0, 1, 1, '1', NULL, 1588836004, 1582792265),
(43, 4, '发件人', 'mail_from', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', NULL, 1588836080, 1582792265),
(44, 4, '发件人签名', 'mail_from_name', 'text', 'input', 0, '', '里派', '', 0, 1, 1, '1', '1', 1588844572, 1588845488),
(45, 38, 'APP支付APPID', 'pay_wechat_appid', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '1', 1588854973, 1588855071),
(46, 38, '公众号APPID', 'pay_wechat_app_id', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 0, 1, 1, '1', NULL, 1588855050, 1582792265),
(47, 38, '小程序APPID', 'pay_wechat_miniapp_id', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 0, 1, 1, '1', NULL, 1588855120, 1582792265),
(48, 38, '商户号', 'pay_wechat_mch_id', 'text', 'input', 0, '', '1588549971', '', 0, 1, 1, '1', NULL, 1588855177, 1582792265),
(49, 38, 'API密钥', 'pay_wechat_key', 'text', 'input', 0, '', 'wsCQDTupznzYfH8oKH89PVvbUC5h4tb0', '', 0, 1, 1, '1', NULL, 1588855400, 1582792265),
(50, 38, '支付证书', 'pay_wechat_apiclient_cert', 'file', 'input', 0, '', '/upload/file/20200507/c0b5fc54d03d194078899202059e41a1.pem', '', 0, 1, 1, '1', '1', 1588855742, 1588856093),
(51, 38, '支付密钥', 'pay_wechat_apiclient_key', 'file', 'input', 0, '', '/upload/file/20200507/53315d3c81bd5e7d6626410cc81f6d45.pem', '', 0, 1, 1, '1', '1', 1588855797, 1588856105),
(52, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'https://learn.leapy.cn', '', 0, 1, 1, '1', NULL, 1588858018, 1582792265),
(53, 39, '支付宝APPID', 'pay_alipay_app_id', 'text', 'input', 0, '', '2018071160550945', '', 0, 1, 1, '1', NULL, 1588894650, 1582792265),
(54, 39, '支付宝公钥', 'pay_alipay_ali_public_key', 'text', 'input', 0, '', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqdwBWnAd0DT973SyIGheDBWFpbRhEowyQwo5K/ryDLl5jQcBnhufgtvxYu7OIP365maGnEjb1VokNFi+9jWLogl9cgHKVOCTpmEwtAfjC6LT2+8bCp/xTQyFtvL5rvQBt5vDiM6n1t3NACPOBKEo5dJoPHv0Frdvmmqs8pWbw1gJDKmVdAxh8YYP5/b4mtG+JruPYOjTzuYms5UPbW3N3/JnMCeoQcJHVOpyZsvztJFqaASMA0OY9N5u8Wr6wJiifN+PWUa8eKFVJ2wc7fDKeNIqUpIP+YiQjzz69h0//3inLeshLsYlEQCjXJUDveXTY/PKBLm3vmSrY0zF2cAt2QIDAQAB', '', 0, 1, 1, '1', '1', 1588894847, 1588895236),
(55, 39, '支付宝私钥', 'pay_alipay_private_key', 'text', 'input', 0, '', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCp3AFacB3QNP3vdLIgaF4MFYWltGESjDJDCjkr+vIMuXmNBwGeG5+C2/Fi7s4g/frmZoacSNvVWiQ0WL72NYuiCX1yAcpU4JOmYTC0B+MLotPb7xsKn/FNDIW28vmu9AG3m8OIzqfW3c0AI84EoSjl0mg8e/QWt2+aaqzylZvDWAkMqZV0DGHxhg/n9via0b4mu49g6NPO5iazlQ9tbc3f8mcwJ6hBwkdU6nJmy/O0kWpoBIwDQ5j03m7xavrAmKJ8349ZRrx4oVUnbBzt8Mp40ipSkg/5iJCPPPr2HT//eKct6yEuxiURAKNclQO95dNj88oEube+ZKtjTMXZwC3ZAgMBAAECggEAPjS9JiLDOFn/2W8SQP4X2zMSk+HgXwuK6LRYxbuMY46VbklvlTimjSUBXOr6AGkjNre7eobQQ21UrvsFTGPFtFznXRY8xCLOz/LuBDCTPNKv5e7GJ3j1xPLeEWcge6sO6fAYhwSvwOfPyMpUC6v9r1UEKYp3lM4vCA0jM2AJAFum+XrGz0zLyKyaSb88GdxTU8FsbM/EbJn6ReQmzNF5O0P+mrBBhb5JQ0a8ixsOB6DIc48tJGMWFf+AVb4QG93qmUP9vyErJCEj6/Cz8gF7SxOE88YtS/baiJGedLayS0Kzxr5Fy2ch/+7q5CLg5n/oN//gJcxIFcGvY/kwp0d4pQKBgQDjpxxIDPSR/FRpgqZXQwK+eZ5aW1GgILZeGH/iF1vsqY3eDqwxD3+fQARHUTYTy86pRTgbEhHAFItKe9cwd2CztDkiz/Avw3DCNmVE6H14deqb89h3fxMeVwuBzsidvvQB0nFbtCDaiG+YGDndh3gVrPY8Bz18dTDBDnrHHh44KwKBgQC/Ap1fjkjwp8j42kO3DvQoaN/Pd1rA/kZoc4GqofUEM1GE6Qx98rPQgCicMMycvJrGzoSg8d/6l19JplmFrn52qKqdnEg+TBTv8H9XY8cqEjDzOggkE4ypRidZypjKdtHmprQ6K8fICs1SGc+aSgDUzuR3U/Om4C+E8R3ujtVMCwKBgQDKwO4WWbuFPcfshNkjhOIvxN+9N/HV/OyPl6BmPEm52TUqHcVMmLIgooJtBi50qSMxbR3QNmKqwWFhgDSizN/KjWwJzkrsL1QBFTNSkQIWxGakaSRVIU9kyT/NZ98TZ5uo98XQV/ieyb8iJgl7fQj9vSM9SXGApFs8xmmhZ/igKwKBgCqei7zJg67m0SntkZRj6sildeLVz9MmKVGfDDylfIUeaj8MvPPRVpvcLLOFE/KZBrP7Wo6KyZ4hbmqBipIQeDlDsyYNu/Tihv1unQtDwSm6+18aAL0D+6u9coRPdz4duwILCkW8hQw2lM+P4MmdX4gcTc/uVHxUo2W3YyVai283AoGAB4+/SHoXFkN+Wez0mxOcQ68o+5SiVDVi19nH1zRY8rxjoxIZ7OkQYyBNMIaT7dwchlLSevUyRI8q56m2vFsYI5LSBnm6ZKfTZhT1DrcpRdk7UFZCi+MQ8PXxDlsXilZOUNvTyBqCsBzRjPehHrzMiv9RSB61uncQnJy0+d1D3OU=', '', 0, 1, 1, '1', '1', 1588894902, 1588895266),
(56, 39, '应用公钥证书路径', 'pay_alipay_app_cert_public_key', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', NULL, 1588895349, 1582792265),
(57, 39, '支付宝根证书路径', 'pay_alipay_alipay_root_cert', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', '1', 1588895390, 1588895402),
(58, 14, '小程序Token', 'miniprogram_token', 'text', 'input', 0, '', 'learn.leapy.cn', '', 0, 1, 1, '1', NULL, 1589007729, 1582792265),
(59, 14, 'EncodingAESKey', 'miniprogram_aeskey', 'text', 'input', 0, '', '4aFLNbclHer8Qhx4PdmBUhohsMR7Ngm0lsQwgllwk4H', '', 0, 1, 1, '1', '1', 1589007789, 1589007836),
(60, 14, '加密方式', 'miniprogram_encry', 'radio', 'input', 0, '1=>明文模式\n2=> 兼容模式\n3=> 安全模式（推荐）', '1', '', 0, 1, 1, '1', NULL, 1589007953, 1582792265),
(61, 14, '接口地址', 'miniprogram_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/mini_program/serve', '', 0, 1, 1, '1', '1', 1589008013, 1589008053),
(62, 14, '审核模式', 'miniprogram_audit', 'radio', 'input', 0, '0=>关闭\n1=>开启', '0', '', 0, 1, 1, '1', '1', 1589177436, 1589326389),
(63, 14, '搜索提示', 'miniprogram_search', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', NULL, 1589178363, 1582792265),
(64, 4, '邮件类型', 'mail_type', 'radio', 'input', 0, '0=>其它\n1=>宝塔邮件', '1', '0::其它,1宝塔', 0, 1, 1, '1', NULL, 1589507116, 1582792265),
(65, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 84, 1, 1, '1', '1', 1582793470, 1582793495),
(66, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认', 'blog', '', 83, 1, 1, '1', '1', 1582793563, 1615639020),
(67, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265),
(68, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265),
(69, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265),
(70, 1, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '青岛市黄岛区长江路街道', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265),
(71, 1, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265),
(72, 1, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);

-- --------------------------------------------------------

--
-- 表的结构 `ape_system_config_tab`
--

CREATE TABLE `ape_system_config_tab` (
  `id` int(8) UNSIGNED NOT NULL COMMENT '分类ID',
  `name` varchar(64) NOT NULL COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置分类' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_system_config_tab`
--

INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES
(1, '基础配置', 99, 1, '1', '1', 1582784937, 1583385482),
(2, '上传配置', 98, 1, '1', '1', 1582785701, 1583385489),
(3, '短信配置', 97, 1, '1', '1', 1582785710, 1583385498),
(4, '邮件配置', 96, 1, '1', '1', 1582785719, 1583385506),
(13, '公众号配置', 95, 1, '1', '1', 1583221840, 1583385525),
(14, '小程序配置', 94, 1, '1', '1', 1583221850, 1583385532),
(38, '微信支付', 0, 1, '1', '1', 1588854047, 1588854054),
(39, '支付宝支付', 0, 1, '1', NULL, 1588854063, 1582792265);

-- --------------------------------------------------------

--
-- 表的结构 `ape_user`
--

CREATE TABLE `ape_user` (
  `id` int(11) NOT NULL COMMENT '主键',
  `username` varchar(40) NOT NULL COMMENT '用户账号',
  `nickname` varchar(30) NOT NULL DEFAULT '里程密' COMMENT '昵称',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `avatar` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '手机号',
  `ip` varchar(50) NOT NULL COMMENT '注册IP地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0启用 1禁用',
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '上次登录时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ape_uv_log`
--

CREATE TABLE `ape_uv_log` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL DEFAULT '0' COMMENT '访问ip',
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ape_uv_log`
--

INSERT INTO `ape_uv_log` (`id`, `ip`, `time`, `date`, `create_time`) VALUES
(1, '127.0.0.1', 15, '2021-02-20', 1613805123),
(2, '127.0.0.1', 16, '2021-02-27', 1614414821),
(3, '127.0.0.1', 9, '2021-03-05', 1614908125),
(4, '127.0.0.1', 0, '2021-03-07', 1615048315),
(5, '127.0.0.1', 9, '2021-03-10', 1615340063);

--
-- 转储表的索引
--

--
-- 表的索引 `ape_admin`
--
ALTER TABLE `ape_admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_admin_auth`
--
ALTER TABLE `ape_admin_auth`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_admin_log`
--
ALTER TABLE `ape_admin_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_admin_notify`
--
ALTER TABLE `ape_admin_notify`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_admin_role`
--
ALTER TABLE `ape_admin_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_attachment`
--
ALTER TABLE `ape_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_attachment_category`
--
ALTER TABLE `ape_attachment_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_document`
--
ALTER TABLE `ape_document`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  ADD KEY `idx_status_type_pid` (`status`,`uid`) USING BTREE;

--
-- 表的索引 `ape_document_article`
--
ALTER TABLE `ape_document_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_document_category`
--
ALTER TABLE `ape_document_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_document_category_content`
--
ALTER TABLE `ape_document_category_content`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_document_product`
--
ALTER TABLE `ape_document_product`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_friend_link`
--
ALTER TABLE `ape_friend_link`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_invitation_code`
--
ALTER TABLE `ape_invitation_code`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_message_form`
--
ALTER TABLE `ape_message_form`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_pv_log`
--
ALTER TABLE `ape_pv_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_slides`
--
ALTER TABLE `ape_slides`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_system_config`
--
ALTER TABLE `ape_system_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_system_config_tab`
--
ALTER TABLE `ape_system_config_tab`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_user`
--
ALTER TABLE `ape_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `ape_uv_log`
--
ALTER TABLE `ape_uv_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ape_admin`
--
ALTER TABLE `ape_admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ape_admin_auth`
--
ALTER TABLE `ape_admin_auth`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id', AUTO_INCREMENT=38;

--
-- 使用表AUTO_INCREMENT `ape_admin_log`
--
ALTER TABLE `ape_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=415;

--
-- 使用表AUTO_INCREMENT `ape_admin_notify`
--
ALTER TABLE `ape_admin_notify`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息ID';

--
-- 使用表AUTO_INCREMENT `ape_admin_role`
--
ALTER TABLE `ape_admin_role`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色状态', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ape_attachment`
--
ALTER TABLE `ape_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ape_attachment_category`
--
ALTER TABLE `ape_attachment_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ape_document`
--
ALTER TABLE `ape_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ape_document_category`
--
ALTER TABLE `ape_document_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ape_friend_link`
--
ALTER TABLE `ape_friend_link`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `ape_invitation_code`
--
ALTER TABLE `ape_invitation_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `ape_message_form`
--
ALTER TABLE `ape_message_form`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ape_pv_log`
--
ALTER TABLE `ape_pv_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `ape_slides`
--
ALTER TABLE `ape_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `ape_system_config`
--
ALTER TABLE `ape_system_config`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=73;

--
-- 使用表AUTO_INCREMENT `ape_system_config_tab`
--
ALTER TABLE `ape_system_config_tab`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `ape_user`
--
ALTER TABLE `ape_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `ape_uv_log`
--
ALTER TABLE `ape_uv_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
