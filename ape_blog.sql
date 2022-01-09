/*
 Navicat Premium Data Transfer

 Source Server         : 本地链接
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ape_blog

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 10/01/2022 01:06:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ape_admin
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin`;
CREATE TABLE `ape_admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) NOT NULL DEFAULT 0 COMMENT '前台用户ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT 0 COMMENT '角色id',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `status` tinyint(1) NOT NULL COMMENT '状态1:正常0冻结',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册ip',
  `create_user` int(32) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(32) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_email_tel`(`username`, `tel`, `email`) USING BTREE COMMENT '用户名'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
INSERT INTO `ape_admin` VALUES (1, 1, 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '', '/uploads/image/20220108/03a9a65a8c6d22ccbc62c36a97b02a90.jpeg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, '', 1, 1, 1580031132, 1641659206);

-- ----------------------------
-- Table structure for ape_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_auth`;
CREATE TABLE `ape_admin_auth`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父id',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名名称',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `font_family` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字体',
  `spreed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'spreed',
  `is_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否菜单',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1可用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
INSERT INTO `ape_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, '', '1', 1582093161, 1624692439);
INSERT INTO `ape_admin_auth` VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627431);
INSERT INTO `ape_admin_auth` VALUES (5, '用户管理', '', 4, 'admin', 'admin', 'index', '', '', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627443);
INSERT INTO `ape_admin_auth` VALUES (6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', '', 0, 0, 1, '/admin/admin_auth/index', 0, 1, '', '2', 1582093161, 1613627454);
INSERT INTO `ape_admin_auth` VALUES (7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', '', 0, 0, 1, '/admin/admin_role/index', 0, 1, '', '1', 1582093161, 1582263652);
INSERT INTO `ape_admin_auth` VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', '', 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', '', 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914);
INSERT INTO `ape_admin_auth` VALUES (11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', '', 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624);
INSERT INTO `ape_admin_auth` VALUES (12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', '', 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680);
INSERT INTO `ape_admin_auth` VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', '', 0, 0, 0, '/admin/login/login', 0, 1, '1', '', 1582707133, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', '', 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', '', 1582781658, 1582781667);
INSERT INTO `ape_admin_auth` VALUES (15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', '', 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', '', 1582781757, 1582781796);
INSERT INTO `ape_admin_auth` VALUES (16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', '', 0, 0, 0, '/admin/system_config/email', 0, 1, '1', '', 1582781787, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', '', 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986);
INSERT INTO `ape_admin_auth` VALUES (18, '文章管理', '', 17, 'admin', 'article', 'index', '', '', 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', '', 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` VALUES (20, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', '', 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194);
INSERT INTO `ape_admin_auth` VALUES (21, '留言管理', '', 20, 'admin', 'message', 'index', '', '', 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` VALUES (22, '邀请码管理', '', 20, 'admin', 'invitation', 'index', '', '', 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` VALUES (23, '广告管理', 'mdi mdi-bulletin-board', 20, 'admin', 'poster', 'index', '', '', 0, 0, 1, '/admin/poster/index', 0, 1, '1', '1', 1627293150, 1627293165);
INSERT INTO `ape_admin_auth` VALUES (24, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (25, '会员管理', '', 24, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (26, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` VALUES (27, '主题管理', '', 26, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (28, '主题商店', '', 26, 'admin', 'theme', 'store', '', '', 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404);
INSERT INTO `ape_admin_auth` VALUES (29, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', '', 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', '', 1613400510, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (30, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', '', 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', '', 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (31, '数据库管理', '', 8, 'admin', 'databases', 'index', '', '', 0, 0, 1, '/admin/databases/index', 0, 1, '1', '', 1635572569, 1635572671);

-- ----------------------------
-- Table structure for ape_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_log`;
CREATE TABLE `ape_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人名字',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------
INSERT INTO `ape_admin_log` VALUES (12, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655280);
INSERT INTO `ape_admin_log` VALUES (13, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655282);
INSERT INTO `ape_admin_log` VALUES (14, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655283);
INSERT INTO `ape_admin_log` VALUES (15, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655658);
INSERT INTO `ape_admin_log` VALUES (16, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655662);
INSERT INTO `ape_admin_log` VALUES (17, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655669);
INSERT INTO `ape_admin_log` VALUES (18, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655672);
INSERT INTO `ape_admin_log` VALUES (19, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655680);
INSERT INTO `ape_admin_log` VALUES (20, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655682);
INSERT INTO `ape_admin_log` VALUES (21, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655684);
INSERT INTO `ape_admin_log` VALUES (22, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655695);
INSERT INTO `ape_admin_log` VALUES (23, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641655696);
INSERT INTO `ape_admin_log` VALUES (24, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656910);
INSERT INTO `ape_admin_log` VALUES (25, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656914);
INSERT INTO `ape_admin_log` VALUES (26, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656915);
INSERT INTO `ape_admin_log` VALUES (27, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656917);
INSERT INTO `ape_admin_log` VALUES (28, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656918);
INSERT INTO `ape_admin_log` VALUES (29, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656919);
INSERT INTO `ape_admin_log` VALUES (30, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656920);
INSERT INTO `ape_admin_log` VALUES (31, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656924);
INSERT INTO `ape_admin_log` VALUES (32, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656977);
INSERT INTO `ape_admin_log` VALUES (33, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641656977);
INSERT INTO `ape_admin_log` VALUES (34, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657035);
INSERT INTO `ape_admin_log` VALUES (35, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657254);
INSERT INTO `ape_admin_log` VALUES (36, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657286);
INSERT INTO `ape_admin_log` VALUES (37, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657379);
INSERT INTO `ape_admin_log` VALUES (38, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657381);
INSERT INTO `ape_admin_log` VALUES (39, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657425);
INSERT INTO `ape_admin_log` VALUES (40, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657767);
INSERT INTO `ape_admin_log` VALUES (41, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657777);
INSERT INTO `ape_admin_log` VALUES (42, 1, 'admin', 'admin', 'theme', 'store', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657778);
INSERT INTO `ape_admin_log` VALUES (43, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657780);
INSERT INTO `ape_admin_log` VALUES (44, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641657813);
INSERT INTO `ape_admin_log` VALUES (45, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658378);
INSERT INTO `ape_admin_log` VALUES (46, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658410);
INSERT INTO `ape_admin_log` VALUES (47, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658418);
INSERT INTO `ape_admin_log` VALUES (48, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658432);
INSERT INTO `ape_admin_log` VALUES (49, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658433);
INSERT INTO `ape_admin_log` VALUES (50, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658436);
INSERT INTO `ape_admin_log` VALUES (51, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658448);
INSERT INTO `ape_admin_log` VALUES (52, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658472);
INSERT INTO `ape_admin_log` VALUES (53, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658484);
INSERT INTO `ape_admin_log` VALUES (54, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658489);
INSERT INTO `ape_admin_log` VALUES (55, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658491);
INSERT INTO `ape_admin_log` VALUES (56, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658498);
INSERT INTO `ape_admin_log` VALUES (57, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658799);
INSERT INTO `ape_admin_log` VALUES (58, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658813);
INSERT INTO `ape_admin_log` VALUES (59, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658828);
INSERT INTO `ape_admin_log` VALUES (60, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658849);
INSERT INTO `ape_admin_log` VALUES (61, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658895);
INSERT INTO `ape_admin_log` VALUES (62, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658904);
INSERT INTO `ape_admin_log` VALUES (63, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658910);
INSERT INTO `ape_admin_log` VALUES (64, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658917);
INSERT INTO `ape_admin_log` VALUES (65, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658918);
INSERT INTO `ape_admin_log` VALUES (66, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658948);
INSERT INTO `ape_admin_log` VALUES (67, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658951);
INSERT INTO `ape_admin_log` VALUES (68, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658972);
INSERT INTO `ape_admin_log` VALUES (69, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658972);
INSERT INTO `ape_admin_log` VALUES (70, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658981);
INSERT INTO `ape_admin_log` VALUES (71, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658983);
INSERT INTO `ape_admin_log` VALUES (72, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641658987);
INSERT INTO `ape_admin_log` VALUES (73, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659148);
INSERT INTO `ape_admin_log` VALUES (74, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659150);
INSERT INTO `ape_admin_log` VALUES (75, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659196);
INSERT INTO `ape_admin_log` VALUES (76, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659198);
INSERT INTO `ape_admin_log` VALUES (77, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659208);
INSERT INTO `ape_admin_log` VALUES (78, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659250);
INSERT INTO `ape_admin_log` VALUES (79, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659251);
INSERT INTO `ape_admin_log` VALUES (80, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659265);
INSERT INTO `ape_admin_log` VALUES (81, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659267);
INSERT INTO `ape_admin_log` VALUES (82, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659353);
INSERT INTO `ape_admin_log` VALUES (83, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659358);
INSERT INTO `ape_admin_log` VALUES (84, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659359);
INSERT INTO `ape_admin_log` VALUES (85, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659363);
INSERT INTO `ape_admin_log` VALUES (86, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659372);
INSERT INTO `ape_admin_log` VALUES (87, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659412);
INSERT INTO `ape_admin_log` VALUES (88, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659431);
INSERT INTO `ape_admin_log` VALUES (89, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659440);
INSERT INTO `ape_admin_log` VALUES (90, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641659455);
INSERT INTO `ape_admin_log` VALUES (91, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641661796);
INSERT INTO `ape_admin_log` VALUES (92, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641661850);
INSERT INTO `ape_admin_log` VALUES (93, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641661901);
INSERT INTO `ape_admin_log` VALUES (94, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641662473);
INSERT INTO `ape_admin_log` VALUES (95, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641662855);
INSERT INTO `ape_admin_log` VALUES (96, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641662925);
INSERT INTO `ape_admin_log` VALUES (97, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641663127);
INSERT INTO `ape_admin_log` VALUES (98, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641663146);
INSERT INTO `ape_admin_log` VALUES (99, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641663160);
INSERT INTO `ape_admin_log` VALUES (100, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641663162);
INSERT INTO `ape_admin_log` VALUES (101, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641741706);
INSERT INTO `ape_admin_log` VALUES (102, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641741706);
INSERT INTO `ape_admin_log` VALUES (103, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747741);
INSERT INTO `ape_admin_log` VALUES (104, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747746);
INSERT INTO `ape_admin_log` VALUES (105, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747753);
INSERT INTO `ape_admin_log` VALUES (106, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747763);
INSERT INTO `ape_admin_log` VALUES (107, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747835);
INSERT INTO `ape_admin_log` VALUES (108, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747836);
INSERT INTO `ape_admin_log` VALUES (109, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747839);
INSERT INTO `ape_admin_log` VALUES (110, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747848);
INSERT INTO `ape_admin_log` VALUES (111, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747859);
INSERT INTO `ape_admin_log` VALUES (112, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 1641747916);

-- ----------------------------
-- Table structure for ape_admin_notify
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_notify`;
CREATE TABLE `ape_admin_notify`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `aid` int(10) NOT NULL COMMENT '管理员ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息来源 谁发的',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_notify
-- ----------------------------

-- ----------------------------
-- Table structure for ape_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_role`;
CREATE TABLE `ape_admin_role`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色状态',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `tree_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_role
-- ----------------------------
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,20,21,22,23,24,25,26,27,28,29', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,20,21,22,23,24,25,26,27,28,29', 0, 1, '1', '1', 1580031132, 1641658902);
INSERT INTO `ape_admin_role` VALUES (2, 0, '普通用户', '17,18,19,20,21,22,23,26,27,28,29', '17,18,19,20,21,22,23,26,27,28,29', 0, 1, '1', '1', 1641393643, 1641659233);

-- ----------------------------
-- Table structure for ape_advert
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert`;
CREATE TABLE `ape_advert`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专区名称',
  `cover_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专区banner图',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专区banner跳转url',
  `position` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '专区位置  默认 1 banner 2顶部页签  3 右侧边栏 ',
  `user_id` int(19) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `sort` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否启用 0不启用 1启用',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职位专区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
INSERT INTO `ape_advert` VALUES (1, 'banner', '/uploads/images/20220109/fdebd2bf797b89b82675476d2af416dd.jpg', 'www.baidu.com', 1, 1, 1, 1, 1641661899, 1641747914);

-- ----------------------------
-- Table structure for ape_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment`;
CREATE TABLE `ape_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件地址',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `mime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mime',
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `storage` int(2) NULL DEFAULT NULL COMMENT '存储方式1本地2腾讯云',
  `create_time` int(10) NOT NULL COMMENT '上传时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
INSERT INTO `ape_attachment` VALUES (1, 1, 'images/20220109\\fdebd2bf797b89b82675476d2af416dd.jpg', '/uploads/images/20220109/fdebd2bf797b89b82675476d2af416dd.jpg', 'images', 'image/jpeg', '1919593', 1, 1641659901, 1641659901);
INSERT INTO `ape_attachment` VALUES (2, 2, 'images/20220109\\759040d44046f0361446d12d1d91788c.jpg', '/uploads/images/20220109/759040d44046f0361446d12d1d91788c.jpg', 'images', 'image/jpeg', '1919593', 1, 1641662533, 1641662533);
INSERT INTO `ape_attachment` VALUES (3, 1, 'images/20220109\\f1e744c5fbc5fef219fd3cecdff35acb.jpg', '/uploads/images/20220109/f1e744c5fbc5fef219fd3cecdff35acb.jpg', 'images', 'image/jpeg', '404022', 1, 1641662658, 1641662658);

-- ----------------------------
-- Table structure for ape_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment_category`;
CREATE TABLE `ape_attachment_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属附件类型',
  `create_user` int(10) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
INSERT INTO `ape_attachment_category` VALUES (1, 0, '广告文件', 'images', 1, 0, 1636649478, 1636649478);
INSERT INTO `ape_attachment_category` VALUES (2, 0, '头像', 'images', 1, 0, 1641150394, 1641150394);

-- ----------------------------
-- Table structure for ape_comment
-- ----------------------------
DROP TABLE IF EXISTS `ape_comment`;
CREATE TABLE `ape_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者姓名',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者邮箱',
  `url` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者网站',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论者内容',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论者ID',
  `cover_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论头像地址',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '评论谁',
  `create_time` int(11) NOT NULL COMMENT '评论时间',
  `document_id` int(11) NOT NULL COMMENT '文章ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 1不显示 1显示',
  `update_time` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ape_document
-- ----------------------------
DROP TABLE IF EXISTS `ape_document`;
CREATE TABLE `ape_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属分类',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `theme` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题模板',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_hot` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否热门',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外链',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `tags` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE,
  INDEX `idx_status_type_pid`(`status`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document
-- ----------------------------
INSERT INTO `ape_document` VALUES (1, 1, '超级管理员', '每日必应图片接口', 1, '/uploads/images/20220109/4cfa2e2d93855ca3d440d3628c416a16.jpg', 'article', '', 1, 1, 1, '', 1, 2, '必应,图片,接口', '<p>每日必应接口</p><p>&nbsp;</p><p>&nbsp;</p><p style=\"text-align: left;\">左对齐</p><p style=\"text-al', '', '', 99, 1641658797, 1641663117, 1, '');

-- ----------------------------
-- Table structure for ape_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_article`;
CREATE TABLE `ape_document_article`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_article
-- ----------------------------
INSERT INTO `ape_document_article` VALUES (1, '<p>每日必应接口</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: left;\">左对齐</p>\r\n<p style=\"text-align: center;\">剧中对齐</p>\r\n<p style=\"text-align: right;\">右对齐</p>\r\n<p style=\"text-align: justify;\">两端对齐</p>\r\n<p style=\"text-align: justify;\"><strong>加粗</strong></p>\r\n<p style=\"text-align: justify;\"><em><strong>斜体</strong></em></p>\r\n<ul>\r\n<li style=\"text-align: justify;\"><em><strong>列表</strong></em></li>\r\n<li style=\"text-align: justify;\"><em><strong>列表</strong></em></li>\r\n<li style=\"text-align: justify;\"><em><strong>列表</strong></em></li>\r\n</ul>\r\n<ol>\r\n<li><em><strong>列表</strong></em></li>\r\n<li><em><strong>列表</strong></em></li>\r\n<li><em><strong>列表</strong></em></li>\r\n</ol>\r\n<p style=\"padding-left: 80px;\"><em><strong>1</strong></em></p>\r\n<p style=\"padding-left: 80px;\"><em><strong>2</strong></em></p>\r\n<p style=\"padding-left: 80px;\"><em><strong>3</strong></em></p>\r\n<p style=\"padding-left: 80px;\"><em><strong><a title=\"百度\" href=\"http://www.baidu.com\">百度</a></strong></em></p>\r\n<p style=\"padding-left: 80px;\">&nbsp;</p>\r\n<p style=\"padding-left: 80px;\"><em><strong><img src=\"../../uploads/image/20220109/2058851ee680c4238560e36e3485e664.jpg\" alt=\"\" width=\"600\" height=\"338\" /></strong></em></p>\r\n<p style=\"padding-left: 80px;\">&nbsp;</p>\r\n<p style=\"padding-left: 80px;\">&nbsp;</p>');

-- ----------------------------
-- Table structure for ape_document_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category`;
CREATE TABLE `ape_document_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `en_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类类别：0列表，1单篇，2链接',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `meta_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分类模板',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外链',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '访问数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
INSERT INTO `ape_document_category` VALUES (1, '编程资料', '编程资料', '', 1, 0, 0, '编程资料', '编程资料', '编程资料', 1, 'list_default.html', '', 3, 0, 1641658482);

-- ----------------------------
-- Table structure for ape_document_category_content
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category_content`;
CREATE TABLE `ape_document_category_content`  (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category_content
-- ----------------------------
INSERT INTO `ape_document_category_content` VALUES (1, '');

-- ----------------------------
-- Table structure for ape_document_product
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_product`;
CREATE TABLE `ape_document_product`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `piclist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品图片集',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '产品价格',
  `market_price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_product
-- ----------------------------

-- ----------------------------
-- Table structure for ape_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ape_friend_link`;
CREATE TABLE `ape_friend_link`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL DEFAULT 1 COMMENT '添加者',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片连接的图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '状态 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友链表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for ape_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `ape_invitation_code`;
CREATE TABLE `ape_invitation_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0未使用 1 使用',
  `uid` int(11) NULL DEFAULT NULL COMMENT '使用用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请码' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_invitation_code
-- ----------------------------

-- ----------------------------
-- Table structure for ape_message_form
-- ----------------------------
DROP TABLE IF EXISTS `ape_message_form`;
CREATE TABLE `ape_message_form`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `is_reply` int(10) NULL DEFAULT 0 COMMENT '回复状态 0未回复',
  `reply_uid` int(10) NULL DEFAULT NULL COMMENT '回复人',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT 1,
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_message_form
-- ----------------------------

-- ----------------------------
-- Table structure for ape_pv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_pv_log`;
CREATE TABLE `ape_pv_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间段',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
INSERT INTO `ape_pv_log` VALUES (1, 23, 14, '2022-01-08', '2022-01-08 23:21:27', '2022-01-08 23:21:27');
INSERT INTO `ape_pv_log` VALUES (2, 0, 10, '2022-01-09', '2022-01-09 00:20:34', '2022-01-09 00:20:34');
INSERT INTO `ape_pv_log` VALUES (3, 1, 24, '2022-01-09', '2022-01-09 01:11:46', '2022-01-09 01:11:46');
INSERT INTO `ape_pv_log` VALUES (4, 23, 6, '2022-01-09', '2022-01-09 23:21:19', '2022-01-09 23:21:19');
INSERT INTO `ape_pv_log` VALUES (5, 1, 12, '2022-01-10', '2022-01-10 01:02:47', '2022-01-10 01:02:47');

-- ----------------------------
-- Table structure for ape_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config`;
CREATE TABLE `ape_system_config`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tab_id` int(8) NOT NULL DEFAULT 0 COMMENT '分组id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题名称',
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单名称',
  `form_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单类型',
  `tag_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签类型',
  `upload_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传配置',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', '', 99, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', '/uploads/images/20220108/ebc3414c8b02c1af2131609616018c0e.png', '', 98, 1, 1, '1', '1', 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '猿博系统', '', 97, 1, 1, '1', '1', 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '猿博系统', '', 96, 1, 1, '1', '1', 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 95, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/uploads/images/20220108/9739e8e4c2cc0d2865f9f1b2475f7da8.png', '', 94, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Power by muzi', '', 93, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', '<a href=\"http://beian.miit.gov.cn\">京ICP备19038953号</a> | <a target=\"_blank\" href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=62062102000138\">甘公网安备62062102000138号</a>', '', 92, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (9, 1, '评论开关', 'comment_close', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (10, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'http://apeblog.io', '', 90, 1, 1, '1', '1', 1588858018, 1582792265);
INSERT INTO `ape_system_config` VALUES (11, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 89, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (12, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'default', '', 88, 1, 1, '1', '1', 1582793563, 1620610858);
INSERT INTO `ape_system_config` VALUES (13, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 87, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (14, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 86, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (15, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n0=>关闭', '0', '', 85, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (16, 1, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '北京市昌平区', '', 84, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (17, 1, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 83, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (18, 1, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 82, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (19, 3, '数据库备份根路径', 'data_backup_path', 'text', 'input', 0, '', './databack/', '路径必须以 / 结尾', 81, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (20, 3, '数据库备份卷大小', 'data_backup_part_size', 'text', 'input', 0, '', '20971520', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 80, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (21, 3, '数据库备份文件是否启用压缩', 'data_backup_compress', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 79, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (22, 3, '数据库备份文件压缩级别', 'data_backup_compress_level', 'text', 'input', 0, '', '4', '数据库备份文件的压缩级别，该配置在开启压缩时生效1:普通\n4:一般\n9:最高', 78, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (23, 1, '微信收款码', 'web_weixin_pay', 'file', 'input', 0, '', '/uploads/images/20220108/bc9076123ad87bfabca390e9fb3c488c.jpg', '微信收款码捐赠使用', 77, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (24, 1, '支付宝收款码', 'web_zhifubao_pay', 'file', 'input', 0, '', '/uploads/images/20220108/934d9383bcefefccbe30bccdc60a03d3.jpg', '支付宝收款码捐赠使用', 76, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (25, 4, '是否登录', 'comment_need_login', 'radio', 'input', 0, '1=>是\n0=>否', '1', '', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (26, 4, '敏感词', 'comment_sensitive_word', 'text', 'input', 0, '', '新疆,华为', '多个逗号隔开', 81, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (27, 1, '评论审核', 'comment_review', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 91, 1, 1, '1', '1', 1583126643, 1582792265);

-- ----------------------------
-- Table structure for ape_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config_tab`;
CREATE TABLE `ape_system_config_tab`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
INSERT INTO `ape_system_config_tab` VALUES (1, '基础配置', 99, 1, '1', '1', 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (2, '上传配置', 98, 1, '1', '1', 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` VALUES (3, '数据库配置', 98, 1, '1', '1', 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` VALUES (4, '留言配置', 99, 1, '1', '1', 1582784937, 1583385482);

-- ----------------------------
-- Table structure for ape_tag
-- ----------------------------
DROP TABLE IF EXISTS `ape_tag`;
CREATE TABLE `ape_tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专区名称',
  `document_id` int(10) NOT NULL DEFAULT 0 COMMENT '文章id',
  `user_id` int(19) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_tag
-- ----------------------------
INSERT INTO `ape_tag` VALUES (13, '必应', 1, 1, 1641663124, 1641663124);
INSERT INTO `ape_tag` VALUES (14, '图片', 1, 1, 1641663124, 1641663124);
INSERT INTO `ape_tag` VALUES (15, '接口', 1, 1, 1641663124, 1641663124);

-- ----------------------------
-- Table structure for ape_url_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_url_log`;
CREATE TABLE `ape_url_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url 受访的页面url',
  `pv` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
INSERT INTO `ape_url_log` VALUES (1, 'http://apeblog.io/', 7, '网站首页', '2022-01-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (2, 'http://apeblog.io/', 16, '网站首页', '2022-01-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (3, 'http://apeblog.io/index/article/detail.html?id=1', 2, '每日必应图片接口', '2022-01-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (4, 'http://apeblog.io/index/article/lists.html?id=1', 3, '编程资料', '2022-01-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (5, 'http://apeblog.io/', 6, '网站首页', '2022-01-10', NULL, NULL);

-- ----------------------------
-- Table structure for ape_user
-- ----------------------------
DROP TABLE IF EXISTS `ape_user`;
CREATE TABLE `ape_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '里程密' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册IP地址',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0启用 1禁用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `is_admin` int(11) NOT NULL DEFAULT 0 COMMENT '是否是管理员',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_email_tel`(`username`, `tel`, `email`) USING BTREE COMMENT '用户名'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_user
-- ----------------------------

-- ----------------------------
-- Table structure for ape_uv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_uv_log`;
CREATE TABLE `ape_uv_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '访问ip',
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Uv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
INSERT INTO `ape_uv_log` VALUES (1, '127.0.0.1', 23, '2022-01-08', '2022-01-08 23:21:27', '2022-01-08 23:21:27');
INSERT INTO `ape_uv_log` VALUES (2, '127.0.0.1', 0, '2022-01-09', '2022-01-09 00:20:34', '2022-01-09 00:20:34');
INSERT INTO `ape_uv_log` VALUES (3, '127.0.0.1', 1, '2022-01-10', '2022-01-10 01:02:47', '2022-01-10 01:02:47');

SET FOREIGN_KEY_CHECKS = 1;
