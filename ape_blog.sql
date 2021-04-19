/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ape_blog

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 19/04/2021 18:20:36
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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
INSERT INTO `ape_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, NULL, '1', 1582093161, 1590466572);
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
INSERT INTO `ape_admin_auth` VALUES (31, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', NULL, 0, 0, 0, '/admin/theme/index', 0, 1, '1', NULL, 1613400314, 1613567542);
INSERT INTO `ape_admin_auth` VALUES (32, '主题管理', '', 31, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (33, '主题商店', '', 31, 'admin', 'theme', 'store', '', NULL, 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404);
INSERT INTO `ape_admin_auth` VALUES (34, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400510, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (35, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (37, '邀请码管理', '', 27, 'admin', 'invitation', 'index', '', NULL, 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);

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
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------
INSERT INTO `ape_admin_log` VALUES (31, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808197);
INSERT INTO `ape_admin_log` VALUES (32, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808197);
INSERT INTO `ape_admin_log` VALUES (33, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808199);
INSERT INTO `ape_admin_log` VALUES (34, 1, 'admin', 'admin', 'user', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808201);
INSERT INTO `ape_admin_log` VALUES (35, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808219);
INSERT INTO `ape_admin_log` VALUES (36, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613808226);
INSERT INTO `ape_admin_log` VALUES (37, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810485);
INSERT INTO `ape_admin_log` VALUES (38, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810488);
INSERT INTO `ape_admin_log` VALUES (39, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810721);
INSERT INTO `ape_admin_log` VALUES (40, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810896);
INSERT INTO `ape_admin_log` VALUES (41, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613810917);
INSERT INTO `ape_admin_log` VALUES (42, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613811090);
INSERT INTO `ape_admin_log` VALUES (43, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613812960);
INSERT INTO `ape_admin_log` VALUES (44, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813362);
INSERT INTO `ape_admin_log` VALUES (45, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813399);
INSERT INTO `ape_admin_log` VALUES (46, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813434);
INSERT INTO `ape_admin_log` VALUES (47, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813459);
INSERT INTO `ape_admin_log` VALUES (48, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813478);
INSERT INTO `ape_admin_log` VALUES (49, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813495);
INSERT INTO `ape_admin_log` VALUES (50, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813645);
INSERT INTO `ape_admin_log` VALUES (51, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813731);
INSERT INTO `ape_admin_log` VALUES (52, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813810);
INSERT INTO `ape_admin_log` VALUES (53, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813840);
INSERT INTO `ape_admin_log` VALUES (54, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813927);
INSERT INTO `ape_admin_log` VALUES (55, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813945);
INSERT INTO `ape_admin_log` VALUES (56, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613813970);
INSERT INTO `ape_admin_log` VALUES (57, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814006);
INSERT INTO `ape_admin_log` VALUES (58, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814164);
INSERT INTO `ape_admin_log` VALUES (59, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613814275);
INSERT INTO `ape_admin_log` VALUES (60, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613829768);
INSERT INTO `ape_admin_log` VALUES (61, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831394);
INSERT INTO `ape_admin_log` VALUES (62, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831394);
INSERT INTO `ape_admin_log` VALUES (63, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831397);
INSERT INTO `ape_admin_log` VALUES (64, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831398);
INSERT INTO `ape_admin_log` VALUES (65, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831478);
INSERT INTO `ape_admin_log` VALUES (66, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831515);
INSERT INTO `ape_admin_log` VALUES (67, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613831525);
INSERT INTO `ape_admin_log` VALUES (68, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884635);
INSERT INTO `ape_admin_log` VALUES (69, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884635);
INSERT INTO `ape_admin_log` VALUES (70, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613884638);
INSERT INTO `ape_admin_log` VALUES (71, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918290);
INSERT INTO `ape_admin_log` VALUES (72, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918290);
INSERT INTO `ape_admin_log` VALUES (73, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918316);
INSERT INTO `ape_admin_log` VALUES (74, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918317);
INSERT INTO `ape_admin_log` VALUES (75, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613918320);
INSERT INTO `ape_admin_log` VALUES (76, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613921578);
INSERT INTO `ape_admin_log` VALUES (77, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613922266);
INSERT INTO `ape_admin_log` VALUES (78, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613957708);
INSERT INTO `ape_admin_log` VALUES (79, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613957709);
INSERT INTO `ape_admin_log` VALUES (80, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967075);
INSERT INTO `ape_admin_log` VALUES (81, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967077);
INSERT INTO `ape_admin_log` VALUES (82, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613967079);
INSERT INTO `ape_admin_log` VALUES (83, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1613968454);
INSERT INTO `ape_admin_log` VALUES (84, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414840);
INSERT INTO `ape_admin_log` VALUES (85, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414850);
INSERT INTO `ape_admin_log` VALUES (86, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414851);
INSERT INTO `ape_admin_log` VALUES (87, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414853);
INSERT INTO `ape_admin_log` VALUES (88, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414855);
INSERT INTO `ape_admin_log` VALUES (89, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614414972);
INSERT INTO `ape_admin_log` VALUES (90, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476434);
INSERT INTO `ape_admin_log` VALUES (91, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476434);
INSERT INTO `ape_admin_log` VALUES (92, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476440);
INSERT INTO `ape_admin_log` VALUES (93, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614476441);
INSERT INTO `ape_admin_log` VALUES (94, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614520232);
INSERT INTO `ape_admin_log` VALUES (95, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614526663);
INSERT INTO `ape_admin_log` VALUES (96, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614526663);
INSERT INTO `ape_admin_log` VALUES (97, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530365);
INSERT INTO `ape_admin_log` VALUES (98, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530367);
INSERT INTO `ape_admin_log` VALUES (99, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530451);
INSERT INTO `ape_admin_log` VALUES (100, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1614530455);
INSERT INTO `ape_admin_log` VALUES (101, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048336);
INSERT INTO `ape_admin_log` VALUES (102, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048350);
INSERT INTO `ape_admin_log` VALUES (103, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048350);
INSERT INTO `ape_admin_log` VALUES (104, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048358);
INSERT INTO `ape_admin_log` VALUES (105, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048359);
INSERT INTO `ape_admin_log` VALUES (106, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048682);
INSERT INTO `ape_admin_log` VALUES (107, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048688);
INSERT INTO `ape_admin_log` VALUES (108, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048715);
INSERT INTO `ape_admin_log` VALUES (109, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615048786);
INSERT INTO `ape_admin_log` VALUES (110, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111007);
INSERT INTO `ape_admin_log` VALUES (111, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111007);
INSERT INTO `ape_admin_log` VALUES (112, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111010);
INSERT INTO `ape_admin_log` VALUES (113, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111016);
INSERT INTO `ape_admin_log` VALUES (114, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111143);
INSERT INTO `ape_admin_log` VALUES (115, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111517);
INSERT INTO `ape_admin_log` VALUES (116, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111532);
INSERT INTO `ape_admin_log` VALUES (117, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615111551);
INSERT INTO `ape_admin_log` VALUES (118, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615113603);
INSERT INTO `ape_admin_log` VALUES (119, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615113692);
INSERT INTO `ape_admin_log` VALUES (120, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128112);
INSERT INTO `ape_admin_log` VALUES (121, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128118);
INSERT INTO `ape_admin_log` VALUES (122, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615128120);
INSERT INTO `ape_admin_log` VALUES (123, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615132814);
INSERT INTO `ape_admin_log` VALUES (124, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68', 1615133417);
INSERT INTO `ape_admin_log` VALUES (125, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340075);
INSERT INTO `ape_admin_log` VALUES (126, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340076);
INSERT INTO `ape_admin_log` VALUES (127, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340086);
INSERT INTO `ape_admin_log` VALUES (128, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340094);
INSERT INTO `ape_admin_log` VALUES (129, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615340097);
INSERT INTO `ape_admin_log` VALUES (130, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615340153);
INSERT INTO `ape_admin_log` VALUES (131, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615340420);
INSERT INTO `ape_admin_log` VALUES (132, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341349);
INSERT INTO `ape_admin_log` VALUES (133, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341659);
INSERT INTO `ape_admin_log` VALUES (134, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341820);
INSERT INTO `ape_admin_log` VALUES (135, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341828);
INSERT INTO `ape_admin_log` VALUES (136, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341832);
INSERT INTO `ape_admin_log` VALUES (137, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341937);
INSERT INTO `ape_admin_log` VALUES (138, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341943);
INSERT INTO `ape_admin_log` VALUES (139, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341944);
INSERT INTO `ape_admin_log` VALUES (140, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341947);
INSERT INTO `ape_admin_log` VALUES (141, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341983);
INSERT INTO `ape_admin_log` VALUES (142, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341986);
INSERT INTO `ape_admin_log` VALUES (143, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615341997);
INSERT INTO `ape_admin_log` VALUES (144, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342002);
INSERT INTO `ape_admin_log` VALUES (145, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342058);
INSERT INTO `ape_admin_log` VALUES (146, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342082);
INSERT INTO `ape_admin_log` VALUES (147, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342217);
INSERT INTO `ape_admin_log` VALUES (148, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342269);
INSERT INTO `ape_admin_log` VALUES (149, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342285);
INSERT INTO `ape_admin_log` VALUES (150, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342329);
INSERT INTO `ape_admin_log` VALUES (151, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342330);
INSERT INTO `ape_admin_log` VALUES (152, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342334);
INSERT INTO `ape_admin_log` VALUES (153, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342351);
INSERT INTO `ape_admin_log` VALUES (154, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342445);
INSERT INTO `ape_admin_log` VALUES (155, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342472);
INSERT INTO `ape_admin_log` VALUES (156, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342475);
INSERT INTO `ape_admin_log` VALUES (157, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342547);
INSERT INTO `ape_admin_log` VALUES (158, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342707);
INSERT INTO `ape_admin_log` VALUES (159, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711);
INSERT INTO `ape_admin_log` VALUES (160, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711);
INSERT INTO `ape_admin_log` VALUES (161, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711);
INSERT INTO `ape_admin_log` VALUES (162, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342711);
INSERT INTO `ape_admin_log` VALUES (163, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712);
INSERT INTO `ape_admin_log` VALUES (164, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712);
INSERT INTO `ape_admin_log` VALUES (165, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712);
INSERT INTO `ape_admin_log` VALUES (166, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712);
INSERT INTO `ape_admin_log` VALUES (167, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342712);
INSERT INTO `ape_admin_log` VALUES (168, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (169, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (170, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (171, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (172, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (173, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342713);
INSERT INTO `ape_admin_log` VALUES (174, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342714);
INSERT INTO `ape_admin_log` VALUES (175, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615342714);
INSERT INTO `ape_admin_log` VALUES (176, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343588);
INSERT INTO `ape_admin_log` VALUES (177, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343589);
INSERT INTO `ape_admin_log` VALUES (178, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343590);
INSERT INTO `ape_admin_log` VALUES (179, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343590);
INSERT INTO `ape_admin_log` VALUES (180, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343658);
INSERT INTO `ape_admin_log` VALUES (181, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343686);
INSERT INTO `ape_admin_log` VALUES (182, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343689);
INSERT INTO `ape_admin_log` VALUES (183, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343833);
INSERT INTO `ape_admin_log` VALUES (184, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615343850);
INSERT INTO `ape_admin_log` VALUES (185, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344075);
INSERT INTO `ape_admin_log` VALUES (186, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344077);
INSERT INTO `ape_admin_log` VALUES (187, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344077);
INSERT INTO `ape_admin_log` VALUES (188, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344092);
INSERT INTO `ape_admin_log` VALUES (189, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344103);
INSERT INTO `ape_admin_log` VALUES (190, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344114);
INSERT INTO `ape_admin_log` VALUES (191, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344128);
INSERT INTO `ape_admin_log` VALUES (192, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344184);
INSERT INTO `ape_admin_log` VALUES (193, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344223);
INSERT INTO `ape_admin_log` VALUES (194, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615344267);
INSERT INTO `ape_admin_log` VALUES (195, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347035);
INSERT INTO `ape_admin_log` VALUES (196, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347036);
INSERT INTO `ape_admin_log` VALUES (197, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615347036);
INSERT INTO `ape_admin_log` VALUES (198, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348194);
INSERT INTO `ape_admin_log` VALUES (199, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195);
INSERT INTO `ape_admin_log` VALUES (200, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195);
INSERT INTO `ape_admin_log` VALUES (201, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348195);
INSERT INTO `ape_admin_log` VALUES (202, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196);
INSERT INTO `ape_admin_log` VALUES (203, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196);
INSERT INTO `ape_admin_log` VALUES (204, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196);
INSERT INTO `ape_admin_log` VALUES (205, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196);
INSERT INTO `ape_admin_log` VALUES (206, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348196);
INSERT INTO `ape_admin_log` VALUES (207, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197);
INSERT INTO `ape_admin_log` VALUES (208, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197);
INSERT INTO `ape_admin_log` VALUES (209, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197);
INSERT INTO `ape_admin_log` VALUES (210, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348197);
INSERT INTO `ape_admin_log` VALUES (211, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348198);
INSERT INTO `ape_admin_log` VALUES (212, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348208);
INSERT INTO `ape_admin_log` VALUES (213, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348278);
INSERT INTO `ape_admin_log` VALUES (214, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348299);
INSERT INTO `ape_admin_log` VALUES (215, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348301);
INSERT INTO `ape_admin_log` VALUES (216, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348305);
INSERT INTO `ape_admin_log` VALUES (217, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615348412);
INSERT INTO `ape_admin_log` VALUES (218, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615349994);
INSERT INTO `ape_admin_log` VALUES (219, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350016);
INSERT INTO `ape_admin_log` VALUES (220, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350019);
INSERT INTO `ape_admin_log` VALUES (221, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350023);
INSERT INTO `ape_admin_log` VALUES (222, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350040);
INSERT INTO `ape_admin_log` VALUES (223, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350042);
INSERT INTO `ape_admin_log` VALUES (224, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350052);
INSERT INTO `ape_admin_log` VALUES (225, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350095);
INSERT INTO `ape_admin_log` VALUES (226, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350097);
INSERT INTO `ape_admin_log` VALUES (227, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350098);
INSERT INTO `ape_admin_log` VALUES (228, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350162);
INSERT INTO `ape_admin_log` VALUES (229, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350190);
INSERT INTO `ape_admin_log` VALUES (230, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350192);
INSERT INTO `ape_admin_log` VALUES (231, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350224);
INSERT INTO `ape_admin_log` VALUES (232, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350268);
INSERT INTO `ape_admin_log` VALUES (233, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350323);
INSERT INTO `ape_admin_log` VALUES (234, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350324);
INSERT INTO `ape_admin_log` VALUES (235, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350325);
INSERT INTO `ape_admin_log` VALUES (236, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350325);
INSERT INTO `ape_admin_log` VALUES (237, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326);
INSERT INTO `ape_admin_log` VALUES (238, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326);
INSERT INTO `ape_admin_log` VALUES (239, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350326);
INSERT INTO `ape_admin_log` VALUES (240, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350327);
INSERT INTO `ape_admin_log` VALUES (241, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350356);
INSERT INTO `ape_admin_log` VALUES (242, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350393);
INSERT INTO `ape_admin_log` VALUES (243, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350395);
INSERT INTO `ape_admin_log` VALUES (244, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350534);
INSERT INTO `ape_admin_log` VALUES (245, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615350583);
INSERT INTO `ape_admin_log` VALUES (246, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351068);
INSERT INTO `ape_admin_log` VALUES (247, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351076);
INSERT INTO `ape_admin_log` VALUES (248, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351119);
INSERT INTO `ape_admin_log` VALUES (249, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351442);
INSERT INTO `ape_admin_log` VALUES (250, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351499);
INSERT INTO `ape_admin_log` VALUES (251, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351506);
INSERT INTO `ape_admin_log` VALUES (252, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351529);
INSERT INTO `ape_admin_log` VALUES (253, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351657);
INSERT INTO `ape_admin_log` VALUES (254, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351673);
INSERT INTO `ape_admin_log` VALUES (255, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351686);
INSERT INTO `ape_admin_log` VALUES (256, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351702);
INSERT INTO `ape_admin_log` VALUES (257, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351710);
INSERT INTO `ape_admin_log` VALUES (258, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351749);
INSERT INTO `ape_admin_log` VALUES (259, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615351751);
INSERT INTO `ape_admin_log` VALUES (260, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615353187);
INSERT INTO `ape_admin_log` VALUES (261, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615353629);
INSERT INTO `ape_admin_log` VALUES (262, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354011);
INSERT INTO `ape_admin_log` VALUES (263, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354642);
INSERT INTO `ape_admin_log` VALUES (264, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354776);
INSERT INTO `ape_admin_log` VALUES (265, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354901);
INSERT INTO `ape_admin_log` VALUES (266, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615354903);
INSERT INTO `ape_admin_log` VALUES (267, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355024);
INSERT INTO `ape_admin_log` VALUES (268, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355053);
INSERT INTO `ape_admin_log` VALUES (269, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355097);
INSERT INTO `ape_admin_log` VALUES (270, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355140);
INSERT INTO `ape_admin_log` VALUES (271, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355143);
INSERT INTO `ape_admin_log` VALUES (272, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355254);
INSERT INTO `ape_admin_log` VALUES (273, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355325);
INSERT INTO `ape_admin_log` VALUES (274, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355437);
INSERT INTO `ape_admin_log` VALUES (275, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355471);
INSERT INTO `ape_admin_log` VALUES (276, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615355804);
INSERT INTO `ape_admin_log` VALUES (277, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615357336);
INSERT INTO `ape_admin_log` VALUES (278, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615357414);
INSERT INTO `ape_admin_log` VALUES (279, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615357450);
INSERT INTO `ape_admin_log` VALUES (280, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358019);
INSERT INTO `ape_admin_log` VALUES (281, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358026);
INSERT INTO `ape_admin_log` VALUES (282, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358032);
INSERT INTO `ape_admin_log` VALUES (283, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358129);
INSERT INTO `ape_admin_log` VALUES (284, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358559);
INSERT INTO `ape_admin_log` VALUES (285, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358605);
INSERT INTO `ape_admin_log` VALUES (286, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358623);
INSERT INTO `ape_admin_log` VALUES (287, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358637);
INSERT INTO `ape_admin_log` VALUES (288, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358651);
INSERT INTO `ape_admin_log` VALUES (289, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615358861);
INSERT INTO `ape_admin_log` VALUES (290, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359164);
INSERT INTO `ape_admin_log` VALUES (291, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359177);
INSERT INTO `ape_admin_log` VALUES (292, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359189);
INSERT INTO `ape_admin_log` VALUES (293, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359234);
INSERT INTO `ape_admin_log` VALUES (294, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359357);
INSERT INTO `ape_admin_log` VALUES (295, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359428);
INSERT INTO `ape_admin_log` VALUES (296, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359429);
INSERT INTO `ape_admin_log` VALUES (297, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615359432);
INSERT INTO `ape_admin_log` VALUES (298, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615429335);
INSERT INTO `ape_admin_log` VALUES (299, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615429336);
INSERT INTO `ape_admin_log` VALUES (300, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615429339);
INSERT INTO `ape_admin_log` VALUES (301, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615429343);
INSERT INTO `ape_admin_log` VALUES (302, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615429657);
INSERT INTO `ape_admin_log` VALUES (303, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224696);
INSERT INTO `ape_admin_log` VALUES (304, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224697);
INSERT INTO `ape_admin_log` VALUES (305, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224703);
INSERT INTO `ape_admin_log` VALUES (306, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224706);
INSERT INTO `ape_admin_log` VALUES (307, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224710);
INSERT INTO `ape_admin_log` VALUES (308, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224711);
INSERT INTO `ape_admin_log` VALUES (309, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224713);
INSERT INTO `ape_admin_log` VALUES (310, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616224879);
INSERT INTO `ape_admin_log` VALUES (311, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616227858);
INSERT INTO `ape_admin_log` VALUES (312, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616231313);
INSERT INTO `ape_admin_log` VALUES (313, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616313169);
INSERT INTO `ape_admin_log` VALUES (314, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616313170);
INSERT INTO `ape_admin_log` VALUES (315, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616313174);
INSERT INTO `ape_admin_log` VALUES (316, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616333375);
INSERT INTO `ape_admin_log` VALUES (317, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616333747);
INSERT INTO `ape_admin_log` VALUES (318, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1616333750);
INSERT INTO `ape_admin_log` VALUES (319, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280962);
INSERT INTO `ape_admin_log` VALUES (320, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280963);
INSERT INTO `ape_admin_log` VALUES (321, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280965);
INSERT INTO `ape_admin_log` VALUES (322, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280966);
INSERT INTO `ape_admin_log` VALUES (323, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280969);
INSERT INTO `ape_admin_log` VALUES (324, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280972);
INSERT INTO `ape_admin_log` VALUES (325, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280974);
INSERT INTO `ape_admin_log` VALUES (326, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280976);
INSERT INTO `ape_admin_log` VALUES (327, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617280986);
INSERT INTO `ape_admin_log` VALUES (328, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281006);
INSERT INTO `ape_admin_log` VALUES (329, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281014);
INSERT INTO `ape_admin_log` VALUES (330, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281033);
INSERT INTO `ape_admin_log` VALUES (331, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281555);
INSERT INTO `ape_admin_log` VALUES (332, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281614);
INSERT INTO `ape_admin_log` VALUES (333, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281687);
INSERT INTO `ape_admin_log` VALUES (334, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281696);
INSERT INTO `ape_admin_log` VALUES (335, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281697);
INSERT INTO `ape_admin_log` VALUES (336, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281697);
INSERT INTO `ape_admin_log` VALUES (337, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281705);
INSERT INTO `ape_admin_log` VALUES (338, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281707);
INSERT INTO `ape_admin_log` VALUES (339, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281707);
INSERT INTO `ape_admin_log` VALUES (340, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281735);
INSERT INTO `ape_admin_log` VALUES (341, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281736);
INSERT INTO `ape_admin_log` VALUES (342, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281737);
INSERT INTO `ape_admin_log` VALUES (343, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281745);
INSERT INTO `ape_admin_log` VALUES (344, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281754);
INSERT INTO `ape_admin_log` VALUES (345, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617281773);
INSERT INTO `ape_admin_log` VALUES (346, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617282018);
INSERT INTO `ape_admin_log` VALUES (347, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617282068);
INSERT INTO `ape_admin_log` VALUES (348, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617282188);
INSERT INTO `ape_admin_log` VALUES (349, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283521);
INSERT INTO `ape_admin_log` VALUES (350, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283561);
INSERT INTO `ape_admin_log` VALUES (351, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283571);
INSERT INTO `ape_admin_log` VALUES (352, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283579);
INSERT INTO `ape_admin_log` VALUES (353, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283880);
INSERT INTO `ape_admin_log` VALUES (354, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283921);
INSERT INTO `ape_admin_log` VALUES (355, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617283993);
INSERT INTO `ape_admin_log` VALUES (356, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284451);
INSERT INTO `ape_admin_log` VALUES (357, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284663);
INSERT INTO `ape_admin_log` VALUES (358, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284731);
INSERT INTO `ape_admin_log` VALUES (359, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284746);
INSERT INTO `ape_admin_log` VALUES (360, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284771);
INSERT INTO `ape_admin_log` VALUES (361, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284815);
INSERT INTO `ape_admin_log` VALUES (362, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284824);
INSERT INTO `ape_admin_log` VALUES (363, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284839);
INSERT INTO `ape_admin_log` VALUES (364, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284930);
INSERT INTO `ape_admin_log` VALUES (365, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284941);
INSERT INTO `ape_admin_log` VALUES (366, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284949);
INSERT INTO `ape_admin_log` VALUES (367, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617284959);
INSERT INTO `ape_admin_log` VALUES (368, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285042);
INSERT INTO `ape_admin_log` VALUES (369, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285056);
INSERT INTO `ape_admin_log` VALUES (370, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285125);
INSERT INTO `ape_admin_log` VALUES (371, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285164);
INSERT INTO `ape_admin_log` VALUES (372, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285304);
INSERT INTO `ape_admin_log` VALUES (373, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285307);
INSERT INTO `ape_admin_log` VALUES (374, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285308);
INSERT INTO `ape_admin_log` VALUES (375, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285310);
INSERT INTO `ape_admin_log` VALUES (376, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285312);
INSERT INTO `ape_admin_log` VALUES (377, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1617285315);
INSERT INTO `ape_admin_log` VALUES (378, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628070);
INSERT INTO `ape_admin_log` VALUES (379, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628071);
INSERT INTO `ape_admin_log` VALUES (380, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628074);
INSERT INTO `ape_admin_log` VALUES (381, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628076);
INSERT INTO `ape_admin_log` VALUES (382, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628178);
INSERT INTO `ape_admin_log` VALUES (383, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628465);
INSERT INTO `ape_admin_log` VALUES (384, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617628475);
INSERT INTO `ape_admin_log` VALUES (385, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617629061);
INSERT INTO `ape_admin_log` VALUES (386, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617629078);
INSERT INTO `ape_admin_log` VALUES (387, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617629756);
INSERT INTO `ape_admin_log` VALUES (388, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617629766);
INSERT INTO `ape_admin_log` VALUES (389, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617632555);
INSERT INTO `ape_admin_log` VALUES (390, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617632555);
INSERT INTO `ape_admin_log` VALUES (391, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617632561);
INSERT INTO `ape_admin_log` VALUES (392, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617632584);
INSERT INTO `ape_admin_log` VALUES (393, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617632598);
INSERT INTO `ape_admin_log` VALUES (394, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617634012);
INSERT INTO `ape_admin_log` VALUES (395, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617634013);
INSERT INTO `ape_admin_log` VALUES (396, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1617634020);
INSERT INTO `ape_admin_log` VALUES (397, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069516);
INSERT INTO `ape_admin_log` VALUES (398, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069524);
INSERT INTO `ape_admin_log` VALUES (399, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069531);
INSERT INTO `ape_admin_log` VALUES (400, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069547);
INSERT INTO `ape_admin_log` VALUES (401, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069570);
INSERT INTO `ape_admin_log` VALUES (402, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 1618069588);

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
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,24,28,29,30,31,32,33,34,35,36,37', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,24,28,29,30,31,32,33,34,35,36,37', 0, 1, '1', '1', 1580031132, 1613400886);

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
INSERT INTO `ape_attachment` VALUES (1, 1, 'e304c7984686281332eb7dea5237e838.jpg', '/uploads/images/20210220\\e304c7984686281332eb7dea5237e838.jpg', 'images', 'image/jpeg', '1919593', 1, 1613799626, 1613799626);
INSERT INTO `ape_attachment` VALUES (2, 0, '1734d1d86e741da7ead7050cc249e37c.jpg', '/uploads/images/20210220\\1734d1d86e741da7ead7050cc249e37c.jpg', 'images', 'image/jpeg', '4766893', 1, 1613831632, 1613831632);
INSERT INTO `ape_attachment` VALUES (3, 0, '8e5b56ca7c6cc01c76a772b492d32862.png', '/uploads/images/20210221\\8e5b56ca7c6cc01c76a772b492d32862.png', 'images', 'image/png', '387019', 1, 1613921550, 1613921550);
INSERT INTO `ape_attachment` VALUES (4, 0, '0c7118cf91dad37e1de8e9e91516e521.png', '/uploads/images/20210228\\0c7118cf91dad37e1de8e9e91516e521.png', 'images', 'image/png', '387019', 1, 1614477335, 1614477335);
INSERT INTO `ape_attachment` VALUES (5, 0, '514f01b4e4854492ef75a8b739a6cb2e.jpg', '/uploads/images/20210228\\514f01b4e4854492ef75a8b739a6cb2e.jpg', 'images', 'image/jpeg', '560215', 1, 1614477802, 1614477802);
INSERT INTO `ape_attachment` VALUES (6, 0, 'a4a2004a673c6bf0b127ab617f6614ce.jpg', '/uploads/images/20210228\\a4a2004a673c6bf0b127ab617f6614ce.jpg', 'images', 'image/jpeg', '1919593', 1, 1614477882, 1614477882);
INSERT INTO `ape_attachment` VALUES (7, 0, '4046e63f462d6844ef6d5b6efa8ce366.jpg', '/uploads/images/20210228\\4046e63f462d6844ef6d5b6efa8ce366.jpg', 'images', 'image/jpeg', '3994763', 1, 1614477937, 1614477937);
INSERT INTO `ape_attachment` VALUES (8, 0, 'ee8d474379ab44286110e394e213e874.png', '/uploads/images/20210228\\ee8d474379ab44286110e394e213e874.png', 'images', 'image/png', '387019', 1, 1614486788, 1614486788);
INSERT INTO `ape_attachment` VALUES (9, 0, 'fd25dd510fcbca385d0344874a1ea28a.png', '/uploads/images/20210228\\fd25dd510fcbca385d0344874a1ea28a.png', 'images', 'image/png', '387019', 1, 1614486897, 1614486897);
INSERT INTO `ape_attachment` VALUES (10, 0, 'b7931aadd1bfc4697e2aae95faf99a96.png', '/uploads/images/20210228\\b7931aadd1bfc4697e2aae95faf99a96.png', 'images', 'image/png', '387019', 1, 1614489466, 1614489466);
INSERT INTO `ape_attachment` VALUES (11, 0, 'ade9d2885cde5d837805dc5d5fd3b424.jpg', '/uploads/images/20210228\\ade9d2885cde5d837805dc5d5fd3b424.jpg', 'images', 'image/jpeg', '1919593', 1, 1614489520, 1614489520);
INSERT INTO `ape_attachment` VALUES (12, 0, '7b6e7d107ba318243fb61fb335350619.png', '/uploads/images/20210228\\7b6e7d107ba318243fb61fb335350619.png', 'images', 'image/png', '387019', 1, 1614489742, 1614489742);
INSERT INTO `ape_attachment` VALUES (13, 0, 'e6856dc502a1d57f0b7a7130a2405978.png', '/uploads/images/20210228\\e6856dc502a1d57f0b7a7130a2405978.png', 'images', 'image/png', '387019', 1, 1614489796, 1614489796);
INSERT INTO `ape_attachment` VALUES (14, 0, 'dce92d47ddf4cbc8c0f24a6478130080.png', '/uploads/images/20210228\\dce92d47ddf4cbc8c0f24a6478130080.png', 'images', 'image/png', '387019', 1, 1614489883, 1614489883);
INSERT INTO `ape_attachment` VALUES (15, 0, 'd733ea98b1be2506fca55807b24f8a89.png', '/uploads/images/20210228\\d733ea98b1be2506fca55807b24f8a89.png', 'images', 'image/png', '387019', 1, 1614489913, 1614489913);
INSERT INTO `ape_attachment` VALUES (16, 0, 'eff2207f2ad37a49d298322c3b31dad2.jpg', '/uploads/images/20210228\\eff2207f2ad37a49d298322c3b31dad2.jpg', 'images', 'image/jpeg', '3994763', 1, 1614490183, 1614490183);
INSERT INTO `ape_attachment` VALUES (17, 0, 'e961308568dc6fe156ef16eb0a7455ad.png', '/uploads/images/20210228\\e961308568dc6fe156ef16eb0a7455ad.png', 'images', 'image/png', '387019', 1, 1614524671, 1614524671);
INSERT INTO `ape_attachment` VALUES (18, 0, 'f2b483888d78f21315f03e5563fdd409.png', '/uploads/images/20210228\\f2b483888d78f21315f03e5563fdd409.png', 'images', 'image/png', '387019', 1, 1614524865, 1614524865);
INSERT INTO `ape_attachment` VALUES (19, 0, 'e0665a0dda68381dd10c42dc078ce620.png', '/uploads/images/20210228\\e0665a0dda68381dd10c42dc078ce620.png', 'images', 'image/png', '387019', 1, 1614524895, 1614524895);
INSERT INTO `ape_attachment` VALUES (20, 0, '373b2a6f3da7680a523acdd87c2e6d40.jpg', '/uploads/images/20210228\\373b2a6f3da7680a523acdd87c2e6d40.jpg', 'images', 'image/jpeg', '1919593', 1, 1614525622, 1614525622);
INSERT INTO `ape_attachment` VALUES (21, 0, '553b85b108f30e14dac090282d02457d.jpg', '/uploads/images/20210228\\553b85b108f30e14dac090282d02457d.jpg', 'images', 'image/jpeg', '1919593', 1, 1614525656, 1614525656);
INSERT INTO `ape_attachment` VALUES (22, 0, 'b1f93b86eb831bda9593a5c9eb2b473d.jpg', '/uploads/images/20210228\\b1f93b86eb831bda9593a5c9eb2b473d.jpg', 'images', 'image/jpeg', '1919593', 1, 1614525707, 1614525707);
INSERT INTO `ape_attachment` VALUES (23, 0, '46b9ee81c2c152ac46379cf889cb8034.jpg', '/uploads/images/20210228\\46b9ee81c2c152ac46379cf889cb8034.jpg', 'images', 'image/jpeg', '560215', 1, 1614525720, 1614525720);
INSERT INTO `ape_attachment` VALUES (24, 0, '719f3152a2b1b218c4e0feb415f5ff60.jpg', '/uploads/images/20210228\\719f3152a2b1b218c4e0feb415f5ff60.jpg', 'images', 'image/jpeg', '560215', 1, 1614526123, 1614526123);
INSERT INTO `ape_attachment` VALUES (25, 0, '0247e9ba18bb3314317b5bd23694cdca.jpg', '/uploads/images/20210228\\0247e9ba18bb3314317b5bd23694cdca.jpg', 'images', 'image/jpeg', '3994763', 1, 1614527118, 1614527118);
INSERT INTO `ape_attachment` VALUES (26, 0, 'cfd6d90c7589995f7b49a07487db6a67.png', '/uploads/images/20210228\\cfd6d90c7589995f7b49a07487db6a67.png', 'images', 'image/png', '387019', 1, 1614527157, 1614527157);
INSERT INTO `ape_attachment` VALUES (27, 0, 'c1ec83ab7461b006b4b8ee0f7749822e.jpg', '/uploads/images/20210228\\c1ec83ab7461b006b4b8ee0f7749822e.jpg', 'images', 'image/jpeg', '3994763', 1, 1614527212, 1614527212);
INSERT INTO `ape_attachment` VALUES (28, 0, '1192697b10d193e13e33eeb0360e7878.png', '/uploads/images/20210301\\1192697b10d193e13e33eeb0360e7878.png', 'images', 'image/png', '387019', 1, 1614528350, 1614528350);
INSERT INTO `ape_attachment` VALUES (29, 0, '9ec51d4e0e83dbe73ece91f7e195f366.jpg', '/uploads/images/20210301\\9ec51d4e0e83dbe73ece91f7e195f366.jpg', 'images', 'image/jpeg', '3994763', 1, 1614528442, 1614528442);
INSERT INTO `ape_attachment` VALUES (30, 0, '8c9db78a898cdadf8ee4948d39d0b080.png', '/uploads/images/20210301\\8c9db78a898cdadf8ee4948d39d0b080.png', 'images', 'image/png', '387019', 1, 1614528579, 1614528579);
INSERT INTO `ape_attachment` VALUES (31, 0, 'a9bb385bc074cde6abca0075018493aa.png', '/uploads/images/20210301\\a9bb385bc074cde6abca0075018493aa.png', 'images', 'image/png', '387019', 1, 1614528818, 1614528818);
INSERT INTO `ape_attachment` VALUES (32, 0, 'b3a60105accdc6856b21201ce039af27.png', '/uploads/images/20210301\\b3a60105accdc6856b21201ce039af27.png', 'images', 'image/png', '387019', 1, 1614528912, 1614528912);
INSERT INTO `ape_attachment` VALUES (33, 0, 'f27d7d40b6e7b5965aacc24327b16748.png', '/uploads/images/20210301\\f27d7d40b6e7b5965aacc24327b16748.png', 'images', 'image/png', '387019', 1, 1614529057, 1614529057);
INSERT INTO `ape_attachment` VALUES (34, 0, 'ef455afd8b44d6be4b6651df3a7a5426.png', '/uploads/images/20210301\\ef455afd8b44d6be4b6651df3a7a5426.png', 'images', 'image/png', '387019', 1, 1614529470, 1614529470);
INSERT INTO `ape_attachment` VALUES (35, 0, 'debd8cff6e2276a522af3f41bd5310de.jpg', '/uploads/images/20210301\\debd8cff6e2276a522af3f41bd5310de.jpg', 'images', 'image/jpeg', '3994763', 1, 1614529569, 1614529569);
INSERT INTO `ape_attachment` VALUES (36, 0, '4fcd25dcc05cfdfb5e25828531420027.jpg', '/uploads/images/20210301\\4fcd25dcc05cfdfb5e25828531420027.jpg', 'images', 'image/jpeg', '3994763', 1, 1614529632, 1614529632);
INSERT INTO `ape_attachment` VALUES (37, 0, '51f99f708d529b8c9e34965160d255e1.png', '/uploads/images/20210301\\51f99f708d529b8c9e34965160d255e1.png', 'images', 'image/png', '387019', 1, 1614529727, 1614529727);
INSERT INTO `ape_attachment` VALUES (38, 0, '7e7e99b0aa3cb288673a9fa47e8966b7.png', '/uploads/images/20210301\\7e7e99b0aa3cb288673a9fa47e8966b7.png', 'images', 'image/png', '387019', 1, 1614529793, 1614529793);
INSERT INTO `ape_attachment` VALUES (39, 0, '87b038536417affdac90e90dfd2ac71e.jpg', '/uploads/images/20210301\\87b038536417affdac90e90dfd2ac71e.jpg', 'images', 'image/jpeg', '3994763', 1, 1614529908, 1614529908);
INSERT INTO `ape_attachment` VALUES (40, 0, '2af94b5640c792a5e9b05981587f9a5d.jpg', '/uploads/images/20210301\\2af94b5640c792a5e9b05981587f9a5d.jpg', 'images', 'image/jpeg', '3994763', 1, 1614530049, 1614530049);
INSERT INTO `ape_attachment` VALUES (41, 0, '5ebc6fcbee2e1f187a9d310a9a437544.png', '/uploads/images/20210301\\5ebc6fcbee2e1f187a9d310a9a437544.png', 'images', 'image/png', '387019', 1, 1614530154, 1614530154);
INSERT INTO `ape_attachment` VALUES (42, 0, 'f6d8d7b6c4fa13723c628c2af37b8e3d.png', '/uploads/images/20210301\\f6d8d7b6c4fa13723c628c2af37b8e3d.png', 'images', 'image/png', '387019', 1, 1614530440, 1614530440);
INSERT INTO `ape_attachment` VALUES (43, 0, '10f8d2154fe1785bd13443df13694789.jpg', '/uploads/images/20210307\\10f8d2154fe1785bd13443df13694789.jpg', 'images', 'image/jpeg', '404022', 1, 1615048389, 1615048389);
INSERT INTO `ape_attachment` VALUES (44, 0, 'c5a826e08a9a77a84e2b8a930f9db251.jpg', '/uploads/images/20210307\\c5a826e08a9a77a84e2b8a930f9db251.jpg', 'images', 'image/jpeg', '1919593', 1, 1615048531, 1615048531);
INSERT INTO `ape_attachment` VALUES (45, 0, '37c603e2b6b1bdfeb9dc5711e4450fcf.jpg', '/uploads/images/20210307\\37c603e2b6b1bdfeb9dc5711e4450fcf.jpg', 'images', 'image/jpeg', '1919593', 1, 1615048796, 1615048796);
INSERT INTO `ape_attachment` VALUES (46, 0, 'f859dd37e566cfcb714ee5b327e994bc.png', '/uploads/images/20210307\\f859dd37e566cfcb714ee5b327e994bc.png', 'images', 'image/png', '387019', 1, 1615111030, 1615111030);
INSERT INTO `ape_attachment` VALUES (47, 0, '0ca910c3688e979dcc8036ee3d204e90.png', '/uploads/images/20210307\\0ca910c3688e979dcc8036ee3d204e90.png', 'images', 'image/png', '387019', 1, 1615111525, 1615111525);
INSERT INTO `ape_attachment` VALUES (48, 0, '4ee66c906a43fee4eba336de9b7ee41b.jpg', '/uploads/images/20210307\\4ee66c906a43fee4eba336de9b7ee41b.jpg', 'images', 'image/jpeg', '1919593', 1, 1615111546, 1615111546);
INSERT INTO `ape_attachment` VALUES (49, 0, '03f399571aa03e7476a0ed880dfe1b43.jpg', '/uploads/images/20210307\\03f399571aa03e7476a0ed880dfe1b43.jpg', 'images', 'image/jpeg', '1919593', 1, 1615111757, 1615111757);
INSERT INTO `ape_attachment` VALUES (50, 0, 'ae4ef0c80b0b1417a1f79d8d62f6b579.jpg', '/uploads/images/20210307\\ae4ef0c80b0b1417a1f79d8d62f6b579.jpg', 'images', 'image/jpeg', '1919593', 1, 1615113981, 1615113981);
INSERT INTO `ape_attachment` VALUES (51, 0, 'c14c29790fb9ba39ba6e46b8ec5b3d6a.jpg', '/uploads/images/20210401\\c14c29790fb9ba39ba6e46b8ec5b3d6a.jpg', 'images', 'image/jpeg', '1919593', 1, 1617280997, 1617280997);
INSERT INTO `ape_attachment` VALUES (52, 0, 'a67d48a217278ba0ea41d232b47f3d65.jpeg', '/uploads/files/20210405\\a67d48a217278ba0ea41d232b47f3d65.jpeg', 'files', 'image/jpeg', '6755', 1, 1617629064, 1617629064);
INSERT INTO `ape_attachment` VALUES (53, 0, '0b4651b1f133369a773cc98bcb163cd8.jpeg', '/uploads/files/20210405\\0b4651b1f133369a773cc98bcb163cd8.jpeg', 'files', 'image/jpeg', '6755', 1, 1617629073, 1617629073);
INSERT INTO `ape_attachment` VALUES (54, 0, '60b557b38a20dc46b4ae1514e7a38fb4.jpeg', '/uploads/files/20210405\\60b557b38a20dc46b4ae1514e7a38fb4.jpeg', 'files', 'image/jpeg', '6755', 1, 1617629084, 1617629084);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
INSERT INTO `ape_attachment_category` VALUES (1, 0, '用户头像', 'images', '1', NULL, 1613799617, 1613799617);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
INSERT INTO `ape_document_category` VALUES (3, '编程资料', '', '', 1, 0, 0, '', '', '', 'list_default.html', '', 5, 1, 0, 0);
INSERT INTO `ape_document_category` VALUES (2, '首页', '', '', 1, 0, 99, '', '', '', 'list_default.html', '', 3, 1, 0, 1617634005);
INSERT INTO `ape_document_category` VALUES (4, '测试', '', '', 1, 2, 0, '', '', '', 'list_default.html', '', 3, 1, 0, 0);
INSERT INTO `ape_document_category` VALUES (5, '测试子元素', '', '', 1, 4, 0, '', '', '', 'list_default.html', '', 0, 1, 0, 0);
INSERT INTO `ape_document_category` VALUES (6, '测试子元素子元素', '', '', 1, 5, 0, '', '', '', 'list_default.html', '', 0, 1, 0, 0);

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
INSERT INTO `ape_document_category_content` VALUES (2, '');
INSERT INTO `ape_document_category_content` VALUES (3, '');
INSERT INTO `ape_document_category_content` VALUES (4, '');
INSERT INTO `ape_document_category_content` VALUES (5, '');
INSERT INTO `ape_document_category_content` VALUES (6, '');

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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
INSERT INTO `ape_pv_log` VALUES (1, 15, 14, '2021-02-20', 1613805123);
INSERT INTO `ape_pv_log` VALUES (2, 16, 31, '2021-02-20', 1613809117);
INSERT INTO `ape_pv_log` VALUES (3, 16, 1, '2021-02-27', 1614414821);
INSERT INTO `ape_pv_log` VALUES (4, 9, 5, '2021-03-05', 1614908125);
INSERT INTO `ape_pv_log` VALUES (5, 0, 1, '2021-03-07', 1615048315);
INSERT INTO `ape_pv_log` VALUES (6, 9, 1, '2021-03-10', 1615340063);
INSERT INTO `ape_pv_log` VALUES (7, 9, 1, '2021-03-11', 1615427714);
INSERT INTO `ape_pv_log` VALUES (8, 10, 7, '2021-03-11', 1615428091);
INSERT INTO `ape_pv_log` VALUES (9, 14, 1, '2021-03-20', 1616222191);
INSERT INTO `ape_pv_log` VALUES (10, 10, 10, '2021-04-03', 1617416807);
INSERT INTO `ape_pv_log` VALUES (11, 11, 20, '2021-04-03', 1617419030);
INSERT INTO `ape_pv_log` VALUES (12, 12, 2, '2021-04-03', 1617422514);
INSERT INTO `ape_pv_log` VALUES (13, 13, 2, '2021-04-03', 1617426662);
INSERT INTO `ape_pv_log` VALUES (14, 16, 2, '2021-04-03', 1617438065);
INSERT INTO `ape_pv_log` VALUES (15, 17, 6, '2021-04-03', 1617442242);
INSERT INTO `ape_pv_log` VALUES (16, 0, 22, '2021-04-04', 1617466672);
INSERT INTO `ape_pv_log` VALUES (17, 18, 2, '2021-04-04', 1617533607);
INSERT INTO `ape_pv_log` VALUES (18, 20, 1, '2021-04-04', 1617540225);
INSERT INTO `ape_pv_log` VALUES (19, 0, 2, '2021-04-05', 1617553909);
INSERT INTO `ape_pv_log` VALUES (20, 19, 6, '2021-04-05', 1617621255);
INSERT INTO `ape_pv_log` VALUES (21, 20, 7, '2021-04-05', 1617624471);
INSERT INTO `ape_pv_log` VALUES (22, 21, 21, '2021-04-05', 1617627697);
INSERT INTO `ape_pv_log` VALUES (23, 22, 6, '2021-04-05', 1617631748);
INSERT INTO `ape_pv_log` VALUES (24, 23, 25, '2021-04-05', 1617635551);
INSERT INTO `ape_pv_log` VALUES (25, 9, 2, '2021-04-06', 1617673132);
INSERT INTO `ape_pv_log` VALUES (26, 17, 1, '2021-04-06', 1617699607);
INSERT INTO `ape_pv_log` VALUES (27, 18, 1, '2021-04-10', 1618051910);
INSERT INTO `ape_pv_log` VALUES (28, 23, 20, '2021-04-10', 1618069480);
INSERT INTO `ape_pv_log` VALUES (29, 0, 33, '2021-04-11', 1618070452);
INSERT INTO `ape_pv_log` VALUES (30, 9, 2, '2021-04-12', 1618190955);
INSERT INTO `ape_pv_log` VALUES (31, 23, 3, '2021-04-18', 1618758678);
INSERT INTO `ape_pv_log` VALUES (32, 16, 2, '2021-04-19', 1618822297);
INSERT INTO `ape_pv_log` VALUES (33, 18, 1, '2021-04-19', 1618827599);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯片' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_slides
-- ----------------------------

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
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', 'systemConfig(\"title\")', 90, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/898b720200509204528197.jpg', '', 89, 1, 1, '1', NULL, 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '派后台管理系统', '', 88, 1, 1, '1', NULL, 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '派后台管理系统', '', 87, 1, 1, '1', NULL, 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/uploads/files/20210405\\60b557b38a20dc46b4ae1514e7a38fb4.jpeg', '', 85, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Power by LEARY.', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', 'xxx', '', 83, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (9, 3, '短信平台', 'sms_type', 'radio', 'input', 0, '1=>腾讯云\n2=>阿里云', '1', '', 99, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (10, 3, 'AppID', 'sms_appid', 'text', 'input', 0, '', '1400323535', '', 98, 1, 1, '1', '1', 1583126757, 1583126769);
INSERT INTO `ape_system_config` VALUES (11, 3, 'App Key', 'sms_appkey', 'text', 'input', 0, '', '0777dd251be53632c95da276738b9fd0', '', 97, 1, 1, '1', '1', 1583126826, 1583131539);
INSERT INTO `ape_system_config` VALUES (12, 3, '短信登录模板ID', 'sms_login', 'number', 'input', 0, '', '545149', '', 0, 0, 1, '1', NULL, 1583137085, 1582792265);
INSERT INTO `ape_system_config` VALUES (13, 3, '短信签名', 'sms_sign', 'text', 'input', 0, '', '里派LEAPY', '', 0, 1, 1, '1', '1', 1583137174, 1583140447);
INSERT INTO `ape_system_config` VALUES (14, 3, '找回密码', 'sms_retrieve', 'number', 'input', 0, '', ' 545151', '', 0, 0, 1, '1', NULL, 1583138408, 1582792265);
INSERT INTO `ape_system_config` VALUES (15, 3, '注册', 'sms_register', 'number', 'input', 0, '', '545150', '', 0, 0, 1, '1', NULL, 1583138507, 1582792265);
INSERT INTO `ape_system_config` VALUES (17, 13, '公众号名称', 'wechat_app_name', 'text', 'input', 0, '', '里派社区', '', 99, 1, 1, '1', '1', 1583221905, 1583222192);
INSERT INTO `ape_system_config` VALUES (18, 13, '微信号', 'wechat_app_number', 'text', 'input', 0, '', 'LEAPY_CN', '', 98, 1, 1, '1', '1', 1583221970, 1583222198);
INSERT INTO `ape_system_config` VALUES (19, 13, '原始ID', 'wechat_app_origin_id', 'text', 'input', 0, '', 'gh_f9e2116bdc11', '', 97, 1, 1, '1', NULL, 1583222185, 1582792265);
INSERT INTO `ape_system_config` VALUES (20, 13, 'AppID', 'wechat_appid', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 96, 1, 1, '1', NULL, 1583222266, 1582792265);
INSERT INTO `ape_system_config` VALUES (21, 13, 'AppSecret', 'wechat_appsecret', 'text', 'input', 0, '', '2575cab179dff5b22f3c9285d4c565b7', '', 95, 1, 1, '1', '1', 1583222345, 1583222356);
INSERT INTO `ape_system_config` VALUES (22, 13, '微信验证TOKEN', 'wechat_token', 'text', 'input', 0, '', 'learn', '', 94, 1, 1, '1', NULL, 1583222439, 1582792265);
INSERT INTO `ape_system_config` VALUES (23, 13, '消息加解密方式', 'wechat_encry', 'radio', 'input', 0, '1=>明文模式\n2=>兼容模式\n3=>安全模式', '1', '', 93, 1, 1, '1', '1', 1583222535, 1583223241);
INSERT INTO `ape_system_config` VALUES (24, 13, 'EncodingAESKey', 'wechat_aeskey', 'text', 'input', 0, '', 'EnRXjvDAHlqKbxaaSeQE3pnNBkNHMLmqL5QuB4KsNYt', '', 92, 1, 1, '1', '1', 1583223110, 1583223252);
INSERT INTO `ape_system_config` VALUES (25, 13, '公众号类型', 'wechat_type', 'radio', 'input', 0, '1=>服务号\n2=>订阅号', '2', '', 91, 1, 1, '1', '1', 1583223219, 1583223257);
INSERT INTO `ape_system_config` VALUES (26, 13, '接口地址', 'wechat_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/wechat/serve', '', 90, 1, 1, '1', NULL, 1583223343, 1582792265);
INSERT INTO `ape_system_config` VALUES (29, 14, '小程序APPID', 'miniprogram_appid', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 99, 1, 1, '1', '1', 1587732068, 1587967147);
INSERT INTO `ape_system_config` VALUES (30, 14, '小程序密钥', 'miniprogram_appsecret', 'text', 'input', 0, '', '144ddbf99b8cf58b644410c36666865d', '', 98, 1, 1, '1', '1', 1587732178, 1587967175);
INSERT INTO `ape_system_config` VALUES (31, 14, '小程序LOGO', 'miniprogram_logo', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/29a4a202005092052147675.jpg', '', 0, 1, 1, '1', '1', 1588201532, 1589028469);
INSERT INTO `ape_system_config` VALUES (32, 14, '小程序名称', 'miniprogram_name', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', NULL, 1588202282, 1582792265);
INSERT INTO `ape_system_config` VALUES (33, 2, '存储方式', 'storage_type', 'radio', 'input', 0, '1=>本地储存\n2=>腾讯云COS', '1', '', 0, 1, 1, '1', NULL, 1588819285, 1582792265);
INSERT INTO `ape_system_config` VALUES (34, 2, 'CDN域名', 'storage_domain', 'text', 'input', 0, '', 'http://file.cos.leapy.cn', '', 0, 1, 1, '1', '1', 1588819651, 1588828871);
INSERT INTO `ape_system_config` VALUES (35, 2, 'SecretId', 'storage_secretid', 'text', 'input', 0, '', 'AKIDBFBzd7aUNEvVv9F7sphOwKWuAuY3qVwI', '', 0, 1, 1, '1', '1', 1588820386, 1588828877);
INSERT INTO `ape_system_config` VALUES (36, 2, 'SecretKey', 'storage_secretkey', 'text', 'input', 0, '', 'fGgw0sY4TiyfFdoqhQyKUTFqJcYM2YxE', '', 0, 1, 1, '1', '1', 1588820426, 1588828883);
INSERT INTO `ape_system_config` VALUES (37, 2, '存储位置', 'storage_region', 'text', 'input', 0, '', 'ap-chengdu', '腾讯云COS填写', 0, 1, 1, '1', '1', 1588821134, 1588828897);
INSERT INTO `ape_system_config` VALUES (38, 2, '存储桶名称', 'storage_bucket', 'text', 'input', 0, '', 'pipasheng-1252563008', '', 0, 1, 1, '1', '1', 1588821538, 1588828889);
INSERT INTO `ape_system_config` VALUES (39, 4, 'SMTP服务器', 'mail_host', 'text', 'input', 0, '', 'http://bt.leapy.cn:618/mail_sys/send_mail_http.json', '', 0, 1, 1, '1', NULL, 1588835717, 1582792265);
INSERT INTO `ape_system_config` VALUES (40, 4, '邮箱用户名', 'mail_username', 'text', 'input', 0, '', 'mail@leapy.cn', '', 0, 1, 1, '1', '1', 1588835775, 1588836096);
INSERT INTO `ape_system_config` VALUES (41, 4, '授权码', 'mail_password', 'text', 'input', 0, '', '52Xia666', '', 0, 1, 1, '1', NULL, 1588835807, 1582792265);
INSERT INTO `ape_system_config` VALUES (42, 4, '服务器端口', 'mail_port', 'text', 'input', 0, '', '25', '', 0, 1, 1, '1', NULL, 1588836004, 1582792265);
INSERT INTO `ape_system_config` VALUES (43, 4, '发件人', 'mail_from', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', NULL, 1588836080, 1582792265);
INSERT INTO `ape_system_config` VALUES (44, 4, '发件人签名', 'mail_from_name', 'text', 'input', 0, '', '里派', '', 0, 1, 1, '1', '1', 1588844572, 1588845488);
INSERT INTO `ape_system_config` VALUES (45, 38, 'APP支付APPID', 'pay_wechat_appid', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '1', 1588854973, 1588855071);
INSERT INTO `ape_system_config` VALUES (46, 38, '公众号APPID', 'pay_wechat_app_id', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 0, 1, 1, '1', NULL, 1588855050, 1582792265);
INSERT INTO `ape_system_config` VALUES (47, 38, '小程序APPID', 'pay_wechat_miniapp_id', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 0, 1, 1, '1', NULL, 1588855120, 1582792265);
INSERT INTO `ape_system_config` VALUES (48, 38, '商户号', 'pay_wechat_mch_id', 'text', 'input', 0, '', '1588549971', '', 0, 1, 1, '1', NULL, 1588855177, 1582792265);
INSERT INTO `ape_system_config` VALUES (49, 38, 'API密钥', 'pay_wechat_key', 'text', 'input', 0, '', 'wsCQDTupznzYfH8oKH89PVvbUC5h4tb0', '', 0, 1, 1, '1', NULL, 1588855400, 1582792265);
INSERT INTO `ape_system_config` VALUES (50, 38, '支付证书', 'pay_wechat_apiclient_cert', 'file', 'input', 0, '', '/upload/file/20200507/c0b5fc54d03d194078899202059e41a1.pem', '', 0, 1, 1, '1', '1', 1588855742, 1588856093);
INSERT INTO `ape_system_config` VALUES (51, 38, '支付密钥', 'pay_wechat_apiclient_key', 'file', 'input', 0, '', '/upload/file/20200507/53315d3c81bd5e7d6626410cc81f6d45.pem', '', 0, 1, 1, '1', '1', 1588855797, 1588856105);
INSERT INTO `ape_system_config` VALUES (52, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'https://learn.leapy.cn', '', 0, 1, 1, '1', NULL, 1588858018, 1582792265);
INSERT INTO `ape_system_config` VALUES (53, 39, '支付宝APPID', 'pay_alipay_app_id', 'text', 'input', 0, '', '2018071160550945', '', 0, 1, 1, '1', NULL, 1588894650, 1582792265);
INSERT INTO `ape_system_config` VALUES (54, 39, '支付宝公钥', 'pay_alipay_ali_public_key', 'text', 'input', 0, '', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqdwBWnAd0DT973SyIGheDBWFpbRhEowyQwo5K/ryDLl5jQcBnhufgtvxYu7OIP365maGnEjb1VokNFi+9jWLogl9cgHKVOCTpmEwtAfjC6LT2+8bCp/xTQyFtvL5rvQBt5vDiM6n1t3NACPOBKEo5dJoPHv0Frdvmmqs8pWbw1gJDKmVdAxh8YYP5/b4mtG+JruPYOjTzuYms5UPbW3N3/JnMCeoQcJHVOpyZsvztJFqaASMA0OY9N5u8Wr6wJiifN+PWUa8eKFVJ2wc7fDKeNIqUpIP+YiQjzz69h0//3inLeshLsYlEQCjXJUDveXTY/PKBLm3vmSrY0zF2cAt2QIDAQAB', '', 0, 1, 1, '1', '1', 1588894847, 1588895236);
INSERT INTO `ape_system_config` VALUES (55, 39, '支付宝私钥', 'pay_alipay_private_key', 'text', 'input', 0, '', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCp3AFacB3QNP3vdLIgaF4MFYWltGESjDJDCjkr+vIMuXmNBwGeG5+C2/Fi7s4g/frmZoacSNvVWiQ0WL72NYuiCX1yAcpU4JOmYTC0B+MLotPb7xsKn/FNDIW28vmu9AG3m8OIzqfW3c0AI84EoSjl0mg8e/QWt2+aaqzylZvDWAkMqZV0DGHxhg/n9via0b4mu49g6NPO5iazlQ9tbc3f8mcwJ6hBwkdU6nJmy/O0kWpoBIwDQ5j03m7xavrAmKJ8349ZRrx4oVUnbBzt8Mp40ipSkg/5iJCPPPr2HT//eKct6yEuxiURAKNclQO95dNj88oEube+ZKtjTMXZwC3ZAgMBAAECggEAPjS9JiLDOFn/2W8SQP4X2zMSk+HgXwuK6LRYxbuMY46VbklvlTimjSUBXOr6AGkjNre7eobQQ21UrvsFTGPFtFznXRY8xCLOz/LuBDCTPNKv5e7GJ3j1xPLeEWcge6sO6fAYhwSvwOfPyMpUC6v9r1UEKYp3lM4vCA0jM2AJAFum+XrGz0zLyKyaSb88GdxTU8FsbM/EbJn6ReQmzNF5O0P+mrBBhb5JQ0a8ixsOB6DIc48tJGMWFf+AVb4QG93qmUP9vyErJCEj6/Cz8gF7SxOE88YtS/baiJGedLayS0Kzxr5Fy2ch/+7q5CLg5n/oN//gJcxIFcGvY/kwp0d4pQKBgQDjpxxIDPSR/FRpgqZXQwK+eZ5aW1GgILZeGH/iF1vsqY3eDqwxD3+fQARHUTYTy86pRTgbEhHAFItKe9cwd2CztDkiz/Avw3DCNmVE6H14deqb89h3fxMeVwuBzsidvvQB0nFbtCDaiG+YGDndh3gVrPY8Bz18dTDBDnrHHh44KwKBgQC/Ap1fjkjwp8j42kO3DvQoaN/Pd1rA/kZoc4GqofUEM1GE6Qx98rPQgCicMMycvJrGzoSg8d/6l19JplmFrn52qKqdnEg+TBTv8H9XY8cqEjDzOggkE4ypRidZypjKdtHmprQ6K8fICs1SGc+aSgDUzuR3U/Om4C+E8R3ujtVMCwKBgQDKwO4WWbuFPcfshNkjhOIvxN+9N/HV/OyPl6BmPEm52TUqHcVMmLIgooJtBi50qSMxbR3QNmKqwWFhgDSizN/KjWwJzkrsL1QBFTNSkQIWxGakaSRVIU9kyT/NZ98TZ5uo98XQV/ieyb8iJgl7fQj9vSM9SXGApFs8xmmhZ/igKwKBgCqei7zJg67m0SntkZRj6sildeLVz9MmKVGfDDylfIUeaj8MvPPRVpvcLLOFE/KZBrP7Wo6KyZ4hbmqBipIQeDlDsyYNu/Tihv1unQtDwSm6+18aAL0D+6u9coRPdz4duwILCkW8hQw2lM+P4MmdX4gcTc/uVHxUo2W3YyVai283AoGAB4+/SHoXFkN+Wez0mxOcQ68o+5SiVDVi19nH1zRY8rxjoxIZ7OkQYyBNMIaT7dwchlLSevUyRI8q56m2vFsYI5LSBnm6ZKfTZhT1DrcpRdk7UFZCi+MQ8PXxDlsXilZOUNvTyBqCsBzRjPehHrzMiv9RSB61uncQnJy0+d1D3OU=', '', 0, 1, 1, '1', '1', 1588894902, 1588895266);
INSERT INTO `ape_system_config` VALUES (56, 39, '应用公钥证书路径', 'pay_alipay_app_cert_public_key', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', NULL, 1588895349, 1582792265);
INSERT INTO `ape_system_config` VALUES (57, 39, '支付宝根证书路径', 'pay_alipay_alipay_root_cert', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', '1', 1588895390, 1588895402);
INSERT INTO `ape_system_config` VALUES (58, 14, '小程序Token', 'miniprogram_token', 'text', 'input', 0, '', 'learn.leapy.cn', '', 0, 1, 1, '1', NULL, 1589007729, 1582792265);
INSERT INTO `ape_system_config` VALUES (59, 14, 'EncodingAESKey', 'miniprogram_aeskey', 'text', 'input', 0, '', '4aFLNbclHer8Qhx4PdmBUhohsMR7Ngm0lsQwgllwk4H', '', 0, 1, 1, '1', '1', 1589007789, 1589007836);
INSERT INTO `ape_system_config` VALUES (60, 14, '加密方式', 'miniprogram_encry', 'radio', 'input', 0, '1=>明文模式\n2=> 兼容模式\n3=> 安全模式（推荐）', '1', '', 0, 1, 1, '1', NULL, 1589007953, 1582792265);
INSERT INTO `ape_system_config` VALUES (61, 14, '接口地址', 'miniprogram_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/mini_program/serve', '', 0, 1, 1, '1', '1', 1589008013, 1589008053);
INSERT INTO `ape_system_config` VALUES (62, 14, '审核模式', 'miniprogram_audit', 'radio', 'input', 0, '0=>关闭\n1=>开启', '0', '', 0, 1, 1, '1', '1', 1589177436, 1589326389);
INSERT INTO `ape_system_config` VALUES (63, 14, '搜索提示', 'miniprogram_search', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', NULL, 1589178363, 1582792265);
INSERT INTO `ape_system_config` VALUES (64, 4, '邮件类型', 'mail_type', 'radio', 'input', 0, '0=>其它\n1=>宝塔邮件', '1', '0::其它,1宝塔', 0, 1, 1, '1', NULL, 1589507116, 1582792265);
INSERT INTO `ape_system_config` VALUES (65, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (66, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'blog', '', 83, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (67, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (68, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (69, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (70, 1, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '青岛市黄岛区长江路街道', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
INSERT INTO `ape_system_config_tab` VALUES (1, '基础配置', 99, 1, '1', '1', 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (2, '上传配置', 98, 1, '1', '1', 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` VALUES (3, '短信配置', 97, 1, '1', '1', 1582785710, 1583385498);
INSERT INTO `ape_system_config_tab` VALUES (4, '邮件配置', 96, 1, '1', '1', 1582785719, 1583385506);
INSERT INTO `ape_system_config_tab` VALUES (13, '公众号配置', 95, 1, '1', '1', 1583221840, 1583385525);
INSERT INTO `ape_system_config_tab` VALUES (14, '小程序配置', 94, 1, '1', '1', 1583221850, 1583385532);
INSERT INTO `ape_system_config_tab` VALUES (38, '微信支付', 0, 1, '1', '1', 1588854047, 1588854054);
INSERT INTO `ape_system_config_tab` VALUES (39, '支付宝支付', 0, 1, '1', NULL, 1588854063, 1582792265);

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
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 309 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
INSERT INTO `ape_url_log` VALUES (291, 'http://hulacwms.io/', 2, '网站首页', '2021-03-21', 1616333763);
INSERT INTO `ape_url_log` VALUES (292, 'http://apeblog.io/', 30, '网站首页', '2021-04-03', 1617417722);
INSERT INTO `ape_url_log` VALUES (293, 'http://apeblog.io/decoration-erp/index.html', 4, '网站首页', '2021-04-03', 1617420239);
INSERT INTO `ape_url_log` VALUES (294, 'http://apeblog.io/oracle-ebs-pl-sql-arapsubleadernotposttogl/index.html', 1, '网站首页', '2021-04-03', 1617422210);
INSERT INTO `ape_url_log` VALUES (295, 'http://apeblog.io/oaworkflowapprove/index.html', 2, '网站首页', '2021-04-03', 1617422325);
INSERT INTO `ape_url_log` VALUES (296, 'http://apeblog.io/', 25, '网站首页', '2021-04-04', 1617466672);
INSERT INTO `ape_url_log` VALUES (297, 'http://apeblog.io/', 55, '网站首页', '2021-04-05', 1617553909);
INSERT INTO `ape_url_log` VALUES (298, 'http://apeblog.io/index/article/lists.html?id=2', 3, '首页', '2021-04-05', 1617630940);
INSERT INTO `ape_url_log` VALUES (299, 'http://apeblog.io/index/article/lists.html?id=4', 1, '测试', '2021-04-05', 1617636916);
INSERT INTO `ape_url_log` VALUES (300, 'http://apeblog.io/', 3, '网站首页', '2021-04-06', 1617673132);
INSERT INTO `ape_url_log` VALUES (301, 'http://apeblog.io/', 21, '网站首页', '2021-04-10', 1618051910);
INSERT INTO `ape_url_log` VALUES (302, 'http://apeblog.io/', 14, '网站首页', '2021-04-11', 1618070452);
INSERT INTO `ape_url_log` VALUES (303, 'http://apeblog.io/index/article/lists.html?id=4', 2, '测试', '2021-04-11', 1618071386);
INSERT INTO `ape_url_log` VALUES (304, 'http://apeblog.io/index/article/lists.html?id=3', 3, '编程资料', '2021-04-11', 1618071859);
INSERT INTO `ape_url_log` VALUES (305, 'http://apeblog.io/index/article/lists.html?id=3', 2, '编程资料', '2021-04-12', 1618190955);
INSERT INTO `ape_url_log` VALUES (306, 'http://apeblog.io/', 1, '网站首页', '2021-04-18', 1618758678);
INSERT INTO `ape_url_log` VALUES (307, 'http://apeblog.io/decoration-erp/index.html', 2, '网站首页', '2021-04-18', 1618758945);
INSERT INTO `ape_url_log` VALUES (308, 'http://apeblog.io/', 3, '网站首页', '2021-04-19', 1618822297);

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
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
INSERT INTO `ape_uv_log` VALUES (1, '127.0.0.1', 15, '2021-02-20', 1613805123);
INSERT INTO `ape_uv_log` VALUES (2, '127.0.0.1', 16, '2021-02-27', 1614414821);
INSERT INTO `ape_uv_log` VALUES (3, '127.0.0.1', 9, '2021-03-05', 1614908125);
INSERT INTO `ape_uv_log` VALUES (4, '127.0.0.1', 0, '2021-03-07', 1615048315);
INSERT INTO `ape_uv_log` VALUES (5, '127.0.0.1', 9, '2021-03-10', 1615340063);
INSERT INTO `ape_uv_log` VALUES (6, '127.0.0.1', 9, '2021-03-11', 1615427714);
INSERT INTO `ape_uv_log` VALUES (7, '127.0.0.1', 14, '2021-03-20', 1616222191);
INSERT INTO `ape_uv_log` VALUES (8, '127.0.0.1', 10, '2021-04-03', 1617416807);
INSERT INTO `ape_uv_log` VALUES (9, '127.0.0.1', 0, '2021-04-04', 1617466672);
INSERT INTO `ape_uv_log` VALUES (10, '127.0.0.1', 0, '2021-04-05', 1617553909);
INSERT INTO `ape_uv_log` VALUES (11, '127.0.0.1', 9, '2021-04-06', 1617673132);
INSERT INTO `ape_uv_log` VALUES (12, '127.0.0.1', 18, '2021-04-10', 1618051910);
INSERT INTO `ape_uv_log` VALUES (13, '127.0.0.1', 0, '2021-04-11', 1618070452);
INSERT INTO `ape_uv_log` VALUES (14, '127.0.0.1', 9, '2021-04-12', 1618190955);
INSERT INTO `ape_uv_log` VALUES (15, '127.0.0.1', 23, '2021-04-18', 1618758678);
INSERT INTO `ape_uv_log` VALUES (16, '127.0.0.1', 16, '2021-04-19', 1618822297);

SET FOREIGN_KEY_CHECKS = 1;
