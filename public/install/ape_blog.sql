/*
 Navicat Premium Data Transfer

 Source Server         : local_docker_mysql
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : localhost:3306
 Source Schema         : apeblog

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 11/02/2023 15:51:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ape_admin
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin`;
CREATE TABLE `ape_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '前台用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT '0' COMMENT '角色id',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1:正常0冻结',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '注册ip',
  `create_user` int(32) NOT NULL DEFAULT '0' COMMENT '添加人',
  `update_user` int(32) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_email_tel` (`username`,`tel`,`email`) USING BTREE COMMENT '用户名'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台人员列表';

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
BEGIN;
INSERT INTO `ape_admin` (`id`, `uid`, `username`, `nickname`, `password`, `realname`, `avatar`, `role_id`, `tel`, `email`, `remark`, `status`, `ip`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, 1, 'admin', '超级管理员', '09f76b1b64d09b0ba5ea53d1dade17c3', '超级管理员', '/upload/image/20220228/c50a4b71b2c3dd358cf63e0a6fa1d014.png', 1, '13500000000', '123@qq.com', '', 1, '', 1, 1, 1642090317, 1658816685);
COMMIT;

-- ----------------------------
-- Table structure for ape_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_auth`;
CREATE TABLE `ape_admin_auth` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '父id',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(32) NOT NULL DEFAULT '' COMMENT '方法名名称',
  `params` varchar(128) NOT NULL DEFAULT '' COMMENT '参数',
  `font_family` varchar(20) NOT NULL DEFAULT '' COMMENT '字体',
  `spreed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'spreed',
  `is_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否菜单',
  `path` varchar(64) NOT NULL DEFAULT '' COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1可用',
  `create_user` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
BEGIN;
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, '', '1', 1582093161, 1624692439);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627431);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (5, '用户管理', '', 4, 'admin', 'admin', 'index', '', '', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627443);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', '', 0, 0, 1, '/admin/admin_auth/index', 0, 1, '', '2', 1582093161, 1613627454);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', '', 0, 0, 1, '/admin/admin_role/index', 0, 1, '', '1', 1582093161, 1582263652);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', '', 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', '', 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', '', 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', '', 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', '', 0, 0, 0, '/admin/login/login', 0, 1, '1', '', 1582707133, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', '', 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', '', 1582781658, 1582781667);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', '', 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', '', 1582781757, 1582781796);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', '', 0, 0, 0, '/admin/system_config/email', 0, 1, '1', '', 1582781787, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', '', 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (18, '文章管理', '', 17, 'admin', 'article', 'index', '', '', 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', '', 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (20, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', '', 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (21, '留言管理', '', 20, 'admin', 'message', 'index', '', '', 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (22, '邀请码管理', '', 20, 'admin', 'invitation', 'index', '', '', 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (23, '广告管理', 'mdi mdi-bulletin-board', 20, 'admin', 'advert', 'index', '', '', 0, 0, 1, '/admin/advert/index', 0, 1, '1', '1', 1627293150, 1641913919);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (24, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (25, '会员管理', '', 24, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (26, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (27, '主题管理', '', 26, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (28, '主题商店', '', 26, 'admin', 'theme', 'store', '', '', 0, 0, 0, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1642946978);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (29, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friend_link', 'index', '', '', 0, 0, 1, '/admin/friend_link/index', 0, 1, '1', '1', 1613400510, 1642947636);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (31, '数据库管理', '', 8, 'admin', 'databases', 'index', '', '', 0, 0, 1, '/admin/databases/index', 0, 1, '1', '', 1635572569, 1635572671);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (32, '友链管理', '', 29, 'admin', 'friend_link', 'index', '', '', 0, 0, 1, '/admin/friend_link/index', 0, 1, '1', '1', 1642089882, 1642947643);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (33, '单页面', '', 17, 'admin', 'page', 'index', '', '', 0, 0, 1, '/admin/page/index', 0, 1, '1', '', 1657463452, 0);
INSERT INTO `ape_admin_auth` (`id`, `name`, `icon`, `pid`, `module`, `controller`, `action`, `params`, `font_family`, `spreed`, `is_check`, `is_menu`, `path`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (34, '导航管理', '', 20, 'admin', 'nav', 'index', '', '', 0, 0, 1, '/admin/nav/index', 0, 1, '1', '', 1657463508, 0);
COMMIT;

-- ----------------------------
-- Table structure for ape_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_log`;
CREATE TABLE `ape_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名字',
  `module` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '方法名',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ip',
  `user_agent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_admin_notify
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_notify`;
CREATE TABLE `ape_admin_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` mediumtext NOT NULL COMMENT '内容',
  `from` varchar(10) NOT NULL DEFAULT '' COMMENT '消息来源 谁发的',
  `type` varchar(10) NOT NULL DEFAULT 'system' COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台信息表';

-- ----------------------------
-- Records of ape_admin_notify
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_role`;
CREATE TABLE `ape_admin_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色状态',
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '上级id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `auth` mediumtext NOT NULL COMMENT '权限',
  `tree_data` mediumtext NOT NULL COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) NOT NULL DEFAULT '0' COMMENT '添加人',
  `update_user` varchar(32) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台角色表';

-- ----------------------------
-- Records of ape_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `ape_admin_role` (`id`, `pid`, `name`, `auth`, `tree_data`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,33,20,21,22,23,34,30,24,25,26,27,28,29,32', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,33,20,21,22,23,34,30,24,25,26,27,28,29,32', 0, 1, '1', '1', 1580031132, 1657463515);
INSERT INTO `ape_admin_role` (`id`, `pid`, `name`, `auth`, `tree_data`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (2, 0, '普通用户', '17,18,19,20,21,22,23,26,27,28,29,32', '17,18,19,20,21,22,23,26,27,28,29,32', 0, 1, '1', '1', 1641393643, 1642089936);
COMMIT;

-- ----------------------------
-- Table structure for ape_advert
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert`;
CREATE TABLE `ape_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1可用-1禁用',
  `description` varchar(1000) DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='幻灯片表';

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
BEGIN;
INSERT INTO `ape_advert` (`id`, `title`, `alias`, `status`, `description`, `create_time`, `update_time`) VALUES (1, '主页banner', 'INDEX_SLIDE', 1, '主页banner', 0, 1657463873);
INSERT INTO `ape_advert` (`id`, `title`, `alias`, `status`, `description`, `create_time`, `update_time`) VALUES (2, '主页推荐位', 'INDEX_RECOMMEND', 1, '主页推荐位', 1657446292, 0);
INSERT INTO `ape_advert` (`id`, `title`, `alias`, `status`, `description`, `create_time`, `update_time`) VALUES (3, '主页右侧广告位', 'INDEX_RIGHT_AD', 1, '主页右侧广告位', 1657446330, 0);
INSERT INTO `ape_advert` (`id`, `title`, `alias`, `status`, `description`, `create_time`, `update_time`) VALUES (4, '文章banner', 'DOCUMENT_BANNER', 1, '文章banner', 1657446359, 0);
INSERT INTO `ape_advert` (`id`, `title`, `alias`, `status`, `description`, `create_time`, `update_time`) VALUES (5, '文章右侧广告位', 'DOCUMENT_RIGHT_AD', 1, '文章右侧广告位', 1657446390, 0);
COMMIT;

-- ----------------------------
-- Table structure for ape_advert_info
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert_info`;
CREATE TABLE `ape_advert_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL DEFAULT '' COMMENT '专区名称',
  `cover_path` varchar(255) NOT NULL DEFAULT '' COMMENT '专区banner图',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '专区banner跳转url',
  `advert_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '专区位置 ',
  `user_id` int(19) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `sort` int(2) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用 0不启用 1启用',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='广告专区表';

-- ----------------------------
-- Records of ape_advert_info
-- ----------------------------
BEGIN;
INSERT INTO `ape_advert_info` (`id`, `title`, `cover_path`, `url`, `advert_id`, `user_id`, `sort`, `status`, `create_time`, `update_time`) VALUES (1, '源码云博客', '/upload/image/20220228/ca20d06b0b2560e1e70042d844615009.jpg', 'http://www.apecloud.ltd', 1, 1, 99, 1, 1642089742, 1674726088);
COMMIT;

-- ----------------------------
-- Table structure for ape_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment`;
CREATE TABLE `ape_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '附件名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型',
  `mime` varchar(20) NOT NULL DEFAULT '' COMMENT 'mime',
  `size` varchar(20) NOT NULL DEFAULT '0' COMMENT '大小',
  `storage` int(2) NOT NULL DEFAULT '1' COMMENT '存储方式1本地2腾讯云',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
BEGIN;
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (1, 1, 'images/20220114\\fd86d80e8f68c4e9347501cbc4e2509c.jpg', '/uploads/images/20220114/fd86d80e8f68c4e9347501cbc4e2509c.jpg', 'images', 'image/jpeg', '1919593', 1, 1642089709, 1642089709);
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (2, 2, 'images/20220123\\a72d3bf8f55e210f03387fe8873fb2c6.png', '/uploads/images/20220123/a72d3bf8f55e210f03387fe8873fb2c6.png', 'images', 'image/png', '32120', 1, 1642946867, 1642946867);
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (3, 2, 'images/20220123\\85745a6882524e0ed8e9eb7a13c9498a.png', '/uploads/images/20220123/85745a6882524e0ed8e9eb7a13c9498a.png', 'images', 'image/png', '34531', 1, 1642946898, 1642946898);
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (4, 3, 'image/20220228/ca20d06b0b2560e1e70042d844615009.jpg', '/upload/image/20220228/ca20d06b0b2560e1e70042d844615009.jpg', 'image', 'image/jpeg', '262966', 1, 1646032165, 1646032165);
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (5, 6, 'image/20220228/c50a4b71b2c3dd358cf63e0a6fa1d014.png', '/upload/image/20220228/c50a4b71b2c3dd358cf63e0a6fa1d014.png', 'image', 'image/png', '10478', 1, 1646032736, 1646032736);
INSERT INTO `ape_attachment` (`id`, `cid`, `name`, `path`, `type`, `mime`, `size`, `storage`, `create_time`, `update_time`) VALUES (6, 3, 'image/20220411/3795d4f225a23b07136149bc55968786.jpeg', '/upload/image/20220411/3795d4f225a23b07136149bc55968786.jpeg', 'image', 'image/png', '87084', 1, 1649677156, 1649677156);
COMMIT;

-- ----------------------------
-- Table structure for ape_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment_category`;
CREATE TABLE `ape_attachment_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '目录名称',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '所属附件类型',
  `create_user` int(10) NOT NULL DEFAULT '0' COMMENT '添加人',
  `update_user` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='附件分类';

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
BEGIN;
INSERT INTO `ape_attachment_category` (`id`, `pid`, `name`, `type`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, 0, 'banner', 'images', 1, 0, 1642089692, 1642089692);
INSERT INTO `ape_attachment_category` (`id`, `pid`, `name`, `type`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (2, 0, '友链', 'images', 1, 0, 1642946833, 1642946833);
INSERT INTO `ape_attachment_category` (`id`, `pid`, `name`, `type`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (4, 0, '头像', 'image', 1, 0, 1646031987, 1646031987);
COMMIT;

-- ----------------------------
-- Table structure for ape_comment
-- ----------------------------
DROP TABLE IF EXISTS `ape_comment`;
CREATE TABLE `ape_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '评论者姓名',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `url` varchar(40) NOT NULL DEFAULT '' COMMENT '评论者网站',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '评论者内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论者ID',
  `cover_path` varchar(255) NOT NULL DEFAULT '' COMMENT '评论头像地址',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '评论谁',
  `document_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0不显示 1显示',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='评论表';

-- ----------------------------
-- Records of ape_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_document
-- ----------------------------
DROP TABLE IF EXISTS `ape_document`;
CREATE TABLE `ape_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(40) NOT NULL DEFAULT '' COMMENT '别名',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `author` varchar(50) NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `cover_path` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `type` varchar(50) NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `theme` varchar(40) NOT NULL DEFAULT '' COMMENT '主题模板',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否热门',
  `link_str` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `is_jump` tinyint(2) NOT NULL DEFAULT '0' COMMENT '跳转外链',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `tags` char(255) NOT NULL DEFAULT '' COMMENT '标识',
  `abstract` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` date NOT NULL COMMENT '创建日期',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '文章密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `alias` (`alias`) USING BTREE,
  KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  KEY `idx_status_type_pid` (`status`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文档模型基础表';

-- ----------------------------
-- Records of ape_document
-- ----------------------------
BEGIN;
INSERT INTO `ape_document` (`id`, `alias`, `uid`, `author`, `title`, `category_id`, `cover_path`, `type`, `theme`, `is_recommend`, `is_top`, `is_hot`, `link_str`, `is_jump`, `display`, `view`, `tags`, `abstract`, `keywords`, `description`, `sort`, `create_date`, `create_time`, `update_time`, `status`, `password`) VALUES (1, 'about', 1, '超级管理员', '关于博客', 0, '/storage/image/20220710/a5059baa808c46f83674cb5dbcae8dc5.png', 'page', 'article.html', 0, 0, 0, '', 0, 1, 570, '源码云', '关于源码云博客', '关于小站,源码云,源码云博客,关于源码云博客', '关于源码云博客', 99, '2022-07-10', 1657464428, 1657464428, 1, '');
COMMIT;

-- ----------------------------
-- Table structure for ape_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_article`;
CREATE TABLE `ape_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `content` mediumtext COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文档模型文章表';

-- ----------------------------
-- Records of ape_document_article
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_document_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category`;
CREATE TABLE `ape_document_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `alias` varchar(30) NOT NULL DEFAULT '' COMMENT '标志',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '分类图标',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类类别：0列表，1单篇，2链接',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '分类模板',
  `link_str` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `view` int(10) NOT NULL DEFAULT '0' COMMENT '访问数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
BEGIN;
INSERT INTO `ape_document_category` (`id`, `title`, `alias`, `icon`, `type`, `pid`, `sort`, `meta_title`, `keywords`, `description`, `status`, `template`, `link_str`, `view`, `create_time`, `update_time`) VALUES (1, '关于小站', '', '', 0, 0, 99, '关于小站', '关于小站,源码云,源码云博客,关于源码云博客', '源码云博客,源码云博客网站', 1, 'list_default.html', '', 80, 0, 1642089484);
COMMIT;

-- ----------------------------
-- Table structure for ape_document_page
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_page`;
CREATE TABLE `ape_document_page` (
  `id` int(11) NOT NULL,
  `content` mediumtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分类内容表';

-- ----------------------------
-- Records of ape_document_page
-- ----------------------------
BEGIN;
INSERT INTO `ape_document_page` (`id`, `content`) VALUES (1, '<p>　　<strong>源码云博客｜Apeblog</strong></p><p>　　源码云博客是一款基于ThinkPHP6 + bootstrap+ MySql打造的，简单实用的开源免费的博客系统。各管理模块，操作简单，具有简约，易用，访问统计，内存占用低等特点，系统易于功能扩展，代码维护，方便二次开发。可以用来做个人博客，工作室官网，自媒体官网等网站，二次开发之后也可以作为资讯、展品展示等门户网站。</p><p>　　高颜值： 提供高性能模板机制，可以根据不同的情况自由发挥设置数据自己的模板权限验证： 可视化的管理权限，然后根据权限动态的注册路由、菜单、页面、按钮(权限节点)，自由分派页面和按钮权限。未来可期： 我们正在持续维护系统，【计划】并着手开发各种oss、云短信等的支持，甚至提供开箱即用的各行业完整应用。高效二开： 使用最新的 ThinkPHP 6.0框架、后台应用form-builder 无需写页面快速增删改查可为您节省大量开发时间。一举多得： 后台自适应PC、平板、手机等多种场景的支持，轻松应对各种需求。其他杂项： 强大的后台权限管理 角色组/管理员/管理员日志、系统配置/导航管理等等、更多特性等你探索...</p><p>　　<strong>自动安装</strong></p><p>　　上传文件到网站根目录修改目录权限（linux系统）777</p><p>　　/public</p><p>　　/runtime安装好拓展配置好域名，在浏览器里打开域名，根据安装向导进行安装后台登录http://域名/admin</p><p>　　<strong>手动安装</strong></p><p>　　1.创建数据库，倒入数据库文件</p><p>　　数据库文件目录/public/install/learn.sql</p><p>　　2.修改数据库连接文件 配置文件路径/.env</p><pre><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">APP_DEBUG = true</p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">[APP]</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">DEFAULT_TIMEZONE = Asia/Shanghai</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">[DATABASE]</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">TYPE = mysql</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">HOSTNAME = 127.0.0.1 #数据库连接地址</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">DATABASE = test #数据库名称</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">USERNAME = username #数据库登录账号</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">PASSWORD = password #数据库登录密码</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">HOSTPORT = 3306 #数据库端口</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">CHARSET = utf8</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">DEBUG = true</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\"><br></span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">[LANG]</span></p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif;\">default_lang = zh-cn</span></p></pre><p>　　<strong>3.安装php拓展</strong></p><p>　　redis</p><p>　　<strong>4.创建目录并修改目录权限（linux系统）777</strong></p><pre><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">mkdir public/upload</p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">mkdir runtime</p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">chmod -R 777 public/storage</p><p style=\"color: rgb(77, 82, 89); font-family: -apple-system, &quot;system-ui&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">chmod -R 777 runtime</p></pre><p>　　5.后台登录：http://域名/admin</p><p>　　默认账号：admin 密码：123456</p><p>　　<strong>文档</strong></p><p>　　<strong>TP6开发手册</strong></p><p>　　<strong>FormBuilder</strong></p><p>　　<strong>Light Year Admin</strong><strong>﻿</strong></p><p>　　<strong>官网体验</strong></p><p>　　<strong>源码云博客</strong></p><p>　　<strong>联系我</strong></p><p>　　邮箱：1099438829@qq.com</p><p>　　QQ：1099438829</p><p>　　<strong>特别鸣谢</strong></p><p>　　感谢巨人提供肩膀，排名不分先后</p><p>　　<strong>Thinkphp</strong></p><p>　　<strong>FormBuilder</strong></p><p>　　<strong>Light Year Admin</strong></p><p>　　<strong>PaiAdmin</strong></p><p>　　<strong>corepress</strong></p><p>　　还有很多未标注出来的，再次表示深深的感谢</p><p>　　版权信息</p><p>　　apeblog 遵循Apache2开源协议发布，并提供免费使用。</p><p>　　本项目包含的第三方源码和二进制文件之版权信息另行标注。</p><p>　　<strong>版权所有Copyright © 2019-2025 by 木子的忧伤 (</strong><strong>https://www.apecloud.cn</strong><strong>)</strong></p><p class=\"p1\" style=\"margin-bottom: 2px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;; color: rgb(0, 0, 0);\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p>　　All rights reserved。</p>');
COMMIT;

-- ----------------------------
-- Table structure for ape_document_product
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_product`;
CREATE TABLE `ape_document_product` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `piclist` mediumtext COMMENT '产品图片集',
  `content` text COMMENT '文章内容',
  `price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `market_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文档模型文章表';

-- ----------------------------
-- Records of ape_document_product
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ape_friend_link`;
CREATE TABLE `ape_friend_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL DEFAULT '1' COMMENT '添加者',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '链接网站名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片连接的图片',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='友链表';

-- ----------------------------
-- Records of ape_friend_link
-- ----------------------------
BEGIN;
INSERT INTO `ape_friend_link` (`id`, `uid`, `title`, `url`, `image`, `description`, `sort`, `create_time`, `update_time`, `status`) VALUES (1, 1, '源码云', 'https://www.apecloud.ltd/', '/upload/image/20220228/c50a4b71b2c3dd358cf63e0a6fa1d014.png', '源码云', 0, 1642946872, 1668266834, 1);
INSERT INTO `ape_friend_link` (`id`, `uid`, `title`, `url`, `image`, `description`, `sort`, `create_time`, `update_time`, `status`) VALUES (2, 1, '源码云博客', 'https://blog.apecloud.ltd/', '/upload/image/20220228/c50a4b71b2c3dd358cf63e0a6fa1d014.png', '源码云博客', 0, 1642946909, 1668266845, 1);
COMMIT;

-- ----------------------------
-- Table structure for ape_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `ape_invitation_code`;
CREATE TABLE `ape_invitation_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0未使用 1 使用',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '使用用户',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='邀请码';

-- ----------------------------
-- Records of ape_invitation_code
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_message_form
-- ----------------------------
DROP TABLE IF EXISTS `ape_message_form`;
CREATE TABLE `ape_message_form` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` mediumtext NOT NULL COMMENT '留言内容',
  `is_reply` int(10) NOT NULL DEFAULT '0' COMMENT '回复状态 0未回复',
  `reply_uid` int(10) NOT NULL DEFAULT '0' COMMENT '回复人',
  `reply_content` mediumtext NOT NULL COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT '1',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='反馈意见表';

-- ----------------------------
-- Records of ape_message_form
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_nav
-- ----------------------------
DROP TABLE IF EXISTS `ape_nav`;
CREATE TABLE `ape_nav` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT '0' COMMENT '父id',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(128) NOT NULL DEFAULT '' COMMENT '参数',
  `target` int(1) NOT NULL DEFAULT '0' COMMENT '是否新窗口打开,默认0,1新窗口打开',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1可用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of ape_nav
-- ----------------------------
BEGIN;
INSERT INTO `ape_nav` (`id`, `title`, `icon`, `pid`, `url`, `params`, `target`, `status`, `sort`, `create_time`, `update_time`) VALUES (1, '首页', '', 0, '/', '', 0, 1, 99, 1657369165, 1658763084);
INSERT INTO `ape_nav` (`id`, `title`, `icon`, `pid`, `url`, `params`, `target`, `status`, `sort`, `create_time`, `update_time`) VALUES (2, '关于', '', 0, '/index/index/about', '', 0, 1, 0, 1657369200, 1658763101);
COMMIT;

-- ----------------------------
-- Table structure for ape_pv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_pv_log`;
CREATE TABLE `ape_pv_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '时间段',
  `view` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3330 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='pv记录';

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config`;
CREATE TABLE `ape_system_config` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tab_id` int(8) NOT NULL DEFAULT '0' COMMENT '分组id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '标题名称',
  `form_name` varchar(32) NOT NULL DEFAULT '' COMMENT '表单名称',
  `form_type` varchar(16) NOT NULL DEFAULT '' COMMENT '表单类型',
  `tag_type` varchar(16) NOT NULL DEFAULT '' COMMENT '标签类型',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传配置',
  `param` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `value` text NOT NULL COMMENT '内容',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
BEGIN;
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿码云个人技术站', '', 99, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', '/static/admin/img/logo.ico', '', 98, 1, 1, '1', '1', 1582793160, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '猿码云,源码云,源码云博客,源码云,源码,猿码,ape,apeblog,apeclooud', '', 97, 1, 1, '1', '1', 1582793221, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '源码云博客是知名中文IT技术交流平台,创建于2017年,包含原创博客、精品问答、职业培训、技术论坛、资源下载等产品服务,提供原创、优质、完整内容的专业IT技术开发社区.', '', 96, 1, 1, '1', '1', 1582793248, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 95, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/upload/image/20220410/6292a1c6e457ff76ba29836b716d207d.png', '', 94, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Copyright © 2022 apeBlog Powered by 源码云博客', '', 93, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', '<a href=\"http://beian.miit.gov.cn\">京ICP备19038953号-2</a> ｜<a target=\"_blank\" href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=62062102000168\"> 甘公网安备 62062102000168号</a>', '', 92, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (10, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'https://www.apecloud.ltd/', '', 90, 1, 1, '1', '1', 1588858018, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (11, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '<script>var _hmt = _hmt || [];\r\n(function() {\r\n  var hm = document.createElement(\"script\");\r\n  hm.src = \"https://hm.baidu.com/hm.js?df245a474077d4239ad5932ba71377b9\";\r\n  var s = document.getElementsByTagName(\"script\")[0]; \r\n  s.parentNode.insertBefore(hm, s);\r\n})();</script>', '', 89, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (12, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'default', '', 88, 1, 1, '1', '1', 1582793563, 1620610858);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (13, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>是\n0=>否', '0', '', 87, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (14, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 86, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (15, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 85, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (16, 2, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '北京市昌平区', '', 84, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (17, 2, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 83, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (18, 2, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 82, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (19, 2, '微信收款码', 'web_weixin_pay', 'file', 'input', 0, '', '/upload/pay/weixin.jpg', '微信收款码捐赠使用', 77, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (20, 2, '支付宝收款码', 'web_zhifubao_pay', 'file', 'input', 0, '', '/upload/pay/zfb.jpg', '支付宝收款码捐赠使用', 76, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (25, 3, '数据库备份根路径', 'data_backup_path', 'text', 'input', 0, '', './databack/', '路径必须以 / 结尾', 81, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (26, 3, '数据库备份卷大小', 'data_backup_part_size', 'text', 'input', 0, '', '20971520', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 80, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (27, 3, '数据库备份文件是否启用压缩', 'data_backup_compress', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 79, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (28, 3, '数据库备份文件压缩级别', 'data_backup_compress_level', 'text', 'input', 0, '', '4', '数据库备份文件的压缩级别，该配置在开启压缩时生效1:普通\n4:一般\n9:最高', 78, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (29, 4, '注册开关', 'is_register', 'radio', 'input', 0, '1=>开启\n0=>关闭', '0', '默认开启，如不需要可关闭。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (30, 4, '注册方式', 'register_type', 'radio', 'input', 0, '0=>普通\n1=>手机\n2=>邀请码', '0', '邀请码注册默认状态为已审核！', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (31, 4, '禁止注册', 'register_black_list', 'text', 'input', 0, '', 'www,bbs,ftp,mail,user,users,admin,administrator', '禁止注册的用户名!', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (32, 4, '评论开关', 'comment_close', 'radio', 'input', 0, '1=>开启\n0=>关闭', '0', '默认开启，如不需要可关闭。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (33, 4, '游客评论', 'comment_visitor', 'radio', 'input', 0, '1=>是\n0=>否', '0', '开启后需要登录才能评论。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (34, 4, '评论审核', 'comment_review', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '开启后需要审核评论才会展示。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (35, 4, '脏话过滤', 'comment_sensitive_word', 'text', 'input', 0, '', '新疆,华为,她妈,它妈,他妈,你妈,去死,贱人', '多个逗号隔开', 81, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (36, 5, 'SMTP地址', 'smtp_host', 'text', 'input', 0, '', 'SMTP地址', '', 0, 1, 1, '1', '', 1667317984, 0);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (37, 5, 'SMTP端口', 'smtp_port', 'text', 'input', 0, '', '465', '', 0, 1, 1, '1', '', 1667318073, 0);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (38, 5, '发信邮箱账号', 'smtp_username', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '', 1667318110, 0);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (39, 5, '邮箱授权码', 'smtp_token', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '', 1667318133, 0);
INSERT INTO `ape_system_config` (`id`, `tab_id`, `name`, `form_name`, `form_type`, `tag_type`, `upload_type`, `param`, `value`, `remark`, `rank`, `is_show`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (40, 5, '管理员邮箱账号', 'smtp_emails', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '', 1667318163, 0);
COMMIT;

-- ----------------------------
-- Table structure for ape_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config_tab`;
CREATE TABLE `ape_system_config_tab` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态1可用0不用',
  `create_user` int(10) NOT NULL DEFAULT '0' COMMENT '添加人',
  `update_user` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置分类';

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
BEGIN;
INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (1, '基础配置', 99, 1, 1, 1, 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (2, '社交配置', 98, 1, 1, 1, 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (3, '数据库配置', 98, 1, 1, 1, 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (4, '用户中心', 99, 1, 1, 1, 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` (`id`, `name`, `rank`, `status`, `create_user`, `update_user`, `create_time`, `update_time`) VALUES (5, '邮件配置', 0, 1, 1, 0, 1667316216, 0);
COMMIT;

-- ----------------------------
-- Table structure for ape_tag
-- ----------------------------
DROP TABLE IF EXISTS `ape_tag`;
CREATE TABLE `ape_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '专区名称',
  `document_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `user_id` int(19) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='标签表';

-- ----------------------------
-- Records of ape_tag
-- ----------------------------
BEGIN;
INSERT INTO `ape_tag` (`id`, `name`, `document_id`, `user_id`, `create_time`, `update_time`) VALUES (1, '源码云', 1, 1, 1649561233, 1649561233);
INSERT INTO `ape_tag` (`id`, `name`, `document_id`, `user_id`, `create_time`, `update_time`) VALUES (2, '博客', 1, 1, 1649561233, 1649561233);
INSERT INTO `ape_tag` (`id`, `name`, `document_id`, `user_id`, `create_time`, `update_time`) VALUES (3, '源码云博客', 1, 1, 1649561233, 1649561233);
COMMIT;

-- ----------------------------
-- Table structure for ape_url_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_url_log`;
CREATE TABLE `ape_url_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url 受访的页面url',
  `pv` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '页面名称',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='pv记录表';

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_user
-- ----------------------------
DROP TABLE IF EXISTS `ape_user`;
CREATE TABLE `ape_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) NOT NULL DEFAULT '' COMMENT '用户账号',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '注册IP地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0启用 1禁用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '是否是管理员 1是 0 否',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_email_tel` (`username`,`tel`,`email`) USING BTREE COMMENT '用户名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of ape_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ape_uv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_uv_log`;
CREATE TABLE `ape_uv_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '访问ip',
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `date` varchar(255) NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Uv记录表';

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
