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

 Date: 15/08/2021 22:20:31
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
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT 0 COMMENT '角色id',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `status` tinyint(1) NOT NULL COMMENT '状态1:正常0冻结',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
INSERT INTO `ape_admin` VALUES (1, 1, 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '', '/uploads/image/20210215/bc6445679240d4795e279860a6ab34e9.jpeg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, NULL, '1', NULL, 1580031132, 1613389670);

-- ----------------------------
-- Table structure for ape_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_auth`;
CREATE TABLE `ape_admin_auth`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父id',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `controller` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名称',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名名称',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `font_family` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体',
  `spreed` tinyint(1) NULL DEFAULT 0 COMMENT 'spreed',
  `is_check` tinyint(1) NULL DEFAULT 0 COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否菜单',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1可用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
INSERT INTO `ape_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, NULL, '1', 1582093161, 1624692439);
INSERT INTO `ape_admin_auth` VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627431);
INSERT INTO `ape_admin_auth` VALUES (5, '用户管理', '', 4, 'admin', 'admin', 'index', '', NULL, 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627443);
INSERT INTO `ape_admin_auth` VALUES (6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', NULL, 0, 0, 1, '/admin/admin_auth/index', 0, 1, NULL, '2', 1582093161, 1613627454);
INSERT INTO `ape_admin_auth` VALUES (7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', NULL, 0, 0, 1, '/admin/admin_role/index', 0, 1, NULL, '1', 1582093161, 1582263652);
INSERT INTO `ape_admin_auth` VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', NULL, 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', NULL, 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', NULL, 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914);
INSERT INTO `ape_admin_auth` VALUES (11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', NULL, 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624);
INSERT INTO `ape_admin_auth` VALUES (12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', NULL, 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680);
INSERT INTO `ape_admin_auth` VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', NULL, 0, 0, 0, '/admin/login/login', 0, 1, '1', NULL, 1582707133, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', NULL, 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', NULL, 1582781658, 1582781667);
INSERT INTO `ape_admin_auth` VALUES (15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', NULL, 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', NULL, 1582781757, 1582781796);
INSERT INTO `ape_admin_auth` VALUES (16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', NULL, 0, 0, 0, '/admin/system_config/email', 0, 1, '1', NULL, 1582781787, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', NULL, 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986);
INSERT INTO `ape_admin_auth` VALUES (18, '文章列表', '', 17, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` VALUES (21, '留言管理', '', 27, 'admin', 'message', 'index', '', NULL, 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` VALUES (23, '分类管理', '', 22, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', NULL, 1613390173, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (24, '幻灯片管理', '', 27, 'admin', 'slides', 'index', '', NULL, 0, 0, 1, '/admin/slides/index', 0, 1, '1', '1', 1613390220, 1613449217);
INSERT INTO `ape_admin_auth` VALUES (25, '文章管理', '', 22, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', NULL, 1613390289, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (26, '文章回收站', '', 22, 'admin', 'article', 'recovery', '', NULL, 0, 0, 1, '/admin/article/recovery', 0, 1, '1', NULL, 1613390366, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (27, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', NULL, 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194);
INSERT INTO `ape_admin_auth` VALUES (28, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (29, '会员管理', '', 28, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (31, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` VALUES (32, '主题管理', '', 31, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (33, '主题商店', '', 31, 'admin', 'theme', 'store', '', NULL, 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404);
INSERT INTO `ape_admin_auth` VALUES (34, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400510, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (35, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (37, '邀请码管理', '', 27, 'admin', 'invitation', 'index', '', NULL, 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` VALUES (38, '广告管理', 'mdi mdi-bulletin-board', 27, 'admin', 'poster', 'index', '', NULL, 0, 0, 1, '/admin/poster/index', 0, 1, '1', '1', 1627293150, 1627293165);

-- ----------------------------
-- Table structure for ape_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_log`;
CREATE TABLE `ape_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL COMMENT '操作人id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名字',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `controller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 725 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------
INSERT INTO `ape_admin_log` VALUES (409, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371932);
INSERT INTO `ape_admin_log` VALUES (410, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371933);
INSERT INTO `ape_admin_log` VALUES (411, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371934);
INSERT INTO `ape_admin_log` VALUES (412, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371940);
INSERT INTO `ape_admin_log` VALUES (413, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371953);
INSERT INTO `ape_admin_log` VALUES (414, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371958);
INSERT INTO `ape_admin_log` VALUES (415, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620371979);
INSERT INTO `ape_admin_log` VALUES (416, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610766);
INSERT INTO `ape_admin_log` VALUES (417, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610767);
INSERT INTO `ape_admin_log` VALUES (418, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610769);
INSERT INTO `ape_admin_log` VALUES (419, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610776);
INSERT INTO `ape_admin_log` VALUES (420, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610779);
INSERT INTO `ape_admin_log` VALUES (421, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610781);
INSERT INTO `ape_admin_log` VALUES (422, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610789);
INSERT INTO `ape_admin_log` VALUES (423, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610790);
INSERT INTO `ape_admin_log` VALUES (424, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610791);
INSERT INTO `ape_admin_log` VALUES (425, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610794);
INSERT INTO `ape_admin_log` VALUES (426, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610796);
INSERT INTO `ape_admin_log` VALUES (427, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610842);
INSERT INTO `ape_admin_log` VALUES (428, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610850);
INSERT INTO `ape_admin_log` VALUES (429, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610852);
INSERT INTO `ape_admin_log` VALUES (430, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610860);
INSERT INTO `ape_admin_log` VALUES (431, 1, 'admin', 'admin', 'theme', 'store', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610866);
INSERT INTO `ape_admin_log` VALUES (432, 1, 'admin', 'admin', 'theme', 'store', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 1620610869);
INSERT INTO `ape_admin_log` VALUES (433, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992090);
INSERT INTO `ape_admin_log` VALUES (434, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992091);
INSERT INTO `ape_admin_log` VALUES (435, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992097);
INSERT INTO `ape_admin_log` VALUES (436, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992097);
INSERT INTO `ape_admin_log` VALUES (437, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992133);
INSERT INTO `ape_admin_log` VALUES (438, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992526);
INSERT INTO `ape_admin_log` VALUES (439, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622992588);
INSERT INTO `ape_admin_log` VALUES (440, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994409);
INSERT INTO `ape_admin_log` VALUES (441, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994447);
INSERT INTO `ape_admin_log` VALUES (442, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994494);
INSERT INTO `ape_admin_log` VALUES (443, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994673);
INSERT INTO `ape_admin_log` VALUES (444, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994837);
INSERT INTO `ape_admin_log` VALUES (445, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994864);
INSERT INTO `ape_admin_log` VALUES (446, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622994880);
INSERT INTO `ape_admin_log` VALUES (447, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995423);
INSERT INTO `ape_admin_log` VALUES (448, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995442);
INSERT INTO `ape_admin_log` VALUES (449, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995675);
INSERT INTO `ape_admin_log` VALUES (450, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995718);
INSERT INTO `ape_admin_log` VALUES (451, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995727);
INSERT INTO `ape_admin_log` VALUES (452, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995758);
INSERT INTO `ape_admin_log` VALUES (453, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995772);
INSERT INTO `ape_admin_log` VALUES (454, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995802);
INSERT INTO `ape_admin_log` VALUES (455, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995854);
INSERT INTO `ape_admin_log` VALUES (456, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995864);
INSERT INTO `ape_admin_log` VALUES (457, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995878);
INSERT INTO `ape_admin_log` VALUES (458, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622995893);
INSERT INTO `ape_admin_log` VALUES (459, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1622996083);
INSERT INTO `ape_admin_log` VALUES (460, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1623593844);
INSERT INTO `ape_admin_log` VALUES (461, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 1623595804);
INSERT INTO `ape_admin_log` VALUES (462, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692421);
INSERT INTO `ape_admin_log` VALUES (463, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692422);
INSERT INTO `ape_admin_log` VALUES (464, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692426);
INSERT INTO `ape_admin_log` VALUES (465, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692427);
INSERT INTO `ape_admin_log` VALUES (466, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692441);
INSERT INTO `ape_admin_log` VALUES (467, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692490);
INSERT INTO `ape_admin_log` VALUES (468, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692492);
INSERT INTO `ape_admin_log` VALUES (469, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692494);
INSERT INTO `ape_admin_log` VALUES (470, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692496);
INSERT INTO `ape_admin_log` VALUES (471, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692497);
INSERT INTO `ape_admin_log` VALUES (472, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692498);
INSERT INTO `ape_admin_log` VALUES (473, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624692499);
INSERT INTO `ape_admin_log` VALUES (474, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624693473);
INSERT INTO `ape_admin_log` VALUES (475, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624693485);
INSERT INTO `ape_admin_log` VALUES (476, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624716192);
INSERT INTO `ape_admin_log` VALUES (477, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.59', 1624717353);
INSERT INTO `ape_admin_log` VALUES (478, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626661900);
INSERT INTO `ape_admin_log` VALUES (479, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626661900);
INSERT INTO `ape_admin_log` VALUES (480, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626661907);
INSERT INTO `ape_admin_log` VALUES (481, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626661948);
INSERT INTO `ape_admin_log` VALUES (482, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626661960);
INSERT INTO `ape_admin_log` VALUES (483, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626673286);
INSERT INTO `ape_admin_log` VALUES (484, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626673290);
INSERT INTO `ape_admin_log` VALUES (485, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626673293);
INSERT INTO `ape_admin_log` VALUES (486, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 1626674143);
INSERT INTO `ape_admin_log` VALUES (487, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270615);
INSERT INTO `ape_admin_log` VALUES (488, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270616);
INSERT INTO `ape_admin_log` VALUES (489, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270620);
INSERT INTO `ape_admin_log` VALUES (490, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270621);
INSERT INTO `ape_admin_log` VALUES (491, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270622);
INSERT INTO `ape_admin_log` VALUES (492, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270625);
INSERT INTO `ape_admin_log` VALUES (493, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270651);
INSERT INTO `ape_admin_log` VALUES (494, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270736);
INSERT INTO `ape_admin_log` VALUES (495, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270746);
INSERT INTO `ape_admin_log` VALUES (496, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270878);
INSERT INTO `ape_admin_log` VALUES (497, 1, 'admin', 'admin', 'theme', 'store', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627270880);
INSERT INTO `ape_admin_log` VALUES (498, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271008);
INSERT INTO `ape_admin_log` VALUES (499, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271025);
INSERT INTO `ape_admin_log` VALUES (500, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271032);
INSERT INTO `ape_admin_log` VALUES (501, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271035);
INSERT INTO `ape_admin_log` VALUES (502, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271038);
INSERT INTO `ape_admin_log` VALUES (503, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271042);
INSERT INTO `ape_admin_log` VALUES (504, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271052);
INSERT INTO `ape_admin_log` VALUES (505, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271687);
INSERT INTO `ape_admin_log` VALUES (506, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627271690);
INSERT INTO `ape_admin_log` VALUES (507, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627293152);
INSERT INTO `ape_admin_log` VALUES (508, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627293167);
INSERT INTO `ape_admin_log` VALUES (509, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295662);
INSERT INTO `ape_admin_log` VALUES (510, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295664);
INSERT INTO `ape_admin_log` VALUES (511, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295666);
INSERT INTO `ape_admin_log` VALUES (512, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295666);
INSERT INTO `ape_admin_log` VALUES (513, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295771);
INSERT INTO `ape_admin_log` VALUES (514, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295923);
INSERT INTO `ape_admin_log` VALUES (515, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295929);
INSERT INTO `ape_admin_log` VALUES (516, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295932);
INSERT INTO `ape_admin_log` VALUES (517, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295936);
INSERT INTO `ape_admin_log` VALUES (518, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295941);
INSERT INTO `ape_admin_log` VALUES (519, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295945);
INSERT INTO `ape_admin_log` VALUES (520, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295947);
INSERT INTO `ape_admin_log` VALUES (521, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295949);
INSERT INTO `ape_admin_log` VALUES (522, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295954);
INSERT INTO `ape_admin_log` VALUES (523, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295958);
INSERT INTO `ape_admin_log` VALUES (524, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295965);
INSERT INTO `ape_admin_log` VALUES (525, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295975);
INSERT INTO `ape_admin_log` VALUES (526, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295979);
INSERT INTO `ape_admin_log` VALUES (527, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295982);
INSERT INTO `ape_admin_log` VALUES (528, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295984);
INSERT INTO `ape_admin_log` VALUES (529, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627295992);
INSERT INTO `ape_admin_log` VALUES (530, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296009);
INSERT INTO `ape_admin_log` VALUES (531, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296029);
INSERT INTO `ape_admin_log` VALUES (532, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296029);
INSERT INTO `ape_admin_log` VALUES (533, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296033);
INSERT INTO `ape_admin_log` VALUES (534, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296033);
INSERT INTO `ape_admin_log` VALUES (535, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296034);
INSERT INTO `ape_admin_log` VALUES (536, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296040);
INSERT INTO `ape_admin_log` VALUES (537, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296051);
INSERT INTO `ape_admin_log` VALUES (538, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296566);
INSERT INTO `ape_admin_log` VALUES (539, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296584);
INSERT INTO `ape_admin_log` VALUES (540, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296586);
INSERT INTO `ape_admin_log` VALUES (541, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296586);
INSERT INTO `ape_admin_log` VALUES (542, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296586);
INSERT INTO `ape_admin_log` VALUES (543, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (544, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (545, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (546, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (547, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (548, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296587);
INSERT INTO `ape_admin_log` VALUES (549, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296588);
INSERT INTO `ape_admin_log` VALUES (550, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296588);
INSERT INTO `ape_admin_log` VALUES (551, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296588);
INSERT INTO `ape_admin_log` VALUES (552, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296588);
INSERT INTO `ape_admin_log` VALUES (553, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296588);
INSERT INTO `ape_admin_log` VALUES (554, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296589);
INSERT INTO `ape_admin_log` VALUES (555, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296589);
INSERT INTO `ape_admin_log` VALUES (556, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296589);
INSERT INTO `ape_admin_log` VALUES (557, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296589);
INSERT INTO `ape_admin_log` VALUES (558, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296589);
INSERT INTO `ape_admin_log` VALUES (559, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296590);
INSERT INTO `ape_admin_log` VALUES (560, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296590);
INSERT INTO `ape_admin_log` VALUES (561, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296593);
INSERT INTO `ape_admin_log` VALUES (562, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296594);
INSERT INTO `ape_admin_log` VALUES (563, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296595);
INSERT INTO `ape_admin_log` VALUES (564, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296612);
INSERT INTO `ape_admin_log` VALUES (565, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296614);
INSERT INTO `ape_admin_log` VALUES (566, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296665);
INSERT INTO `ape_admin_log` VALUES (567, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296666);
INSERT INTO `ape_admin_log` VALUES (568, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296671);
INSERT INTO `ape_admin_log` VALUES (569, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296777);
INSERT INTO `ape_admin_log` VALUES (570, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296821);
INSERT INTO `ape_admin_log` VALUES (571, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296826);
INSERT INTO `ape_admin_log` VALUES (572, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296858);
INSERT INTO `ape_admin_log` VALUES (573, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296874);
INSERT INTO `ape_admin_log` VALUES (574, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296885);
INSERT INTO `ape_admin_log` VALUES (575, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296888);
INSERT INTO `ape_admin_log` VALUES (576, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296888);
INSERT INTO `ape_admin_log` VALUES (577, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296897);
INSERT INTO `ape_admin_log` VALUES (578, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627296976);
INSERT INTO `ape_admin_log` VALUES (579, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627297028);
INSERT INTO `ape_admin_log` VALUES (580, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627297473);
INSERT INTO `ape_admin_log` VALUES (581, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627297531);
INSERT INTO `ape_admin_log` VALUES (582, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627297542);
INSERT INTO `ape_admin_log` VALUES (583, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298194);
INSERT INTO `ape_admin_log` VALUES (584, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298722);
INSERT INTO `ape_admin_log` VALUES (585, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298724);
INSERT INTO `ape_admin_log` VALUES (586, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298784);
INSERT INTO `ape_admin_log` VALUES (587, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298814);
INSERT INTO `ape_admin_log` VALUES (588, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627298870);
INSERT INTO `ape_admin_log` VALUES (589, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627301354);
INSERT INTO `ape_admin_log` VALUES (590, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627301542);
INSERT INTO `ape_admin_log` VALUES (591, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627301557);
INSERT INTO `ape_admin_log` VALUES (592, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627301570);
INSERT INTO `ape_admin_log` VALUES (593, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312064);
INSERT INTO `ape_admin_log` VALUES (594, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312067);
INSERT INTO `ape_admin_log` VALUES (595, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312068);
INSERT INTO `ape_admin_log` VALUES (596, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312068);
INSERT INTO `ape_admin_log` VALUES (597, 1, 'admin', 'admin', 'advert', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312072);
INSERT INTO `ape_admin_log` VALUES (598, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312270);
INSERT INTO `ape_admin_log` VALUES (599, 1, 'admin', 'admin', 'ad_info', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312395);
INSERT INTO `ape_admin_log` VALUES (600, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312402);
INSERT INTO `ape_admin_log` VALUES (601, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312418);
INSERT INTO `ape_admin_log` VALUES (602, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312428);
INSERT INTO `ape_admin_log` VALUES (603, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312428);
INSERT INTO `ape_admin_log` VALUES (604, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312462);
INSERT INTO `ape_admin_log` VALUES (605, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312482);
INSERT INTO `ape_admin_log` VALUES (606, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312491);
INSERT INTO `ape_admin_log` VALUES (607, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312491);
INSERT INTO `ape_admin_log` VALUES (608, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312522);
INSERT INTO `ape_admin_log` VALUES (609, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312536);
INSERT INTO `ape_admin_log` VALUES (610, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312536);
INSERT INTO `ape_admin_log` VALUES (611, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312567);
INSERT INTO `ape_admin_log` VALUES (612, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312568);
INSERT INTO `ape_admin_log` VALUES (613, 1, 'admin', 'admin', 'ad_info', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312573);
INSERT INTO `ape_admin_log` VALUES (614, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312582);
INSERT INTO `ape_admin_log` VALUES (615, 1, 'admin', 'admin', 'ad_info', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312607);
INSERT INTO `ape_admin_log` VALUES (616, 1, 'admin', 'admin', 'ad_info', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312622);
INSERT INTO `ape_admin_log` VALUES (617, 1, 'admin', 'admin', 'ad_info', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312625);
INSERT INTO `ape_admin_log` VALUES (618, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312626);
INSERT INTO `ape_admin_log` VALUES (619, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312781);
INSERT INTO `ape_admin_log` VALUES (620, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312798);
INSERT INTO `ape_admin_log` VALUES (621, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312799);
INSERT INTO `ape_admin_log` VALUES (622, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312833);
INSERT INTO `ape_admin_log` VALUES (623, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312833);
INSERT INTO `ape_admin_log` VALUES (624, 1, 'admin', 'admin', 'banner', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627312836);
INSERT INTO `ape_admin_log` VALUES (625, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627313381);
INSERT INTO `ape_admin_log` VALUES (626, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627313386);
INSERT INTO `ape_admin_log` VALUES (627, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627313408);
INSERT INTO `ape_admin_log` VALUES (628, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627313408);
INSERT INTO `ape_admin_log` VALUES (629, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627313411);
INSERT INTO `ape_admin_log` VALUES (630, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627393923);
INSERT INTO `ape_admin_log` VALUES (631, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 1627393923);
INSERT INTO `ape_admin_log` VALUES (632, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628344422);
INSERT INTO `ape_admin_log` VALUES (633, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628344423);
INSERT INTO `ape_admin_log` VALUES (634, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628344430);
INSERT INTO `ape_admin_log` VALUES (635, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628344578);
INSERT INTO `ape_admin_log` VALUES (636, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628347197);
INSERT INTO `ape_admin_log` VALUES (637, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628347263);
INSERT INTO `ape_admin_log` VALUES (638, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628347265);
INSERT INTO `ape_admin_log` VALUES (639, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349179);
INSERT INTO `ape_admin_log` VALUES (640, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349181);
INSERT INTO `ape_admin_log` VALUES (641, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349297);
INSERT INTO `ape_admin_log` VALUES (642, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349443);
INSERT INTO `ape_admin_log` VALUES (643, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349463);
INSERT INTO `ape_admin_log` VALUES (644, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349529);
INSERT INTO `ape_admin_log` VALUES (645, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349617);
INSERT INTO `ape_admin_log` VALUES (646, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349634);
INSERT INTO `ape_admin_log` VALUES (647, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349651);
INSERT INTO `ape_admin_log` VALUES (648, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628349662);
INSERT INTO `ape_admin_log` VALUES (649, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628354699);
INSERT INTO `ape_admin_log` VALUES (650, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628354703);
INSERT INTO `ape_admin_log` VALUES (651, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628354710);
INSERT INTO `ape_admin_log` VALUES (652, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628354713);
INSERT INTO `ape_admin_log` VALUES (653, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628355484);
INSERT INTO `ape_admin_log` VALUES (654, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628355493);
INSERT INTO `ape_admin_log` VALUES (655, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628355494);
INSERT INTO `ape_admin_log` VALUES (656, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628355508);
INSERT INTO `ape_admin_log` VALUES (657, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628442267);
INSERT INTO `ape_admin_log` VALUES (658, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628442267);
INSERT INTO `ape_admin_log` VALUES (659, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628442274);
INSERT INTO `ape_admin_log` VALUES (660, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628442282);
INSERT INTO `ape_admin_log` VALUES (661, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628442292);
INSERT INTO `ape_admin_log` VALUES (662, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523356);
INSERT INTO `ape_admin_log` VALUES (663, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523356);
INSERT INTO `ape_admin_log` VALUES (664, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523360);
INSERT INTO `ape_admin_log` VALUES (665, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523361);
INSERT INTO `ape_admin_log` VALUES (666, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523362);
INSERT INTO `ape_admin_log` VALUES (667, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523364);
INSERT INTO `ape_admin_log` VALUES (668, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523366);
INSERT INTO `ape_admin_log` VALUES (669, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523367);
INSERT INTO `ape_admin_log` VALUES (670, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523369);
INSERT INTO `ape_admin_log` VALUES (671, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523369);
INSERT INTO `ape_admin_log` VALUES (672, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523370);
INSERT INTO `ape_admin_log` VALUES (673, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523373);
INSERT INTO `ape_admin_log` VALUES (674, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523374);
INSERT INTO `ape_admin_log` VALUES (675, 1, 'admin', 'admin', 'theme', 'store', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523375);
INSERT INTO `ape_admin_log` VALUES (676, 1, 'admin', 'admin', 'friendlink', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523378);
INSERT INTO `ape_admin_log` VALUES (677, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523400);
INSERT INTO `ape_admin_log` VALUES (678, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36 Edg/92.0.902.67', 1628523402);
INSERT INTO `ape_admin_log` VALUES (679, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783548);
INSERT INTO `ape_admin_log` VALUES (680, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783549);
INSERT INTO `ape_admin_log` VALUES (681, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783563);
INSERT INTO `ape_admin_log` VALUES (682, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783565);
INSERT INTO `ape_admin_log` VALUES (683, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783566);
INSERT INTO `ape_admin_log` VALUES (684, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783623);
INSERT INTO `ape_admin_log` VALUES (685, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783626);
INSERT INTO `ape_admin_log` VALUES (686, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783632);
INSERT INTO `ape_admin_log` VALUES (687, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783714);
INSERT INTO `ape_admin_log` VALUES (688, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783715);
INSERT INTO `ape_admin_log` VALUES (689, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783719);
INSERT INTO `ape_admin_log` VALUES (690, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783726);
INSERT INTO `ape_admin_log` VALUES (691, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783728);
INSERT INTO `ape_admin_log` VALUES (692, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783728);
INSERT INTO `ape_admin_log` VALUES (693, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783789);
INSERT INTO `ape_admin_log` VALUES (694, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783811);
INSERT INTO `ape_admin_log` VALUES (695, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783812);
INSERT INTO `ape_admin_log` VALUES (696, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783813);
INSERT INTO `ape_admin_log` VALUES (697, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783814);
INSERT INTO `ape_admin_log` VALUES (698, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783891);
INSERT INTO `ape_admin_log` VALUES (699, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783896);
INSERT INTO `ape_admin_log` VALUES (700, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628783897);
INSERT INTO `ape_admin_log` VALUES (701, 1, 'admin', 'admin', 'theme', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628784092);
INSERT INTO `ape_admin_log` VALUES (702, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628784297);
INSERT INTO `ape_admin_log` VALUES (703, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628784485);
INSERT INTO `ape_admin_log` VALUES (704, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628784662);
INSERT INTO `ape_admin_log` VALUES (705, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628784865);
INSERT INTO `ape_admin_log` VALUES (706, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786030);
INSERT INTO `ape_admin_log` VALUES (707, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786051);
INSERT INTO `ape_admin_log` VALUES (708, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786052);
INSERT INTO `ape_admin_log` VALUES (709, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786055);
INSERT INTO `ape_admin_log` VALUES (710, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786056);
INSERT INTO `ape_admin_log` VALUES (711, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786058);
INSERT INTO `ape_admin_log` VALUES (712, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786060);
INSERT INTO `ape_admin_log` VALUES (713, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786332);
INSERT INTO `ape_admin_log` VALUES (714, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786336);
INSERT INTO `ape_admin_log` VALUES (715, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786344);
INSERT INTO `ape_admin_log` VALUES (716, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786356);
INSERT INTO `ape_admin_log` VALUES (717, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786388);
INSERT INTO `ape_admin_log` VALUES (718, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786427);
INSERT INTO `ape_admin_log` VALUES (719, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628786550);
INSERT INTO `ape_admin_log` VALUES (720, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628787120);
INSERT INTO `ape_admin_log` VALUES (721, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628787131);
INSERT INTO `ape_admin_log` VALUES (722, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628787386);
INSERT INTO `ape_admin_log` VALUES (723, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628787453);
INSERT INTO `ape_admin_log` VALUES (724, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', 1628787456);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_role
-- ----------------------------
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', 0, 1, '1', '1', 1580031132, 1627296049);

-- ----------------------------
-- Table structure for ape_advert
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert`;
CREATE TABLE `ape_advert`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '专区名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专区banner图',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专区banner跳转url',
  `position` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '专区位置  默认 1 1 顶部页签  2 右侧边栏',
  `user_id` int(19) NULL DEFAULT NULL COMMENT '操作人id',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `sort` int(2) NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '是否启用 0不启用 1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职位专区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
INSERT INTO `ape_advert` VALUES (17, '粽情端午', '/uploads/images/20210726\\14c25515c377028f274c93f79b7d11bd.jpg', 'https://hewa.cn/mainSwiperContent.html?swiperId=s014#/', 1, 32, '2021-05-31 11:01:58', '2021-07-26 20:12:19', 0, 1);
INSERT INTO `ape_advert` VALUES (18, '用友专区', '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'https://hewa.cn/recommend.html?codes=40d701c08594baf68833ae14f28f00e0', 2, 61, '2021-06-03 10:54:13', '2021-08-13 00:52:10', 0, 1);
INSERT INTO `ape_advert` VALUES (19, '胖达', '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'https://hewa.cn/recommend.html?codes=4295911b01a686aafb717f0ea4abab9b', 2, 61, '2021-07-05 15:19:18', '2021-08-13 00:52:15', 0, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
INSERT INTO `ape_attachment` VALUES (1, 2, '816417fae9785c2efa62bdb96327dc79.jpg', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', 'images', 'image/jpeg', '1919593', 1, 1622992555, 1622992555);
INSERT INTO `ape_attachment` VALUES (2, 2, '045f1d01edbd194f80f0b9fb28e35844.jpg', '/uploads/images/20210606\\045f1d01edbd194f80f0b9fb28e35844.jpg', 'images', 'image/jpeg', '4766893', 1, 1622992566, 1622992566);
INSERT INTO `ape_attachment` VALUES (3, 0, '1254252dcceb7a92a18dbe71e8a51ee8.jpg', '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'images', 'image/jpeg', '560215', 1, 1622994431, 1622994431);
INSERT INTO `ape_attachment` VALUES (4, 0, 'e7f65d07dda7d50d3464349ead6a5eb1.png', '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'images', 'image/png', '387019', 1, 1622995792, 1622995792);
INSERT INTO `ape_attachment` VALUES (5, 3, '96125961627bc5768065fdb4ed7cded1.jpg', '/uploads/images/20210726\\96125961627bc5768065fdb4ed7cded1.jpg', 'images', 'image/jpeg', '21029', 1, 1627301501, 1627301501);
INSERT INTO `ape_attachment` VALUES (6, 3, '14c25515c377028f274c93f79b7d11bd.jpg', '/uploads/images/20210726\\14c25515c377028f274c93f79b7d11bd.jpg', 'images', 'image/jpeg', '1602752', 1, 1627301511, 1627301511);

-- ----------------------------
-- Table structure for ape_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment_category`;
CREATE TABLE `ape_attachment_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属附件类型',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
INSERT INTO `ape_attachment_category` VALUES (1, 0, '用户头像', 'images', '1', NULL, 1613799617, 1613799617);
INSERT INTO `ape_attachment_category` VALUES (2, 0, 'banner', 'images', '1', NULL, 1622992546, 1622992546);
INSERT INTO `ape_attachment_category` VALUES (3, 0, '广告', 'images', '1', NULL, 1627301484, 1627301484);

-- ----------------------------
-- Table structure for ape_document
-- ----------------------------
DROP TABLE IF EXISTS `ape_document`;
CREATE TABLE `ape_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '封面',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `theme` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题模板',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_hot` tinyint(4) NULL DEFAULT 0 COMMENT '是否热门',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '外链',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `tags` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE,
  INDEX `idx_status_type_pid`(`status`, `uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document
-- ----------------------------
INSERT INTO `ape_document` VALUES (1, 1, '超级管理员', '特种兵之霹雳火', 3, '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'article', '', 1, 1, 1, '', 1, 59, '111', '11', '', '', 99, 1622994445, 1624693478, 1, NULL);
INSERT INTO `ape_document` VALUES (2, 1, '超级管理员', '111111111111111', 3, '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'article', '', 1, 1, 1, '', 1, 93, '', '', '', '', 99, 1622995800, 1624693479, 1, NULL);

-- ----------------------------
-- Table structure for ape_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_article`;
CREATE TABLE `ape_document_article`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_article
-- ----------------------------
INSERT INTO `ape_document_article` VALUES (2, '<p>啊水水顶顶顶顶顶大师的帆帆帆帆帆帆帆帆 对方灌灌灌灌灌灌灌灌灌灌灌灌</p>');
INSERT INTO `ape_document_article` VALUES (1, '<ul style=\"list-style-type: square;\">\r\n<li style=\"text-align: left;\"><sub><span style=\"text-decoration: line-through;\">2131312</span></sub></li>\r\n</ul>\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>');

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
  `template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分类模板',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外链',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '访问数',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
INSERT INTO `ape_document_category` VALUES (3, '编程资料', '', '', 1, 0, 0, '', '', '', 'list_default.html', '', 79, 1, 1617634005, 1617634005, 1);

-- ----------------------------
-- Table structure for ape_document_category_content
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category_content`;
CREATE TABLE `ape_document_category_content`  (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category_content
-- ----------------------------
INSERT INTO `ape_document_category_content` VALUES (3, '');

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
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_friend_link
-- ----------------------------
INSERT INTO `ape_friend_link` VALUES (1, 1, '源码云', 'www.apecloud.cn', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', '猿码云', 99, 1626661946, 1626661957, 1);

-- ----------------------------
-- Table structure for ape_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `ape_invitation_code`;
CREATE TABLE `ape_invitation_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0未使用 1 使用',
  `user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请码' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_invitation_code
-- ----------------------------
INSERT INTO `ape_invitation_code` VALUES (14, 'demo8038224376', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (15, 'demo8038227462', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (16, 'demo8038226823', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (17, 'demo8038229091', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (18, 'demo8038224412', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (19, 'demo8038226410', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (20, 'demo8038225806', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (21, 'demo8038224342', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (22, 'demo8038227448', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (23, 'demo8038223733', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (24, 'demo8038227281', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (25, 'demo8038227782', 0, '1', 1613803822, 1613803822);

-- ----------------------------
-- Table structure for ape_message_form
-- ----------------------------
DROP TABLE IF EXISTS `ape_message_form`;
CREATE TABLE `ape_message_form`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `is_reply` int(10) NULL DEFAULT 0 COMMENT '回复状态 0未回复',
  `reply_uid` int(10) NULL DEFAULT NULL COMMENT '回复人',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT 1,
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
INSERT INTO `ape_pv_log` VALUES (1, 23, 4, '2021-05-09', '2021-05-09 23:39:46', '2021-05-09 23:39:46');
INSERT INTO `ape_pv_log` VALUES (2, 9, 1, '2021-05-10', '2021-05-10 09:38:58', '2021-05-10 09:38:58');
INSERT INTO `ape_pv_log` VALUES (3, 10, 11, '2021-05-11', '2021-05-11 10:08:49', '2021-05-11 10:08:49');
INSERT INTO `ape_pv_log` VALUES (4, 9, 5, '2021-05-26', '2021-05-26 09:47:24', '2021-05-26 09:47:24');
INSERT INTO `ape_pv_log` VALUES (5, 12, 8, '2021-05-29', '2021-05-29 12:02:49', '2021-05-29 12:02:49');
INSERT INTO `ape_pv_log` VALUES (6, 22, 3, '2021-06-06', '2021-06-06 22:41:30', '2021-06-06 22:41:30');
INSERT INTO `ape_pv_log` VALUES (7, 23, 19, '2021-06-06', '2021-06-06 23:05:56', '2021-06-06 23:05:56');
INSERT INTO `ape_pv_log` VALUES (8, 0, 4, '2021-06-07', '2021-06-07 00:15:14', '2021-06-07 00:15:14');
INSERT INTO `ape_pv_log` VALUES (9, 22, 2, '2021-06-13', '2021-06-13 22:17:06', '2021-06-13 22:17:06');
INSERT INTO `ape_pv_log` VALUES (10, 23, 2, '2021-06-13', '2021-06-13 23:05:26', '2021-06-13 23:05:26');
INSERT INTO `ape_pv_log` VALUES (11, 14, 2, '2021-06-26', '2021-06-26 14:44:29', '2021-06-26 14:44:29');
INSERT INTO `ape_pv_log` VALUES (12, 16, 4, '2021-06-27', '2021-06-27 16:53:44', '2021-06-27 16:53:44');
INSERT INTO `ape_pv_log` VALUES (13, 17, 1, '2021-06-27', '2021-06-27 17:05:26', '2021-06-27 17:05:26');
INSERT INTO `ape_pv_log` VALUES (14, 21, 10, '2021-06-27', '2021-06-27 21:00:29', '2021-06-27 21:00:29');
INSERT INTO `ape_pv_log` VALUES (15, 23, 26, '2021-06-27', '2021-06-27 23:19:00', '2021-06-27 23:19:00');
INSERT INTO `ape_pv_log` VALUES (16, 0, 59, '2021-06-28', '2021-06-28 00:03:15', '2021-06-28 00:03:15');
INSERT INTO `ape_pv_log` VALUES (17, 15, 2, '2021-07-01', '2021-07-01 15:59:21', '2021-07-01 15:59:21');
INSERT INTO `ape_pv_log` VALUES (18, 17, 8596, '2021-07-01', '2021-07-01 17:30:40', '2021-07-01 17:30:40');
INSERT INTO `ape_pv_log` VALUES (19, 16, 4, '2021-07-04', '2021-07-04 16:19:41', '2021-07-04 16:19:41');
INSERT INTO `ape_pv_log` VALUES (20, 17, 2, '2021-07-04', '2021-07-04 17:39:05', '2021-07-04 17:39:05');
INSERT INTO `ape_pv_log` VALUES (21, 23, 8, '2021-07-04', '2021-07-04 23:33:29', '2021-07-04 23:33:29');
INSERT INTO `ape_pv_log` VALUES (22, 16, 7, '2021-07-15', '2021-07-15 16:54:59', '2021-07-15 16:54:59');
INSERT INTO `ape_pv_log` VALUES (23, 17, 2, '2021-07-15', '2021-07-15 17:00:12', '2021-07-15 17:00:12');
INSERT INTO `ape_pv_log` VALUES (24, 22, 2, '2021-07-18', '2021-07-18 22:56:03', '2021-07-18 22:56:03');
INSERT INTO `ape_pv_log` VALUES (25, 10, 12, '2021-07-19', '2021-07-19 10:23:43', '2021-07-19 10:23:43');
INSERT INTO `ape_pv_log` VALUES (26, 14, 2, '2021-07-19', '2021-07-19 14:48:56', '2021-07-19 14:48:56');
INSERT INTO `ape_pv_log` VALUES (27, 15, 4, '2021-07-19', '2021-07-19 15:11:43', '2021-07-19 15:11:43');
INSERT INTO `ape_pv_log` VALUES (28, 20, 2, '2021-07-24', '2021-07-24 20:48:23', '2021-07-24 20:48:23');
INSERT INTO `ape_pv_log` VALUES (29, 10, 4, '2021-07-26', '2021-07-26 10:37:44', '2021-07-26 10:37:44');
INSERT INTO `ape_pv_log` VALUES (30, 11, 10, '2021-07-26', '2021-07-26 11:00:02', '2021-07-26 11:00:02');
INSERT INTO `ape_pv_log` VALUES (31, 10, 3, '2021-07-27', '2021-07-27 10:09:47', '2021-07-27 10:09:47');
INSERT INTO `ape_pv_log` VALUES (32, 21, 2, '2021-07-27', '2021-07-27 21:52:10', '2021-07-27 21:52:10');
INSERT INTO `ape_pv_log` VALUES (33, 22, 25, '2021-07-27', '2021-07-27 22:08:57', '2021-07-27 22:08:57');
INSERT INTO `ape_pv_log` VALUES (34, 23, 21, '2021-07-27', '2021-07-27 23:24:16', '2021-07-27 23:24:16');
INSERT INTO `ape_pv_log` VALUES (35, 18, 2, '2021-08-01', '2021-08-01 18:43:52', '2021-08-01 18:43:52');
INSERT INTO `ape_pv_log` VALUES (36, 21, 3, '2021-08-07', '2021-08-07 21:46:26', '2021-08-07 21:46:26');
INSERT INTO `ape_pv_log` VALUES (37, 22, 7, '2021-08-07', '2021-08-07 22:41:07', '2021-08-07 22:41:07');
INSERT INTO `ape_pv_log` VALUES (38, 23, 52, '2021-08-07', '2021-08-07 23:00:22', '2021-08-07 23:00:22');
INSERT INTO `ape_pv_log` VALUES (39, 0, 124, '2021-08-08', '2021-08-08 00:11:30', '2021-08-08 00:11:30');
INSERT INTO `ape_pv_log` VALUES (40, 1, 6, '2021-08-08', '2021-08-08 01:00:11', '2021-08-08 01:00:11');
INSERT INTO `ape_pv_log` VALUES (41, 16, 66, '2021-08-08', '2021-08-08 16:28:43', '2021-08-08 16:28:43');
INSERT INTO `ape_pv_log` VALUES (42, 22, 52, '2021-08-08', '2021-08-08 22:31:51', '2021-08-08 22:31:51');
INSERT INTO `ape_pv_log` VALUES (43, 23, 22, '2021-08-08', '2021-08-08 23:35:51', '2021-08-08 23:35:51');
INSERT INTO `ape_pv_log` VALUES (44, 0, 147, '2021-08-09', '2021-08-09 00:00:19', '2021-08-09 00:00:19');
INSERT INTO `ape_pv_log` VALUES (45, 1, 26, '2021-08-09', '2021-08-09 01:00:53', '2021-08-09 01:00:53');
INSERT INTO `ape_pv_log` VALUES (46, 22, 1, '2021-08-09', '2021-08-09 22:38:14', '2021-08-09 22:38:14');
INSERT INTO `ape_pv_log` VALUES (47, 23, 10, '2021-08-09', '2021-08-09 23:12:04', '2021-08-09 23:12:04');
INSERT INTO `ape_pv_log` VALUES (48, 23, 20, '2021-08-11', '2021-08-11 23:55:40', '2021-08-11 23:55:40');
INSERT INTO `ape_pv_log` VALUES (49, 23, 9, '2021-08-12', '2021-08-12 23:27:49', '2021-08-12 23:27:49');
INSERT INTO `ape_pv_log` VALUES (50, 0, 22, '2021-08-13', '2021-08-13 00:34:57', '2021-08-13 00:34:57');
INSERT INTO `ape_pv_log` VALUES (51, 14, 10, '2021-08-15', '2021-08-15 14:38:55', '2021-08-15 14:38:55');
INSERT INTO `ape_pv_log` VALUES (52, 18, 2, '2021-08-15', '2021-08-15 18:46:12', '2021-08-15 18:46:12');
INSERT INTO `ape_pv_log` VALUES (53, 19, 32, '2021-08-15', '2021-08-15 19:04:41', '2021-08-15 19:04:41');
INSERT INTO `ape_pv_log` VALUES (54, 20, 19, '2021-08-15', '2021-08-15 20:06:19', '2021-08-15 20:06:19');
INSERT INTO `ape_pv_log` VALUES (55, 21, 14, '2021-08-15', '2021-08-15 21:02:53', '2021-08-15 21:02:53');
INSERT INTO `ape_pv_log` VALUES (56, 22, 14, '2021-08-15', '2021-08-15 22:00:06', '2021-08-15 22:00:06');

-- ----------------------------
-- Table structure for ape_slides
-- ----------------------------
DROP TABLE IF EXISTS `ape_slides`;
CREATE TABLE `ape_slides`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动url',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT 'banner类型',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯片' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_slides
-- ----------------------------
INSERT INTO `ape_slides` VALUES (1, 'ceshi', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', 'http://apeblog.io/', NULL, 1622992131, 1622992572, 1, 0);
INSERT INTO `ape_slides` VALUES (2, 'ceshi2', '/uploads/images/20210606\\045f1d01edbd194f80f0b9fb28e35844.jpg', '/', NULL, 1622992586, 1622992586, 1, 0);

-- ----------------------------
-- Table structure for ape_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config`;
CREATE TABLE `ape_system_config`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tab_id` int(8) NULL DEFAULT NULL COMMENT '分组id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题名称',
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单类型',
  `tag_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签类型',
  `upload_type` tinyint(1) NULL DEFAULT NULL COMMENT '上传配置',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', '', 90, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/898b720200509204528197.jpg', '', 89, 1, 1, '1', NULL, 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '派后台管理系统', '', 88, 1, 1, '1', NULL, 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '派后台管理系统', '', 87, 1, 1, '1', NULL, 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/uploads/files/20210405\\60b557b38a20dc46b4ae1514e7a38fb4.jpeg', '', 85, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Power by LEARY.', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', 'xxx', '', 83, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (52, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'https://learn.leapy.cn', '', 0, 1, 1, '1', NULL, 1588858018, 1582792265);
INSERT INTO `ape_system_config` VALUES (65, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (66, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'default', '', 83, 1, 1, '1', '1', 1582793563, 1620610858);
INSERT INTO `ape_system_config` VALUES (67, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (68, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (69, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (70, 1, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '北京市昌平区', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (71, 1, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (72, 1, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
INSERT INTO `ape_system_config_tab` VALUES (1, '基础配置', 99, 1, '1', '1', 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (2, '上传配置', 98, 1, '1', '1', 1582785701, 1583385489);

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
) ENGINE = MyISAM AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
INSERT INTO `ape_url_log` VALUES (1, 'http://apeblog.io/', 2, '网站首页', '2021-05-09', '2021-05-09 23:45:27', '2021-05-09 23:45:27');
INSERT INTO `ape_url_log` VALUES (2, 'http://apeblog.io/', 1, '网站首页', '2021-05-10', '2021-05-10 09:38:58', '2021-05-10 09:38:58');
INSERT INTO `ape_url_log` VALUES (3, 'http://apeblog.io/', 10, '网站首页', '2021-05-11', '2021-05-11 10:08:49', '2021-05-11 10:08:49');
INSERT INTO `ape_url_log` VALUES (4, 'http://apeblog.io/index/article/lists.html?id=4', 1, '测试', '2021-05-11', '2021-05-11 10:18:13', '2021-05-11 10:18:13');
INSERT INTO `ape_url_log` VALUES (5, 'http://apeblog.io/', 5, '网站首页', '2021-05-26', '2021-05-26 09:47:24', '2021-05-26 09:47:24');
INSERT INTO `ape_url_log` VALUES (6, 'http://apeblog.io/', 5, '网站首页', '2021-05-29', '2021-05-29 12:02:49', '2021-05-29 12:02:49');
INSERT INTO `ape_url_log` VALUES (7, 'http://apeblog.io/index/article/lists.html?id=4', 1, '测试', '2021-05-29', '2021-05-29 12:03:15', '2021-05-29 12:03:15');
INSERT INTO `ape_url_log` VALUES (8, 'http://apeblog.io/decoration-erp/index.html', 1, '网站首页', '2021-05-29', '2021-05-29 12:03:26', '2021-05-29 12:03:26');
INSERT INTO `ape_url_log` VALUES (9, 'http://apeblog.io/oracle-ebs-pl-sql-ap-podetial/index.html', 1, '网站首页', '2021-05-29', '2021-05-29 12:03:38', '2021-05-29 12:03:38');
INSERT INTO `ape_url_log` VALUES (10, 'http://apeblog.io/', 12, '网站首页', '2021-06-06', '2021-06-06 22:41:30', '2021-06-06 22:41:30');
INSERT INTO `ape_url_log` VALUES (11, 'http://apeblog.io/decoration-erp/index.html', 7, '网站首页', '2021-06-06', '2021-06-06 22:41:37', '2021-06-06 22:41:37');
INSERT INTO `ape_url_log` VALUES (12, 'http://apeblog.io/oracle-ebs-pl-sql-arapsubleadernotposttogl/index.html', 3, '网站首页', '2021-06-06', '2021-06-06 23:05:56', '2021-06-06 23:05:56');
INSERT INTO `ape_url_log` VALUES (13, 'http://apeblog.io/', 4, '网站首页', '2021-06-07', '2021-06-07 00:15:14', '2021-06-07 00:15:14');
INSERT INTO `ape_url_log` VALUES (14, 'http://apeblog.io/', 4, '网站首页', '2021-06-13', '2021-06-13 22:17:06', '2021-06-13 22:17:06');
INSERT INTO `ape_url_log` VALUES (15, 'http://apeblog.io/', 2, '网站首页', '2021-06-26', '2021-06-26 14:44:29', '2021-06-26 14:44:29');
INSERT INTO `ape_url_log` VALUES (16, 'http://apeblog.io/', 29, '网站首页', '2021-06-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (17, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 2, '网站首页', '2021-06-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (18, 'http://apeblog.io/index/article/detail.html?id=2', 15, '111111111111111', '2021-06-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (19, 'http://apeblog.io/index/index.html', 1, '网站首页', '2021-06-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (20, 'http://apeblog.io/', 4, '网站首页', '2021-06-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (21, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 4, '网站首页', '2021-06-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (22, 'http://apeblog.io/index/article/detail.html?id=1', 2, '特种兵之霹雳火', '2021-06-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (23, 'http://apeblog.io/', 8596, '网站首页', '2021-07-01', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (24, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 2, '网站首页', '2021-07-01', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (25, 'http://apeblog.io/', 6, '网站首页', '2021-07-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (26, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 5, '网站首页', '2021-07-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (27, 'http://apeblog.io/index/article/lists.html?id=2', 1, '首页', '2021-07-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (28, 'http://apeblog.io/', 4, '网站首页', '2021-07-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (29, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 2, '网站首页', '2021-07-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (30, 'http://apeblog.io/index/article/lists.html?id=3', 1, '编程资料', '2021-07-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (31, 'http://apeblog.io/index/article/lists.html?id=2', 1, '首页', '2021-07-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (32, 'http://apeblog.io/', 1, '网站首页', '2021-07-18', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (33, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 1, '网站首页', '2021-07-18', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (34, 'http://apeblog.io/', 7, '网站首页', '2021-07-19', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (35, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 9, '网站首页', '2021-07-19', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (36, 'http://apeblog.io/about.html', 1, '网站首页', '2021-07-19', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (37, 'http://apeblog.io/www.apecloud.cn', 1, '网站首页', '2021-07-19', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (38, 'http://apeblog.io/', 1, '网站首页', '2021-07-24', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (39, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 1, '网站首页', '2021-07-24', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (40, 'http://apeblog.io/', 9, '网站首页', '2021-07-26', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (41, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 5, '网站首页', '2021-07-26', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (42, 'http://apeblog.io/', 3, '网站首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (43, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 21, '网站首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (44, 'http://apeblog.io/about.html', 1, '网站首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (45, 'http://apeblog.io/msg.html', 1, '网站首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (46, 'http://apeblog.io/corepress.html', 22, '网站首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (47, 'http://apeblog.io/index/article/lists.html?id=2', 1, '首页', '2021-07-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (48, 'http://apeblog.io/', 1, '网站首页', '2021-08-01', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (49, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 1, '网站首页', '2021-08-01', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (50, 'http://apeblog.io/', 2, '网站首页', '2021-08-07', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (51, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 2, '网站首页', '2021-08-07', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (52, 'http://apeblog.io/index/article/detail.html?id=2', 16, '111111111111111', '2021-08-07', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (53, 'http://apeblog.io/index/article/lists.html?id=3', 15, '编程资料', '2021-08-07', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (54, 'http://apeblog.io/index/article/detail.html?id=2', 14, '111111111111111', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (55, 'http://apeblog.io/index/article/lists.html?id=3', 47, '编程资料', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (56, 'http://apeblog.io/', 32, '网站首页', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (57, 'http://apeblog.io/%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98', 1, '网站首页', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (58, 'http://apeblog.io/index/article/lists.html?id=2', 10, '首页', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (59, 'http://apeblog.io/index/article/detail.html?id=1', 24, '特种兵之霹雳火', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (60, 'http://apeblog.io/login.html', 2, '网站首页', '2021-08-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (61, 'http://apeblog.io/', 20, '网站首页', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (62, 'http://apeblog.io/index/article/detail.html?id=1', 24, '特种兵之霹雳火', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (63, 'http://apeblog.io/index/article/lists.html?id=3', 7, '编程资料', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (64, 'http://apeblog.io/index/article/detail.html?id=2', 21, '111111111111111', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (65, 'http://apeblog.io/index/article/lists.html?id=2', 1, '首页', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (66, 'http://apeblog.io/msg.html', 2, '网站首页', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (67, 'http://apeblog.io/about.html', 1, '网站首页', '2021-08-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (68, 'http://apeblog.io/', 5, '网站首页', '2021-08-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (69, 'http://apeblog.io/index/article/lists.html?id=3', 1, '编程资料', '2021-08-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (70, 'http://apeblog.io/index/article/detail.html?id=2', 4, '111111111111111', '2021-08-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (71, 'http://apeblog.io/index/article/detail.html?id=1', 2, '特种兵之霹雳火', '2021-08-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (72, 'http://apeblog.io/', 5, '网站首页', '2021-08-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (73, 'http://apeblog.io/index/article/detail.html?id=2', 2, '111111111111111', '2021-08-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (74, 'http://apeblog.io/', 22, '网站首页', '2021-08-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (75, 'http://apeblog.io/', 67, '网站首页', '2021-08-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (76, 'http://apeblog.io/index/article/detail.html?id=2', 6, '111111111111111', '2021-08-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (77, 'http://apeblog.io/corepress.html', 2, '网站首页', '2021-08-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (78, 'http://apeblog.io/index/article/lists.html?id=3', 1, '编程资料', '2021-08-15', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (79, 'http://apeblog.io/www.apecloud.cn', 4, '网站首页', '2021-08-15', NULL, NULL);

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
  `is_admin` int(11) NOT NULL DEFAULT 0 COMMENT '是否是管理员',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE
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
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
INSERT INTO `ape_uv_log` VALUES (1, '127.0.0.1', 23, '2021-05-09', '2021-05-09 23:45:27', '2021-05-09 23:45:27');
INSERT INTO `ape_uv_log` VALUES (2, '127.0.0.1', 9, '2021-05-10', '2021-05-10 09:38:58', '2021-05-10 09:38:58');
INSERT INTO `ape_uv_log` VALUES (3, '127.0.0.1', 10, '2021-05-11', '2021-05-11 10:08:49', '2021-05-11 10:08:49');
INSERT INTO `ape_uv_log` VALUES (4, '127.0.0.1', 9, '2021-05-26', '2021-05-26 09:47:24', '2021-05-26 09:47:24');
INSERT INTO `ape_uv_log` VALUES (5, '127.0.0.1', 12, '2021-05-29', '2021-05-29 12:02:49', '2021-05-29 12:02:49');
INSERT INTO `ape_uv_log` VALUES (6, '127.0.0.1', 22, '2021-06-06', '2021-06-06 22:41:30', '2021-06-06 22:41:30');
INSERT INTO `ape_uv_log` VALUES (7, '127.0.0.1', 0, '2021-06-07', '2021-06-07 00:15:14', '2021-06-07 00:15:14');
INSERT INTO `ape_uv_log` VALUES (8, '127.0.0.1', 22, '2021-06-13', '2021-06-13 22:17:06', '2021-06-13 22:17:06');
INSERT INTO `ape_uv_log` VALUES (9, '127.0.0.1', 14, '2021-06-26', '2021-06-26 14:44:29', '2021-06-26 14:44:29');
INSERT INTO `ape_uv_log` VALUES (10, '127.0.0.1', 16, '2021-06-27', '2021-06-27 16:53:44', '2021-06-27 16:53:44');
INSERT INTO `ape_uv_log` VALUES (11, '127.0.0.1', 0, '2021-06-28', '2021-06-28 00:03:15', '2021-06-28 00:03:15');
INSERT INTO `ape_uv_log` VALUES (12, '127.0.0.1', 15, '2021-07-01', '2021-07-01 15:59:21', '2021-07-01 15:59:21');
INSERT INTO `ape_uv_log` VALUES (13, '127.0.0.1', 16, '2021-07-04', '2021-07-04 16:19:41', '2021-07-04 16:19:41');
INSERT INTO `ape_uv_log` VALUES (14, '127.0.0.1', 16, '2021-07-15', '2021-07-15 16:54:59', '2021-07-15 16:54:59');
INSERT INTO `ape_uv_log` VALUES (15, '127.0.0.1', 22, '2021-07-18', '2021-07-18 22:56:03', '2021-07-18 22:56:03');
INSERT INTO `ape_uv_log` VALUES (16, '127.0.0.1', 10, '2021-07-19', '2021-07-19 10:23:43', '2021-07-19 10:23:43');
INSERT INTO `ape_uv_log` VALUES (17, '127.0.0.1', 20, '2021-07-24', '2021-07-24 20:48:23', '2021-07-24 20:48:23');
INSERT INTO `ape_uv_log` VALUES (18, '127.0.0.1', 10, '2021-07-26', '2021-07-26 10:37:44', '2021-07-26 10:37:44');
INSERT INTO `ape_uv_log` VALUES (19, '127.0.0.1', 10, '2021-07-27', '2021-07-27 10:09:47', '2021-07-27 10:09:47');
INSERT INTO `ape_uv_log` VALUES (20, '127.0.0.1', 18, '2021-08-01', '2021-08-01 18:43:52', '2021-08-01 18:43:52');
INSERT INTO `ape_uv_log` VALUES (21, '127.0.0.1', 21, '2021-08-07', '2021-08-07 21:46:26', '2021-08-07 21:46:26');
INSERT INTO `ape_uv_log` VALUES (22, '127.0.0.1', 0, '2021-08-08', '2021-08-08 00:11:30', '2021-08-08 00:11:30');
INSERT INTO `ape_uv_log` VALUES (23, '127.0.0.1', 0, '2021-08-09', '2021-08-09 00:00:19', '2021-08-09 00:00:19');
INSERT INTO `ape_uv_log` VALUES (24, '127.0.0.1', 23, '2021-08-11', '2021-08-11 23:55:40', '2021-08-11 23:55:40');
INSERT INTO `ape_uv_log` VALUES (25, '127.0.0.1', 23, '2021-08-12', '2021-08-12 23:27:49', '2021-08-12 23:27:49');
INSERT INTO `ape_uv_log` VALUES (26, '127.0.0.1', 0, '2021-08-13', '2021-08-13 00:34:57', '2021-08-13 00:34:57');
INSERT INTO `ape_uv_log` VALUES (27, '127.0.0.1', 14, '2021-08-15', '2021-08-15 14:38:55', '2021-08-15 14:38:55');

SET FOREIGN_KEY_CHECKS = 1;
