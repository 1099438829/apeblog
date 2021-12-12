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

 Date: 10/12/2021 00:07:48
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
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `status` tinyint(1) NOT NULL COMMENT '状态1:正常0冻结',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册ip',
  `create_user` int(32) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(32) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
INSERT INTO `ape_admin` VALUES (1, 1, 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '', '/uploads/image/20210215/bc6445679240d4795e279860a6ab34e9.jpeg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, '', 1, 1, 1580031132, 1635572650);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `ape_admin_auth` VALUES (18, '文章列表', '', 17, 'admin', 'article', 'index', '', '', 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', '', 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` VALUES (21, '留言管理', '', 27, 'admin', 'message', 'index', '', '', 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` VALUES (23, '分类管理', '', 22, 'admin', 'category', 'index', '', '', 0, 0, 1, '/admin/category/index', 0, 1, '1', '', 1613390173, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (25, '文章管理', '', 22, 'admin', 'article', 'index', '', '', 0, 0, 1, '/admin/article/index', 0, 1, '1', '', 1613390289, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (26, '文章回收站', '', 22, 'admin', 'article', 'recovery', '', '', 0, 0, 1, '/admin/article/recovery', 0, 1, '1', '', 1613390366, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (27, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', '', 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194);
INSERT INTO `ape_admin_auth` VALUES (28, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (29, '会员管理', '', 28, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (31, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` VALUES (32, '主题管理', '', 31, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (33, '主题商店', '', 31, 'admin', 'theme', 'store', '', '', 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404);
INSERT INTO `ape_admin_auth` VALUES (34, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', '', 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', '', 1613400510, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (35, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', '', 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', '', 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (37, '邀请码管理', '', 27, 'admin', 'invitation', 'index', '', '', 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` VALUES (38, '广告管理', 'mdi mdi-bulletin-board', 27, 'admin', 'poster', 'index', '', '', 0, 0, 1, '/admin/poster/index', 0, 1, '1', '1', 1627293150, 1627293165);
INSERT INTO `ape_admin_auth` VALUES (39, '数据库管理', '', 8, 'admin', 'databases', 'index', '', '', 0, 0, 1, '/admin/databases/index', 0, 1, '1', '', 1635572569, 1635572671);

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
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------
INSERT INTO `ape_admin_log` VALUES (1, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636301752);
INSERT INTO `ape_admin_log` VALUES (2, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636301777);
INSERT INTO `ape_admin_log` VALUES (3, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636302055);
INSERT INTO `ape_admin_log` VALUES (4, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636302058);
INSERT INTO `ape_admin_log` VALUES (5, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636302152);
INSERT INTO `ape_admin_log` VALUES (6, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636302180);
INSERT INTO `ape_admin_log` VALUES (7, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636302241);
INSERT INTO `ape_admin_log` VALUES (8, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636303081);
INSERT INTO `ape_admin_log` VALUES (9, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636303631);
INSERT INTO `ape_admin_log` VALUES (10, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636304403);
INSERT INTO `ape_admin_log` VALUES (11, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.38', 1636304676);
INSERT INTO `ape_admin_log` VALUES (12, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562763);
INSERT INTO `ape_admin_log` VALUES (13, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562764);
INSERT INTO `ape_admin_log` VALUES (14, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562766);
INSERT INTO `ape_admin_log` VALUES (15, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562776);
INSERT INTO `ape_admin_log` VALUES (16, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562790);
INSERT INTO `ape_admin_log` VALUES (17, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562795);
INSERT INTO `ape_admin_log` VALUES (18, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636562847);
INSERT INTO `ape_admin_log` VALUES (19, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636564043);
INSERT INTO `ape_admin_log` VALUES (20, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636564290);
INSERT INTO `ape_admin_log` VALUES (21, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636564293);
INSERT INTO `ape_admin_log` VALUES (22, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636564319);
INSERT INTO `ape_admin_log` VALUES (23, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636565343);
INSERT INTO `ape_admin_log` VALUES (24, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636565471);
INSERT INTO `ape_admin_log` VALUES (25, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1636565490);
INSERT INTO `ape_admin_log` VALUES (26, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644646);
INSERT INTO `ape_admin_log` VALUES (27, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644646);
INSERT INTO `ape_admin_log` VALUES (28, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644652);
INSERT INTO `ape_admin_log` VALUES (29, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644656);
INSERT INTO `ape_admin_log` VALUES (30, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644856);
INSERT INTO `ape_admin_log` VALUES (31, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644858);
INSERT INTO `ape_admin_log` VALUES (32, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644859);
INSERT INTO `ape_admin_log` VALUES (33, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644861);
INSERT INTO `ape_admin_log` VALUES (34, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644863);
INSERT INTO `ape_admin_log` VALUES (35, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644884);
INSERT INTO `ape_admin_log` VALUES (36, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636644887);
INSERT INTO `ape_admin_log` VALUES (37, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645164);
INSERT INTO `ape_admin_log` VALUES (38, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645276);
INSERT INTO `ape_admin_log` VALUES (39, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645279);
INSERT INTO `ape_admin_log` VALUES (40, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645329);
INSERT INTO `ape_admin_log` VALUES (41, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645399);
INSERT INTO `ape_admin_log` VALUES (42, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645557);
INSERT INTO `ape_admin_log` VALUES (43, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645681);
INSERT INTO `ape_admin_log` VALUES (44, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645764);
INSERT INTO `ape_admin_log` VALUES (45, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645821);
INSERT INTO `ape_admin_log` VALUES (46, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645838);
INSERT INTO `ape_admin_log` VALUES (47, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636645995);
INSERT INTO `ape_admin_log` VALUES (48, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636646081);
INSERT INTO `ape_admin_log` VALUES (49, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636646692);
INSERT INTO `ape_admin_log` VALUES (50, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636646713);
INSERT INTO `ape_admin_log` VALUES (51, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636647783);
INSERT INTO `ape_admin_log` VALUES (52, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636647784);
INSERT INTO `ape_admin_log` VALUES (53, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636647785);
INSERT INTO `ape_admin_log` VALUES (54, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636649248);
INSERT INTO `ape_admin_log` VALUES (55, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636649284);
INSERT INTO `ape_admin_log` VALUES (56, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636649423);
INSERT INTO `ape_admin_log` VALUES (57, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636722051);
INSERT INTO `ape_admin_log` VALUES (58, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636722051);
INSERT INTO `ape_admin_log` VALUES (59, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636722064);
INSERT INTO `ape_admin_log` VALUES (60, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636722083);
INSERT INTO `ape_admin_log` VALUES (61, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636723124);
INSERT INTO `ape_admin_log` VALUES (62, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636723547);
INSERT INTO `ape_admin_log` VALUES (63, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636725818);
INSERT INTO `ape_admin_log` VALUES (64, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636725832);
INSERT INTO `ape_admin_log` VALUES (65, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636725835);
INSERT INTO `ape_admin_log` VALUES (66, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44', 1636725835);
INSERT INTO `ape_admin_log` VALUES (67, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819636);
INSERT INTO `ape_admin_log` VALUES (68, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819636);
INSERT INTO `ape_admin_log` VALUES (69, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819654);
INSERT INTO `ape_admin_log` VALUES (70, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819665);
INSERT INTO `ape_admin_log` VALUES (71, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819668);
INSERT INTO `ape_admin_log` VALUES (72, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819668);
INSERT INTO `ape_admin_log` VALUES (73, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819937);
INSERT INTO `ape_admin_log` VALUES (74, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819954);
INSERT INTO `ape_admin_log` VALUES (75, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636819956);
INSERT INTO `ape_admin_log` VALUES (76, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636820685);
INSERT INTO `ape_admin_log` VALUES (77, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636820686);
INSERT INTO `ape_admin_log` VALUES (78, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636821724);
INSERT INTO `ape_admin_log` VALUES (79, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636821746);
INSERT INTO `ape_admin_log` VALUES (80, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636821904);
INSERT INTO `ape_admin_log` VALUES (81, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636821907);
INSERT INTO `ape_admin_log` VALUES (82, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636822278);
INSERT INTO `ape_admin_log` VALUES (83, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.53', 1636822308);
INSERT INTO `ape_admin_log` VALUES (84, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036030);
INSERT INTO `ape_admin_log` VALUES (85, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036031);
INSERT INTO `ape_admin_log` VALUES (86, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036034);
INSERT INTO `ape_admin_log` VALUES (87, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036045);
INSERT INTO `ape_admin_log` VALUES (88, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036052);
INSERT INTO `ape_admin_log` VALUES (89, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036052);
INSERT INTO `ape_admin_log` VALUES (90, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036055);
INSERT INTO `ape_admin_log` VALUES (91, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036055);
INSERT INTO `ape_admin_log` VALUES (92, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036070);
INSERT INTO `ape_admin_log` VALUES (93, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036098);
INSERT INTO `ape_admin_log` VALUES (94, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036099);
INSERT INTO `ape_admin_log` VALUES (95, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036099);
INSERT INTO `ape_admin_log` VALUES (96, 1, 'admin', 'admin', 'admin_role', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036100);
INSERT INTO `ape_admin_log` VALUES (97, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036111);
INSERT INTO `ape_admin_log` VALUES (98, 1, 'admin', 'admin', 'message', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036116);
INSERT INTO `ape_admin_log` VALUES (99, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036117);
INSERT INTO `ape_admin_log` VALUES (100, 1, 'admin', 'admin', 'invitation', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036118);
INSERT INTO `ape_admin_log` VALUES (101, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036119);
INSERT INTO `ape_admin_log` VALUES (102, 1, 'admin', 'admin', 'slides', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036174);
INSERT INTO `ape_admin_log` VALUES (103, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036199);
INSERT INTO `ape_admin_log` VALUES (104, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036203);
INSERT INTO `ape_admin_log` VALUES (105, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036205);
INSERT INTO `ape_admin_log` VALUES (106, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036207);
INSERT INTO `ape_admin_log` VALUES (107, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036207);
INSERT INTO `ape_admin_log` VALUES (108, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036209);
INSERT INTO `ape_admin_log` VALUES (109, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036211);
INSERT INTO `ape_admin_log` VALUES (110, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036213);
INSERT INTO `ape_admin_log` VALUES (111, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036215);
INSERT INTO `ape_admin_log` VALUES (112, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036221);
INSERT INTO `ape_admin_log` VALUES (113, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036552);
INSERT INTO `ape_admin_log` VALUES (114, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036903);
INSERT INTO `ape_admin_log` VALUES (115, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036908);
INSERT INTO `ape_admin_log` VALUES (116, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638036912);
INSERT INTO `ape_admin_log` VALUES (117, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116522);
INSERT INTO `ape_admin_log` VALUES (118, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116532);
INSERT INTO `ape_admin_log` VALUES (119, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116532);
INSERT INTO `ape_admin_log` VALUES (120, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116537);
INSERT INTO `ape_admin_log` VALUES (121, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116652);
INSERT INTO `ape_admin_log` VALUES (122, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116654);
INSERT INTO `ape_admin_log` VALUES (123, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116783);
INSERT INTO `ape_admin_log` VALUES (124, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638116790);
INSERT INTO `ape_admin_log` VALUES (125, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117082);
INSERT INTO `ape_admin_log` VALUES (126, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117201);
INSERT INTO `ape_admin_log` VALUES (127, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117345);
INSERT INTO `ape_admin_log` VALUES (128, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117388);
INSERT INTO `ape_admin_log` VALUES (129, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117392);
INSERT INTO `ape_admin_log` VALUES (130, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117392);
INSERT INTO `ape_admin_log` VALUES (131, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638117581);
INSERT INTO `ape_admin_log` VALUES (132, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 1638118423);
INSERT INTO `ape_admin_log` VALUES (133, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638631640);
INSERT INTO `ape_admin_log` VALUES (134, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638631641);
INSERT INTO `ape_admin_log` VALUES (135, 1, 'admin', 'admin', 'article', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638631643);
INSERT INTO `ape_admin_log` VALUES (136, 1, 'admin', 'admin', 'category', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638632201);
INSERT INTO `ape_admin_log` VALUES (137, 1, 'admin', 'admin', 'system_config_tab', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638632243);
INSERT INTO `ape_admin_log` VALUES (138, 1, 'admin', 'admin', 'databases', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638632245);
INSERT INTO `ape_admin_log` VALUES (139, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638632245);
INSERT INTO `ape_admin_log` VALUES (140, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638709143);
INSERT INTO `ape_admin_log` VALUES (141, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638709184);
INSERT INTO `ape_admin_log` VALUES (142, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638709185);
INSERT INTO `ape_admin_log` VALUES (143, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710245);
INSERT INTO `ape_admin_log` VALUES (144, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710248);
INSERT INTO `ape_admin_log` VALUES (145, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710249);
INSERT INTO `ape_admin_log` VALUES (146, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710302);
INSERT INTO `ape_admin_log` VALUES (147, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710303);
INSERT INTO `ape_admin_log` VALUES (148, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710456);
INSERT INTO `ape_admin_log` VALUES (149, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710458);
INSERT INTO `ape_admin_log` VALUES (150, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710461);
INSERT INTO `ape_admin_log` VALUES (151, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710463);
INSERT INTO `ape_admin_log` VALUES (152, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710602);
INSERT INTO `ape_admin_log` VALUES (153, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710603);
INSERT INTO `ape_admin_log` VALUES (154, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710617);
INSERT INTO `ape_admin_log` VALUES (155, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710618);
INSERT INTO `ape_admin_log` VALUES (156, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710634);
INSERT INTO `ape_admin_log` VALUES (157, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710635);
INSERT INTO `ape_admin_log` VALUES (158, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710909);
INSERT INTO `ape_admin_log` VALUES (159, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710910);
INSERT INTO `ape_admin_log` VALUES (160, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710912);
INSERT INTO `ape_admin_log` VALUES (161, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710930);
INSERT INTO `ape_admin_log` VALUES (162, 1, 'admin', 'admin', 'system_config', 'base', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1638710931);
INSERT INTO `ape_admin_log` VALUES (163, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065937);
INSERT INTO `ape_admin_log` VALUES (164, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065937);
INSERT INTO `ape_admin_log` VALUES (165, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065949);
INSERT INTO `ape_admin_log` VALUES (166, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065961);
INSERT INTO `ape_admin_log` VALUES (167, 1, 'admin', 'admin', 'login', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065978);
INSERT INTO `ape_admin_log` VALUES (168, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065979);
INSERT INTO `ape_admin_log` VALUES (169, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065986);
INSERT INTO `ape_admin_log` VALUES (170, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065990);
INSERT INTO `ape_admin_log` VALUES (171, 1, 'admin', 'admin', 'system_config', 'clearCache', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065993);
INSERT INTO `ape_admin_log` VALUES (172, 1, 'admin', 'admin', 'index', 'main', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639065995);
INSERT INTO `ape_admin_log` VALUES (173, 1, 'admin', 'admin', 'poster', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639066000);
INSERT INTO `ape_admin_log` VALUES (174, 1, 'admin', 'admin', 'admin', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639066020);
INSERT INTO `ape_admin_log` VALUES (175, 1, 'admin', 'admin', 'admin_auth', 'index', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', 1639066021);

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
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,39,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,39,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', 0, 1, '1', '1', 1580031132, 1635572662);

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
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  `sort` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否启用 0不启用 1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职位专区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
INSERT INTO `ape_advert` VALUES (1, '我是小广告', '/uploads/images/20211114\\9d6e563a56429ffb126044e7669a70ba.jpg', 'http://apeblog.io/', 3, 0, 1636649595, 1636649595, 99, 1);
INSERT INTO `ape_advert` VALUES (2, '我是首页', '/uploads/images/20211114\\9d6e563a56429ffb126044e7669a70ba.jpg', '/index/article/detail.html?id=1', 1, 0, 1638036172, 1638036172, 99, 1);
INSERT INTO `ape_advert` VALUES (3, '我是小广告', '/uploads/images/20211114\\9d6e563a56429ffb126044e7669a70ba.jpg', 'http://apeblog.io/', 2, 0, 1636649595, 1636649595, 99, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
INSERT INTO `ape_attachment` VALUES (1, 1, 'images/20211114\\9d6e563a56429ffb126044e7669a70ba.jpg', '/uploads/images/20211114\\9d6e563a56429ffb126044e7669a70ba.jpg', 'images', 'image/jpeg', '1919593', 1, 1636822168, 1636822168);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
INSERT INTO `ape_attachment_category` VALUES (1, 0, '广告文件', 'images', 1, 0, 1636649478, 1636649478);

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
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '评论谁',
  `create_time` int(11) NOT NULL COMMENT '评论时间',
  `document_id` int(11) NOT NULL COMMENT '文章ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 1不显示 1显示',
  `update_time` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_comment
-- ----------------------------
INSERT INTO `ape_comment` VALUES (1, '影子', 'qeqwe', 'eqw', '[f=youling]', 0, 0, 1636565743, 1, 1, 1638632235);
INSERT INTO `ape_comment` VALUES (2, 'AS', 'as', 'AS', 'aasSa', 0, 0, 1638631598, 1, 1, 1638632233);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document
-- ----------------------------
INSERT INTO `ape_document` VALUES (1, 1, '超级管理员', '我是首页', 1, '/uploads/images/20211111\\522a67179ee445a32039a9cd3030c378.jpg', 'article', '', 1, 1, 1, '', 1, 176, '张三,李四,王麻子', '编程文章', '', '', 99, 1636562845, 1636725820, 1, '');
INSERT INTO `ape_document` VALUES (2, 1, '超级管理员', '测试摘要i', 1, '/uploads/images/20211114\\560c1956b3fa3b78cb82f7c801a8ede3.jpg', 'article', '', 0, 0, 0, '', 1, 58, '', '<p>测试摘要222222222222222222222222222</p>', '', '', 99, 1636822306, 1636822306, 1, '');

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
INSERT INTO `ape_document_article` VALUES (1, '<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>\r\n<p>张三李四王麻子</p>');
INSERT INTO `ape_document_article` VALUES (2, '<p>测试摘要222222222222222222222222222</p>');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
INSERT INTO `ape_document_category` VALUES (1, '编程文章', '', '', 1, 0, 0, '', '', '', 1, 'list_detail.html', '', 12, 0, 1636646746);
INSERT INTO `ape_document_category` VALUES (2, 'php', '', '', 1, 1, 0, '', '', '', 1, 'list_detail.html', '', 38, 0, 0);

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
INSERT INTO `ape_document_category_content` VALUES (2, '');

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
  `user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用用户',
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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
INSERT INTO `ape_pv_log` VALUES (1, 1, 3, '2021-11-08', '2021-11-08 01:05:55', '2021-11-08 01:05:55');
INSERT INTO `ape_pv_log` VALUES (2, 23, 1, '2021-11-10', '2021-11-10 23:06:10', '2021-11-10 23:06:10');
INSERT INTO `ape_pv_log` VALUES (3, 0, 41, '2021-11-11', '2021-11-11 00:27:18', '2021-11-11 00:27:18');
INSERT INTO `ape_pv_log` VALUES (4, 1, 74, '2021-11-11', '2021-11-11 01:06:07', '2021-11-11 01:06:07');
INSERT INTO `ape_pv_log` VALUES (5, 21, 8, '2021-11-11', '2021-11-11 21:39:11', '2021-11-11 21:39:11');
INSERT INTO `ape_pv_log` VALUES (6, 23, 11, '2021-11-11', '2021-11-11 23:40:31', '2021-11-11 23:40:31');
INSERT INTO `ape_pv_log` VALUES (7, 0, 2, '2021-11-12', '2021-11-12 00:50:56', '2021-11-12 00:50:56');
INSERT INTO `ape_pv_log` VALUES (8, 21, 15, '2021-11-12', '2021-11-12 21:00:14', '2021-11-12 21:00:14');
INSERT INTO `ape_pv_log` VALUES (9, 22, 54, '2021-11-12', '2021-11-12 22:01:33', '2021-11-12 22:01:33');
INSERT INTO `ape_pv_log` VALUES (10, 23, 26, '2021-11-12', '2021-11-12 23:01:13', '2021-11-12 23:01:13');
INSERT INTO `ape_pv_log` VALUES (11, 0, 23, '2021-11-13', '2021-11-13 00:33:08', '2021-11-13 00:33:08');
INSERT INTO `ape_pv_log` VALUES (12, 21, 42, '2021-11-13', '2021-11-13 21:34:52', '2021-11-13 21:34:52');
INSERT INTO `ape_pv_log` VALUES (13, 22, 14, '2021-11-13', '2021-11-13 22:09:34', '2021-11-13 22:09:34');
INSERT INTO `ape_pv_log` VALUES (14, 23, 32, '2021-11-13', '2021-11-13 23:04:29', '2021-11-13 23:04:29');
INSERT INTO `ape_pv_log` VALUES (15, 0, 24, '2021-11-14', '2021-11-14 00:00:48', '2021-11-14 00:00:48');
INSERT INTO `ape_pv_log` VALUES (16, 18, 10, '2021-11-14', '2021-11-14 18:31:45', '2021-11-14 18:31:45');
INSERT INTO `ape_pv_log` VALUES (17, 19, 15, '2021-11-14', '2021-11-14 19:00:16', '2021-11-14 19:00:16');
INSERT INTO `ape_pv_log` VALUES (18, 20, 2, '2021-11-14', '2021-11-14 20:46:14', '2021-11-14 20:46:14');
INSERT INTO `ape_pv_log` VALUES (19, 22, 2, '2021-11-21', '2021-11-21 22:26:44', '2021-11-21 22:26:44');
INSERT INTO `ape_pv_log` VALUES (20, 22, 2, '2021-11-22', '2021-11-22 22:28:51', '2021-11-22 22:28:51');
INSERT INTO `ape_pv_log` VALUES (21, 23, 3, '2021-11-24', '2021-11-24 23:38:40', '2021-11-24 23:38:40');
INSERT INTO `ape_pv_log` VALUES (22, 22, 3, '2021-11-27', '2021-11-27 22:26:28', '2021-11-27 22:26:28');
INSERT INTO `ape_pv_log` VALUES (23, 1, 49, '2021-11-28', '2021-11-28 01:08:30', '2021-11-28 01:08:30');
INSERT INTO `ape_pv_log` VALUES (24, 2, 23, '2021-11-28', '2021-11-28 02:00:01', '2021-11-28 02:00:01');
INSERT INTO `ape_pv_log` VALUES (25, 20, 6, '2021-11-28', '2021-11-28 20:35:33', '2021-11-28 20:35:33');
INSERT INTO `ape_pv_log` VALUES (26, 23, 20, '2021-11-28', '2021-11-28 23:19:20', '2021-11-28 23:19:20');
INSERT INTO `ape_pv_log` VALUES (27, 0, 30, '2021-11-29', '2021-11-29 00:00:14', '2021-11-29 00:00:14');
INSERT INTO `ape_pv_log` VALUES (28, 23, 32, '2021-12-04', '2021-12-04 23:20:50', '2021-12-04 23:20:50');
INSERT INTO `ape_pv_log` VALUES (29, 15, 7, '2021-12-05', '2021-12-05 15:47:54', '2021-12-05 15:47:54');
INSERT INTO `ape_pv_log` VALUES (30, 16, 2, '2021-12-05', '2021-12-05 16:30:37', '2021-12-05 16:30:37');
INSERT INTO `ape_pv_log` VALUES (31, 17, 1, '2021-12-05', '2021-12-05 17:24:01', '2021-12-05 17:24:01');
INSERT INTO `ape_pv_log` VALUES (32, 21, 11, '2021-12-05', '2021-12-05 21:37:58', '2021-12-05 21:37:58');
INSERT INTO `ape_pv_log` VALUES (33, 22, 4, '2021-12-05', '2021-12-05 22:08:30', '2021-12-05 22:08:30');
INSERT INTO `ape_pv_log` VALUES (34, 23, 14, '2021-12-05', '2021-12-05 23:13:18', '2021-12-05 23:13:18');
INSERT INTO `ape_pv_log` VALUES (35, 0, 32, '2021-12-06', '2021-12-06 00:09:55', '2021-12-06 00:09:55');
INSERT INTO `ape_pv_log` VALUES (36, 1, 1, '2021-12-06', '2021-12-06 01:01:26', '2021-12-06 01:01:26');
INSERT INTO `ape_pv_log` VALUES (37, 23, 30, '2021-12-06', '2021-12-06 23:19:01', '2021-12-06 23:19:01');
INSERT INTO `ape_pv_log` VALUES (38, 23, 12, '2021-12-09', '2021-12-09 23:37:45', '2021-12-09 23:37:45');
INSERT INTO `ape_pv_log` VALUES (39, 0, 11, '2021-12-10', '2021-12-10 00:01:15', '2021-12-10 00:01:15');

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', '', 99, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', '/uploads/images/20211129\\2fcc09f5d102bc76b634f2e324700faa.png', '', 98, 1, 1, '1', '1', 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '猿博系统', '', 97, 1, 1, '1', '1', 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '猿博系统', '', 96, 1, 1, '1', '1', 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 95, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/uploads/images/20211129\\ede116617e0b1705dadcdd9aa91cc419.png', '', 94, 1, 1, '1', '1', 1582793393, 1582793700);
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
INSERT INTO `ape_system_config` VALUES (23, 1, '微信收款码', 'web_weixin_pay', 'file', 'input', 0, '', '/uploads/images/20211129\\7e67eef3314ace6ad4b7f75e04fc196d.jpg', '微信收款码', 77, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (24, 1, '支付宝收款码', 'web_zhifubao_pay', 'file', 'input', 0, '', '/uploads/images/20211129\\65eb4dd90488eb082d93d8f1163ed840.jpg', '支付宝收款码', 76, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (25, 4, '是否登录', 'comment_need_login', 'radio', 'input', 0, '1=>是\n0=>否', '1', '', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (26, 4, '敏感词', 'comment_sensitive_word', 'text', 'input', 0, '', '新疆,华为', '多个逗号隔开', 81, 1, 1, '1', '1', 1582793305, 1582792265);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_tag
-- ----------------------------
INSERT INTO `ape_tag` VALUES (4, '张三', 1, 1, 1636645161, 1636645161);
INSERT INTO `ape_tag` VALUES (5, '李四', 1, 1, 1636645161, 1636645161);
INSERT INTO `ape_tag` VALUES (6, '王麻子', 1, 1, 1636645161, 1636645161);

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
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
INSERT INTO `ape_url_log` VALUES (1, 'http://apeblog.io/', 3, '网站首页', '2021-11-08', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (2, 'http://apeblog.io/', 1, '网站首页', '2021-11-10', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (3, 'http://apeblog.io/', 22, '网站首页', '2021-11-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (4, 'http://apeblog.io/undefined', 4, '网站首页', '2021-11-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (5, 'http://apeblog.io/index/article/detail.html?id=1', 13, '我是首页', '2021-11-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (6, 'http://apeblog.io/index/article/lists.html?id=1', 1, '编程文章', '2021-11-11', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (7, 'http://apeblog.io/', 16, '网站首页', '2021-11-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (8, 'http://apeblog.io/index/article/lists.html?id=1', 9, '编程文章', '2021-11-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (9, 'http://apeblog.io/index/article/lists.html?id=2', 8, 'php', '2021-11-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (10, 'http://apeblog.io/index/article/detail.html?id=1', 43, '我是首页', '2021-11-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (11, 'http://apeblog.io/login.html', 4, '网站首页', '2021-11-12', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (12, 'http://apeblog.io/login.html', 1, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (13, 'http://apeblog.io/', 41, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (14, 'http://apeblog.io/index/article/lists.html?id=2', 11, 'php', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (15, 'http://apeblog.io/index/article/detail.html?id=1', 8, '我是首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (16, 'http://apeblog.io/about.html', 1, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (17, 'http://apeblog.io/index/article/lists.html?id=1', 1, '编程文章', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (18, 'http://apeblog.io/applylink', 1, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (19, 'http://apeblog.io/msg', 1, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (20, 'http://apeblog.io/wlwmanifest.xml', 1, '网站首页', '2021-11-13', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (21, 'http://apeblog.io/index/article/lists.html?id=2', 9, 'php', '2021-11-14', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (22, 'http://apeblog.io/', 11, '网站首页', '2021-11-14', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (23, 'http://apeblog.io/index/article/detail.html?id=1', 5, '我是首页', '2021-11-14', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (24, 'http://apeblog.io/index/article/detail.html?id=2', 6, '测试摘要i', '2021-11-14', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (25, 'http://apeblog.io/', 1, '网站首页', '2021-11-21', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (26, 'http://apeblog.io/', 1, '网站首页', '2021-11-22', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (27, 'http://apeblog.io/', 1, '网站首页', '2021-11-24', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (28, 'http://apeblog.io/index/article/detail.html?id=1', 1, '我是首页', '2021-11-24', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (29, 'http://apeblog.io/', 1, '网站首页', '2021-11-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (30, 'http://apeblog.io/index/article/detail.html?id=1', 1, '我是首页', '2021-11-27', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (31, 'http://apeblog.io/', 12, '网站首页', '2021-11-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (32, 'http://apeblog.io/index/article/detail.html?id=1', 32, '我是首页', '2021-11-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (33, 'http://apeblog.io/index/article/detail.html?id=2', 32, '测试摘要i', '2021-11-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (34, 'http://apeblog.io/index/article/lists.html?id=2', 3, 'php', '2021-11-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (35, 'http://apeblog.io/index/article/lists.html?id=1', 1, '编程文章', '2021-11-28', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (36, 'http://apeblog.io/index/article/detail.html?id=2', 15, '测试摘要i', '2021-11-29', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (37, 'http://apeblog.io/', 7, '网站首页', '2021-11-29', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (38, 'http://apeblog.io/index/article/detail.html?id=1', 1, '我是首页', '2021-11-29', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (39, 'http://apeblog.io/', 11, '网站首页', '2021-12-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (40, 'http://apeblog.io/index/article/detail.html?id=1', 2, '我是首页', '2021-12-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (41, 'http://apeblog.io/index/article/lists.html?id=2', 2, 'php', '2021-12-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (42, 'http://apeblog.io/index/article/detail.html?id=2', 3, '测试摘要i', '2021-12-04', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (43, 'http://apeblog.io/', 3, '网站首页', '2021-12-05', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (44, 'http://apeblog.io/index/article/lists.html?id=2', 1, 'php', '2021-12-05', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (45, 'http://apeblog.io/index/article/detail.html?id=1', 31, '我是首页', '2021-12-05', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (46, 'http://apeblog.io/index/article/detail.html?id=1', 35, '我是首页', '2021-12-06', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (47, 'http://apeblog.io/', 26, '网站首页', '2021-12-06', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (48, 'http://apeblog.io/index/article/detail.html?id=2', 1, '测试摘要i', '2021-12-06', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (49, 'http://apeblog.io/index/article/detail.html?id=1', 4, '我是首页', '2021-12-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (50, 'http://apeblog.io/', 4, '网站首页', '2021-12-09', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (51, 'http://apeblog.io/index/article/lists.html?id=2', 4, 'php', '2021-12-10', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (52, 'http://apeblog.io/', 3, '网站首页', '2021-12-10', NULL, NULL);
INSERT INTO `ape_url_log` VALUES (53, 'http://apeblog.io/index/article/detail.html?id=2', 1, '测试摘要i', '2021-12-10', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Uv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
INSERT INTO `ape_uv_log` VALUES (1, '127.0.0.1', 1, '2021-11-08', '2021-11-08 01:05:55', '2021-11-08 01:05:55');
INSERT INTO `ape_uv_log` VALUES (2, '127.0.0.1', 23, '2021-11-10', '2021-11-10 23:06:10', '2021-11-10 23:06:10');
INSERT INTO `ape_uv_log` VALUES (3, '127.0.0.1', 0, '2021-11-11', '2021-11-11 00:27:18', '2021-11-11 00:27:18');
INSERT INTO `ape_uv_log` VALUES (4, '127.0.0.1', 0, '2021-11-12', '2021-11-12 00:50:56', '2021-11-12 00:50:56');
INSERT INTO `ape_uv_log` VALUES (5, '127.0.0.1', 0, '2021-11-13', '2021-11-13 00:33:08', '2021-11-13 00:33:08');
INSERT INTO `ape_uv_log` VALUES (6, '127.0.0.1', 0, '2021-11-14', '2021-11-14 00:00:48', '2021-11-14 00:00:48');
INSERT INTO `ape_uv_log` VALUES (7, '127.0.0.1', 22, '2021-11-21', '2021-11-21 22:26:44', '2021-11-21 22:26:44');
INSERT INTO `ape_uv_log` VALUES (8, '127.0.0.1', 22, '2021-11-22', '2021-11-22 22:28:51', '2021-11-22 22:28:51');
INSERT INTO `ape_uv_log` VALUES (9, '127.0.0.1', 23, '2021-11-24', '2021-11-24 23:38:40', '2021-11-24 23:38:40');
INSERT INTO `ape_uv_log` VALUES (10, '127.0.0.1', 22, '2021-11-27', '2021-11-27 22:26:28', '2021-11-27 22:26:28');
INSERT INTO `ape_uv_log` VALUES (11, '127.0.0.1', 1, '2021-11-28', '2021-11-28 01:08:30', '2021-11-28 01:08:30');
INSERT INTO `ape_uv_log` VALUES (12, '127.0.0.1', 0, '2021-11-29', '2021-11-29 00:00:14', '2021-11-29 00:00:14');
INSERT INTO `ape_uv_log` VALUES (13, '127.0.0.1', 23, '2021-12-04', '2021-12-04 23:20:50', '2021-12-04 23:20:50');
INSERT INTO `ape_uv_log` VALUES (14, '127.0.0.1', 15, '2021-12-05', '2021-12-05 15:47:54', '2021-12-05 15:47:54');
INSERT INTO `ape_uv_log` VALUES (15, '127.0.0.1', 0, '2021-12-06', '2021-12-06 00:09:55', '2021-12-06 00:09:55');
INSERT INTO `ape_uv_log` VALUES (16, '127.0.0.1', 23, '2021-12-09', '2021-12-09 23:37:45', '2021-12-09 23:37:45');
INSERT INTO `ape_uv_log` VALUES (17, '127.0.0.1', 0, '2021-12-10', '2021-12-10 00:01:15', '2021-12-10 00:01:15');

SET FOREIGN_KEY_CHECKS = 1;
